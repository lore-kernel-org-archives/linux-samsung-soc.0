From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH -v4 0/8] drm/exynos: clean up patches (preparing for atomic)
Date: Mon, 06 Apr 2015 19:38:46 +0900
Message-ID: <55226236.8070307@samsung.com>
References: <1427904132-15677-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:14533 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752654AbbDFKit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Apr 2015 06:38:49 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NMD00ET3S8NKE90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Apr 2015 19:38:47 +0900 (KST)
In-reply-to: <1427904132-15677-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

On 2015=EB=85=84 04=EC=9B=94 02=EC=9D=BC 01:02, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> Hi,
>=20
> Here goes some clean ups to the exynos drivers. The main clean ups is
> the presetting and zpos making the property immutable and the removal
> of *_win_data structures.
>=20
> v2 contains a extra patch to fix alpha setting for planes in fimd, so
> now fimd works fine even after the removal of struct fimd_win_data.
>=20
> v3 removes a leftover var in the first commit and address the comment=
 from
> Joonyoung about checking the return value of exynos_plane_init()
>=20
> v4 rebases on top of Daniel Stone patch, currently only applied to
> exynos-drm-fixes

Applied.

Thanks,
Inki Dae

>=20
> Gustavo Padovan (7):
>   drm/exynos: fimd: fix alpha setting for XR24 pixel format
>   drm/exynos: remove unused exynos_crtc->win_enable() callback
>   drm/exynos: remove struct *_win_data abstraction on planes
>   drm/exynos: preset zpos value for overlay planes
>   drm/exynos: make zpos property immutable
>   drm/exynos: remove exynos_plane_destroy()
>   drm/exynos: remove leftover functions declarations
>=20
> Mandeep Singh Baines (1):
>   drm/exynos: track vblank events on a per crtc basis
>=20
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 178 ++++++++-----------=
---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c   | 101 ++++++-------
>  drivers/gpu/drm/exynos/exynos_drm_crtc.h   |   7 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.c    |  27 ----
>  drivers/gpu/drm/exynos/exynos_drm_drv.h    |  20 +--
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 230 ++++++++++++-------=
----------
>  drivers/gpu/drm/exynos/exynos_drm_plane.c  |  66 ++-------
>  drivers/gpu/drm/exynos/exynos_drm_plane.h  |   7 +-
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c   | 136 +++++------------
>  drivers/gpu/drm/exynos/exynos_mixer.c      | 221 ++++++++++---------=
--------
>  include/video/samsung_fimd.h               |   5 +
>  11 files changed, 345 insertions(+), 653 deletions(-)
>=20
