From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH][RESEND] ARM: S5P64X0: External Interrupt Support
Date: Thu, 21 Jul 2011 17:06:45 +0900
Message-ID: <006a01cc477d$24673750$6d35a5f0$%kim@samsung.com>
References: <1311247385-10854-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55426 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751425Ab1GUIGv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2011 04:06:51 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOO00DINBRYD4O0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 17:06:49 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOO001E3BVDOR@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 17:06:49 +0900 (KST)
In-reply-to: <1311247385-10854-1-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Padmavathi Venna wrote:
> 
> Add external interrupt support for S5P64X0.The external interrupt
> group 0(0 to 15) is used for wake-up source in stop and sleep mode.
> Add generic irq chip support
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
> 
> Please ignore my previous patch due to wrong return value.
> 
>  arch/arm/mach-s5p64x0/Makefile                 |    2 +-
>  arch/arm/mach-s5p64x0/include/mach/regs-gpio.h |   10 ++
>  arch/arm/mach-s5p64x0/irq-eint.c               |  152
> ++++++++++++++++++++++++
>  3 files changed, 163 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/mach-s5p64x0/irq-eint.c
> 
> diff --git a/arch/arm/mach-s5p64x0/Makefile
b/arch/arm/mach-s5p64x0/Makefile
> index ae6bf6f..5f6afdf 100644
> --- a/arch/arm/mach-s5p64x0/Makefile
> +++ b/arch/arm/mach-s5p64x0/Makefile
> @@ -13,7 +13,7 @@ obj-				:=
>  # Core support for S5P64X0 system
> 
>  obj-$(CONFIG_ARCH_S5P64X0)	+= cpu.o init.o clock.o dma.o gpiolib.o
> -obj-$(CONFIG_ARCH_S5P64X0)	+= setup-i2c0.o
> +obj-$(CONFIG_ARCH_S5P64X0)	+= setup-i2c0.o irq-eint.o
>  obj-$(CONFIG_CPU_S5P6440)	+= clock-s5p6440.o
>  obj-$(CONFIG_CPU_S5P6450)	+= clock-s5p6450.o
> 
> diff --git a/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
b/arch/arm/mach-
> s5p64x0/include/mach/regs-gpio.h
> index 0953ef6..6ce2547 100644
> --- a/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
> +++ b/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
> @@ -34,4 +34,14 @@
>  #define S5P6450_GPQ_BASE		(S5P_VA_GPIO + 0x0180)
>  #define S5P6450_GPS_BASE		(S5P_VA_GPIO + 0x0300)
> 
> +/* External interrupt control registers for group0 */
> +
> +#define EINT0CON0_OFFSET		(0x900)
> +#define EINT0MASK_OFFSET		(0x920)
> +#define EINT0PEND_OFFSET		(0x924)
> +
> +#define S5P64X0_EINT0CON0		(S5P_VA_GPIO +
> EINT0CON0_OFFSET)
> +#define S5P64X0_EINT0MASK		(S5P_VA_GPIO +
> EINT0MASK_OFFSET)
> +#define S5P64X0_EINT0PEND		(S5P_VA_GPIO +
> EINT0PEND_OFFSET)
> +
>  #endif /* __ASM_ARCH_REGS_GPIO_H */
> diff --git a/arch/arm/mach-s5p64x0/irq-eint.c
b/arch/arm/mach-s5p64x0/irq-eint.c
> new file mode 100644
> index 0000000..69ed454
> --- /dev/null
> +++ b/arch/arm/mach-s5p64x0/irq-eint.c
> @@ -0,0 +1,152 @@
> +/* arch/arm/mach-s5p64x0/irq-eint.c
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd
> + *		http://www.samsung.com/
> + *
> + * Based on linux/arch/arm/mach-s3c64xx/irq-eint.c
> + *
> + * S5P64X0 - Interrupt handling for External Interrupts.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/gpio.h>
> +#include <linux/irq.h>
> +#include <linux/io.h>
> +
> +#include <plat/regs-irqtype.h>
> +#include <plat/gpio-cfg.h>
> +
> +#include <mach/regs-gpio.h>
> +#include <mach/regs-clock.h>
> +
> +#define eint_offset(irq)	((irq) - IRQ_EINT(0))
> +
> +static int s5p64x0_irq_eint_set_type(struct irq_data *data, unsigned int
type)
> +{
> +	int offs = eint_offset(data->irq);
> +	int shift;
> +	u32 ctrl, mask;
> +	u32 newvalue = 0;
> +
> +	if (offs > 15)
> +		return -EINVAL;
> +
> +	switch (type) {
> +	case IRQ_TYPE_NONE:
> +		printk(KERN_WARNING "No edge setting!\n");
> +		break;
> +	case IRQ_TYPE_EDGE_RISING:
> +		newvalue = S3C2410_EXTINT_RISEEDGE;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		newvalue = S3C2410_EXTINT_FALLEDGE;
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		newvalue = S3C2410_EXTINT_BOTHEDGE;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		newvalue = S3C2410_EXTINT_LOWLEV;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		newvalue = S3C2410_EXTINT_HILEV;
> +		break;
> +	default:
> +		printk(KERN_ERR "No such irq type %d", type);
> +		return -EINVAL;
> +	}
> +
> +	shift = (offs / 2) * 4;
> +	mask = 0x7 << shift;
> +
> +	ctrl = __raw_readl(S5P64X0_EINT0CON0) & ~mask;
> +	ctrl |= newvalue << shift;
> +	__raw_writel(ctrl, S5P64X0_EINT0CON0);
> +
> +	/* Configure the GPIO pin for 6450 or 6440 based on CPU ID */
> +	if (0x50000 == (__raw_readl(S5P64X0_SYS_ID) & 0xFF000))
> +		s3c_gpio_cfgpin(S5P6450_GPN(offs), S3C_GPIO_SFN(2));
> +	else
> +		s3c_gpio_cfgpin(S5P6440_GPN(offs), S3C_GPIO_SFN(2));
> +
> +	return 0;
> +}
> +
> +/*
> + * s5p64x0_irq_demux_eint
> + *
> + * This function demuxes the IRQ from the group0 external interrupts,
> + * from IRQ_EINT(0) to IRQ_EINT(15). It is designed to be inlined into
> + * the specific handlers s5p64x0_irq_demux_eintX_Y.
> + */
> +static inline void s5p64x0_irq_demux_eint(unsigned int start, unsigned
int end)
> +{
> +	u32 status = __raw_readl(S5P64X0_EINT0PEND);
> +	u32 mask = __raw_readl(S5P64X0_EINT0MASK);
> +	unsigned int irq;
> +
> +	status &= ~mask;
> +	status >>= start;
> +	status &= (1 << (end - start + 1)) - 1;
> +
> +	for (irq = IRQ_EINT(start); irq <= IRQ_EINT(end); irq++) {
> +		if (status & 1)
> +			generic_handle_irq(irq);
> +		status >>= 1;
> +	}
> +}
> +
> +static void s5p64x0_irq_demux_eint0_3(unsigned int irq, struct irq_desc
*desc)
> +{
> +	s5p64x0_irq_demux_eint(0, 3);
> +}
> +
> +static void s5p64x0_irq_demux_eint4_11(unsigned int irq, struct irq_desc
*desc)
> +{
> +	s5p64x0_irq_demux_eint(4, 11);
> +}
> +
> +static void s5p64x0_irq_demux_eint12_15(unsigned int irq,
> +					struct irq_desc *desc)
> +{
> +	s5p64x0_irq_demux_eint(12, 15);
> +}
> +
> +static int s5p64x0_alloc_gc(void)
> +{
> +	struct irq_chip_generic *gc;
> +	struct irq_chip_type *ct;
> +
> +	gc = irq_alloc_generic_chip("s5p64x0-eint", 1, S5P_IRQ_EINT_BASE,
> +				    S5P_VA_GPIO, handle_level_irq);
> +	if (!gc) {
> +		printk(KERN_ERR "%s: irq_alloc_generic_chip for group 0"
> +			"external interrupts failed\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	ct = gc->chip_types;
> +	ct->chip.irq_ack = irq_gc_ack;
> +	ct->chip.irq_mask = irq_gc_mask_set_bit;
> +	ct->chip.irq_unmask = irq_gc_mask_clr_bit;
> +	ct->chip.irq_set_type = s5p64x0_irq_eint_set_type;
> +	ct->regs.ack = EINT0PEND_OFFSET;
> +	ct->regs.mask = EINT0MASK_OFFSET;
> +	irq_setup_generic_chip(gc, IRQ_MSK(16), IRQ_GC_INIT_MASK_CACHE,
> +			       IRQ_NOREQUEST | IRQ_NOPROBE, 0);
> +	return 0;
> +}
> +
> +static int __init s5p64x0_init_irq_eint(void)
> +{
> +	int ret = s5p64x0_alloc_gc();
> +	irq_set_chained_handler(IRQ_EINT0_3, s5p64x0_irq_demux_eint0_3);
> +	irq_set_chained_handler(IRQ_EINT4_11, s5p64x0_irq_demux_eint4_11);
> +	irq_set_chained_handler(IRQ_EINT12_15, s5p64x0_irq_demux_eint12_15);
> +
> +	return ret;
> +}
> +arch_initcall(s5p64x0_init_irq_eint);
> --
> 1.7.0.4

Maybe this is my last guest :)

Ok, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
