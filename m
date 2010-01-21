From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH v2 06/10] ARM: S5PV210: Add SMDKV210 board support file
Date: Thu, 21 Jan 2010 02:28:34 +0000
Message-ID: <20100121022834.GE10592@trinity.fluff.org>
References: <1264031845-2201-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:33433 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751439Ab0AUC2f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2010 21:28:35 -0500
Content-Disposition: inline
In-Reply-To: <1264031845-2201-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Thu, Jan 21, 2010 at 08:57:25AM +0900, Kukjin Kim wrote:
> This patch adds SMDKV210 board support file.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-smdkv210.c |   98 +++++++++++++++++++++++++++++++++
>  1 files changed, 98 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-s5pv210/mach-smdkv210.c
> 
> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
> new file mode 100644
> index 0000000..93d9d99
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
> @@ -0,0 +1,98 @@
> +/* linux/arch/arm/mach-s5pv210/mach-smdkv210.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/init.h>
> +#include <linux/serial_core.h>
> +
> +#include <asm/mach/arch.h>
> +#include <asm/mach/map.h>
> +#include <asm/setup.h>
> +#include <asm/mach-types.h>
> +
> +#include <mach/map.h>
> +#include <mach/regs-clock.h>
> +
> +#include <plat/regs-serial.h>
> +#include <plat/s5pv210.h>
> +#include <plat/devs.h>
> +#include <plat/cpu.h>
> +
> +/* Following are default values for UCON, ULCON and UFCON UART registers */
> +#define S5PV210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
> +				 S3C2410_UCON_RXILEVEL |	\
> +				 S3C2410_UCON_TXIRQMODE |	\
> +				 S3C2410_UCON_RXIRQMODE |	\
> +				 S3C2410_UCON_RXFIFO_TOI |	\
> +				 S3C2443_UCON_RXERR_IRQEN)
> +
> +#define S5PV210_ULCON_DEFAULT	S3C2410_LCON_CS8
> +
> +#define S5PV210_UFCON_DEFAULT	(S3C2410_UFCON_FIFOMODE |	\
> +				 S5PV210_UFCON_TXTRIG4 |	\
> +				 S5PV210_UFCON_RXTRIG4)
> +
> +static struct s3c2410_uartcfg smdkv210_uartcfgs[] __initdata = {
> +	[0] = {
> +		.hwport		= 0,
> +		.flags		= 0,
> +		.ucon		= S5PV210_UCON_DEFAULT,
> +		.ulcon		= S5PV210_ULCON_DEFAULT,
> +		.ufcon		= S5PV210_UFCON_DEFAULT,
> +	},
> +	[1] = {
> +		.hwport		= 1,
> +		.flags		= 0,
> +		.ucon		= S5PV210_UCON_DEFAULT,
> +		.ulcon		= S5PV210_ULCON_DEFAULT,
> +		.ufcon		= S5PV210_UFCON_DEFAULT,
> +	},
> +	[2] = {
> +		.hwport		= 2,
> +		.flags		= 0,
> +		.ucon		= S5PV210_UCON_DEFAULT,
> +		.ulcon		= S5PV210_ULCON_DEFAULT,
> +		.ufcon		= S5PV210_UFCON_DEFAULT,
> +	},
> +	[3] = {
> +		.hwport		= 3,
> +		.flags		= 0,
> +		.ucon		= S5PV210_UCON_DEFAULT,
> +		.ulcon		= S5PV210_ULCON_DEFAULT,
> +		.ufcon		= S5PV210_UFCON_DEFAULT,
> +	},
> +};
> +
> +static struct platform_device *smdkv210_devices[] __initdata = {
> +};
> +
> +static void __init smdkv210_map_io(void)
> +{
> +	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> +	s3c24xx_init_clocks(24000000);
> +	s3c24xx_init_uarts(smdkv210_uartcfgs, ARRAY_SIZE(smdkv210_uartcfgs));
> +}
> +
> +static void __init smdkv210_machine_init(void)
> +{
> +	platform_add_devices(smdkv210_devices, ARRAY_SIZE(smdkv210_devices));
> +}
> +
> +MACHINE_START(SMDKV210, "SMDKV210")
> +	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
> +	.phys_io	= S5P_PA_UART & 0xfff00000,
> +	.io_pg_offst	= (((u32)S5P_VA_UART) >> 18) & 0xfffc,
> +	.boot_params	= S5P_PA_SDRAM + 0x100,
> +	.init_irq	= s5pv210_init_irq,
> +	.map_io		= smdkv210_map_io,
> +	.init_machine	= smdkv210_machine_init,
> +	.timer		= &s3c24xx_timer,

I take it we've decided to remove the fixup entirely for the moment?

Has the system been tested with SPARSEMEM yet?

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
