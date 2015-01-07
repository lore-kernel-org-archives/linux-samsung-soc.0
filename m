From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 26/29] drm/exynos: atomic phase 1: add
 atomic_begin()/atomic_flush()
Date: Wed, 7 Jan 2015 17:29:14 -0200
Message-ID: <20150107192914.GC2001@joana>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
 <1418911135-5207-27-git-send-email-gustavo@padovan.org>
 <54A2B9D0.8000602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f53.google.com ([209.85.213.53]:43211 "EHLO
	mail-yh0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752880AbbAGT3S convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jan 2015 14:29:18 -0500
Received: by mail-yh0-f53.google.com with SMTP id i57so932147yha.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Jan 2015 11:29:18 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <54A2B9D0.8000602@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

2014-12-30 Inki Dae <inki.dae@samsung.com>:

> On 2014=EB=85=84 12=EC=9B=94 18=EC=9D=BC 22:58, Gustavo Padovan wrote=
:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >=20
> > Add CRTC callbacks .atomic_begin() .atomic_flush(). On exynos they
> > unprotect the windows before the commit and protects it after based=
 on
> > a plane mask tha store which plane will be updated.
>=20
> tha? Typo?

Okay.

>=20
> >=20
> > For that we create two new exynos_crtc callbacks: .win_protect() an=
d
> > .win_unprotect(). The only driver that implement those now is FIMD.
> >=20
> > Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 34 +++++++++++++++++++
> >  drivers/gpu/drm/exynos/exynos_drm_drv.h   |  4 +++
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c  | 56 +++++++++++++++++++=
+++---------
> >  drivers/gpu/drm/exynos/exynos_drm_plane.c |  4 +++
> >  4 files changed, 82 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu=
/drm/exynos/exynos_drm_crtc.c
> > index 74980c5..f231eb8 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > @@ -156,6 +156,38 @@ static void exynos_drm_crtc_disable(struct drm=
_crtc *crtc)
> >  	}
> >  }
> > =20
> > +static void exynos_crtc_atomic_begin(struct drm_crtc *crtc)
> > +{
> > +	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> > +	struct drm_plane *plane;
> > +	int index =3D 0;
> > +
>=20
> Isn't drm_modest_lock_all(dev) required? Or is this function atomic
> context? I didn't look into all codes yet so there may be my missing =
point.

the atomic code already protects it by calling drm_modeset_lock_all() s=
o we
are running in a safe context.

	Gustavo
