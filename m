From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH v4] ARM: S5PV210: Add Ext interrupt support.
Date: Fri, 14 May 2010 13:03:56 +0200
Message-ID: <008f01caf355$2ba713a0$82f53ae0$%szyprowski@samsung.com>
References: <1273826160-17999-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:38382 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755455Ab0ENLEp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 May 2010 07:04:45 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2E00GWSPFV63@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 20:04:43 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2E0065LPFEE3@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 20:04:43 +0900 (KST)
In-reply-to: <1273826160-17999-1-git-send-email-kgene.kim@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Pannaga Bhushan' <p.bhushan@samsung.com>, 'Jongpill Lee' <boyko.lee@samsung.com>, ben-linux@fluff.org, kyungmin.park@samsung.com

Hello,

On Friday, May 14, 2010 10:36 AM Kukjin Kim wrote:

> From: Jongpill Lee <boyko.lee@samsung.com>
> 
> Add support for external interrupts on v210.
> 
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: Pannaga Bhushan <p.bhushan@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5pv210/Kconfig                  |    1 +
>  arch/arm/mach-s5pv210/include/mach/irqs.h      |   26 +--
>  arch/arm/mach-s5pv210/include/mach/regs-gpio.h |   46 +++++
>  arch/arm/plat-s5p/Kconfig                      |    5 +
>  arch/arm/plat-s5p/Makefile                     |    1 +
>  arch/arm/plat-s5p/irq-eint.c                   |  216
> ++++++++++++++++++++++++
>  6 files changed, 277 insertions(+), 18 deletions(-)
>  create mode 100644 arch/arm/mach-s5pv210/include/mach/regs-gpio.h
>  create mode 100644 arch/arm/plat-s5p/irq-eint.c

> ...

> diff --git a/arch/arm/plat-s5p/irq-eint.c b/arch/arm/plat-s5p/irq-eint.c
> new file mode 100644
> index 0000000..040e271
> --- /dev/null
> +++ b/arch/arm/plat-s5p/irq-eint.c
> @@ -0,0 +1,216 @@
> +/* linux/arch/arm/plat-s5p/irq-eint.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * S5P - IRQ EINT support
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/io.h>
> +#include <linux/sysdev.h>
> +#include <linux/gpio.h>
> +
> +#include <asm/bitops.h>
> +#include <asm/hardware/vic.h>
> +
> +#include <plat/regs-irqtype.h>
> +
> +#include <mach/map.h>
> +#include <plat/cpu.h>
> +#include <plat/pm.h>
> +
> +#include <plat/gpio-cfg.h>
> +#include <mach/regs-gpio.h>
> +
> +static inline void s5p_irq_eint_mask(unsigned int irq)
> +{
> +	u32 mask;
> +
> +	mask = __raw_readl(S5P_EINT_MASK(eint_mask_reg(irq)));
> +	mask |= eint_irq_to_bit(irq);
> +	__raw_writel(mask, S5P_EINT_MASK(eint_mask_reg(irq)));
> +}
> +
> +static void s5p_irq_eint_unmask(unsigned int irq)
> +{
> +	u32 mask;
> +
> +	mask = __raw_readl(S5P_EINT_MASK(eint_mask_reg(irq)));
> +	mask &= ~(eint_irq_to_bit(irq));
> +	__raw_writel(mask, S5P_EINT_MASK(eint_mask_reg(irq)));
> +}
> +
> +static inline void s5p_irq_eint_ack(unsigned int irq)
> +{
> +	__raw_writel(eint_irq_to_bit(irq), S5P_EINT_PEND(eint_pend_reg(irq)));
> +}
> +
> +static void s5p_irq_eint_maskack(unsigned int irq)
> +{
> +	/* compiler should in-line these */
> +	s5p_irq_eint_mask(irq);
> +	s5p_irq_eint_ack(irq);
> +}
> +
> +static int s5p_irq_eint_set_type(unsigned int irq, unsigned int type)
> +{
> +	int offs = eint_offset(irq);
> +	int shift;
> +	u32 ctrl, mask;
> +	u32 newvalue = 0;
> +
> +	switch (type) {
> +	case IRQ_TYPE_NONE:
> +		printk(KERN_WARNING "No edge setting!\n");
> +		break;
> +
> +	case IRQ_TYPE_EDGE_RISING:
> +		newvalue = S5P_EXTINT_RISEEDGE;
> +		break;
> +
> +	case IRQ_TYPE_EDGE_FALLING:
> +		newvalue = S5P_EXTINT_RISEEDGE;
> +		break;
> +
> +	case IRQ_TYPE_EDGE_BOTH:
> +		newvalue = S5P_EXTINT_BOTHEDGE;
> +		break;
> +
> +	case IRQ_TYPE_LEVEL_LOW:
> +		newvalue = S5P_EXTINT_LOWLEV;
> +		break;
> +
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		newvalue = S5P_EXTINT_HILEV;
> +		break;
> +
> +	default:
> +		printk(KERN_ERR "No such irq type %d", type);
> +		return -EINVAL;
> +	}
> +
> +	shift = (offs & 0x7) * 4;
> +	mask = 0x7 << shift;
> +
> +	ctrl = __raw_readl(S5P_EINT_CON(eint_conf_reg(irq)));
> +	ctrl &= ~mask;
> +	ctrl |= newvalue << shift;
> +	__raw_writel(ctrl, S5P_EINT_CON(eint_conf_reg(irq)));
> +
> +	if ((0 <= offs) && (offs < 8))
> +		s3c_gpio_cfgpin(S5PV210_GPH0(offs & 0x7), EINT_MODE);
> +
> +	else if ((8 <= offs) && (offs < 16))
> +		s3c_gpio_cfgpin(S5PV210_GPH1(offs & 0x7), EINT_MODE);
> +
> +	else if ((16 <= offs) && (offs < 24))
> +		s3c_gpio_cfgpin(S5PV210_GPH2(offs & 0x7), EINT_MODE);
> +
> +	else if ((24 <= offs) && (offs < 32))
> +		s3c_gpio_cfgpin(S5PV210_GPH3(offs & 0x7), EINT_MODE);

When the code is put into plat-s5p directory then please don't use
S5PV210_GPH3 defines. If makes it hardly reusable with other SoCs.

> ...

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
