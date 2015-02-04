From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: IOMMU support should not be selectable by user
Date: Wed, 04 Feb 2015 14:17:34 +0900
Message-ID: <54D1AB6E.3080900@samsung.com>
References: <1421764274-26398-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:9503 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750879AbbBDFRh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Feb 2015 00:17:37 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJ800HJEEPBW5C0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Feb 2015 14:17:35 +0900 (KST)
In-reply-to: <1421764274-26398-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, kyungmin.park@samsung.com

On 2015=EB=85=84 01=EC=9B=94 20=EC=9D=BC 23:31, Marek Szyprowski wrote:
> If system provides IOMMU feature, Exynos DRM should use it by default=
,
> because the Exynos DRM subdrivers don't work correctly when Exynos IO=
MMU
> driver has been enabled and no IOMMU support has been compiled into E=
xynos
> DRM driver.

Applied.

Thanks,
Inki Dae

>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/Kconfig | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/=
Kconfig
> index 7f9f6f9e9b7e..39fe490efcd4 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -13,10 +13,9 @@ config DRM_EXYNOS
>  	  If M is selected the module will be called exynosdrm.
> =20
>  config DRM_EXYNOS_IOMMU
> -	bool "EXYNOS DRM IOMMU Support"
> +	bool
>  	depends on DRM_EXYNOS && EXYNOS_IOMMU && ARM_DMA_USE_IOMMU
> -	help
> -	  Choose this option if you want to use IOMMU feature for DRM.
> +	default y
> =20
>  config DRM_EXYNOS_DMABUF
>  	bool "EXYNOS DRM DMABUF"
>=20
