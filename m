From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: Add 5800 SoC support
Date: Fri, 23 May 2014 23:06:17 +0200
Message-ID: <537FB849.10303@gmail.com>
References: <1400830448-28501-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:52080 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751334AbaEWVGX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 17:06:23 -0400
Received: by mail-wi0-f177.google.com with SMTP id f8so1489811wiw.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2014 14:06:22 -0700 (PDT)
In-Reply-To: <1400830448-28501-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, arunkk.samsung@gmail.com

Hi Arun,

On 23.05.2014 09:34, Arun Kumar K wrote:
> Exynos5800 is an octa core SoC which is based on the 5420
> platform. This patch adds the basic support for it in the
> mach-exynos.
> 
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig   |    5 +++++
>  arch/arm/mach-exynos/common.h  |   11 ++++++++++-
>  arch/arm/mach-exynos/platsmp.c |    2 +-
>  3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 4663417..c5423da 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -99,6 +99,11 @@ config SOC_EXYNOS5440
>  	help
>  	  Enable EXYNOS5440 SoC support
>  
> +config SOC_EXYNOS5800
> +	bool "SAMSUNG EXYNOS5800"
> +	default y
> +	depends on SOC_EXYNOS5420
> +
>  endmenu
>  
>  config EXYNOS5420_MCPM
> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
> index ae5f648..8fbc55b 100644
> --- a/arch/arm/mach-exynos/common.h
> +++ b/arch/arm/mach-exynos/common.h
> @@ -23,6 +23,7 @@
>  #define EXYNOS5250_SOC_ID	0x43520000
>  #define EXYNOS5420_SOC_ID	0xE5420000
>  #define EXYNOS5440_SOC_ID	0xE5440000
> +#define EXYNOS5800_SOC_ID	0xE5422000
>  #define EXYNOS5_SOC_MASK	0xFFFFF000
>  
>  extern unsigned long samsung_cpu_id;
> @@ -39,6 +40,7 @@ IS_SAMSUNG_CPU(exynos4412, EXYNOS4412_CPU_ID, EXYNOS4_CPU_MASK)
>  IS_SAMSUNG_CPU(exynos5250, EXYNOS5250_SOC_ID, EXYNOS5_SOC_MASK)
>  IS_SAMSUNG_CPU(exynos5420, EXYNOS5420_SOC_ID, EXYNOS5_SOC_MASK)
>  IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
> +IS_SAMSUNG_CPU(exynos5800, EXYNOS5800_SOC_ID, EXYNOS5_SOC_MASK)
>  
>  #if defined(CONFIG_CPU_EXYNOS4210)
>  # define soc_is_exynos4210()	is_samsung_exynos4210()
> @@ -80,9 +82,16 @@ IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
>  # define soc_is_exynos5440()	0
>  #endif
>  
> +#if defined(CONFIG_SOC_EXYNOS5800)
> +# define soc_is_exynos5800()	is_samsung_exynos5800()
> +#else
> +# define soc_is_exynos5800()	0
> +#endif
> +
>  #define soc_is_exynos4() (soc_is_exynos4210() || soc_is_exynos4212() || \
>  			  soc_is_exynos4412())
> -#define soc_is_exynos5() (soc_is_exynos5250() || soc_is_exynos5420())
> +#define soc_is_exynos5() (soc_is_exynos5250() || soc_is_exynos5420() || \
> +			  soc_is_exynos5800())
>  
>  void mct_init(void __iomem *base, int irq_g0, int irq_l0, int irq_l1);
>  
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
> index 9c16da2..112bc66 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -70,7 +70,7 @@ static inline void __iomem *cpu_boot_reg(int cpu)
>  		return ERR_PTR(-ENODEV);
>  	if (soc_is_exynos4412())
>  		boot_reg += 4*cpu;
> -	else if (soc_is_exynos5420())
> +	else if (soc_is_exynos5420() || soc_is_exynos5800())
>  		boot_reg += 4;
>  	return boot_reg;
>  }
> 

Isn't this SoC a multi-cluster one? Shouldn't it rather use MCPM SMP ops
and so the code being changed here be ignored completely?

Best regards,
Tomasz
