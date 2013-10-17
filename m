From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Initialize L2x0 cache controller for
 Exynos4 only
Date: Thu, 17 Oct 2013 15:05:21 +0200
Message-ID: <3434799.pjC3lbNE3P@amdc1227>
References: <1382011392-18199-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:26770 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753811Ab3JQNFZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 09:05:25 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUT00MTPDN42690@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Oct 2013 14:05:23 +0100 (BST)
In-reply-to: <1382011392-18199-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tushar.behera@linaro.org

Hi Sachin,

On Thursday 17 of October 2013 17:33:12 Sachin Kamat wrote:
> L2x0 cache controller is present only in Cortex-A9 based Exynos4 SoCs.
> Thus move this function to Exynos4 early init call to avoid non-Exynos4
> SoCs from calling this function in multi-platform support.

I believe that at the time .init_early() is called there is no ioremap()
infrastructure working yet and so L2 cache initialization which needs
it will cause a kernel panic. This patch worked only because currently
there is no L2X0 controller defined in device tree sources of Exynos 4.

Other than that, it will be required to register firmware operations
before L2X0 initialization, because on some boards it is needed to
initialize the L2 cache through secure firmware.

Please let me handle this by the way of patches adding firmware based
L2X0 initialization.

Best regards,
Tomasz

> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> Tested on Origen(4210), Arndale(5250) and 5420 boards.
> ---
>  arch/arm/mach-exynos/common.c          |    3 +--
>  arch/arm/mach-exynos/common.h          |    2 +-
>  arch/arm/mach-exynos/mach-exynos4-dt.c |    9 ++++++++-
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index 1510436..f822b226 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -396,7 +396,7 @@ static int __init exynos_core_init(void)
>  }
>  core_initcall(exynos_core_init);
>  
> -static int __init exynos4_l2x0_cache_init(void)
> +int __init exynos4_l2x0_cache_init(void)
>  {
>  	int ret;
>  
> @@ -408,7 +408,6 @@ static int __init exynos4_l2x0_cache_init(void)
>  	clean_dcache_area(&l2x0_regs_phys, sizeof(unsigned long));
>  	return 0;
>  }
> -early_initcall(exynos4_l2x0_cache_init);
>  
>  static int __init exynos_init(void)
>  {
> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
> index 3f03334..3031321 100644
> --- a/arch/arm/mach-exynos/common.h
> +++ b/arch/arm/mach-exynos/common.h
> @@ -24,7 +24,7 @@ void exynos5_restart(enum reboot_mode mode, const char *cmd);
>  void exynos_cpuidle_init(void);
>  void exynos_cpufreq_init(void);
>  void exynos_init_late(void);
> -
> +int exynos4_l2x0_cache_init(void);
>  void exynos_firmware_init(void);
>  
>  #ifdef CONFIG_PM_GENERIC_DOMAINS
> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
> index ffd19a0..2e6f51c 100644
> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -49,11 +49,18 @@ static void __init exynos4_reserve(void)
>  				mfc_mem.lsize);
>  #endif
>  }
> +
> +static void __init exynos4_early_init(void)
> +{
> +	exynos4_l2x0_cache_init();
> +	exynos_firmware_init();
> +}
> +
>  DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 (Flattened Device Tree)")
>  	/* Maintainer: Thomas Abraham <thomas.abraham@linaro.org> */
>  	.smp		= smp_ops(exynos_smp_ops),
>  	.map_io		= exynos_init_io,
> -	.init_early	= exynos_firmware_init,
> +	.init_early	= exynos4_early_init,
>  	.init_machine	= exynos4_dt_machine_init,
>  	.init_late	= exynos_init_late,
>  	.dt_compat	= exynos4_dt_compat,
> 
