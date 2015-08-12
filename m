From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v2 11/11] drm/exynos: remove struct exynos_drm_encoder
 layer
Date: Wed, 12 Aug 2015 12:54:06 -0300
Message-ID: <20150812155406.GA6769@joana>
References: <1438817060-22164-10-git-send-email-gustavo@padovan.org>
 <1438867908-18975-1-git-send-email-gustavo@padovan.org>
 <1438867908-18975-2-git-send-email-gustavo@padovan.org>
 <55C49B8A.4090009@samsung.com>
 <20150811003833.GE8125@joana>
 <55C9E702.8060603@samsung.com>
 <20150812154900.GA16747@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:35203 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753552AbbHLPyK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Aug 2015 11:54:10 -0400
Received: by ykdz80 with SMTP id z80so17600463ykd.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Aug 2015 08:54:09 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150812154900.GA16747@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Cc: Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de

2015-08-12 Gustavo Padovan <gustavo.padovan@collabora.co.uk>:

> Hi Inki,
>=20
> 2015-08-11 Inki Dae <inki.dae@samsung.com>:
>=20
> > On 2015=EB=85=84 08=EC=9B=94 11=EC=9D=BC 09:38, Gustavo Padovan wro=
te:
> > > Hi Inki,
> > >=20
> > > 2015-08-07 Inki Dae <inki.dae@samsung.com>:
> > >=20
> > >> Hi Gustavo,
> > >>
> > >> On 2015=EB=85=84 08=EC=9B=94 06=EC=9D=BC 22:31, Gustavo Padovan =
wrote:
> > >>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > >>>
> > >>> struct exynos_drm_encoder was justing wrapping struct drm_encod=
er, it had
> > >>> only a drm_encoder member and the internal exynos_drm_encoders =
ops that
> > >>> was directly mapped to the drm_encoder helper funcs.
> > >>>
> > >>> So now exynos DRM uses struct drm_encoder directly, this remove=
s
> > >>> completely the struct exynos_drm_encoder.
> > >>>
> > >>
> > >> Trats2 board, which uses Exynos4412 Soc, doesn't work after this=
 patch
> > >> is applied. Below is the booting logs,
> > >> [    1.171318] console [ttySAC2] enabled
> > >> [    1.175522] 13830000.serial: ttySAC3 at MMIO 0x13830000 (irq =
=3D 60,
> > >> base_baud =3D 0) is a S3C6400/10
> > >> [    1.185545] [drm] Initialized drm 1.1.0 20060810
> > >> [    1.194104] exynos-drm exynos-drm: bound 11c00000.fimd (ops
> > >> fimd_component_ops)
> > >> [    1.200352] exynos-drm exynos-drm: bound 11c80000.dsi (ops
> > >> exynos_dsi_component_ops)
> > >> [    1.207688] [drm] Supports vblank timestamp caching Rev 2 (21=
=2E10.2013).
> > >> [    1.214313] [drm] No driver support for vblank timestamp quer=
y.
> > >> [    1.220218] [drm] Initialized exynos 1.0.0 20110530 on minor =
0
> > >>
> > >> Booting is locked up here. This patch looks good to me so I trie=
d to
> > >> find why locked up and I found the booting is locked up as soon =
as
> > >> console_lock function is called. Can you and other guys look int=
o this
> > >> issue?
> > >=20
> > > I've realized that I left a fix for patch 01 behind, it could be =
the
> > > cause of this issue. I've just resent this patch with the added v=
2 fix
> > > up.
> >=20
> > With above change, still locked up. So your updated patch doesn't
> > resolve this issue.
> >=20
> > Anyway, I tested it with fbdev emulation relevant patch series[1] a=
nd
> > the booting was ok with disabling fbdev emulation as Daniel comment=
ed.
> > However, I think the booting should also be ok with fbdev emulation=
 so I
> > don't want for your last patch to be merged to mainline until the i=
ssue
> > is resolved.
>=20
> I've tried to reproduce your issue with these patches on a odroid-x2
> (exynos4412) but it seems to work fine for me with fbdev emulation
> enabled. In snow and peach-pi it also works fine. We would need
> to debug better on your side to figure out what is breaking for you.

Can you please git bisect this? So we can figure out which commit is
causing the issue. That would be great.

	Gustavo
