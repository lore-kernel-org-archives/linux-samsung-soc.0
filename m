From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/4] drm: add generic zpos property
Date: Thu, 12 May 2016 22:20:12 +0300
Message-ID: <4862983.CHN7hQXAbO@avalon>
References: <1463048902-9388-1-git-send-email-benjamin.gaignard@linaro.org> <20160512115155.GJ4329@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:50561 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752298AbcELTUN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 May 2016 15:20:13 -0400
In-Reply-To: <20160512115155.GJ4329@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, daniel@ffwll.ch, linaro-mm-sig@lists.linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, vincent.abriou@st.com, fabien.dessenne@st.com

Hi Ville,

On Thursday 12 May 2016 14:51:55 Ville Syrj=E4l=E4 wrote:
> On Thu, May 12, 2016 at 12:28:19PM +0200, Benjamin Gaignard wrote:
> > From: Marek Szyprowski <m.szyprowski@samsung.com>
> >=20
> > This patch adds support for generic plane's zpos property property =
with
> > well-defined semantics:
> > - added zpos properties to plane and plane state structures
> > - added helpers for normalizing zpos properties of given set of pla=
nes
> > - well defined semantics: planes are sorted by zpos values and then=
 plane
> >   id value if zpos equals
> >=20
> > Normalized zpos values are calculated automatically when generic
> > muttable zpos property has been initialized. Drivers can simply use
> > plane_state->normalized_zpos in their atomic_check and/or plane_upd=
ate
> > callbacks without any additional calls to DRM core.
> >=20
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >=20
> > Compare to Marek's original patch zpos property is now specific to =
each
> > plane and no more to the core.
> > Normalize function take care of the range of per plane defined rang=
e
> > before set normalized_zpos.
> >=20
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> >=20
> > Cc: Inki Dae <inki.dae@samsung.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> > Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> > Cc: Gustavo Padovan <gustavo@padovan.org>
> > Cc: vincent.abriou@st.com
> > Cc: fabien.dessenne@st.com
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >=20
> >  Documentation/DocBook/gpu.tmpl      |  10 ++
> >  drivers/gpu/drm/Makefile            |   2 +-
> >  drivers/gpu/drm/drm_atomic.c        |   4 +
> >  drivers/gpu/drm/drm_atomic_helper.c |   6 +
> >  drivers/gpu/drm/drm_blend.c         | 229 ++++++++++++++++++++++++=
+++++++
> >  drivers/gpu/drm/drm_crtc_internal.h |   3 +
> >  include/drm/drm_crtc.h              |  28 +++++
> >  7 files changed, 281 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/drm_blend.c

[snip]

> > diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blen=
d.c
> > new file mode 100644
> > index 0000000..eef59bb
> > --- /dev/null
> > +++ b/drivers/gpu/drm/drm_blend.c
> > @@ -0,0 +1,229 @@

[snip]

> > +static int drm_atomic_state_zpos_cmp(const void *a, const void *b)
> > +{
> > +	const struct drm_plane_state *sa =3D *(struct drm_plane_state **)=
a;
> > +	const struct drm_plane_state *sb =3D *(struct drm_plane_state **)=
b;
> > +
> > +	if (sa->zpos !=3D sb->zpos)
> > +		return sa->zpos - sb->zpos;
> > +	else
> > +		return sa->plane->base.id - sb->plane->base.id;
> > +}
>=20
> Still not really convinced this normalization is a good idea when we
> have atomic. It made sense before atomic since otherwise you might no=
t be
> able to swap the zpos of two planes without shutting one of them down=
,
> but it makes interpreting the zpos prop values more confusing. And wi=
th
> atomic we don't actually need it AFAICS. Or do we have an actual use =
case
> for this behaviour?

Speaking selfishly about my use case (rcar-du-drm), I need to sort plan=
es in=20
display order from 0 to N-1 as that's how the hardware is programmed.=20
Normalization gives me an array of sorted planes, which is exactly what=
 I=20
need. I expect other drivers to have similar requirements, so normaliza=
tion in=20
the core will allow code sharing.

Now, is your concern that allowing two planes to have the same zpos isn=
't=20
needed with the atomic API ? I agree with that, but it would also make =
it=20
impossible to swap two planes using the legacy API implemented on top o=
f=20
atomic drivers. I'll let others decide whether this is considered as a=20
concern.

While at it, Benjamin told me that you've requested configurable min/ma=
x=20
values per plane, what are your use cases for that ? On the same topic,=
 please=20
see below.

> > +
> > +/**
> > + * drm_atomic_helper_crtc_normalize_zpos - calculate normalized zp=
os
> > values
> > + * @crtc: crtc with planes, which have to be considered for normal=
ization
> > + * @crtc_state: new atomic state to apply
> > + *
> > + * This function checks new states of all planes assigned to given=
 crtc
> > and
> > + * calculates normalized zpos value for them. Planes are compared =
first
> > by their
> > + * zpos values, then by plane id (if zpos equals). Plane with lowe=
st zpos
> > value
> > + * is at the bottom. The plane_state->normalized_zpos is then fill=
ed with
> > unique
> > + * values from 0 to number of active planes in crtc minus one.
> > + *
> > + * RETURNS
> > + * Zero for success or -errno
> > + */
> > +int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
> > +					  struct drm_crtc_state *crtc_state)
> > +{
> > +	struct drm_atomic_state *state =3D crtc_state->state;
> > +	struct drm_device *dev =3D crtc->dev;
> > +	int total_planes =3D dev->mode_config.num_total_plane;
> > +	struct drm_plane_state **states;
> > +	struct drm_plane *plane;
> > +	int i, zpos, n =3D 0;
> > +	int ret =3D 0;
> > +
> > +	DRM_DEBUG_ATOMIC("[CRTC:%d:%s] calculating normalized zpos values=
\n",
> > +			 crtc->base.id, crtc->name);
> > +
> > +	states =3D kmalloc(total_planes * sizeof(*states), GFP_KERNEL);
>=20
> kmalloc_array(..., GFP_TEMPORARY);
>=20
> > +	if (!states)
> > +		return -ENOMEM;
> > +
> > +	/*
> > +	 * Normalization process might create new states for planes which
> > +	 * normalized_zpos has to be recalculated.
> > +	 */
> > +	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
> > +		struct drm_plane_state *plane_state =3D
> > +			drm_atomic_get_plane_state(state, plane);
> > +		if (IS_ERR(plane_state)) {
> > +			ret =3D PTR_ERR(plane_state);
> > +			goto done;
> > +		}
>=20
> Hmm. So if we change the zpos for any plane, we get to re-check every
> plane. Not the most efficient thing perhaps, since on some hardware
> you might only have a subset of planes that can even change their
> zpos. OTOH I suppose it does make life a bit simpler when you don't
> have to think which planes might be affected, so I guess it's fine.
>=20
> > +		states[n++] =3D plane_state;
> > +		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] processing zpos value %d\n",
> > +				 plane->base.id, plane->name,
> > +				 plane_state->zpos);
> > +	}
> > +
> > +	sort(states, n, sizeof(*states), drm_atomic_state_zpos_cmp, NULL)=
;
> > +
> > +	for (i =3D 0, zpos =3D 0; i < n; i++, zpos++) {
> > +		plane =3D states[i]->plane;
> > +
> > +		zpos =3D max_t(int, zpos, states[i]->zpos);

The purpose of this code is to support the per-plane min/max zpos value=
s. As=20
Benjamin explained, for example if the zpos range is [0,2] for plane X =
and=20
[4,6] for plane Y, we need to be sure the min zpos value of plane Y is =
4. To=20
this I replied that's exactly what I'd rather avoid. I think the core c=
ode=20
should take care of sorting planes, taking driver-specific constraints =
into=20
account when possible (too exotic constraints can always be implemented=
=20
directly by drivers), and then leave to the drivers the responsibility =
of=20
taking the sorted planes array and computing whatever hardware-specific=
=20
configuration is needed. Sorting planes from 0 to N-1 seems to be like =
a=20
better API than having semi-random values for the normalized zpos. Do w=
e have=20
use cases that wouldn't be covered by a simpler implementation ?

> > +		states[i]->normalized_zpos =3D zpos;
> > +		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] normalized zpos value %d\n",
> > +				 plane->base.id, plane->name, zpos);
> > +	}
> > +	crtc_state->zpos_changed =3D true;
> > +
> > +done:
> > +	kfree(states);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(drm_atomic_helper_crtc_normalize_zpos);

--=20
Regards,

Laurent Pinchart
