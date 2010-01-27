From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] ARM: S5P6440: Move common memory map definitions for
	S5P to plat-s5p
Date: Wed, 27 Jan 2010 01:42:39 +0000
Message-ID: <20100127014239.GB24843@trinity.fluff.org>
References: <1264554279-19275-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:49037 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752064Ab0A0Bml (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2010 20:42:41 -0500
Content-Disposition: inline
In-Reply-To: <1264554279-19275-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Wed, Jan 27, 2010 at 10:04:39AM +0900, Kukjin Kim wrote:
> This patch moves common memory map definitions for S5P such as S5P_VA_XXX
> into plat-s5p/include/mach/map-s5p.h from mach-s5p6440/include/mach.
> And removes unnecessary definitions in the map.h
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5p6440/include/mach/debug-macro.S |    4 +-
>  arch/arm/mach-s5p6440/include/mach/map.h         |   65 ++++-----------------
>  arch/arm/mach-s5p6440/include/mach/regs-clock.h  |    2 +-
>  arch/arm/mach-s5p6440/mach-smdk6440.c            |    4 +-
>  arch/arm/plat-s5p/cpu.c                          |   15 +++--
>  arch/arm/plat-s5p/include/plat/map-s5p.h         |   37 ++++++++++++
>  6 files changed, 64 insertions(+), 63 deletions(-)
>  create mode 100644 arch/arm/plat-s5p/include/plat/map-s5p.h
> 
> diff --git a/arch/arm/mach-s5p6440/include/mach/debug-macro.S b/arch/arm/mach-s5p6440/include/mach/debug-macro.S
> index f3a5d16..48cdb0d 100644
> --- a/arch/arm/mach-s5p6440/include/mach/debug-macro.S
> +++ b/arch/arm/mach-s5p6440/include/mach/debug-macro.S
> @@ -22,8 +22,8 @@
>  	.macro addruart, rx
>  		mrc	p15, 0, \rx, c1, c0
>  		tst	\rx, #1
> -		ldreq	\rx, = S5P_PA_UART
> -		ldrne	\rx, = (S5P_VA_UART + S5P_PA_UART & 0xfffff)
> +		ldreq	\rx, = S3C_PA_UART
> +		ldrne	\rx, = S3C_VA_UART
>  #if CONFIG_DEBUG_S3C_UART != 0
>  		add	\rx, \rx, #(0x400 * CONFIG_DEBUG_S3C_UART)
>  #endif
> diff --git a/arch/arm/mach-s5p6440/include/mach/map.h b/arch/arm/mach-s5p6440/include/mach/map.h
> index 4a73e73..8924e5a 100644
> --- a/arch/arm/mach-s5p6440/include/mach/map.h
> +++ b/arch/arm/mach-s5p6440/include/mach/map.h
> @@ -14,94 +14,55 @@
>  #define __ASM_ARCH_MAP_H __FILE__
>  
>  #include <plat/map-base.h>
> +#include <plat/map-s5p.h>
>  
> -/* Chip ID */
>  #define S5P6440_PA_CHIPID	(0xE0000000)
>  #define S5P_PA_CHIPID		S5P6440_PA_CHIPID
> -#define S5P_VA_CHIPID		S3C_ADDR(0x00700000)
>  
> -/* SYSCON */
>  #define S5P6440_PA_SYSCON	(0xE0100000)
> -#define S5P_PA_SYSCON		S5P6440_PA_SYSCON
> -#define S5P_VA_SYSCON		S3C_VA_SYS
> -
>  #define S5P6440_PA_CLK		(S5P6440_PA_SYSCON + 0x0)
> -#define S5P_PA_CLK		S5P6440_PA_CLK
> -#define S5P_VA_CLK		(S5P_VA_SYSCON + 0x0)
> +#define S5P_PA_SYSCON		S5P6440_PA_SYSCON
>  
> -/* GPIO */
>  #define S5P6440_PA_GPIO		(0xE0308000)
>  #define S5P_PA_GPIO		S5P6440_PA_GPIO
> -#define S5P_VA_GPIO		S3C_ADDR(0x00500000)
>  
> -/* VIC0 */
>  #define S5P6440_PA_VIC0		(0xE4000000)
>  #define S5P_PA_VIC0		S5P6440_PA_VIC0
> -#define S5P_VA_VIC0		(S3C_VA_IRQ + 0x0)
> -#define VA_VIC0			S5P_VA_VIC0
>  
> -/* VIC1 */
>  #define S5P6440_PA_VIC1		(0xE4100000)
>  #define S5P_PA_VIC1		S5P6440_PA_VIC1
> -#define S5P_VA_VIC1		(S3C_VA_IRQ + 0x10000)
> -#define VA_VIC1			S5P_VA_VIC1
>  
> -/* Timer */
>  #define S5P6440_PA_TIMER	(0xEA000000)
>  #define S5P_PA_TIMER		S5P6440_PA_TIMER
> -#define S5P_VA_TIMER		S3C_VA_TIMER
>  
> -/* RTC */
>  #define S5P6440_PA_RTC		(0xEA100000)
>  #define S5P_PA_RTC		S5P6440_PA_RTC
> -#define S5P_VA_RTC		S3C_ADDR(0x00600000)
>  
> -/* WDT */
>  #define S5P6440_PA_WDT		(0xEA200000)
>  #define S5P_PA_WDT		S5P6440_PA_WDT
> -#define S5p_VA_WDT		S3C_VA_WATCHDOG
>  
> -/* UART */
>  #define S5P6440_PA_UART		(0xEC000000)
> -#define S5P_PA_UART		S5P6440_PA_UART
> -#define S5P_VA_UART		S3C_VA_UART
>  
> -/* HS USB OtG */
> +#define S5P_PA_UART0		(S5P6440_PA_UART + 0x0)
> +#define S5P_PA_UART1		(S5P6440_PA_UART + 0x400)
> +#define S5P_PA_UART2		(S5P6440_PA_UART + 0x800)
> +#define S5P_PA_UART3		(S5P6440_PA_UART + 0xC00)
> +
> +#define S5P_SZ_UART		SZ_256
> +
> +#define S5P6440_PA_IIC0		(0xEC104000)
> +
>  #define S5P6440_PA_HSOTG	(0xED100000)
>  
> -/* HSMMC */
>  #define S5P6440_PA_HSMMC0	(0xED800000)
>  #define S5P6440_PA_HSMMC1	(0xED900000)
>  #define S5P6440_PA_HSMMC2	(0xEDA00000)
>  
> -#define S5P_PA_UART0		(S5P_PA_UART + 0x0)
> -#define S5P_PA_UART1		(S5P_PA_UART + 0x400)
> -#define S5P_PA_UART2		(S5P_PA_UART + 0x800)
> -#define S5P_PA_UART3		(S5P_PA_UART + 0xC00)
> -#define S5P_UART_OFFSET		(0x400)
> -
> -#define S5P_VA_UARTx(x)		(S5P_VA_UART + (S5P_PA_UART & 0xfffff) \
> -				+ ((x) * S5P_UART_OFFSET))
> -
> -#define S5P_VA_UART0		S5P_VA_UARTx(0)
> -#define S5P_VA_UART1		S5P_VA_UARTx(1)
> -#define S5P_VA_UART2		S5P_VA_UARTx(2)
> -#define S5P_VA_UART3		S5P_VA_UARTx(3)
> -#define S5P_SZ_UART		SZ_256
> -
> -/* I2C */
> -#define S5P6440_PA_IIC0		(0xEC104000)
> -#define S5P_PA_IIC0		S5P6440_PA_IIC0
> -#define S5p_VA_IIC0		S3C_ADDR(0x00700000)
> -
> -/* SDRAM */
>  #define S5P6440_PA_SDRAM	(0x20000000)
>  #define S5P_PA_SDRAM		S5P6440_PA_SDRAM
>  
>  /* compatibiltiy defines. */
> -#define S3C_PA_UART		S5P_PA_UART
> -#define S3C_UART_OFFSET		S5P_UART_OFFSET
> -#define S3C_PA_TIMER		S5P_PA_TIMER
> -#define S3C_PA_IIC		S5P_PA_IIC0
> +#define S3C_PA_UART		S5P6440_PA_UART
> +#define S3C_PA_IIC		S5P6440_PA_IIC0
>  
>  #endif /* __ASM_ARCH_MAP_H */
> diff --git a/arch/arm/mach-s5p6440/include/mach/regs-clock.h b/arch/arm/mach-s5p6440/include/mach/regs-clock.h
> index b7af283..c783ecc 100644
> --- a/arch/arm/mach-s5p6440/include/mach/regs-clock.h
> +++ b/arch/arm/mach-s5p6440/include/mach/regs-clock.h
> @@ -15,7 +15,7 @@
>  
>  #include <mach/map.h>
>  
> -#define S5P_CLKREG(x)		(S5P_VA_CLK + (x))
> +#define S5P_CLKREG(x)		(S3C_VA_SYS + (x))
>  
>  #define S5P_APLL_LOCK		S5P_CLKREG(0x00)
>  #define S5P_MPLL_LOCK		S5P_CLKREG(0x04)
> diff --git a/arch/arm/mach-s5p6440/mach-smdk6440.c b/arch/arm/mach-s5p6440/mach-smdk6440.c
> index 760ea54..3ae88f2 100644
> --- a/arch/arm/mach-s5p6440/mach-smdk6440.c
> +++ b/arch/arm/mach-s5p6440/mach-smdk6440.c
> @@ -100,8 +100,8 @@ static void __init smdk6440_machine_init(void)
>  
>  MACHINE_START(SMDK6440, "SMDK6440")
>  	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
> -	.phys_io	= S5P_PA_UART & 0xfff00000,
> -	.io_pg_offst	= (((u32)S5P_VA_UART) >> 18) & 0xfffc,
> +	.phys_io	= S3C_PA_UART & 0xfff00000,
> +	.io_pg_offst	= (((u32)S3C_VA_UART) >> 18) & 0xfffc,
>  	.boot_params	= S5P_PA_SDRAM + 0x100,
>  
>  	.init_irq	= s5p6440_init_irq,
> diff --git a/arch/arm/plat-s5p/cpu.c b/arch/arm/plat-s5p/cpu.c
> index 0895a77..ab37545 100644
> --- a/arch/arm/plat-s5p/cpu.c
> +++ b/arch/arm/plat-s5p/cpu.c
> @@ -37,17 +37,20 @@ static struct cpu_table cpu_ids[] __initdata = {
>  
>  /* minimal IO mapping */
>  
> -#define UART_OFFS (S5P_PA_UART & 0xfffff)
> -
>  static struct map_desc s5p_iodesc[] __initdata = {
>  	{
> -		.virtual	= (unsigned long)S5P_VA_SYSCON,
> +		.virtual	= (unsigned long)S5P_VA_CHIPID,
> +		.pfn		= __phys_to_pfn(S5P_PA_CHIPID),
> +		.length		= SZ_4K,
> +		.type		= MT_DEVICE,
> +	}, {
> +		.virtual	= (unsigned long)S3C_VA_SYS,
>  		.pfn		= __phys_to_pfn(S5P_PA_SYSCON),
>  		.length		= SZ_64K,
>  		.type		= MT_DEVICE,
>  	}, {
> -		.virtual	= (unsigned long)(S5P_VA_UART + UART_OFFS),
> -		.pfn		= __phys_to_pfn(S5P_PA_UART),
> +		.virtual	= (unsigned long)S3C_VA_UART,
> +		.pfn		= __phys_to_pfn(S3C_PA_UART),
>  		.length		= SZ_4K,
>  		.type		= MT_DEVICE,
>  	}, {
> @@ -61,7 +64,7 @@ static struct map_desc s5p_iodesc[] __initdata = {
>  		.length		= SZ_16K,
>  		.type		= MT_DEVICE,
>  	}, {
> -		.virtual	= (unsigned long)S5P_VA_TIMER,
> +		.virtual	= (unsigned long)S3C_VA_TIMER,
>  		.pfn		= __phys_to_pfn(S5P_PA_TIMER),
>  		.length		= SZ_16K,
>  		.type		= MT_DEVICE,
> diff --git a/arch/arm/plat-s5p/include/plat/map-s5p.h b/arch/arm/plat-s5p/include/plat/map-s5p.h
> new file mode 100644
> index 0000000..d716017
> --- /dev/null
> +++ b/arch/arm/plat-s5p/include/plat/map-s5p.h
> @@ -0,0 +1,37 @@
> +/* linux/arch/arm/plat-s5p/include/plat/s5p-map.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com/
> + *
> + * S5P - Memory map definitions
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_PLAT_MAP_S5P_H
> +#define __ASM_PLAT_MAP_S5P_H __FILE__
> +
> +#define S5P_VA_CHIPID		S3C_ADDR(0x00700000)
> +#define S5P_VA_GPIO		S3C_ADDR(0x00500000)
> +#define S5P_VA_SYSTIMER		S3C_ADDR(0x01200000)
> +#define S5P_VA_SROMC		S3C_ADDR(0x01100000)
> +#define S5P_VA_RTC		S3C_ADDR(0x00600000)

The RTC block is currently not mapped, and as such I expect it never to
be statically mapped into the VA space like this. If there's no reason
for it to be here, then please remove it.

> +#define S5P_VA_VIC0		(S3C_VA_IRQ + 0x0)
> +#define S5P_VA_VIC1		(S3C_VA_IRQ + 0x10000)
> +#define S5P_VA_VIC2		(S3C_VA_IRQ + 0x20000)
> +#define S5P_VA_VIC3		(S3C_VA_IRQ + 0x30000)
> +
> +#define S5P_VA_UART0		(S3C_VA_UART + 0x0)
> +#define S5P_VA_UART1		(S3C_VA_UART + 0x400)
> +#define S5P_VA_UART2		(S3C_VA_UART + 0x800)
> +#define S5P_VA_UART3		(S3C_VA_UART + 0xC00)
> +
> +/* compatibiltiy defines. */
> +#define S3C_UART_OFFSET		(0x400)
> +#define VA_VIC0			S5P_VA_VIC0
> +#define VA_VIC1			S5P_VA_VIC1

Maybe we should remove the S5P_VA_VIC0 and S5P_VA_VIC1 and just
define VA_VIC0 and VA_VIC1 directly.

Note, to my horror i've found the following in arch/arm/plat-s5p/irq.c:

    28  #define VIC_VAADDR(no)  (S5P_VA_VIC0   + ((no)*0x10000))
    29  #define VIC_BASE(no)    (S5P_VIC0_BASE + ((no)*32))

Why aren't these in the relevant header files? Please think about
changing at-least the VIC_VAADDR before re-submitting this patch.

My suggesiton would be VA_VIC(x) and then

#define VA_VIC0	VA_VIC(0)
#define VA_VIC1 VA_VIC(1)
etc.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
