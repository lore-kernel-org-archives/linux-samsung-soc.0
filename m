From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [RFC PATCH] ARM: exynos_defconfig: Enable Samsung media platform
 drivers as modules
Date: Wed, 23 Mar 2016 20:32:17 +0100
Message-ID: <56F2EF41.2000701@math.uni-bielefeld.de>
References: <1458745109-21036-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:48585 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753079AbcCWTcY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 15:32:24 -0400
In-Reply-To: <1458745109-21036-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hello Javier,

I think the G2D and probably also the GSC v4l drivers should be left
off, since they use the same resources as their DRM counterparts.

With best wishes,
Tobias


Javier Martinez Canillas wrote:
> There are a bunch of media platform drivers under drivers/media/platform/
> that are for Samsung SoCs but are not being built with exynos_defconfig.
> 
> This patch enables them as a module to improve build coverage for these
> drivers and also to allow people use them with proper hardware if modules
> are installed. The S5P MFC driver wasn't enabled since it fails to probe.
> 
> Only the boolean Kconfig symbols are enabled as built-in, since drivers
> are not critical and also to keep the kernel binary image size as small
> as possible.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> Hello Kukjin and Krzysztof,
> 
> I'm posting this as a RFC because I don't know if it will add too much bloat
> to a kernel built with exynos_defconfig.
> 
> I think it doesn't since the image size only increased 15 KiB which seems to
> be a small price for having these built, but you may have another opinion.
> 
> Best regards,
> Javier
> 
>  arch/arm/configs/exynos_defconfig | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 6ffd7e76f3ce..4d25489f381b 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -136,8 +136,20 @@ CONFIG_REGULATOR_S5M8767=y
>  CONFIG_REGULATOR_TPS65090=y
>  CONFIG_MEDIA_SUPPORT=m
>  CONFIG_MEDIA_CAMERA_SUPPORT=y
> +CONFIG_MEDIA_CONTROLLER=y
> +CONFIG_VIDEO_V4L2_SUBDEV_API=y
>  CONFIG_MEDIA_USB_SUPPORT=y
>  CONFIG_USB_VIDEO_CLASS=m
> +CONFIG_V4L_PLATFORM_DRIVERS=y
> +CONFIG_VIDEO_SAMSUNG_EXYNOS4_IS=m
> +CONFIG_VIDEO_S5P_FIMC=m
> +CONFIG_VIDEO_S5P_MIPI_CSIS=m
> +CONFIG_VIDEO_EXYNOS_FIMC_LITE=m
> +CONFIG_VIDEO_EXYNOS4_FIMC_IS=m
> +CONFIG_V4L_MEM2MEM_DRIVERS=y
> +CONFIG_VIDEO_SAMSUNG_S5P_G2D=m
> +CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
> +CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
>  CONFIG_DRM=y
>  CONFIG_DRM_NXP_PTN3460=y
>  CONFIG_DRM_PARADE_PS8622=y
> 
