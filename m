From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH CRITICAL] ARM: s3c64xx: dt: Fix boot failure due to double clock initialization
Date: Sat, 14 Dec 2013 04:00:16 +0100
Message-ID: <201312140400.16794.arnd@arndb.de>
References: <1386964779-29457-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:62549 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753166Ab3LNDBB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Dec 2013 22:01:01 -0500
In-Reply-To: <1386964779-29457-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

On Friday 13 December 2013, Tomasz Figa wrote:
> Commit
> 
> 4178bac ARM: call of_clk_init from default time_init handler
> 
> added implicit call to of_clk_init() from default time_init callback,
> but it did not change platforms calling it from other callbacks, despite
> of not having custom time_init callbacks. This caused double clock
> initialization on such platforms, leading to boot failures. An example
> of such platform is mach-s3c64xx.
> 
> This patch fixes boot failure on s3c64xx by dropping custom init_irq
> callback, which had a call to of_clk_init() and moving system reset
> initialization to init_machine callback. This allows us to have
> clocks initialized properly without a need to have custom init_time or
> init_irq callbacks.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

I see of_clk_init(NULL) getting called on two other ARM platforms:

$ git grep -w of_clk_init arch/arm
arch/arm/kernel/time.c:         of_clk_init(NULL);
arch/arm/mach-keystone/pm_domain.c:     of_clk_init(NULL);
arch/arm/mach-mvebu/armada-370-xp.c:    of_clk_init(NULL);
arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c:        of_clk_init(NULL);

Are the other two platforms ok here?

I assume that mvebu is fine since Sebastian would have noticed breaking
that one and it has a custom init_time function, but keystone seems
broken in the same way as s3c64xx. Santosh, can you have a look?

	Arnd

> diff --git a/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c b/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
> index 7eb9a10..2fddf38 100644
> --- a/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
> +++ b/arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c

> @@ -48,15 +46,9 @@ static void __init s3c64xx_dt_map_io(void)
>  		panic("SoC is not S3C64xx!");
>  }
>  
> -static void __init s3c64xx_dt_init_irq(void)
> -{
> -	of_clk_init(NULL);
> -	samsung_wdt_reset_of_init();
> -	irqchip_init();
> -};
> -
>  static void __init s3c64xx_dt_init_machine(void)
>  {
> +	samsung_wdt_reset_of_init();
>  	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
>  }
>  
> @@ -79,7 +71,6 @@ DT_MACHINE_START(S3C6400_DT, "Samsung S3C64xx (Flattened Device Tree)")
>  	/* Maintainer: Tomasz Figa <tomasz.figa@gmail.com> */
>  	.dt_compat	= s3c64xx_dt_compat,
>  	.map_io		= s3c64xx_dt_map_io,
> -	.init_irq	= s3c64xx_dt_init_irq,
>  	.init_machine	= s3c64xx_dt_init_machine,
>  	.restart        = s3c64xx_dt_restart,
>  MACHINE_END
