From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 17/28] ARM: EXYNOS: Decouple ARCH_EXYNOS from PLAT_S5P
Date: Sat, 15 Jun 2013 10:52:37 +0900
Message-ID: <171e01ce696b$0320a010$0961e030$%kim@samsung.com>
References: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
 <1371238384-1504-18-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65266 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753994Ab3FOBwj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 21:52:39 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOE00A9NVVPR280@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 15 Jun 2013 10:52:37 +0900 (KST)
In-reply-to: <1371238384-1504-18-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>

Tomasz Figa wrote:
> 
> After removing support for ATAGS based boot on Exynos, there is not much
> that can be shared between Exynos and other S5P platforms. This patch
> makes Exynos a standalone Samsung platform, not using PLAT_S5P.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/Kconfig                | 4 ++++
>  arch/arm/Makefile               | 1 +
>  arch/arm/mach-exynos/Kconfig    | 1 +
>  arch/arm/plat-samsung/Kconfig   | 8 +++-----
>  arch/arm/plat-samsung/pm-gpio.c | 5 +++--
>  5 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 9c69e6c..21bf253 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -795,7 +795,9 @@ config ARCH_EXYNOS
>  	bool "Samsung EXYNOS"
>  	select ARCH_HAS_CPUFREQ
>  	select ARCH_HAS_HOLES_MEMORYMODEL
> +	select ARCH_REQUIRE_GPIOLIB
>  	select ARCH_SPARSEMEM_ENABLE
> +	select ARM_GIC
>  	select CLKDEV_LOOKUP
>  	select COMMON_CLK
>  	select CPU_V7
> @@ -807,7 +809,9 @@ config ARCH_EXYNOS
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select NEED_MACH_GPIO_H
>  	select NEED_MACH_MEMORY_H
> +	select S5P_GPIO_DRVSTR
>  	select SAMSUNG_ATAGS
> +	select SAMSUNG_GPIOLIB_4BIT

SAMSUNG_GPIOLIB_4BIT is not used anywhere...

>  	select USE_OF
>  	help
>  	  Support for SAMSUNG's EXYNOS SoCs (EXYNOS4/5)
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 1ba358b..2192a3f 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -204,6 +204,7 @@ plat-$(CONFIG_PLAT_ORION)	+= orion
>  plat-$(CONFIG_PLAT_PXA)		+= pxa
>  plat-$(CONFIG_PLAT_S3C24XX)	+= samsung
>  plat-$(CONFIG_PLAT_S5P)		+= samsung
> +plat-$(CONFIG_ARCH_EXYNOS)	+= samsung

Put it in alphabetical order.

>  plat-$(CONFIG_PLAT_VERSATILE)	+= versatile
> 
>  ifeq ($(CONFIG_ARCH_EBSA110),y)
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 0d93ebe..47d8d9e 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -18,6 +18,7 @@ config ARCH_EXYNOS4
>  	select HAVE_SMP
>  	select MIGHT_HAVE_CACHE_L2X0
>  	select PINCTRL
> +	select GIC_NON_BANKED

Please put it in alphabetical order

>  	help
>  	  Samsung EXYNOS4 SoCs based systems
> 
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 1c607da..6c23722 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -6,7 +6,7 @@
> 
>  config PLAT_SAMSUNG
>  	bool
> -	depends on PLAT_S3C24XX || ARCH_S3C64XX || PLAT_S5P
> +	depends on PLAT_S3C24XX || ARCH_S3C64XX || PLAT_S5P || ARCH_EXYNOS
>  	default y
>  	select GENERIC_IRQ_CHIP
>  	select NO_IOPORT
> @@ -15,12 +15,10 @@ config PLAT_SAMSUNG
> 
>  config PLAT_S5P
>  	bool
> -	depends on (ARCH_S5P64X0 || ARCH_S5PC100 || ARCH_S5PV210 ||
> ARCH_EXYNOS)
> +	depends on (ARCH_S5P64X0 || ARCH_S5PC100 || ARCH_S5PV210)
>  	default y
>  	select ARCH_REQUIRE_GPIOLIB
> -	select ARM_GIC if ARCH_EXYNOS
> -	select ARM_VIC if !ARCH_EXYNOS
> -	select GIC_NON_BANKED if ARCH_EXYNOS4
> +	select ARM_VIC
>  	select NO_IOPORT
>  	select PLAT_SAMSUNG
>  	select S3C_GPIO_TRACK
> diff --git a/arch/arm/plat-samsung/pm-gpio.c b/arch/arm/plat-samsung/pm-
> gpio.c
> index c2ff92c..a8de3cf 100644
> --- a/arch/arm/plat-samsung/pm-gpio.c
> +++ b/arch/arm/plat-samsung/pm-gpio.c
> @@ -192,7 +192,8 @@ struct samsung_gpio_pm samsung_gpio_pm_2bit = {
>  	.resume = samsung_gpio_pm_2bit_resume,
>  };
> 
> -#if defined(CONFIG_ARCH_S3C64XX) || defined(CONFIG_PLAT_S5P)
> +#if defined(CONFIG_ARCH_S3C64XX) || defined(CONFIG_PLAT_S5P) \
> +	|| defined(CONFIG_ARCH_EXYNOS)
>  static void samsung_gpio_pm_4bit_save(struct samsung_gpio_chip *chip)
>  {
>  	chip->pm_save[1] = __raw_readl(chip->base + OFFS_CON);
> @@ -302,7 +303,7 @@ struct samsung_gpio_pm samsung_gpio_pm_4bit = {
>  	.save	= samsung_gpio_pm_4bit_save,
>  	.resume = samsung_gpio_pm_4bit_resume,
>  };
> -#endif /* CONFIG_ARCH_S3C64XX || CONFIG_PLAT_S5P */
> +#endif /* CONFIG_ARCH_S3C64XX || CONFIG_PLAT_S5P || CONFIG_ARCH_EXYNOS */
> 
>  /**
>   * samsung_pm_save_gpio() - save gpio chip data for suspend
> --
> 1.8.2.1

How about PLAT_S5P in drivers/media/platform/ and drivers/usb/?

- Kukjin
