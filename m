From: padma venkat <padma.kvr@gmail.com>
Subject: Re:
Date: Thu, 21 Jul 2011 11:13:11 +0530
Message-ID: <CAAgF-BcTUTN5B59NO+yo7o=r=AtzvEHHOPwLBUgL15ifyYfFWA@mail.gmail.com>
References: <1311246765-4161-1-git-send-email-padma.v@samsung.com>
	<4E27B914.3050809@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4E27B914.3050809@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, Padmavathi Venna <padma.v@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tushar,

On Thu, Jul 21, 2011 at 10:58 AM, Tushar Behera
<tushar.behera@linaro.org> wrote:
> On Thursday 21 July 2011 04:42 PM, Padmavathi Venna wrote:
>>
>> Add external interrupt support for S5P64X0.The external interrupt
>> group 0(0 to 15) is used for wake-up source in stop and sleep mode.
>> Add generic irq chip support
>
> Comment looks incomplete.
Please kindly ignore this patch.
>>
>> Signed-off-by: Padmavathi Venna<padma.v@samsung.com>
>
> Subject line seems missing in the patch.
>
>> ---
>>
>> Please ignore my previous patch due to wrong return value.
>>
>> =A0arch/arm/mach-s5p64x0/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
>> =A0arch/arm/mach-s5p64x0/include/mach/regs-gpio.h | =A0 10 ++
>> =A0arch/arm/mach-s5p64x0/irq-eint.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0152
>> ++++++++++++++++++++++++
>> =A03 files changed, 163 insertions(+), 1 deletions(-)
>> =A0create mode 100644 arch/arm/mach-s5p64x0/irq-eint.c
>>
>> diff --git a/arch/arm/mach-s5p64x0/Makefile
>> b/arch/arm/mach-s5p64x0/Makefile
>> index ae6bf6f..5f6afdf 100644
>> --- a/arch/arm/mach-s5p64x0/Makefile
>> +++ b/arch/arm/mach-s5p64x0/Makefile
>> @@ -13,7 +13,7 @@ obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0:=3D
>> =A0# Core support for S5P64X0 system
>>
>> =A0obj-$(CONFIG_ARCH_S5P64X0) =A0 =A0+=3D cpu.o init.o clock.o dma.o gpi=
olib.o
>> -obj-$(CONFIG_ARCH_S5P64X0) =A0 =A0 +=3D setup-i2c0.o
>> +obj-$(CONFIG_ARCH_S5P64X0) =A0 =A0 +=3D setup-i2c0.o irq-eint.o
>> =A0obj-$(CONFIG_CPU_S5P6440) =A0 =A0 +=3D clock-s5p6440.o
>> =A0obj-$(CONFIG_CPU_S5P6450) =A0 =A0 +=3D clock-s5p6450.o
>>
>> diff --git a/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
>> b/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
>> index 0953ef6..6ce2547 100644
>> --- a/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
>> +++ b/arch/arm/mach-s5p64x0/include/mach/regs-gpio.h
>> @@ -34,4 +34,14 @@
>> =A0#define S5P6450_GPQ_BASE =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO + 0x=
0180)
>> =A0#define S5P6450_GPS_BASE =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO + 0x=
0300)
>>
>> +/* External interrupt control registers for group0 */
>> +
>> +#define EINT0CON0_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x900)
>> +#define EINT0MASK_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x920)
>> +#define EINT0PEND_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x924)
>> +
>> +#define S5P64X0_EINT0CON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO + EIN=
T0CON0_OFFSET)
>> +#define S5P64X0_EINT0MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO + EIN=
T0MASK_OFFSET)
>> +#define S5P64X0_EINT0PEND =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_GPIO + EIN=
T0PEND_OFFSET)
>> +
>> =A0#endif /* __ASM_ARCH_REGS_GPIO_H */
>> diff --git a/arch/arm/mach-s5p64x0/irq-eint.c
>> b/arch/arm/mach-s5p64x0/irq-eint.c
>> new file mode 100644
>> index 0000000..69ed454
>> --- /dev/null
>> +++ b/arch/arm/mach-s5p64x0/irq-eint.c
>> @@ -0,0 +1,152 @@
>> +/* arch/arm/mach-s5p64x0/irq-eint.c
>> + *
>> + * Copyright (c) 2011 Samsung Electronics Co., Ltd
>> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
>> + *
>> + * Based on linux/arch/arm/mach-s3c64xx/irq-eint.c
>> + *
>> + * S5P64X0 - Interrupt handling for External Interrupts.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +#include<linux/kernel.h>
>> +#include<linux/gpio.h>
>> +#include<linux/irq.h>
>> +#include<linux/io.h>
>> +
>> +#include<plat/regs-irqtype.h>
>> +#include<plat/gpio-cfg.h>
>> +
>> +#include<mach/regs-gpio.h>
>> +#include<mach/regs-clock.h>
>> +
>> +#define eint_offset(irq) =A0 =A0 =A0 ((irq) - IRQ_EINT(0))
>> +
>> +static int s5p64x0_irq_eint_set_type(struct irq_data *data, unsigned int
>> type)
>> +{
>> + =A0 =A0 =A0 int offs =3D eint_offset(data->irq);
>> + =A0 =A0 =A0 int shift;
>> + =A0 =A0 =A0 u32 ctrl, mask;
>> + =A0 =A0 =A0 u32 newvalue =3D 0;
>> +
>> + =A0 =A0 =A0 if (offs> =A015)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 =A0 switch (type) {
>> + =A0 =A0 =A0 case IRQ_TYPE_NONE:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "No edge setting!\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 case IRQ_TYPE_EDGE_RISING:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_RISEEDGE;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 case IRQ_TYPE_EDGE_FALLING:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_FALLEDGE;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 case IRQ_TYPE_EDGE_BOTH:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_BOTHEDGE;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 case IRQ_TYPE_LEVEL_LOW:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_LOWLEV;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 case IRQ_TYPE_LEVEL_HIGH:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 newvalue =3D S3C2410_EXTINT_HILEV;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 default:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "No such irq type %d", typ=
e);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 shift =3D (offs / 2) * 4;
>> + =A0 =A0 =A0 mask =3D 0x7<< =A0shift;
>> +
>> + =A0 =A0 =A0 ctrl =3D __raw_readl(S5P64X0_EINT0CON0)& =A0~mask;
>> + =A0 =A0 =A0 ctrl |=3D newvalue<< =A0shift;
>> + =A0 =A0 =A0 __raw_writel(ctrl, S5P64X0_EINT0CON0);
>> +
>> + =A0 =A0 =A0 /* Configure the GPIO pin for 6450 or 6440 based on CPU ID=
 */
>> + =A0 =A0 =A0 if (0x50000 =3D=3D (__raw_readl(S5P64X0_SYS_ID)& =A00xFF00=
0))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6450_GPN(offs), S3C_GPI=
O_SFN(2));
>> + =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgpin(S5P6440_GPN(offs), S3C_GPI=
O_SFN(2));
>> +
>> + =A0 =A0 =A0 return 0;
>> +}
>> +
>> +/*
>> + * s5p64x0_irq_demux_eint
>> + *
>> + * This function demuxes the IRQ from the group0 external interrupts,
>> + * from IRQ_EINT(0) to IRQ_EINT(15). It is designed to be inlined into
>> + * the specific handlers s5p64x0_irq_demux_eintX_Y.
>> + */
>> +static inline void s5p64x0_irq_demux_eint(unsigned int start, unsigned
>> int end)
>> +{
>> + =A0 =A0 =A0 u32 status =3D __raw_readl(S5P64X0_EINT0PEND);
>> + =A0 =A0 =A0 u32 mask =3D __raw_readl(S5P64X0_EINT0MASK);
>> + =A0 =A0 =A0 unsigned int irq;
>> +
>> + =A0 =A0 =A0 status&=3D ~mask;
>> + =A0 =A0 =A0 status>>=3D start;
>> + =A0 =A0 =A0 status&=3D (1<< =A0(end - start + 1)) - 1;
>> +
>> + =A0 =A0 =A0 for (irq =3D IRQ_EINT(start); irq<=3D IRQ_EINT(end); irq++=
) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (status& =A01)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 generic_handle_irq(irq);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status>>=3D 1;
>> + =A0 =A0 =A0 }
>> +}
>> +
>> +static void s5p64x0_irq_demux_eint0_3(unsigned int irq, struct irq_desc
>> *desc)
>> +{
>> + =A0 =A0 =A0 s5p64x0_irq_demux_eint(0, 3);
>> +}
>> +
>> +static void s5p64x0_irq_demux_eint4_11(unsigned int irq, struct irq_desc
>> *desc)
>> +{
>> + =A0 =A0 =A0 s5p64x0_irq_demux_eint(4, 11);
>> +}
>> +
>> +static void s5p64x0_irq_demux_eint12_15(unsigned int irq,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 struct irq_desc *desc)
>> +{
>> + =A0 =A0 =A0 s5p64x0_irq_demux_eint(12, 15);
>> +}
>> +
>> +static int s5p64x0_alloc_gc(void)
>> +{
>> + =A0 =A0 =A0 struct irq_chip_generic *gc;
>> + =A0 =A0 =A0 struct irq_chip_type *ct;
>> +
>> + =A0 =A0 =A0 gc =3D irq_alloc_generic_chip("s5p64x0-eint", 1, S5P_IRQ_E=
INT_BASE,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5=
P_VA_GPIO, handle_level_irq);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^^^^
Added spaces purposefully to make the parameters aligned properly in
the next line
> nitpick: Should be TABS
>>
>> + =A0 =A0 =A0 if (!gc) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: irq_alloc_generic_chi=
p for group 0"
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "external interrupts faile=
d\n", __func__);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 ct =3D gc->chip_types;
>> + =A0 =A0 =A0 ct->chip.irq_ack =3D irq_gc_ack;
>> + =A0 =A0 =A0 ct->chip.irq_mask =3D irq_gc_mask_set_bit;
>> + =A0 =A0 =A0 ct->chip.irq_unmask =3D irq_gc_mask_clr_bit;
>> + =A0 =A0 =A0 ct->chip.irq_set_type =3D s5p64x0_irq_eint_set_type;
>> + =A0 =A0 =A0 ct->regs.ack =3D EINT0PEND_OFFSET;
>> + =A0 =A0 =A0 ct->regs.mask =3D EINT0MASK_OFFSET;
>> + =A0 =A0 =A0 irq_setup_generic_chip(gc, IRQ_MSK(16), IRQ_GC_INIT_MASK_C=
ACHE,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0IRQ_NOREQUE=
ST | IRQ_NOPROBE, 0);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0^^^^^^
> TABS
Added spaces purposefully to make the parameters aligned properly in
the next line.

Thanks&Regards
Padma
>>
>> + =A0 =A0 =A0 return 0;
>> +}
>> +
>> +static int __init s5p64x0_init_irq_eint(void)
>> +{
>> + =A0 =A0 =A0 int ret =3D s5p64x0_alloc_gc();
>> + =A0 =A0 =A0 irq_set_chained_handler(IRQ_EINT0_3, s5p64x0_irq_demux_ein=
t0_3);
>> + =A0 =A0 =A0 irq_set_chained_handler(IRQ_EINT4_11, s5p64x0_irq_demux_ei=
nt4_11);
>> + =A0 =A0 =A0 irq_set_chained_handler(IRQ_EINT12_15,
>> s5p64x0_irq_demux_eint12_15);
>> +
>> + =A0 =A0 =A0 return ret;
>> +}
>> +arch_initcall(s5p64x0_init_irq_eint);
>
>
> --
> Tushar Behera
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-s=
oc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
