From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 1/3] arm64: defconfig: Enable video,
 DRM and LPASS drivers for Exynos5433 and Exynos7
Date: Wed, 15 Mar 2017 10:01:58 +0900
Message-ID: <58C89286.20003@samsung.com>
References: <20170314171028.20337-1-krzk@kernel.org>
 <CGME20170314171149epcas5p444bc8e7f4a338ab207c8e3f1bdbe267d@epcas5p4.samsung.com>
 <20170314171028.20337-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52822 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750914AbdCOBCB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 21:02:01 -0400
In-reply-to: <20170314171028.20337-2-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>

Hi,

On 2017년 03월 15일 02:10, Krzysztof Kozlowski wrote:
> Enable drivers specific to Exynos5433 and Exynos7:
> 1. MFD Low Power Audio SubSystem (LPASS),
> 2. DRM drivers (DECON display, outputs),
> 3. Drivers for video-related sub-blocks (JPEG, Multi Format Codec,
>    GScaler).
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/configs/defconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5e7fa211eb0a..3b54794d3166 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -302,6 +302,7 @@ CONFIG_RENESAS_WDT=y
>  CONFIG_S3C2410_WATCHDOG=y
>  CONFIG_MESON_GXBB_WATCHDOG=m
>  CONFIG_MESON_WATCHDOG=m
> +CONFIG_MFD_EXYNOS_LPASS=m
>  CONFIG_MFD_MAX77620=y
>  CONFIG_MFD_RK808=y
>  CONFIG_MFD_SPMI_PMIC=y
> @@ -327,10 +328,20 @@ CONFIG_MEDIA_CONTROLLER=y
>  CONFIG_VIDEO_V4L2_SUBDEV_API=y
>  # CONFIG_DVB_NET is not set
>  CONFIG_V4L_MEM2MEM_DRIVERS=y
> +CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
> +CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
> +CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
>  CONFIG_VIDEO_RENESAS_FCP=m
>  CONFIG_VIDEO_RENESAS_VSP1=m
>  CONFIG_DRM=m
>  CONFIG_DRM_NOUVEAU=m
> +CONFIG_DRM_EXYNOS=m
> +CONFIG_DRM_EXYNOS5433_DECON=y
> +CONFIG_DRM_EXYNOS7_DECON=y
> +CONFIG_DRM_EXYNOS_DSI=y
> +# CONFIG_DRM_EXYNOS_DP is not set
> +CONFIG_DRM_EXYNOS_HDMI=y
> +CONFIG_DRM_EXYNOS_MIC=y
>  CONFIG_DRM_RCAR_DU=m
>  CONFIG_DRM_RCAR_HDMI=y
>  CONFIG_DRM_RCAR_LVDS=y
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
