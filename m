From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] clk: samsung: Allow modular build of the Audio Subsystem CLKCON
 driver
Date: Fri, 08 Jul 2016 09:56:46 -0700
Message-ID: <146799700614.73491.6564650478987470074@resonance>
References: <1467987300-31450-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:35651 "EHLO
	mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755911AbcGHQ4t convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jul 2016 12:56:49 -0400
Received: by mail-pf0-f175.google.com with SMTP id c2so14273798pfa.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Jul 2016 09:56:49 -0700 (PDT)
In-Reply-To: <1467987300-31450-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: b.zolnierkie@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Quoting Sylwester Nawrocki (2016-07-08 07:15:00)
> Any clock dependencies can be properly handled with deferred probing
> so we can remove core_initcall and switch to a proper loadable platform
> driver module.
> This change has been tested on Exynos4412 Odroid U3 based board.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Looks good to me.

Regards,
Mike

> ---
>  drivers/clk/samsung/Kconfig            |  9 +++++++++
>  drivers/clk/samsung/Makefile           |  2 +-
>  drivers/clk/samsung/clk-exynos-audss.c | 12 +-----------
>  3 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> index 20c5fe9..addc652 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -9,6 +9,15 @@ config EXYNOS_ARM64_COMMON_CLK
>         bool "Samsung Exynos ARMv8-family clock controller support" if COMPILE_TEST
>         depends on COMMON_CLK_SAMSUNG
>  
> +config EXYNOS_AUDSS_CLK_CON
> +       tristate "Samsung Exynos AUDSS clock controller support"
> +       depends on COMMON_CLK_SAMSUNG
> +       default y if ARCH_EXYNOS
> +       help
> +         Support for the Audio Subsystem CLKCON clock controller present
> +         on some Exynos SoC variants. Choose M or Y here if you want to
> +         use audio devices such as I2S, PCM, etc.
> +
>  # For S3C24XX platforms, select following symbols:
>  config S3C2410_COMMON_CLK
>         bool "Samsung S3C2410 clock controller support" if COMPILE_TEST
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index fc367d4..57f4dc6 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -12,7 +12,7 @@ obj-$(CONFIG_SOC_EXYNOS5410)  += clk-exynos5410.o
>  obj-$(CONFIG_SOC_EXYNOS5420)   += clk-exynos5420.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos5433.o
>  obj-$(CONFIG_SOC_EXYNOS5440)   += clk-exynos5440.o
> -obj-$(CONFIG_ARCH_EXYNOS)      += clk-exynos-audss.o
> +obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
>  obj-$(CONFIG_ARCH_EXYNOS)      += clk-exynos-clkout.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos7.o
>  obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
> diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
> index 4e9584d..bdf8b97 100644
> --- a/drivers/clk/samsung/clk-exynos-audss.c
> +++ b/drivers/clk/samsung/clk-exynos-audss.c
> @@ -273,17 +273,7 @@ static struct platform_driver exynos_audss_clk_driver = {
>         .remove = exynos_audss_clk_remove,
>  };
>  
> -static int __init exynos_audss_clk_init(void)
> -{
> -       return platform_driver_register(&exynos_audss_clk_driver);
> -}
> -core_initcall(exynos_audss_clk_init);
> -
> -static void __exit exynos_audss_clk_exit(void)
> -{
> -       platform_driver_unregister(&exynos_audss_clk_driver);
> -}
> -module_exit(exynos_audss_clk_exit);
> +module_platform_driver(exynos_audss_clk_driver);
>  
>  MODULE_AUTHOR("Padmavathi Venna <padma.v@samsung.com>");
>  MODULE_DESCRIPTION("Exynos Audio Subsystem Clock Controller");
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
