Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C94C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 17:44:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E15F60E78
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 17:44:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234403AbhKBRqg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 13:46:36 -0400
Received: from gloria.sntech.de ([185.11.138.130]:58144 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230500AbhKBRqg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 13:46:36 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mhxpC-0003PG-1v; Tue, 02 Nov 2021 18:43:54 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>, Cedric Roux <sed@free.fr>,
        Sam Van Den Berge <sam.van.den.berge@telenet.be>,
        Lihua Yao <ylhuajnu@outlook.com>
Subject: Re: [RFC PATCH] ARM: s3c: mark as deprecated and schedule removal after 2022
Date:   Tue, 02 Nov 2021 18:43:53 +0100
Message-ID: <1678494.ihjLuDa2nf@diego>
In-Reply-To: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
References: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Am Dienstag, 2. November 2021, 12:05:19 CET schrieb Krzysztof Kozlowski:
> The Samsung S3C24xx and S3C64xx platforms are very old designs. S3C2416
> was introduced in 2008 and S3C6410 in 2009/2010.  They are not widely
> available anymore - out-of-stock on FriendlyArm (one of manufacturers of
> boards) and only few specialist stores still offer them for quite a high
> price.
> 
> The community around these platforms was not very active, so I suspect
> no one really uses them anymore. Maintenance takes precious time so
> there is little sense in keeping them alive if there are no real users.
> 
> Let's mark all S3C24xx and S3C64xx platforms as deprecated and mention
> possible removal in one year (after 2022).  The deprecation message will
> be as text in Kconfig, build message (not a warning though) and runtime
> print error.
> 
> If there are any users, they might respond and postpone the removal.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


s3c2416/s3c2450 was my entry into kernel development, so I have an
emotional connection to it ;-) - and also still hold onto a stash of devices.

Nevertheless personally I don't see myself finding the time to continue
working on those platforms (or the s3c2443-based Openmoko Freerunner
I also still have), because as you said those platforms are so old.


So
Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  arch/arm/Kconfig                  | 7 ++++++-
>  arch/arm/mach-s3c/Kconfig.s3c64xx | 7 ++++++-
>  arch/arm/mach-s3c/cpu.c           | 1 +
>  arch/arm/mach-s3c/init.c          | 2 ++
>  arch/arm/mach-s3c/s3c24xx.c       | 5 +++++
>  arch/arm/mach-s3c/s3c64xx.c       | 5 +++++
>  6 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index f0f9e8bec83a..bd8237c7e7f1 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -473,7 +473,7 @@ config ARCH_SA1100
>  	  Support for StrongARM 11x0 based boards.
>  
>  config ARCH_S3C24XX
> -	bool "Samsung S3C24XX SoCs"
> +	bool "Samsung S3C24XX SoCs (deprecated, see help)"
>  	select ATAGS
>  	select CLKSRC_SAMSUNG_PWM
>  	select GPIO_SAMSUNG
> @@ -491,6 +491,11 @@ config ARCH_S3C24XX
>  	  (<http://www.simtec.co.uk/products/EB110ITX/>), the IPAQ 1940 or the
>  	  Samsung SMDK2410 development board (and derivatives).
>  
> +	  The platform is deprecated and scheduled in removal. Please reach to
> +	  the maintainers of the platform and linux-samsung-soc@vger.kernel.org if
> +	  you still use it.
> +	  Without such feedback, the platform will be removed after 2022.
> +
>  config ARCH_OMAP1
>  	bool "TI OMAP1"
>  	depends on MMU
> diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
> index f3fcb570edf5..3b090ae72bbd 100644
> --- a/arch/arm/mach-s3c/Kconfig.s3c64xx
> +++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
> @@ -4,7 +4,7 @@
>  #	Simtec Electronics, Ben Dooks <ben@simtec.co.uk>
>  
>  menuconfig ARCH_S3C64XX
> -	bool "Samsung S3C64XX"
> +	bool "Samsung S3C64XX (deprecated, see help)"
>  	depends on ARCH_MULTI_V6
>  	select ARM_AMBA
>  	select ARM_VIC
> @@ -25,6 +25,11 @@ menuconfig ARCH_S3C64XX
>  	help
>  	  Samsung S3C64XX series based systems
>  
> +	  The platform is deprecated and scheduled in removal. Please reach to
> +	  the maintainers of the platform and linux-samsung-soc@vger.kernel.org if
> +	  you still use it.
> +	  Without such feedback, the platform will be removed after 2022.
> +
>  if ARCH_S3C64XX
>  
>  # Configuration options for the S3C6410 CPU
> diff --git a/arch/arm/mach-s3c/cpu.c b/arch/arm/mach-s3c/cpu.c
> index 6e9772555f0d..3b16cf42910f 100644
> --- a/arch/arm/mach-s3c/cpu.c
> +++ b/arch/arm/mach-s3c/cpu.c
> @@ -28,4 +28,5 @@ void __init s3c64xx_init_cpu(void)
>  	}
>  
>  	pr_info("Samsung CPU ID: 0x%08lx\n", samsung_cpu_id);
> +	pr_err("The platform is deprecated and scheduled in removal. Please reach to the maintainers of the platform and linux-samsung-soc@vger.kernel.org if you still use it.  Without such feedback, the platform will be removed after 2022.\n");
>  }
> diff --git a/arch/arm/mach-s3c/init.c b/arch/arm/mach-s3c/init.c
> index 9d92f03e9bc1..5db7dc54340c 100644
> --- a/arch/arm/mach-s3c/init.c
> +++ b/arch/arm/mach-s3c/init.c
> @@ -59,6 +59,8 @@ void __init s3c_init_cpu(unsigned long idcode,
>  
>  	if (cpu->map_io)
>  		cpu->map_io();
> +
> +	pr_err("The platform is deprecated and scheduled in removal. Please reach to the maintainers of the platform and linux-samsung-soc@vger.kernel.org if you still use it.  Without such feedback, the platform will be removed after 2022.\n");
>  }
>  
>  /* s3c24xx_init_clocks
> diff --git a/arch/arm/mach-s3c/s3c24xx.c b/arch/arm/mach-s3c/s3c24xx.c
> index ccfed48c98aa..2ea1cb21dfbc 100644
> --- a/arch/arm/mach-s3c/s3c24xx.c
> +++ b/arch/arm/mach-s3c/s3c24xx.c
> @@ -678,3 +678,8 @@ struct platform_device s3c2410_device_dclk = {
>  	},
>  };
>  #endif
> +
> +#pragma message "The platform is deprecated and scheduled in removal (see platform help). " \
> +		"Please reach to the maintainers of the platform " \
> +		"and linux-samsung-soc@vger.kernel.org if you still use it." \
> +		"Without such feedback, the platform will be removed after 2022."
> diff --git a/arch/arm/mach-s3c/s3c64xx.c b/arch/arm/mach-s3c/s3c64xx.c
> index 4dfb648142f2..3e248f0e96a2 100644
> --- a/arch/arm/mach-s3c/s3c64xx.c
> +++ b/arch/arm/mach-s3c/s3c64xx.c
> @@ -425,3 +425,8 @@ static int __init s3c64xx_init_irq_eint(void)
>  	return 0;
>  }
>  arch_initcall(s3c64xx_init_irq_eint);
> +
> +#pragma message "The platform is deprecated and scheduled in removal (see platform help). " \
> +		"Please reach to the maintainers of the platform " \
> +		"and linux-samsung-soc@vger.kernel.org if you still use it." \
> +		"Without such feedback, the platform will be removed after 2022."
> 




