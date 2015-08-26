From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 03/11] drm/exynos: add prepare and cleanup phases for
 planes
Date: Wed, 26 Aug 2015 12:45:13 -0300
Message-ID: <20150826154513.GB1991@joana>
References: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
 <1439655980-32146-4-git-send-email-gustavo@padovan.org>
 <55DB1473.40109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f68.google.com ([209.85.192.68]:35230 "EHLO
	mail-qg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751859AbbHZPpS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Aug 2015 11:45:18 -0400
Received: by qgeb6 with SMTP id b6so12765478qge.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Aug 2015 08:45:17 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55DB1473.40109@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Inki,

2015-08-24 Inki Dae <inki.dae@samsung.com>:

> On 2015=EB=85=84 08=EC=9B=94 16=EC=9D=BC 01:26, Gustavo Padovan wrote=
:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >
> > .prepare_plane() and .cleanup_plane() allows to perform extra opera=
tions
> > before and after the update of planes. For FIMD for example this wi=
ll
> > be used to enable disable the shadow protection bit.
> >
> > Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_crtc.c | 19 +++++++++++++++++++
> >  drivers/gpu/drm/exynos/exynos_drm_drv.h  |  6 ++++++
> >  2 files changed, 25 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu=
/drm/exynos/exynos_drm_crtc.c
> > index 5a19e16..3a89fc9 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > @@ -72,15 +72,34 @@ exynos_drm_crtc_mode_set_nofb(struct drm_crtc *=
crtc)
> >  static void exynos_crtc_atomic_begin(struct drm_crtc *crtc)
> >  {
> >  	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> > +	struct drm_plane *plane;
> >
> >  	if (crtc->state->event) {
> >  		WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
> >  		exynos_crtc->event =3D crtc->state->event;
> >  	}
> > +
> > +	drm_atomic_crtc_for_each_plane(plane, crtc) {
> > +		struct exynos_drm_plane *exynos_plane =3D to_exynos_plane(plane)=
;
> > +
> > +		if (exynos_crtc->ops->prepare_plane)
> > +			exynos_crtc->ops->prepare_plane(exynos_crtc,
> > +							exynos_plane);
>=20
> There is no any reason to use prepare_plane/cleanup_plane callback
> names. How about using atomic_begin/atomic_flush callback names inste=
ad
> for consistency between framework and device drivers?

Either names are fine for me. So let's go with atomic_begin/flush. I'll
send an updated patchset.

	Gustavo
