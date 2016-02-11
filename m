From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 01/10] drm/exynos: depend on ARCH_EXYNOS for DRM_EXYNOS
Date: Thu, 11 Feb 2016 20:17:31 +0900
Message-ID: <56BC6DCB.4000804@samsung.com>
References: <1454503374-16382-1-git-send-email-m.szyprowski@samsung.com>
 <1454503374-16382-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59836 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbcBKLRd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Feb 2016 06:17:33 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O2D00O5QRD77M20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Feb 2016 20:17:31 +0900 (KST)
In-reply-to: <1454503374-16382-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>


Hi Marek,

=46or all patches, picked them up.

Thanks,
Inki Dae

2016=EB=85=84 02=EC=9B=94 03=EC=9D=BC 21:42=EC=97=90 Marek Szyprowski =EC=
=9D=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> From: Joonyoung Shim <jy0922.shim@samsung.com>
>=20
> Because PLAT_SAMSUNG isn't include exynos SoCs for arm64, but
> ARCH_EXYNOS can do it. And it also needs to add ARCH_S3C64XX instead =
of
> PLAT_SAMSUNG.
>=20
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/=
Kconfig
> index 83efca9..f17d392 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -1,6 +1,6 @@
>  config DRM_EXYNOS
>  	tristate "DRM Support for Samsung SoC EXYNOS Series"
> -	depends on OF && DRM && (PLAT_SAMSUNG || ARCH_MULTIPLATFORM)
> +	depends on OF && DRM && (ARCH_S3C64XX || ARCH_EXYNOS || ARCH_MULTIP=
LATFORM)
>  	select DRM_KMS_HELPER
>  	select DRM_KMS_FB_HELPER
>  	select FB_CFB_FILLRECT
>=20
