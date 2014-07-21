From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/3] drm/exynos: Allow module to be autoloaded
Date: Mon, 21 Jul 2014 12:02:04 +0900
Message-ID: <53CC82AC.9060301@samsung.com>
References: <1405715801-5325-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40240 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752025AbaGUDCH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Jul 2014 23:02:07 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9100GMPKFHA3C0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 21 Jul 2014 12:02:05 +0900 (KST)
In-reply-to: <1405715801-5325-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

On 2014=EB=85=84 07=EC=9B=94 19=EC=9D=BC 05:36, Sjoerd Simons wrote:
> The exynos DRM module currently is not automatically loaded when buil=
d as a
> module. This is due to the simple fact that it doesn't have any
> MODULE_DEVICE_TABLE entries whatsoever... Most of these were removed =
previously
> as it wasn't possible at the time to have multiple calls to MODULE_DE=
VICE_TABLE
> in one module, however commit 21bdd17b21b45ea solved that.
>=20
> The first two patches revert the previous removals of MODULE_DEVICE_T=
ABLE
> calls, while the last one adds calls for the remaining OF match table=
s without a
> MODULE_DEVICE_TABLE call.

Hi,

Exynos drm follows single-driver model. So each usb driver of Exynos dr=
m
wouldn't need its own MODULE_DEVICE_TABLE.

Thanks,
Inki Dae

>=20
> Sjoerd Simons (3):
>   Revert "drm/exynos: fix module build error"
>   Revert "drm/exynos: remove MODULE_DEVICE_TABLE definitions"
>   drm/exynos: Add MODULE_DEVICE_TABLE entries for various components
>=20
>  drivers/gpu/drm/exynos/exynos_dp_core.c     | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c    | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c    | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c     | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c | 1 +
>  drivers/gpu/drm/exynos/exynos_hdmi.c        | 1 +
>  drivers/gpu/drm/exynos/exynos_mixer.c       | 1 +
>  8 files changed, 8 insertions(+)
>=20
