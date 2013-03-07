From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: remove EXYNOS_DEV_SYSMMU entirely
Date: Thu, 07 Mar 2013 10:12:52 +0900
Message-ID: <014f01ce1ad0$e4432b10$acc98130$%kim@samsung.com>
References: <1362509466.16460.108.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33895 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752224Ab3CGBMy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 20:12:54 -0500
In-reply-to: <1362509466.16460.108.camel@x61.thuisdomein>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Paul Bolle' <pebolle@tiscali.nl>, 'Russell King' <linux@arm.linux.org.uk>
Cc: 'KyongHo Cho' <pullip.cho@samsung.com>, 'Joerg Roedel' <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Paul Bolle wrote:
> 
> Commit 25e9d28d927d2e1731df53f60cde53d75bcb7c36 ("ARM: EXYNOS: remove
> system mmu initialization from exynos tree") removed the Kconfig symbol
> EXYNOS_DEV_SYSMMU. Remove its last traces too.
> 
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> 0) Untested.
> 
> 1) Please note that this patch changes the dependencies of EXYNOS_IOMMU
> (it removed a dependency that could never be met). That's probably what
> needs to be done but some specific review is needed here.
> 
>  arch/arm/mach-exynos/Kconfig | 4 ----
>  drivers/iommu/Kconfig        | 2 +-
>  2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 70f94c8..6c2bdc3 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -200,7 +200,6 @@ config MACH_SMDKV310
>  	select EXYNOS4_SETUP_USB_PHY
>  	select EXYNOS_DEV_DMA
>  	select EXYNOS_DEV_DRM
> -	select EXYNOS_DEV_SYSMMU
>  	select S3C24XX_PWM
>  	select S3C_DEV_HSMMC
>  	select S3C_DEV_HSMMC1
> @@ -254,7 +253,6 @@ config MACH_UNIVERSAL_C210
>  	select EXYNOS4_SETUP_USB_PHY
>  	select EXYNOS_DEV_DMA
>  	select EXYNOS_DEV_DRM
> -	select EXYNOS_DEV_SYSMMU
>  	select HAVE_SCHED_CLOCK
>  	select S3C_DEV_HSMMC
>  	select S3C_DEV_HSMMC2
> @@ -331,7 +329,6 @@ config MACH_ORIGEN
>  	select EXYNOS4_SETUP_USB_PHY
>  	select EXYNOS_DEV_DMA
>  	select EXYNOS_DEV_DRM
> -	select EXYNOS_DEV_SYSMMU
>  	select S3C24XX_PWM
>  	select S3C_DEV_HSMMC
>  	select S3C_DEV_HSMMC2
> @@ -367,7 +364,6 @@ config MACH_SMDK4212
>  	select EXYNOS4_SETUP_USB_PHY
>  	select EXYNOS_DEV_DMA
>  	select EXYNOS_DEV_DRM
> -	select EXYNOS_DEV_SYSMMU
>  	select S3C24XX_PWM
>  	select S3C_DEV_HSMMC2
>  	select S3C_DEV_HSMMC3
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 5c514d07..c520c20 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -168,7 +168,7 @@ config TEGRA_IOMMU_SMMU
> 
>  config EXYNOS_IOMMU
>  	bool "Exynos IOMMU Support"
> -	depends on ARCH_EXYNOS && EXYNOS_DEV_SYSMMU
> +	depends on ARCH_EXYNOS
>  	select IOMMU_API
>  	help
>  	  Support for the IOMMU(System MMU) of Samsung Exynos application
> --
> 1.7.11.7

Actually, to update iommu for exynos is on-going. And as I know, it will be done this time for v3.10 by KyongHo Cho, so it would be better to handle this cleanup with that at the same time.

Thanks.

- Kukjin
