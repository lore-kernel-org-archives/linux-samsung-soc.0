From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v2 11/11] drm/exynos: remove struct exynos_drm_encoder
 layer
Date: Mon, 10 Aug 2015 21:38:33 -0300
Message-ID: <20150811003833.GE8125@joana>
References: <1438817060-22164-10-git-send-email-gustavo@padovan.org>
 <1438867908-18975-1-git-send-email-gustavo@padovan.org>
 <1438867908-18975-2-git-send-email-gustavo@padovan.org>
 <55C49B8A.4090009@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f169.google.com ([209.85.160.169]:34490 "EHLO
	mail-yk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932670AbbHKAih convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Aug 2015 20:38:37 -0400
Received: by ykdt205 with SMTP id t205so73901922ykd.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Aug 2015 17:38:36 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55C49B8A.4090009@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Inki,

2015-08-07 Inki Dae <inki.dae@samsung.com>:

> Hi Gustavo,
>=20
> On 2015=EB=85=84 08=EC=9B=94 06=EC=9D=BC 22:31, Gustavo Padovan wrote=
:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >=20
> > struct exynos_drm_encoder was justing wrapping struct drm_encoder, =
it had
> > only a drm_encoder member and the internal exynos_drm_encoders ops =
that
> > was directly mapped to the drm_encoder helper funcs.
> >=20
> > So now exynos DRM uses struct drm_encoder directly, this removes
> > completely the struct exynos_drm_encoder.
> >=20
>=20
> Trats2 board, which uses Exynos4412 Soc, doesn't work after this patc=
h
> is applied. Below is the booting logs,
> [    1.171318] console [ttySAC2] enabled
> [    1.175522] 13830000.serial: ttySAC3 at MMIO 0x13830000 (irq =3D 6=
0,
> base_baud =3D 0) is a S3C6400/10
> [    1.185545] [drm] Initialized drm 1.1.0 20060810
> [    1.194104] exynos-drm exynos-drm: bound 11c00000.fimd (ops
> fimd_component_ops)
> [    1.200352] exynos-drm exynos-drm: bound 11c80000.dsi (ops
> exynos_dsi_component_ops)
> [    1.207688] [drm] Supports vblank timestamp caching Rev 2 (21.10.2=
013).
> [    1.214313] [drm] No driver support for vblank timestamp query.
> [    1.220218] [drm] Initialized exynos 1.0.0 20110530 on minor 0
>=20
> Booting is locked up here. This patch looks good to me so I tried to
> find why locked up and I found the booting is locked up as soon as
> console_lock function is called. Can you and other guys look into thi=
s
> issue?

I've realized that I left a fix for patch 01 behind, it could be the
cause of this issue. I've just resent this patch with the added v2 fix
up.

	Gustavo
