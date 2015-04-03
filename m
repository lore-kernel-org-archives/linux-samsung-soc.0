From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH -v4 5/8] drm/exynos: make zpos property immutable
Date: Fri, 3 Apr 2015 11:59:53 -0300
Message-ID: <20150403145953.GA2208@joana>
References: <1427904132-15677-1-git-send-email-gustavo@padovan.org>
 <1427904132-15677-6-git-send-email-gustavo@padovan.org>
 <551E79C0.10105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f44.google.com ([209.85.213.44]:35627 "EHLO
	mail-yh0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752036AbbDCO75 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Apr 2015 10:59:57 -0400
Received: by yhfw71 with SMTP id w71so28782252yhf.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Apr 2015 07:59:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <551E79C0.10105@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Inki,

2015-04-03 Inki Dae <inki.dae@samsung.com>:

> On 2015=EB=85=84 04=EC=9B=94 02=EC=9D=BC 01:02, Gustavo Padovan wrote=
:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >
> > We already set each plane zpos at init, after that changes to zpos =
are
> > not expected. This patch turns zpos into a read-only property so no=
w it is
> > impossible to set zpos.
> >
> > Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_plane.c | 21 ++-----------------=
--
> >  1 file changed, 2 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gp=
u/drm/exynos/exynos_drm_plane.c
> > index 504bd6e..2fbac9b 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> > @@ -184,27 +184,10 @@ static void exynos_plane_destroy(struct drm_p=
lane *plane)
> >  	drm_plane_cleanup(plane);
> >  }
> >
> > -static int exynos_plane_set_property(struct drm_plane *plane,
> > -				     struct drm_property *property,
> > -				     uint64_t val)
> > -{
> > -	struct drm_device *dev =3D plane->dev;
> > -	struct exynos_drm_plane *exynos_plane =3D to_exynos_plane(plane);
> > -	struct exynos_drm_private *dev_priv =3D dev->dev_private;
> > -
> > -	if (property =3D=3D dev_priv->plane_zpos_property) {
> > -		exynos_plane->zpos =3D val;
> > -		return 0;
> > -	}
> > -
> > -	return -EINVAL;
> > -}
> > -
> >  static struct drm_plane_funcs exynos_plane_funcs =3D {
> >  	.update_plane	=3D exynos_update_plane,
> >  	.disable_plane	=3D exynos_disable_plane,
> >  	.destroy	=3D exynos_plane_destroy,
> > -	.set_property	=3D exynos_plane_set_property,
>=20
> As I commented like below before, This patch would make the
> compatibility of the existing application which uses set_property ioc=
tl
> to be broken. Didn't you check my comment?
> http://www.spinics.net/lists/dri-devel/msg78852.html

I checked that and it is currently not possible to output a error messa=
ge
when an property is set to immutable. The drm core will return earlier
and never call the driver's set_property callback. We won't be able to =
add
the error message but I think we need this patch.

	Gustavo
