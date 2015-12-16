From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 2/7] drm/exynos: make zpos property configurable
Date: Wed, 16 Dec 2015 15:48:18 +0200
Message-ID: <20151216134818.GB4437@intel.com>
References: <1450268508-15028-1-git-send-email-m.szyprowski@samsung.com>
 <1450268508-15028-3-git-send-email-m.szyprowski@samsung.com>
 <20151216132836.GM30437@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:42698 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752546AbbLPNs0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 08:48:26 -0500
Content-Disposition: inline
In-Reply-To: <20151216132836.GM30437@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

On Wed, Dec 16, 2015 at 02:28:36PM +0100, Daniel Vetter wrote:
> On Wed, Dec 16, 2015 at 01:21:43PM +0100, Marek Szyprowski wrote:
> > This patch adds all infrastructure to make zpos plane property
> > configurable from userspace.
> >=20
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>=20
> Imo zpos should be a generic atomic property with well-defined semant=
ics
> shared across drivers. So
> - storead (in decoded form) in drm_plane_state
> - common functions to register/attach zpos prop to a plane, with
>   full-blown kerneldoc explaining how it should work
> - generic kms igt to validate that interface
>=20
> One of the big things that always comes up when we talk about zpos is=
 how
> equal zpos should be handled, and how exactly they should be sorted. =
I
> think for that we should have a drm function which computes a normali=
zed
> zpos. Or the core check code should reject such nonsense.

Yeah I think just having some core check reject the operation if two
planes end up with the same zpos. And zpos should probably just be=20
in the [0-number_of_planes_on_the_crtc_currently] range? Or maybe
[0-max_number_of_planes_possible_on_the_crtc], or just
[0-total_max_number_of_planes] ? One of the latter two might be sensibl=
e
because you could then enable/disable some planes on the crtc without
necessarily touching the zpos for the other planes.

Another complication is how you think about color keying. Eg. if you us=
e
dst keying between the primary plane and some other plane, then it may
make sense to think of the primary being above the other plane and the
colorkey just punches a hole into the primary. But if the planes
otherwise are always ordered with the primary at the botton, then I'm
not sure if exposing zpos and requiring it to be reconfigured for
colorkeying to work would just make things more confusing. But this
decisions might also depend on what happens to pixels on the other plan=
e
that fall outside of the primary plane (assuming the primary can be
non-fullscreen). I don't remember off the top of my head how this works
on Intel hw. The other option I suppose is to define color keying as
just being slightly magic that it can effectively reorder the planes
even though zpos says something else. Not quite sure which is best.

Dst color keying is rather confusing in any case since it may work
only between certain planes (and exactly which planes may depend which
planes are active on the same crtc).

> -Daniel
>=20
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  4 ++-
> >  drivers/gpu/drm/exynos/exynos_drm_plane.c | 51 +++++++++++++++++++=
+++++++++---
> >  2 files changed, 49 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/=
drm/exynos/exynos_drm_drv.h
> > index 588b6763f9c7..f0827dbebb7d 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> > @@ -64,6 +64,7 @@ struct exynos_drm_plane_state {
> >  	struct exynos_drm_rect src;
> >  	unsigned int h_ratio;
> >  	unsigned int v_ratio;
> > +	unsigned int zpos;
> >  };
> > =20
> >  static inline struct exynos_drm_plane_state *
> > @@ -91,11 +92,12 @@ struct exynos_drm_plane {
> > =20
> >  #define EXYNOS_DRM_PLANE_CAP_DOUBLE	(1 << 0)
> >  #define EXYNOS_DRM_PLANE_CAP_SCALE	(1 << 1)
> > +#define EXYNOS_DRM_PLANE_CAP_ZPOS	(1 << 2)
> > =20
> >  /*
> >   * Exynos DRM plane configuration structure.
> >   *
> > - * @zpos: z-position of the plane.
> > + * @zpos: initial z-position of the plane.
> >   * @type: type of the plane (primary, cursor or overlay).
> >   * @pixel_formats: supported pixel formats.
> >   * @num_pixel_formats: number of elements in 'pixel_formats'.
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gp=
u/drm/exynos/exynos_drm_plane.c
> > index fd6cb4cee01a..a2bdab836b50 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> > @@ -124,6 +124,7 @@ static void exynos_plane_mode_set(struct exynos=
_drm_plane_state *exynos_state)
> > =20
> >  static void exynos_drm_plane_reset(struct drm_plane *plane)
> >  {
> > +	struct exynos_drm_plane *exynos_plane =3D to_exynos_plane(plane);
> >  	struct exynos_drm_plane_state *exynos_state;
> > =20
> >  	if (plane->state) {
> > @@ -136,6 +137,7 @@ static void exynos_drm_plane_reset(struct drm_p=
lane *plane)
> > =20
> >  	exynos_state =3D kzalloc(sizeof(*exynos_state), GFP_KERNEL);
> >  	if (exynos_state) {
> > +		exynos_state->zpos =3D exynos_plane->config->zpos;
> >  		plane->state =3D &exynos_state->base;
> >  		plane->state->plane =3D plane;
> >  	}
> > @@ -153,6 +155,7 @@ exynos_drm_plane_duplicate_state(struct drm_pla=
ne *plane)
> >  		return NULL;
> > =20
> >  	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
> > +	copy->zpos =3D exynos_state->zpos;
> >  	return &copy->base;
> >  }
> > =20
> > @@ -165,13 +168,53 @@ static void exynos_drm_plane_destroy_state(st=
ruct drm_plane *plane,
> >  	kfree(old_exynos_state);
> >  }
> > =20
> > +static int exynos_drm_plane_atomic_set_property(struct drm_plane *=
plane,
> > +						struct drm_plane_state *state,
> > +						struct drm_property *property,
> > +						uint64_t val)
> > +{
> > +	struct exynos_drm_plane *exynos_plane =3D to_exynos_plane(plane);
> > +	struct exynos_drm_plane_state *exynos_state =3D
> > +					to_exynos_plane_state(state);
> > +	struct exynos_drm_private *dev_priv =3D plane->dev->dev_private;
> > +	const struct exynos_drm_plane_config *config =3D exynos_plane->co=
nfig;
> > +
> > +	if (property =3D=3D dev_priv->plane_zpos_property &&
> > +	    (config->capabilities & EXYNOS_DRM_PLANE_CAP_ZPOS))
> > +		exynos_state->zpos =3D val;
> > +	else
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> > +static int exynos_drm_plane_atomic_get_property(struct drm_plane *=
plane,
> > +					  const struct drm_plane_state *state,
> > +					  struct drm_property *property,
> > +					  uint64_t *val)
> > +{
> > +	const struct exynos_drm_plane_state *exynos_state =3D
> > +		container_of(state, const struct exynos_drm_plane_state, base);
> > +	struct exynos_drm_private *dev_priv =3D plane->dev->dev_private;
> > +
> > +	if (property =3D=3D dev_priv->plane_zpos_property)
> > +		*val =3D exynos_state->zpos;
> > +	else
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> >  static struct drm_plane_funcs exynos_plane_funcs =3D {
> >  	.update_plane	=3D drm_atomic_helper_update_plane,
> >  	.disable_plane	=3D drm_atomic_helper_disable_plane,
> >  	.destroy	=3D drm_plane_cleanup,
> > +	.set_property	=3D drm_atomic_helper_plane_set_property,
> >  	.reset		=3D exynos_drm_plane_reset,
> >  	.atomic_duplicate_state =3D exynos_drm_plane_duplicate_state,
> >  	.atomic_destroy_state =3D exynos_drm_plane_destroy_state,
> > +	.atomic_set_property =3D exynos_drm_plane_atomic_set_property,
> > +	.atomic_get_property =3D exynos_drm_plane_atomic_get_property,
> >  };
> > =20
> >  static int
> > @@ -267,8 +310,8 @@ static void exynos_plane_attach_zpos_property(s=
truct drm_plane *plane,
> > =20
> >  	prop =3D dev_priv->plane_zpos_property;
> >  	if (!prop) {
> > -		prop =3D drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE,
> > -						 "zpos", 0, MAX_PLANE - 1);
> > +		prop =3D drm_property_create_range(dev, 0, "zpos",
> > +						 0, MAX_PLANE - 1);
> >  		if (!prop)
> >  			return;
> > =20
> > @@ -302,9 +345,7 @@ int exynos_plane_init(struct drm_device *dev,
> >  	exynos_plane->index =3D index;
> >  	exynos_plane->config =3D config;
> > =20
> > -	if (config->type =3D=3D DRM_PLANE_TYPE_OVERLAY)
> > -		exynos_plane_attach_zpos_property(&exynos_plane->base,
> > -						  config->zpos);
> > +	exynos_plane_attach_zpos_property(&exynos_plane->base, config->zp=
os);
> > =20
> >  	return 0;
> >  }
> > --=20
> > 1.9.2
> >=20
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > http://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Ville Syrj=E4l=E4
Intel OTC
