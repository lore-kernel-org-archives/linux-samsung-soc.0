From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: add fimd dependency to fimd related encoders
Date: Fri, 23 May 2014 23:25:54 +0900
Message-ID: <537F5A72.6000402@samsung.com>
References: <1400842768-20622-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:27817 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751113AbaEWOZ5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 10:25:57 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N61003FC6R7Z800@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 May 2014 23:25:55 +0900 (KST)
In-reply-to: <1400842768-20622-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, m.szyprowski@samsung.com

On 2014=EB=85=84 05=EC=9B=94 23=EC=9D=BC 19:59, Andrzej Hajda wrote:
> DPI, DSI and DP drivers will not work without FIMD.
> The patch adds appropriate dependencies in Kconfig.

Applied.

Thanks,
Inki Dae

>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/=
Kconfig
> index e0d73fb..178d2a9 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -33,7 +33,7 @@ config DRM_EXYNOS_FIMD
> =20
>  config DRM_EXYNOS_DPI
>  	bool "EXYNOS DRM parallel output support"
> -	depends on DRM_EXYNOS
> +	depends on DRM_EXYNOS_FIMD
>  	select DRM_PANEL
>  	default n
>  	help
> @@ -41,7 +41,7 @@ config DRM_EXYNOS_DPI
> =20
>  config DRM_EXYNOS_DSI
>  	bool "EXYNOS DRM MIPI-DSI driver support"
> -	depends on DRM_EXYNOS
> +	depends on DRM_EXYNOS_FIMD
>  	select DRM_MIPI_DSI
>  	select DRM_PANEL
>  	default n
> @@ -50,7 +50,7 @@ config DRM_EXYNOS_DSI
> =20
>  config DRM_EXYNOS_DP
>  	bool "EXYNOS DRM DP driver support"
> -	depends on DRM_EXYNOS && ARCH_EXYNOS && (DRM_PTN3460=3Dn || DRM_PTN=
3460=3Dy || DRM_PTN3460=3DDRM_EXYNOS)
> +	depends on DRM_EXYNOS_FIMD && ARCH_EXYNOS && (DRM_PTN3460=3Dn || DR=
M_PTN3460=3Dy || DRM_PTN3460=3DDRM_EXYNOS)
>  	default DRM_EXYNOS
>  	help
>  	  This enables support for DP device.
>=20
