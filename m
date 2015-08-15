From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v2 11/11] drm/exynos: remove struct exynos_drm_encoder
 layer
Date: Sat, 15 Aug 2015 12:22:30 -0300
Message-ID: <20150815152230.GD22987@joana>
References: <1438817060-22164-10-git-send-email-gustavo@padovan.org>
 <1438867908-18975-1-git-send-email-gustavo@padovan.org>
 <1438867908-18975-2-git-send-email-gustavo@padovan.org>
 <55C49B8A.4090009@samsung.com>
 <20150811003833.GE8125@joana>
 <55C9E702.8060603@samsung.com>
 <20150812154900.GA16747@joana>
 <20150812155406.GA6769@joana>
 <CAAQKjZNRLVLR8mcnzY29XigDiL9DJfz6k=v1rF5wFE85TgOBAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f174.google.com ([209.85.160.174]:34453 "EHLO
	mail-yk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751408AbbHOPWe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Aug 2015 11:22:34 -0400
Received: by ykdt205 with SMTP id t205so92186420ykd.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Aug 2015 08:22:33 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAAQKjZNRLVLR8mcnzY29XigDiL9DJfz6k=v1rF5wFE85TgOBAQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hi Inki,

2015-08-15 Inki Dae <inki.dae@samsung.com>:

> 2015-08-13 0:54 GMT+09:00 Gustavo Padovan <gustavo@padovan.org>:
> > 2015-08-12 Gustavo Padovan <gustavo.padovan@collabora.co.uk>:
> >
> >> Hi Inki,
> >>
> >> 2015-08-11 Inki Dae <inki.dae@samsung.com>:
> >>
> >> > On 2015=EB=85=84 08=EC=9B=94 11=EC=9D=BC 09:38, Gustavo Padovan =
wrote:
> >> > > Hi Inki,
> >> > >
> >> > > 2015-08-07 Inki Dae <inki.dae@samsung.com>:
> >> > >
> >> > >> Hi Gustavo,
> >> > >>
> >> > >> On 2015=EB=85=84 08=EC=9B=94 06=EC=9D=BC 22:31, Gustavo Padov=
an wrote:
> >> > >>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >> > >>>
> >> > >>> struct exynos_drm_encoder was justing wrapping struct drm_en=
coder, it had
> >> > >>> only a drm_encoder member and the internal exynos_drm_encode=
rs ops that
> >> > >>> was directly mapped to the drm_encoder helper funcs.
> >> > >>>
> >> > >>> So now exynos DRM uses struct drm_encoder directly, this rem=
oves
> >> > >>> completely the struct exynos_drm_encoder.
> >> > >>>
> >> > >>
> >> > >> Trats2 board, which uses Exynos4412 Soc, doesn't work after t=
his patch
> >> > >> is applied. Below is the booting logs,
> >> > >> [    1.171318] console [ttySAC2] enabled
> >> > >> [    1.175522] 13830000.serial: ttySAC3 at MMIO 0x13830000 (i=
rq =3D 60,
> >> > >> base_baud =3D 0) is a S3C6400/10
> >> > >> [    1.185545] [drm] Initialized drm 1.1.0 20060810
> >> > >> [    1.194104] exynos-drm exynos-drm: bound 11c00000.fimd (op=
s
> >> > >> fimd_component_ops)
> >> > >> [    1.200352] exynos-drm exynos-drm: bound 11c80000.dsi (ops
> >> > >> exynos_dsi_component_ops)
> >> > >> [    1.207688] [drm] Supports vblank timestamp caching Rev 2 =
(21.10.2013).
> >> > >> [    1.214313] [drm] No driver support for vblank timestamp q=
uery.
> >> > >> [    1.220218] [drm] Initialized exynos 1.0.0 20110530 on min=
or 0
> >> > >>
> >> > >> Booting is locked up here. This patch looks good to me so I t=
ried to
> >> > >> find why locked up and I found the booting is locked up as so=
on as
> >> > >> console_lock function is called. Can you and other guys look =
into this
> >> > >> issue?
> >> > >
> >> > > I've realized that I left a fix for patch 01 behind, it could =
be the
> >> > > cause of this issue. I've just resent this patch with the adde=
d v2 fix
> >> > > up.
> >> >
> >> > With above change, still locked up. So your updated patch doesn'=
t
> >> > resolve this issue.
> >> >
> >> > Anyway, I tested it with fbdev emulation relevant patch series[1=
] and
> >> > the booting was ok with disabling fbdev emulation as Daniel comm=
ented.
> >> > However, I think the booting should also be ok with fbdev emulat=
ion so I
> >> > don't want for your last patch to be merged to mainline until th=
e issue
> >> > is resolved.
> >>
> >> I've tried to reproduce your issue with these patches on a odroid-=
x2
> >> (exynos4412) but it seems to work fine for me with fbdev emulation
> >> enabled. In snow and peach-pi it also works fine. We would need
> >> to debug better on your side to figure out what is breaking for yo=
u.
> >
> > Can you please git bisect this? So we can figure out which commit i=
s
> > causing the issue. That would be great.
>=20
> I already commented above, your last patch - 11/11. Without 11/11, it
> worked well. Did you test odroid-x2 with LVDS based Display panel? If
> so, it's not different because I tested it with Trats2 board with
> MIPI-DSI + Display panel. AFAIK, Odroid-x2 board doesn't support
> MIPI-DSI panel. I will have a pull request soon without 11/11. After
> that, I think we could find and resolve the issue later.

Ah, I thougth your talking about whole patchset! I think I figured out
what was happend the .mode_fixup() and .mode_set() helpers for the DSI
drm_encoder was not set and leading to a null pointer at some pointer.
That is problably what you were experiencing. Could you please try the
new version of patch 11/11 that I've just sent to the mailing list?
And thanks for merging these patches!

	Gustavo
