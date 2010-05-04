From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] S5P6440: Add support for SDHCI interface.
Date: Tue, 4 May 2010 08:19:21 +0100
Message-ID: <20100504071921.GF26401@trinity.fluff.org>
References: <1268141986-10983-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:33072 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753771Ab0EDHTV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 May 2010 03:19:21 -0400
Content-Disposition: inline
In-Reply-To: <1268141986-10983-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

On Tue, Mar 09, 2010 at 07:09:46PM +0530, Thomas Abraham wrote:
> This patch adds support for SDHCI interface for Samsung's S5P6440 SoC.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/mach-s5p6440/Kconfig            |    9 +++++++++
>  arch/arm/mach-s5p6440/cpu.c              |    4 ++++
>  arch/arm/mach-s5p6440/include/mach/map.h |    3 +++
>  arch/arm/plat-s5p/include/plat/s5p6440.h |    1 +
>  drivers/mmc/host/Kconfig                 |    2 +-
>  5 files changed, 18 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s5p6440/Kconfig b/arch/arm/mach-s5p6440/Kconfig
> index 4c29ff8..7a73ae2 100644
> --- a/arch/arm/mach-s5p6440/Kconfig
> +++ b/arch/arm/mach-s5p6440/Kconfig
> @@ -12,9 +12,18 @@ config CPU_S5P6440
>  	help
>  	  Enable S5P6440 CPU support
>  
> +config S5P6440_SETUP_SDHCI
> +	bool
> +	help
> +	  Internal configuration for default SDHCI setup for S5P6440 SoC.
> +
>  config MACH_SMDK6440
>  	bool "SMDK6440"
>  	select CPU_S5P6440
> +	select S5P6440_SETUP_SDHCI
> +	select S3C_DEV_HSMMC
> +	select S3C_DEV_HSMMC1
> +	select S3C_DEV_HSMMC2
>  	help
>  	  Machine support for the Samsung SMDK6440
>  
> diff --git a/arch/arm/mach-s5p6440/cpu.c b/arch/arm/mach-s5p6440/cpu.c
> index 1794131..16f6f0d 100644
> --- a/arch/arm/mach-s5p6440/cpu.c
> +++ b/arch/arm/mach-s5p6440/cpu.c
> @@ -107,6 +107,10 @@ int __init s5p6440_init(void)
>  {
>  	printk(KERN_INFO "S5P6440: Initializing architecture\n");
>  
> +#ifdef CONFIG_MMC_SDHCI_S3C
> +	s5p6440_setup_sdhci();
> +#endif
> +
>  	/* set idle function */
>  	pm_idle = s5p6440_idle;
>  
> diff --git a/arch/arm/mach-s5p6440/include/mach/map.h b/arch/arm/mach-s5p6440/include/mach/map.h
> index 8924e5a..abf462b 100644
> --- a/arch/arm/mach-s5p6440/include/mach/map.h
> +++ b/arch/arm/mach-s5p6440/include/mach/map.h
> @@ -64,5 +64,8 @@
>  /* compatibiltiy defines. */
>  #define S3C_PA_UART		S5P6440_PA_UART
>  #define S3C_PA_IIC		S5P6440_PA_IIC0
> +#define S3C_PA_HSMMC0           S5P6440_PA_HSMMC0
> +#define S3C_PA_HSMMC1           S5P6440_PA_HSMMC1
> +#define S3C_PA_HSMMC2           S5P6440_PA_HSMMC2
>  
>  #endif /* __ASM_ARCH_MAP_H */
> diff --git a/arch/arm/plat-s5p/include/plat/s5p6440.h b/arch/arm/plat-s5p/include/plat/s5p6440.h
> index a4cd75a..0ca8daf 100644
> --- a/arch/arm/plat-s5p/include/plat/s5p6440.h
> +++ b/arch/arm/plat-s5p/include/plat/s5p6440.h
> @@ -15,6 +15,7 @@
>  extern void s5p6440_common_init_uarts(struct s3c2410_uartcfg *cfg, int no);
>  extern void s5p6440_register_clocks(void);
>  extern void s5p6440_setup_clocks(void);
> +extern void s5p6440_setup_sdhci(void);
>  
>  #ifdef CONFIG_CPU_S5P6440
>  
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index ce1d288..811d00b 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -127,7 +127,7 @@ config MMC_SDHCI_PLTFM
>  
>  config MMC_SDHCI_S3C
>  	tristate "SDHCI support on Samsung S3C SoC"
> -	depends on MMC_SDHCI && (PLAT_S3C24XX || PLAT_S3C64XX)
> +	depends on MMC_SDHCI && (PLAT_S3C24XX || PLAT_S3C64XX || PLAT_S5P)
>  	help
>  	  This selects the Secure Digital Host Controller Interface (SDHCI)
>  	  often referrered to as the HSMMC block in some of the Samsung S3C

Hmm, should we change to depending on PLAT_SAMSUNG instead, or have a
HAVE_S3C_SDHCI which the relevant platforms/SoCs select? not all S3C24XX
have this.


> 1.6.6.rc2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
