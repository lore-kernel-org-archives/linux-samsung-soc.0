From: Ben Dooks <ben@trinity.fluff.org>
Subject: Re: [PATCH] ARM: S5PC100: Add Watchdog support for S5PC100
Date: Tue, 1 Jun 2010 03:35:36 +0100
Message-ID: <20100601023536.GA30276@trinity.fluff.org>
References: <1275357892-21314-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:58169 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752003Ab0FACfn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 May 2010 22:35:43 -0400
Content-Disposition: inline
In-Reply-To: <1275357892-21314-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Banajit Goswami <banajit.g@samsung.com>

On Tue, Jun 01, 2010 at 11:04:52AM +0900, Kukjin Kim wrote:
> From: Banajit Goswami <banajit.g@samsung.com>
> 
> This patch adds support for Watchdog timer for Samsung S5PC100.
> 
> Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5pc100/Kconfig            |    2 ++
>  arch/arm/mach-s5pc100/include/mach/map.h |    3 +++
>  arch/arm/mach-s5pc100/mach-smdkc100.c    |    1 +
>  3 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
> index b2a11df..b63b440 100644
> --- a/arch/arm/mach-s5pc100/Kconfig
> +++ b/arch/arm/mach-s5pc100/Kconfig
> @@ -44,6 +44,8 @@ config MACH_SMDKC100
>  	select S3C_DEV_HSMMC
>  	select S3C_DEV_HSMMC1
>  	select S3C_DEV_HSMMC2
> +	select S3C_DEV_WDT
> +	select HAVE_S3C2410_WATCHDOG

Hmm, HAVE_S3C2410_WATCHDOG should probably be property fo the SoC an
the board only needs to select S3C_DEV_WDT.

>  	select S5PC100_SETUP_FB_24BPP
>  	select S5PC100_SETUP_I2C1
>  	select S5PC100_SETUP_SDHCI
> diff --git a/arch/arm/mach-s5pc100/include/mach/map.h b/arch/arm/mach-s5pc100/include/mach/map.h
> index cadae43..7671baa 100644
> --- a/arch/arm/mach-s5pc100/include/mach/map.h
> +++ b/arch/arm/mach-s5pc100/include/mach/map.h
> @@ -72,6 +72,8 @@
>  
>  #define S5PC100_PA_SYSTIMER	(0xEA100000)
>  
> +#define S5PC100_PA_WDT		(0xEA200000)
> +
>  #define S5PC100_PA_UART		(0xEC000000)
>  
>  #define S5P_PA_UART0		(S5PC100_PA_UART + 0x0)
> @@ -131,6 +133,7 @@
>  #define S3C_PA_HSMMC2		S5PC100_PA_HSMMC(2)
>  #define S3C_PA_KEYPAD		S5PC100_PA_KEYPAD
>  #define S3C_PA_TSADC		S5PC100_PA_TSADC
> +#define S3C_PA_WDT		S5PC100_PA_WDT
>  #define S3C_PA_ONENAND		S5PC100_PA_ONENAND
>  #define S3C_PA_ONENAND_BUF	S5PC100_PA_ONENAND_BUF
>  #define S3C_SZ_ONENAND_BUF	S5PC100_SZ_ONENAND_BUF
> diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-s5pc100/mach-smdkc100.c
> index af22f82..6fc0bff 100644
> --- a/arch/arm/mach-s5pc100/mach-smdkc100.c
> +++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
> @@ -156,6 +156,7 @@ static struct platform_device *smdkc100_devices[] __initdata = {
>  	&s3c_device_hsmmc0,
>  	&s3c_device_hsmmc1,
>  	&s3c_device_hsmmc2,
> +	&s3c_device_wdt,
>  	&smdkc100_lcd_powerdev,
>  	&s5pc100_device_iis0,
>  	&s5pc100_device_ac97,
> -- 
> 1.6.2.5
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
