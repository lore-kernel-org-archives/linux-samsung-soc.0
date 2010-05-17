From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH v5] ARM: S5PV210: Add Ext interrupt support.
Date: Mon, 17 May 2010 05:48:11 +0100
Message-ID: <20100517044811.GT26401@trinity.fluff.org>
References: <1274059016-24700-1-git-send-email-kgene.kim@samsung.com> <20100517022209.GS26401@trinity.fluff.org> <AANLkTilijYxXm-vXTG3iL11Z_INXAebGQdh02EdmOboE@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:51207 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751328Ab0EQEsS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 00:48:18 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTilijYxXm-vXTG3iL11Z_INXAebGQdh02EdmOboE@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jongpill Lee <boyko.lee@samsung.com>, Pannaga Bhushan <p.bhushan@samsung.com>

On Mon, May 17, 2010 at 12:21:25PM +0900, Kyungmin Park wrote:
> On Mon, May 17, 2010 at 11:22 AM, Ben Dooks <ben-linux@fluff.org> wro=
te:
> > On Mon, May 17, 2010 at 10:16:56AM +0900, Kukjin Kim wrote:
> >> From: Jongpill Lee <boyko.lee@samsung.com>
> >>
> >> Add support for external interrupts on v210.
> >>
> >> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> >> Signed-off-by: Pannaga Bhushan <p.bhushan@samsung.com>
> >> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> >> ---
> >> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A01 +
> >> =A0arch/arm/mach-s5pv210/include/mach/irqs.h =A0 =A0 =A0| =A0 31 +=
+--
> >> =A0arch/arm/mach-s5pv210/include/mach/regs-gpio.h | =A0 46 +++++
> >> =A0arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A05 +
> >> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A01 +
> >> =A0arch/arm/plat-s5p/irq-eint.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0216 ++++++++++++++++++++++++
> >> =A06 files changed, 282 insertions(+), 18 deletions(-)
> >> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/regs-gpio=
=2Eh
> >> =A0create mode 100644 arch/arm/plat-s5p/irq-eint.c
> >>
> >> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210=
/Kconfig
> >> index af33a1a..c4c2a7f 100644
> >> --- a/arch/arm/mach-s5pv210/Kconfig
> >> +++ b/arch/arm/mach-s5pv210/Kconfig
> >> @@ -12,6 +12,7 @@ if ARCH_S5PV210
> >> =A0config CPU_S5PV210
> >> =A0 =A0 =A0 bool
> >> =A0 =A0 =A0 select PLAT_S5P
> >> + =A0 =A0 select S5P_EXT_INT
> >> =A0 =A0 =A0 help
> >> =A0 =A0 =A0 =A0 Enable S5PV210 CPU support
> >>
> >> diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/=
mach-s5pv210/include/mach/irqs.h
> >> index 62c5175..42b9b28 100644
> >> --- a/arch/arm/mach-s5pv210/include/mach/irqs.h
> >> +++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
> >> @@ -17,22 +17,9 @@
> >>
> >> =A0/* VIC0: System, DMA, Timer */
> >>
> >> -#define IRQ_EINT0 =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC0(0)
> >> -#define IRQ_EINT1 =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC0(1)
> >> -#define IRQ_EINT2 =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC0(2)
> >> -#define IRQ_EINT3 =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC0(3)
> >> -#define IRQ_EINT4 =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC0(4)
> >> -#define IRQ_EINT5 =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC0(5)
> >> -#define IRQ_EINT6 =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC0(6)
> >> -#define IRQ_EINT7 =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC0(7)
> >> -#define IRQ_EINT8 =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC0(8)
> >> -#define IRQ_EINT9 =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VIC0(9)
> >> -#define IRQ_EINT10 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC0(10)
> >> -#define IRQ_EINT11 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC0(11)
> >> -#define IRQ_EINT12 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC0(12)
> >> -#define IRQ_EINT13 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC0(13)
> >> -#define IRQ_EINT14 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC0(14)
> >> -#define IRQ_EINT15 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC0(15)
> >> +/* Can be used for EINTs 0 to 15 */
> >> +#define IRQ_EINT(x) =A0 =A0 =A0 =A0 =A0((x) + S5P_IRQ_VIC0(0))
> >> +
>=20
> It should be consider the higher interrupt number. As your comment
> user should use the
> IRQ_EINT(16) or IRQ_EINT(22). So IRQ_EINT should handle if EINT is
> grater than 15
> "This function demuxes the IRQ from the group0 external interrupts,
>  from IRQ_EINT(16) to IRQ_EINT(31). It is designed to be inlined into
>  * the specific handlers s5p_irq_demux_eintX_Y."
>=20
> #define IRQ_EINT(x)             ((x) < 16 ? S5P_IRQ_VIC0(x) : \
>                                         (S5P_IRQ_EINT_BASE + (x)-16))

I think that this is the best way to go, and have EINT(x) deal with all
cases of 'x'.=20

> Thank you,
> Kyungmin Park
>=20
> >> =A0#define IRQ_EINT16_31 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_IRQ_VI=
C0(16)
> >> =A0#define IRQ_BATF =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC0(17)
> >> =A0#define IRQ_MDMA =A0 =A0 =A0 =A0 =A0 =A0 S5P_IRQ_VIC0(18)
> >> @@ -137,10 +124,18 @@
> >> =A0#define S5P_IRQ_EINT_BASE =A0 =A0(IRQ_VIC_END + 1)
> >>
> >> =A0#define S5P_EINT(x) =A0 =A0 =A0 =A0 =A0((x) + S5P_IRQ_EINT_BASE=
)
> >> -#define IRQ_EINT(x) =A0 =A0 =A0 =A0 =A0S5P_EINT(x)
> >> +/* Can be used for EINTs 16 to 31 */
> >> +#define IRQ_EINT_GRP(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_EINT(x)
> >> +
> >> +#define EINT_MODE =A0 =A0 =A0 =A0 =A0 =A0S3C_GPIO_SFN(0xf)
> >>
> >> =A0/* Set the default NR_IRQS */
> >>
> >> -#define NR_IRQS =A0 =A0 =A0 =A0 =A0 =A0 =A0(IRQ_EINT(31) + 1)
> >> +#define NR_IRQS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(IRQ_E=
INT_GRP(31) + 1)
> >> +
> >> +#define EINT_GPIO_REG0(x) =A0 =A0S5PV210_GPH0(x)
> >> +#define EINT_GPIO_REG1(x) =A0 =A0S5PV210_GPH1(x)
> >> +#define EINT_GPIO_REG2(x) =A0 =A0S5PV210_GPH2(x)
> >> +#define EINT_GPIO_REG3(x) =A0 =A0S5PV210_GPH3(x)

i think _REG shoiuld be removed from here, it isn't a register as such.

> >> =A0#endif /* ASM_ARCH_IRQS_H */
> >> diff --git a/arch/arm/mach-s5pv210/include/mach/regs-gpio.h b/arch=
/arm/mach-s5pv210/include/mach/regs-gpio.h
> >> new file mode 100644
> >> index 0000000..fe16292
> >> --- /dev/null
> >> +++ b/arch/arm/mach-s5pv210/include/mach/regs-gpio.h
> >> @@ -0,0 +1,46 @@
> >> +/* linux/arch/arm/mach-s5pv210/include/mach/regs-gpio.h
> >> + *
> >> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> >> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> >> + *
> >> + * S5PV210 - GPIO (including EINT) register definitions
> >> + *
> >> + * This program is free software; you can redistribute it and/or =
modify
> >> + * it under the terms of the GNU General Public License version 2=
 as
> >> + * published by the Free Software Foundation.
> >> +*/
> >> +
> >> +#ifndef __ASM_ARCH_REGS_GPIO_H
> >> +#define __ASM_ARCH_REGS_GPIO_H __FILE__
> >> +
> >> +#include <mach/map.h>
> >> +
> >> +#define S5PV210_EINT30CON =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO + 0=
xE00)
> >> +#define S5P_EINT_CON(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
(S5PV210_EINT30CON + ((x) * 0x4))
> >> +
> >> +#define S5PV210_EINT30FLTCON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P=
_VA_GPIO + 0xE80)
> >> +#define S5P_EINT_FLTCON(x) =A0 =A0 =A0 =A0 =A0 (S5PV210_EINT30FLT=
CON0 + ((x) * 0x4))
> >> +
> >> +#define S5PV210_EINT30MASK =A0 =A0 =A0 =A0 =A0 (S5P_VA_GPIO + 0xF=
00)
> >> +#define S5P_EINT_MASK(x) =A0 =A0 =A0 =A0 =A0 =A0 (S5PV210_EINT30M=
ASK + ((x) * 0x4))
> >> +
> >> +#define S5PV210_EINT30PEND =A0 =A0 =A0 =A0 =A0 (S5P_VA_GPIO + 0xF=
40)
> >> +#define S5P_EINT_PEND(x) =A0 =A0 =A0 =A0 =A0 =A0 (S5PV210_EINT30P=
END + ((x) * 0x4))
> >> +
> >> +#define eint_offset(irq) =A0 =A0 ((irq) < IRQ_EINT16_31 ? ((irq) =
- IRQ_EINT(0)) \
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 : ((irq) - S5P_IRQ_EINT_BASE))
> >> +
> >
> > should we sepreate out the EINT 0..15 cases to make the higher EINT
> > code easier to process?

=46rom a quick talk with Bhuhsan, it seems that this isn't the case. We=
 can
leave this comment for now.

> >> +#define eint_irq_to_bit(irq) =A0 =A0 =A0 =A0 (1 << (eint_offset(i=
rq) & 0x7))
> >> +
> >> +#define eint_conf_reg(irq) =A0 =A0 =A0 =A0 =A0 ((eint_offset(irq)=
) >> 3)
> >> +#define eint_mask_reg(irq) =A0 =A0 =A0 =A0 =A0 ((eint_offset(irq)=
) >> 3)
> >> +#define eint_pend_reg(irq) =A0 =A0 =A0 =A0 =A0 ((eint_offset(irq)=
) >> 3)
> >> +
> >> +/* values for S5P_EXTINT0 */
> >> +#define S5P_EXTINT_LOWLEV =A0 =A0 =A0 =A0 =A0 =A0(0x00)
> >> +#define S5P_EXTINT_HILEV =A0 =A0 =A0 =A0 =A0 =A0 (0x01)
> >> +#define S5P_EXTINT_FALLEDGE =A0 =A0 =A0 =A0 =A0(0x02)
> >> +#define S5P_EXTINT_RISEEDGE =A0 =A0 =A0 =A0 =A0(0x03)
> >> +#define S5P_EXTINT_BOTHEDGE =A0 =A0 =A0 =A0 =A0(0x04)
> >> +
> >> +#endif /* __ASM_ARCH_REGS_GPIO_H */
> >> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> >> index d400a6a..7d1fc40 100644
> >> --- a/arch/arm/plat-s5p/Kconfig
> >> +++ b/arch/arm/plat-s5p/Kconfig
> >> @@ -23,3 +23,8 @@ config PLAT_S5P
> >> =A0 =A0 =A0 select SAMSUNG_IRQ_UART
> >> =A0 =A0 =A0 help
> >> =A0 =A0 =A0 =A0 Base platform code for Samsung's S5P series SoC.
> >> +
> >> +config S5P_EXT_INT
> >> + =A0 =A0 bool
> >> + =A0 =A0 help
> >> + =A0 =A0 =A0 Use the external interrupts (other than GPIO interru=
pts.)
> >> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefi=
le
> >> index a7c54b3..25941a5 100644
> >> --- a/arch/arm/plat-s5p/Makefile
> >> +++ b/arch/arm/plat-s5p/Makefile
> >> @@ -16,4 +16,5 @@ obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 +=3D dev-uart.o
> >> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D cpu.o
> >> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D clock.o
> >> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D irq.o
> >> +obj-$(CONFIG_S5P_EXT_INT) =A0 =A0+=3D irq-eint.o
> >> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D setup-i2c0.o
> >> diff --git a/arch/arm/plat-s5p/irq-eint.c b/arch/arm/plat-s5p/irq-=
eint.c
> >> new file mode 100644
> >> index 0000000..484a8fe
> >> --- /dev/null
> >> +++ b/arch/arm/plat-s5p/irq-eint.c
> >> @@ -0,0 +1,216 @@
> >> +/* linux/arch/arm/plat-s5p/irq-eint.c
> >> + *
> >> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> >> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> >> + *
> >> + * S5P - IRQ EINT support
> >> + *
> >> + * This program is free software; you can redistribute it and/or =
modify
> >> + * it under the terms of the GNU General Public License version 2=
 as
> >> + * published by the Free Software Foundation.
> >> +*/
> >> +
> >> +#include <linux/kernel.h>
> >> +#include <linux/interrupt.h>
> >> +#include <linux/irq.h>
> >> +#include <linux/io.h>
> >> +#include <linux/sysdev.h>
> >> +#include <linux/gpio.h>
> >> +
> >> +#include <asm/bitops.h>
> >> +#include <asm/hardware/vic.h>
> >> +
> >> +#include <plat/regs-irqtype.h>
> >> +
> >> +#include <mach/map.h>
> >> +#include <plat/cpu.h>
> >> +#include <plat/pm.h>
> >> +
> >> +#include <plat/gpio-cfg.h>
> >> +#include <mach/regs-gpio.h>
> >> +
> >> +static inline void s5p_irq_eint_mask(unsigned int irq)
> >> +{
> >> + =A0 =A0 u32 mask;
> >> +
> >> + =A0 =A0 mask =3D __raw_readl(S5P_EINT_MASK(eint_mask_reg(irq)));
> >> + =A0 =A0 mask |=3D eint_irq_to_bit(irq);
> >> + =A0 =A0 __raw_writel(mask, S5P_EINT_MASK(eint_mask_reg(irq)));
> >> +}
> >> +
> >> +static void s5p_irq_eint_unmask(unsigned int irq)
> >> +{
> >> + =A0 =A0 u32 mask;
> >> +
> >> + =A0 =A0 mask =3D __raw_readl(S5P_EINT_MASK(eint_mask_reg(irq)));
> >> + =A0 =A0 mask &=3D ~(eint_irq_to_bit(irq));
> >> + =A0 =A0 __raw_writel(mask, S5P_EINT_MASK(eint_mask_reg(irq)));
> >> +}
> >> +
> >> +static inline void s5p_irq_eint_ack(unsigned int irq)
> >> +{
> >> + =A0 =A0 __raw_writel(eint_irq_to_bit(irq), S5P_EINT_PEND(eint_pe=
nd_reg(irq)));
> >> +}
> >> +
> >> +static void s5p_irq_eint_maskack(unsigned int irq)
> >> +{
> >> + =A0 =A0 /* compiler should in-line these */
> >> + =A0 =A0 s5p_irq_eint_mask(irq);
> >> + =A0 =A0 s5p_irq_eint_ack(irq);
> >> +}
> >> +
> >> +static int s5p_irq_eint_set_type(unsigned int irq, unsigned int t=
ype)
> >> +{
> >> + =A0 =A0 int offs =3D eint_offset(irq);
> >> + =A0 =A0 int shift;
> >> + =A0 =A0 u32 ctrl, mask;
> >> + =A0 =A0 u32 newvalue =3D 0;
> >> +
> >> + =A0 =A0 switch (type) {
> >> + =A0 =A0 case IRQ_TYPE_NONE:
> >> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "No edge setting!\n"=
);
> >> + =A0 =A0 =A0 =A0 =A0 =A0 break;
> >> +
> >> + =A0 =A0 case IRQ_TYPE_EDGE_RISING:
> >> + =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S5P_EXTINT_RISEEDGE;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 break;
> >> +
> >> + =A0 =A0 case IRQ_TYPE_EDGE_FALLING:
> >> + =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S5P_EXTINT_RISEEDGE;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 break;
> >> +
> >> + =A0 =A0 case IRQ_TYPE_EDGE_BOTH:
> >> + =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S5P_EXTINT_BOTHEDGE;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 break;
> >> +
> >> + =A0 =A0 case IRQ_TYPE_LEVEL_LOW:
> >> + =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S5P_EXTINT_LOWLEV;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 break;
> >> +
> >> + =A0 =A0 case IRQ_TYPE_LEVEL_HIGH:
> >> + =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S5P_EXTINT_HILEV;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 break;
> >> +
> >> + =A0 =A0 default:
> >> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "No such irq type %d", t=
ype);
> >> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> >> + =A0 =A0 }
> >> +
> >> + =A0 =A0 shift =3D (offs & 0x7) * 4;
> >> + =A0 =A0 mask =3D 0x7 << shift;
> >> +
> >> + =A0 =A0 ctrl =3D __raw_readl(S5P_EINT_CON(eint_conf_reg(irq)));
> >> + =A0 =A0 ctrl &=3D ~mask;
> >> + =A0 =A0 ctrl |=3D newvalue << shift;
> >> + =A0 =A0 __raw_writel(ctrl, S5P_EINT_CON(eint_conf_reg(irq)));
> >> +
> >> + =A0 =A0 if ((0 <=3D offs) && (offs < 8))
> >> + =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(EINT_GPIO_REG0(offs & 0x=
7), EINT_MODE);
> >> +
> >> + =A0 =A0 else if ((8 <=3D offs) && (offs < 16))
> >> + =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(EINT_GPIO_REG1(offs & 0x=
7), EINT_MODE);
> >> +
> >> + =A0 =A0 else if ((16 <=3D offs) && (offs < 24))
> >> + =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(EINT_GPIO_REG2(offs & 0x=
7), EINT_MODE);
> >> +
> >> + =A0 =A0 else if ((24 <=3D offs) && (offs < 32))
> >> + =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(EINT_GPIO_REG3(offs & 0x=
7), EINT_MODE);
> >> +
> >> + =A0 =A0 else
> >> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "No such irq number %d",=
 offs);
> >> +
> >> + =A0 =A0 return 0;
> >> +}
> >> +
> >> +static struct irq_chip s5p_irq_eint =3D {
> >> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s5p-eint",
> >> + =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D s5p_irq_eint_mask,
> >> + =A0 =A0 .unmask =A0 =A0 =A0 =A0 =3D s5p_irq_eint_unmask,
> >> + =A0 =A0 .mask_ack =A0 =A0 =A0 =3D s5p_irq_eint_maskack,
> >> + =A0 =A0 .ack =A0 =A0 =A0 =A0 =A0 =A0=3D s5p_irq_eint_ack,
> >> + =A0 =A0 .set_type =A0 =A0 =A0 =3D s5p_irq_eint_set_type,
> >> +#ifdef CONFIG_PM
> >> + =A0 =A0 .set_wake =A0 =A0 =A0 =3D s3c_irqext_wake,
> >> +#endif
> >> +};
> >> +
> >> +/* s5p_irq_demux_eint
> >> + *
> >> + * This function demuxes the IRQ from the group0 external interru=
pts,
> >> + * from IRQ_EINT(16) to IRQ_EINT(31). It is designed to be inline=
d into
> >> + * the specific handlers s5p_irq_demux_eintX_Y.
> >> + */
> >> +static inline void s5p_irq_demux_eint(unsigned int start, unsigne=
d int end)
> >> +{
> >> + =A0 =A0 u32 status;
> >> + =A0 =A0 u32 mask =3D __raw_readl(S5P_EINT_MASK((start >> 3)));
> >> + =A0 =A0 unsigned int irq;
> >> +
> >> + =A0 =A0 status =3D __raw_readl(S5P_EINT_PEND((start >> 3)));
> >> + =A0 =A0 status &=3D ~mask;
> >> + =A0 =A0 status &=3D (1 << (end - start + 1)) - 1;
> >
> > We don't need to do any masking here as we'll always be processing =
all
> > interrupts from the controller. In fact, we probably don't need the=
 end
> > argument here at-all.
> >
> >> + =A0 =A0 while (status) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 irq =3D fls(status);
> >> + =A0 =A0 =A0 =A0 =A0 =A0 generic_handle_irq(irq - 1 + IRQ_EINT(st=
art));
> >> + =A0 =A0 =A0 =A0 =A0 =A0 status &=3D ~(1 << irq);
> >> + =A0 =A0 }
> >> +}
> >> +
> >> +static void s5p_irq_demux_eint16_31(unsigned int irq, struct irq_=
desc *desc)
> >> +{
> >> + =A0 =A0 s5p_irq_demux_eint(16, 23);
> >> + =A0 =A0 s5p_irq_demux_eint(24, 31);

We can remove the end parameters, both interrupt banks are 8 IRQs and
this we can also make the bit clearing post mask a constant if it is
even needed.

> >> +}
> >> +
> >> +static inline void s5p_irq_vic_eint_mask(unsigned int irq)
> >> +{
> >> + =A0 =A0 s5p_irq_eint_mask(irq);
> >> +}
> >> +
> >> +static void s5p_irq_vic_eint_unmask(unsigned int irq)
> >> +{
> >> + =A0 =A0 s5p_irq_eint_unmask(irq);
> >> +}
> >> +
> >> +static inline void s5p_irq_vic_eint_ack(unsigned int irq)
> >> +{
> >> + =A0 =A0 __raw_writel(eint_irq_to_bit(irq), S5P_EINT_PEND(eint_pe=
nd_reg(irq)));
> >> +}
> >> +
> >> +static void s5p_irq_vic_eint_maskack(unsigned int irq)
> >> +{
> >> + =A0 =A0 s5p_irq_vic_eint_mask(irq);
> >> + =A0 =A0 s5p_irq_vic_eint_ack(irq);
> >> +}
> >> +
> >> +static struct irq_chip s5p_irq_vic_eint =3D {
> >> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s5p_vic_eint",
> >> + =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D s5p_irq_vic_eint_mask,
> >> + =A0 =A0 .unmask =A0 =A0 =A0 =A0 =3D s5p_irq_vic_eint_unmask,
> >> + =A0 =A0 .mask_ack =A0 =A0 =A0 =3D s5p_irq_vic_eint_maskack,
> >> + =A0 =A0 .ack =A0 =A0 =A0 =A0 =A0 =A0=3D s5p_irq_vic_eint_ack,
> >> + =A0 =A0 .set_type =A0 =A0 =A0 =3D s5p_irq_eint_set_type,
> >> +#ifdef CONFIG_PM
> >> + =A0 =A0 .set_wake =A0 =A0 =A0 =3D s3c_irqext_wake,
> >> +#endif
> >> +};
> >> +
> >> +int __init s5p_init_irq_eint(void)
> >> +{
> >> + =A0 =A0 int irq;
> >> +
> >> + =A0 =A0 for (irq =3D IRQ_EINT(0); irq <=3D IRQ_EINT(15); irq++)
> >> + =A0 =A0 =A0 =A0 =A0 =A0 set_irq_chip(irq, &s5p_irq_vic_eint);
> >> +
> >> + =A0 =A0 for (irq =3D IRQ_EINT_GRP(16); irq <=3D IRQ_EINT_GRP(31)=
; irq++) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 set_irq_chip(irq, &s5p_irq_eint);
> >> + =A0 =A0 =A0 =A0 =A0 =A0 set_irq_handler(irq, handle_level_irq);
> >> + =A0 =A0 =A0 =A0 =A0 =A0 set_irq_flags(irq, IRQF_VALID);
> >> + =A0 =A0 }
> >> +
> >> + =A0 =A0 set_irq_chained_handler(IRQ_EINT16_31, s5p_irq_demux_ein=
t16_31);
> >> + =A0 =A0 return 0;
> >> +}
> >> +
> >> +arch_initcall(s5p_init_irq_eint);

--=20
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
