From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH v2] ARM: S5P6440: Add External Interrupt support
Date: Wed, 11 Aug 2010 14:01:56 +0530
Message-ID: <AANLkTikuhc=z3vfvT9qxyzxYqvycL797FehDLL-Nv3_Z@mail.gmail.com>
References: <1274747055-12276-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:59310 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932679Ab0HKIcR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Aug 2010 04:32:17 -0400
Received: by qwh6 with SMTP id 6so9234795qwh.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2010 01:32:16 -0700 (PDT)
In-Reply-To: <1274747055-12276-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>

Hi Every one,

On 25 May 2010 05:54, Kukjin Kim <kgene.kim@samsung.com> wrote:
>
> From: Thomas Abraham <thomas.ab@samsung.com>
>
> Add external interrupt support for S5P6440. The external interrupts
> supported as 0 to 15.
>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> Changes since v1:
>
> 1. Removed unused include files.
> 2. Fix incorrect return values.
>
> =A0arch/arm/mach-s5p6440/Makefile =A0 | =A0 =A02 +-
> =A0arch/arm/mach-s5p6440/irq-eint.c | =A0164 ++++++++++++++++++++++++=
++++++++++++++
> =A02 files changed, 165 insertions(+), 1 deletions(-)
> =A0create mode 100644 arch/arm/mach-s5p6440/irq-eint.c
>
> diff --git a/arch/arm/mach-s5p6440/Makefile b/arch/arm/mach-s5p6440/M=
akefile
> index be3c53a..f1bc1e0 100644
> --- a/arch/arm/mach-s5p6440/Makefile
> +++ b/arch/arm/mach-s5p6440/Makefile
> @@ -12,7 +12,7 @@ obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0:=3D
>
> =A0# Core support for S5P6440 system
>
> -obj-$(CONFIG_CPU_S5P6440) =A0 =A0 =A0+=3D cpu.o init.o clock.o gpio.=
o dma.o
> +obj-$(CONFIG_CPU_S5P6440) =A0 =A0 =A0+=3D cpu.o init.o clock.o gpio.=
o dma.o irq-eint.o
> =A0obj-$(CONFIG_CPU_S5P6440) =A0 =A0 =A0+=3D setup-i2c0.o
>
> =A0# machine support
> diff --git a/arch/arm/mach-s5p6440/irq-eint.c b/arch/arm/mach-s5p6440=
/irq-eint.c
> new file mode 100644
> index 0000000..93310ae
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/irq-eint.c
> @@ -0,0 +1,164 @@
> +/* arch/arm/mach-s5p6440/irq-eint.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * Based on linux/arch/arm/mach-s3c6410/irq-eint.c
> + *
> + * S5P6440 - Interrupt handling for External Interrupts.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/gpio.h>
> +#include <linux/irq.h>
> +#include <linux/io.h>
> +
> +#include <plat/regs-irqtype.h>
> +#include <mach/regs-gpio.h>
> +#include <plat/gpio-cfg.h>
> +
> +#define eint_offset(irq) =A0 =A0 =A0 ((irq) - IRQ_EINT(0))
> +#define eint_irq_to_bit(irq) =A0 (1 << eint_offset(irq))
> +
> +static inline void s5p_irq_eint_mask(unsigned int irq)
> +{
> + =A0 =A0 =A0 u32 mask =3D =A0__raw_readl(S5P6440_EINT0MASK);
> +
> + =A0 =A0 =A0 mask |=3D eint_irq_to_bit(irq);
> + =A0 =A0 =A0 __raw_writel(mask, S5P6440_EINT0MASK);
> +}
> +
> +static void s5p_irq_eint_unmask(unsigned int irq)
> +{
> + =A0 =A0 =A0 u32 mask =3D __raw_readl(S5P6440_EINT0MASK);
> +
> + =A0 =A0 =A0 mask &=3D ~eint_irq_to_bit(irq);
> + =A0 =A0 =A0 __raw_writel(mask, S5P6440_EINT0MASK);
> +}
> +
> +static inline void s5p_irq_eint_ack(unsigned int irq)
> +{
> + =A0 =A0 =A0 __raw_writel(eint_irq_to_bit(irq), S5P6440_EINT0PEND);
> +}
> +
> +static void s5p_irq_eint_maskack(unsigned int irq)
> +{
> + =A0 =A0 =A0 s5p_irq_eint_mask(irq);
> + =A0 =A0 =A0 s5p_irq_eint_ack(irq);
> +}
> +
> +static int s5p_irq_eint_set_type(unsigned int irq, unsigned int type=
)
> +{
> + =A0 =A0 =A0 int offs =3D eint_offset(irq);
> + =A0 =A0 =A0 int shift;
> + =A0 =A0 =A0 u32 ctrl, mask;
> + =A0 =A0 =A0 u32 newvalue =3D 0;
> +
> + =A0 =A0 =A0 if (offs > 15)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 switch (type) {
> + =A0 =A0 =A0 case IRQ_TYPE_NONE:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "No edge setting!\n=
");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case IRQ_TYPE_EDGE_RISING:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_RISEEDGE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case IRQ_TYPE_EDGE_FALLING:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_FALLEDGE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case IRQ_TYPE_EDGE_BOTH:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_BOTHEDGE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case IRQ_TYPE_LEVEL_LOW:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_LOWLEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case IRQ_TYPE_LEVEL_HIGH:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_HILEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "No such irq type %d", =
type);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 shift =3D (offs / 2) * 4;
> + =A0 =A0 =A0 mask =3D 0x7 << shift;
> +
> + =A0 =A0 =A0 ctrl =3D __raw_readl(S5P6440_EINT0CON0) & ~mask;
> + =A0 =A0 =A0 ctrl |=3D newvalue << shift;
> + =A0 =A0 =A0 __raw_writel(ctrl, S5P6440_EINT0CON0);
> +
> + =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPN(offs), S3C_GPIO_SFN(2));
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static struct irq_chip s5p_irq_eint =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s5p-eint",
> + =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D s5p_irq_eint_mask,
> + =A0 =A0 =A0 .unmask =A0 =A0 =A0 =A0 =3D s5p_irq_eint_unmask,
> + =A0 =A0 =A0 .mask_ack =A0 =A0 =A0 =3D s5p_irq_eint_maskack,
> + =A0 =A0 =A0 .ack =A0 =A0 =A0 =A0 =A0 =A0=3D s5p_irq_eint_ack,
> + =A0 =A0 =A0 .set_type =A0 =A0 =A0 =3D s5p_irq_eint_set_type,
> +};
> +
> +static inline void s5p_irq_demux_eint(unsigned int start, unsigned i=
nt end)
> +{
> + =A0 =A0 =A0 u32 status =3D __raw_readl(S5P6440_EINT0PEND);
> + =A0 =A0 =A0 u32 mask =3D __raw_readl(S5P6440_EINT0MASK);
> + =A0 =A0 =A0 unsigned int irq;
> +
> + =A0 =A0 =A0 status &=3D ~mask;
> + =A0 =A0 =A0 status >>=3D start;
> + =A0 =A0 =A0 status &=3D (1 << (end - start + 1)) - 1;
> +
> + =A0 =A0 =A0 for (irq =3D IRQ_EINT(start); irq <=3D IRQ_EINT(end); i=
rq++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (status & 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 generic_handle_irq(irq)=
;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status >>=3D 1;
> + =A0 =A0 =A0 }
> +}
> +
> +static void s5p_irq_demux_eint0_3(unsigned int irq, struct irq_desc =
*desc)
> +{
> + =A0 =A0 =A0 s5p_irq_demux_eint(0, 3);
> +}
> +
> +static void s5p_irq_demux_eint4_11(unsigned int irq, struct irq_desc=
 *desc)
> +{
> + =A0 =A0 =A0 s5p_irq_demux_eint(4, 11);
> +}
> +
> +static void s5p_irq_demux_eint12_15(unsigned int irq, struct irq_des=
c *desc)
> +{
> + =A0 =A0 =A0 s5p_irq_demux_eint(12, 15);
> +}
> +
> +static int __init s5p6440_init_irq_eint(void)
> +{
> + =A0 =A0 =A0 int irq;
> +
> + =A0 =A0 =A0 for (irq =3D IRQ_EINT(0); irq <=3D IRQ_EINT(15); irq++)=
 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_irq_chip(irq, &s5p_irq_eint);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_irq_handler(irq, handle_level_irq);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_irq_flags(irq, IRQF_VALID);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 set_irq_chained_handler(IRQ_EINT0_3, s5p_irq_demux_eint=
0_3);
> + =A0 =A0 =A0 set_irq_chained_handler(IRQ_EINT4_11, s5p_irq_demux_ein=
t4_11);
> + =A0 =A0 =A0 set_irq_chained_handler(IRQ_EINT12_15, s5p_irq_demux_ei=
nt12_15);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +arch_initcall(s5p6440_init_irq_eint);
> --
> 1.6.3.3

This patch would suffice for External interrupt support on SMDK6450 als=
o.
Any one got any to say on this..

Thanks,
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html





--
Shine bright,
(: Naveen Krishna Ch :)
