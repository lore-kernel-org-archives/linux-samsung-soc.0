From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: EXYNOS: Fix EXYNOS_DEV_DMA Kconfig entry
Date: Fri, 22 Jun 2012 11:09:58 +0900
Message-ID: <04ac01cd501c$1fc7b320$5f571960$%kim@samsung.com>
References: <1340279701-22822-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:17044 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760864Ab2FVCJ7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jun 2012 22:09:59 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5Z003B2XXKCR90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Jun 2012 11:09:58 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5Z00AGGY0M1550@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Jun 2012 11:09:58 +0900 (KST)
In-reply-to: <1340279701-22822-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: boojin.kim@samsung.com, patches@linaro.org

Sachin Kamat wrote:
> 
> Commit 20ef9e08 ("ARM: EXYNOS: Support DMA for EXYNOS5250 SoC")
> renamed EXYNOS4_DEV_DMA to EXYNOS_DEV_DMA. But some machine entries
> still had EXYNOS4_DEV_DMA. Changed them to EXYNOS_DEV_DMA.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/Kconfig |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index f5fb6ea..498596b 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -213,7 +213,7 @@ config MACH_SMDKV310
>  	select EXYNOS_DEV_SYSMMU
>  	select EXYNOS4_DEV_AHCI
>  	select SAMSUNG_DEV_KEYPAD
> -	select EXYNOS4_DEV_DMA
> +	select EXYNOS_DEV_DMA
>  	select SAMSUNG_DEV_PWM
>  	select EXYNOS4_DEV_USB_OHCI
>  	select EXYNOS4_SETUP_FIMD0
> @@ -265,7 +265,7 @@ config MACH_UNIVERSAL_C210
>  	select S5P_DEV_ONENAND
>  	select S5P_DEV_TV
>  	select EXYNOS_DEV_SYSMMU
> -	select EXYNOS4_DEV_DMA
> +	select EXYNOS_DEV_DMA
>  	select EXYNOS_DEV_DRM
>  	select EXYNOS4_SETUP_FIMD0
>  	select EXYNOS4_SETUP_I2C1
> @@ -304,7 +304,7 @@ config MACH_NURI
>  	select S5P_DEV_MFC
>  	select S5P_DEV_USB_EHCI
>  	select S5P_SETUP_MIPIPHY
> -	select EXYNOS4_DEV_DMA
> +	select EXYNOS_DEV_DMA
>  	select EXYNOS_DEV_DRM
>  	select EXYNOS4_SETUP_FIMC
>  	select EXYNOS4_SETUP_FIMD0
> @@ -343,7 +343,7 @@ config MACH_ORIGEN
>  	select SAMSUNG_DEV_PWM
>  	select EXYNOS_DEV_DRM
>  	select EXYNOS_DEV_SYSMMU
> -	select EXYNOS4_DEV_DMA
> +	select EXYNOS_DEV_DMA
>  	select EXYNOS4_DEV_USB_OHCI
>  	select EXYNOS4_SETUP_FIMD0
>  	select EXYNOS4_SETUP_SDHCI
> --
> 1.7.4.1

Yeah, right. I will apply this into fixes.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
