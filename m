From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 06/10] ARM: S5PV210: Add SMDKV210 board support file
Date: Tue, 19 Jan 2010 03:50:51 +0000
Message-ID: <20100119035051.GF3971@trinity.fluff.org>
References: <1263868087-31951-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:60652 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753008Ab0ASDuw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2010 22:50:52 -0500
Content-Disposition: inline
In-Reply-To: <1263868087-31951-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Jan 19, 2010 at 11:28:07AM +0900, Kukjin Kim wrote:
> This patch adds SMDKV210 board support file.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-smdkv210.c |  121 +++++++++++++++++++++++++++++++++
>  1 files changed, 121 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-s5pv210/mach-smdkv210.c
> 
> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
> new file mode 100644
> index 0000000..be78597
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
> @@ -0,0 +1,121 @@
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
> +static void __init smdkv210_fixup(struct machine_desc *desc, struct tag *tags,
> +				  char **cmdline, struct meminfo *mi)
> +{
> +	mi->bank[0].start = 0x20000000;
> +	mi->bank[0].size = 256 * SZ_1M;
> +	mi->bank[0].node = 0;
> +
> +	mi->bank[1].start = 0x30000000;
> +	mi->bank[1].size = 256 * SZ_1M;
> +	mi->bank[1].node = 1;
> +
> +	mi->bank[2].start = 0x40000000;
> +	mi->bank[2].size = 256 * SZ_1M;
> +	mi->bank[2].node = 2;
> +
> +	mi->bank[3].start = 0x50000000;
> +	mi->bank[3].size = 256 * SZ_1M;
> +	mi->bank[3].node = 3;
> +
> +	mi->nr_banks = 4;
> +}

You should check whether the bootloader passed valid data or not, and
thus avoid re-setting it if it did. I think a big warning here to say
if the data wasn't valid as any bootloader authour who isn't passing
this information should be re-educated (and not given any cookies).

> +MACHINE_START(SMDKV210, "SMDKV210")
> +	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
> +	.phys_io	= S5P_PA_UART & 0xfff00000,
> +	.io_pg_offst	= (((u32)S5P_VA_UART) >> 18) & 0xfffc,
> +	.boot_params	= S5P_PA_SDRAM + 0x100,
> +	.fixup		= smdkv210_fixup,
> +	.init_irq	= s5pv210_init_irq,
> +	.map_io		= smdkv210_map_io,
> +	.init_machine	= smdkv210_machine_init,
> +	.timer		= &s3c24xx_timer,
> +MACHINE_END
> -- 
> 1.6.2.5
> 

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
