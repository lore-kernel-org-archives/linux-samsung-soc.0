From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] arch: arm: samsung: Clean-up usage of CONFIG_SERIAL_SAMSUNG_UARTS symbol
Date: Tue, 30 Sep 2014 17:13:47 +0200
Message-ID: <2267491.QlLoTEuT3L@wuerfel>
References: <1412087695-10591-1-git-send-email-a.kesavan@samsung.com> <1412087695-10591-2-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:55226 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751091AbaI3POZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Sep 2014 11:14:25 -0400
In-Reply-To: <1412087695-10591-2-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Abhilash Kesavan <a.kesavan@samsung.com>, gregkh@linuxfoundation.org, linux-samsung-soc@vger.kernel.org, jslaby@suse.cz, tomasz.figa@gmail.com

On Tuesday 30 September 2014 20:04:55 Abhilash Kesavan wrote:
> --- a/arch/arm/mach-s3c64xx/irq-pm.c
> +++ b/arch/arm/mach-s3c64xx/irq-pm.c
> @@ -55,10 +55,10 @@ static struct irq_grp_save {
>         u32     mask;
>  } eint_grp_save[5];
>  
> -#ifndef CONFIG_SERIAL_SAMSUNG_UARTS
> -#define SERIAL_SAMSUNG_UARTS 0
> +#ifndef CONFIG_SERIAL_SAMSUNG
> +#define SERIAL_SAMSUNG_UARTS   0
>  #else
> -#define        SERIAL_SAMSUNG_UARTS CONFIG_SERIAL_SAMSUNG_UARTS
> +#define SERIAL_SAMSUNG_UARTS   4
>  #endif
>  
>  static u32 irq_uart_mask[SERIAL_SAMSUNG_UARTS];

I think this won't work because now you access invalid registers
on machines that have only three uarts.

> diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
> index 11fbbc2..03cafe9 100644
> --- a/arch/arm/plat-samsung/init.c
> +++ b/arch/arm/plat-samsung/init.c
> @@ -93,8 +93,8 @@ void __init s3c24xx_init_clocks(int xtal)
>  #if IS_ENABLED(CONFIG_SAMSUNG_ATAGS)
>  static int nr_uarts __initdata = 0;
>  
> -#ifdef CONFIG_SERIAL_SAMSUNG_UARTS
> -static struct s3c2410_uartcfg uart_cfgs[CONFIG_SERIAL_SAMSUNG_UARTS];
> +#ifdef CONFIG_SERIAL_SAMSUNG
> +static struct s3c2410_uartcfg uart_cfgs[4];
>  #endif
>  
>  /* s3c24xx_init_uartdevs
> @@ -110,7 +110,7 @@ void __init s3c24xx_init_uartdevs(char *name,
>                                   struct s3c24xx_uart_resources *res,
>                                   struct s3c2410_uartcfg *cfg, int no)
>  {
> -#ifdef CONFIG_SERIAL_SAMSUNG_UARTS
> +#ifdef CONFIG_SERIAL_SAMSUNG
>         struct platform_device *platdev;
>         struct s3c2410_uartcfg *cfgptr = uart_cfgs;
>         struct s3c24xx_uart_resources *resp;

Since you hardcode the number here now, you can actually drop this #ifdef.

	Arnd
