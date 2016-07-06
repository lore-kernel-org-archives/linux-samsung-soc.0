From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] drm/exynos: make fbdev support really optional
Date: Wed, 6 Jul 2016 15:51:21 +0200
Message-ID: <577D0CD9.9020607@math.uni-bielefeld.de>
References: <1466769168-31602-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:45520 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754679AbcGFNvZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Jul 2016 09:51:25 -0400
In-Reply-To: <1466769168-31602-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com

Ping!

- Tobias

Tobias Jakobi wrote:
> Currently enabling Exynos DRM support automatically pulls in
> lots of fbdev dependencies. However these deps are
> unnecessary since DRM core already enables them when
> needed.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/exynos/Kconfig | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index baddf33..590559c 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -2,10 +2,6 @@ config DRM_EXYNOS
>  	tristate "DRM Support for Samsung SoC EXYNOS Series"
>  	depends on OF && DRM && (ARCH_S3C64XX || ARCH_EXYNOS || ARCH_MULTIPLATFORM)
>  	select DRM_KMS_HELPER
> -	select DRM_KMS_FB_HELPER
> -	select FB_CFB_FILLRECT
> -	select FB_CFB_COPYAREA
> -	select FB_CFB_IMAGEBLIT
>  	select VIDEOMODE_HELPERS
>  	help
>  	  Choose this option if you have a Samsung SoC EXYNOS chipset.
> 
