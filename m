From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/exynos: fix kernel panic issue at drm releasing
Date: Tue, 5 Jan 2016 12:08:11 +0100
Message-ID: <20160105110811.GB8076@phenom.ffwll.local>
References: <1450948214-14688-1-git-send-email-inki.dae@samsung.com>
 <CAPj87rMUrt55rBSXiFAsJ=vKUjohDmZPeC2CTMbTNAbVkCgYBg@mail.gmail.com>
 <568A5E3A.8090601@samsung.com>
 <CAPj87rOjMnCRsThp3vjOpik4nYcJdV_M1eEJxTOAUVHA700YCg@mail.gmail.com>
 <568BA138.3050504@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:35516 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752095AbcAELIO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jan 2016 06:08:14 -0500
Received: by mail-wm0-f47.google.com with SMTP id f206so18532988wmf.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jan 2016 03:08:13 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <568BA138.3050504@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Daniel Stone <daniel@fooishbar.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On Tue, Jan 05, 2016 at 07:55:52PM +0900, Inki Dae wrote:
> Hi Daniel,
>=20
> 2016=EB=85=84 01=EC=9B=94 05=EC=9D=BC 05:24=EC=97=90 Daniel Stone =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> > Hi Inki,
> >=20
> > On 4 January 2016 at 12:57, Inki Dae <inki.dae@samsung.com> wrote:
> >> 2015=EB=85=84 12=EC=9B=94 24=EC=9D=BC 22:32=EC=97=90 Daniel Stone =
=EC=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> >>> On 24 December 2015 at 09:10, Inki Dae <inki.dae@samsung.com> wro=
te:
> >>>> +void exynos_drm_crtc_cancel_page_flip(struct drm_crtc *crtc)
> >>>> +{
> >>>> +       struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(c=
rtc);
> >>>> +       unsigned long flags;
> >>>> +
> >>>> +       spin_lock_irqsave(&crtc->dev->event_lock, flags);
> >>>> +       exynos_crtc->event =3D NULL;
> >>>> +       spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> >>>> +}
> >>>
> >>> This will leak the event and event space; you should call
> >>> event->base.destroy() here. With that fixed:
> >>
> >> Right. we don't use exynos specific page flip function anymore whi=
ch managed the event as a list so that the event objects can be freed b=
y postclose callback.
> >> Anyway, would it be better for event->base.destory() to be called =
between spin lock/unlock?
> >=20
> > You must increment event->base.file_priv->event_space (see
> > drm_atomic.c:destroy_vblank_event), as well as calling
>=20
> Reasonable to me. Seems other DRM drivers don't increment event_space=
=2E
>=20
> > event->base.destroy (see drm_fops.c:drm_read) underneath event_lock=
,
> > yes.
>=20
> In addition, only event objects belonging to the request process shou=
ld be destroyed.

Just random comment out of the far left field, but robclark had a bunch=
 of
patches to clean up all that event alloc/cleanup code a bit and extract=
 it
into core functions. Might be good to ping him on irc to figure out whe=
re
that series is and whether you could take it over.

Cheers, Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
