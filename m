From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/3] ARM: EXYNOS: Enable multi-platform build support
Date: Wed, 21 May 2014 12:36:07 +0200
Message-ID: <1635304.bK37Q0Q4AO@amdc1032>
References: <1400655169-21683-1-git-send-email-sachin.kamat@linaro.org>
 <1400655169-21683-3-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:65437 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751120AbaEUKg1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 06:36:27 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5X00FMH6SJ3R20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 May 2014 19:36:19 +0900 (KST)
In-reply-to: <1400655169-21683-3-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, arnd@arndb.de


Hi,

On Wednesday, May 21, 2014 12:22:48 PM Sachin Kamat wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This makes it possible to enable the exynos platform as part of a
> multiplatform kernel, in addition to keeping the single-platform
> Exynos support.

The patch description is wrong.  After this patch single-platform Exynos
support is no longer available and it adds at least one serious regression
(cpufreq) which should be fixed before merging this patch.  Moreover it
seems that this patch (#2) should be merged with patch #3 to preserve
bisectability.  Please also note that exynos_defconfig is no longer useful
after these changes and can be be removed.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/Kconfig               |   30 ------------------------------
>  arch/arm/mach-exynos/Kconfig   |   28 ++++++++++++++++++++++++++++
>  arch/arm/mach-exynos/Makefile  |    2 ++
>  arch/arm/plat-samsung/Makefile |    3 +++
>  4 files changed, 33 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 666b59b58ab0..26f2bae4d948 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -829,36 +829,6 @@ config ARCH_S5PV210
>  	help
>  	  Samsung S5PV210/S5PC110 series based systems
>  
> -config ARCH_EXYNOS
> -	bool "Samsung EXYNOS"
> -	select ARCH_HAS_BANDGAP
> -	select ARCH_HAS_CPUFREQ
> -	select ARCH_HAS_HOLES_MEMORYMODEL
> -	select ARCH_REQUIRE_GPIOLIB
> -	select ARCH_SPARSEMEM_ENABLE
> -	select ARM_AMBA
> -	select ARM_GIC
> -	select CLKSRC_OF
> -	select COMMON_CLK_SAMSUNG
> -	select CPU_V7
> -	select GENERIC_CLOCKEVENTS
> -	select HAVE_ARM_SCU if SMP
> -	select HAVE_S3C2410_I2C if I2C
> -	select HAVE_S3C2410_WATCHDOG if WATCHDOG
> -	select HAVE_S3C_RTC if RTC_CLASS
> -	select HAVE_SMP
> -	select NEED_MACH_MEMORY_H
> -	select PINCTRL
> -	select PINCTRL_EXYNOS
> -	select PM_GENERIC_DOMAINS if PM_RUNTIME
> -	select S5P_DEV_MFC
> -	select SAMSUNG_DMADEV
> -	select SPARSE_IRQ
> -	select SRAM
> -	select USE_OF
> -	help
> -	  Support for SAMSUNG's EXYNOS SoCs (EXYNOS4/5)
> -
>  config ARCH_DAVINCI
>  	bool "TI DaVinci"
>  	select ARCH_HAS_HOLES_MEMORYMODEL
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 138070e42aa9..46634175cf54 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -7,6 +7,34 @@
>  
>  # Configuration options for the EXYNOS4
>  
> +config ARCH_EXYNOS
> +	bool "Samsung EXYNOS" if ARCH_MULTI_V7
> +	select ARCH_HAS_BANDGAP
> +	select ARCH_HAS_CPUFREQ
> +	select ARCH_HAS_HOLES_MEMORYMODEL
> +	select ARCH_REQUIRE_GPIOLIB
> +	select ARM_AMBA
> +	select ARM_GIC
> +	select CLKSRC_OF
> +	select COMMON_CLK_SAMSUNG
> +	select CPU_V7
> +	select GENERIC_CLOCKEVENTS
> +	select HAVE_ARM_SCU if SMP
> +	select HAVE_S3C2410_I2C if I2C
> +	select HAVE_S3C2410_WATCHDOG if WATCHDOG
> +	select HAVE_S3C_RTC if RTC_CLASS
> +	select HAVE_SMP
> +	select PINCTRL
> +	select PINCTRL_EXYNOS
> +	select PM_GENERIC_DOMAINS if PM_RUNTIME
> +	select S5P_DEV_MFC
> +	select SAMSUNG_DMADEV
> +	select SPARSE_IRQ
> +	select SRAM
> +	select USE_OF
> +	help
> +	  Support for SAMSUNG EXYNOS SoCs (EXYNOS4/5)
> +
>  if ARCH_EXYNOS
>  
>  menu "SAMSUNG EXYNOS SoCs Support"
> diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
> index 2e0666d31e75..97af694291f1 100644
> --- a/arch/arm/mach-exynos/Makefile
> +++ b/arch/arm/mach-exynos/Makefile
> @@ -5,6 +5,8 @@
>  #
>  # Licensed under GPLv2
>  
> +ccflags-$(CONFIG_ARCH_MULTIPLATFORM) += -I$(srctree)/$(src)/include -I$(srctree)/arch/arm/plat-samsung/include
> +
>  obj-y				:=
>  obj-m				:=
>  obj-n				:=
> diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
> index 25c826ed3b65..5e5beaa9ae15 100644
> --- a/arch/arm/plat-samsung/Makefile
> +++ b/arch/arm/plat-samsung/Makefile
> @@ -4,6 +4,9 @@
>  #
>  # Licensed under GPLv2
>  
> +ccflags-$(CONFIG_ARCH_MULTI_V7) += -I$(srctree)/$(src)/include
> +ccflags-$(CONFIG_ARCH_EXYNOS)	+= -I$(srctree)/arch/arm/mach-exynos/include
> +
>  obj-y				:=
>  obj-m				:=
>  obj-n				:= dummy.o
