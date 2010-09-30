From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v4] ARM: Samsung: Add common s5p gpio interrupt support
Date: Thu, 30 Sep 2010 22:47:04 +0900
Message-ID: <AANLkTikf+BqqeH--GTern_5NAsUUwuTT8jYpwMn1m1FZ@mail.gmail.com>
References: <00a501cb5f18$e6b11590$b41340b0$%szyprowski@samsung.com>
	<1285830749-30008-1-git-send-email-m.szyprowski@samsung.com>
	<00ac01cb60a3$88b0b950$9a122bf0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <00ac01cb60a3$88b0b950$9a122bf0$%kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 30, 2010 at 10:29 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Marek Szyprowski wrote:
>>
>> This patch adds common code to enable support of gpio interrupts on s5p
>> series.
>>
>> The total number of gpio pins is quite large on s5p series. Registering
>> irq support for all of them would be a resource waste. Because of that
>> the interrupt support for standard gpio pins is registered dynamically
>> by the s5p_register_gpio_interrupt() function.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>>
>> ---
>>
>> Changes since v3:
>> - merged default and IRQ_TYPE_NONE cases in s5p_gpioint_set_type function
>> - fixed mask in GPIOINT_CON_OFFSET register from 0xf to 0x7
>> - renamed the chip to s5p_gpioint to match the s5p_extint style
>> - extended comments in plat/irqs.h
>>
>> ---
>> =A0arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A05 +
>> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A01 +
>> =A0arch/arm/plat-s5p/include/plat/irqs.h =A0 =A0 =A0 =A0 =A0| =A0 =A09 +
>> =A0arch/arm/plat-s5p/irq-gpioint.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A02=
42
>> ++++++++++++++++++++++++
>> =A0arch/arm/plat-samsung/include/plat/gpio-cfg.h =A0| =A0 18 ++
>> =A0arch/arm/plat-samsung/include/plat/gpio-core.h | =A0 =A04 +
>> =A06 files changed, 279 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/plat-s5p/irq-gpioint.c
>>
>> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
>> index 2596096..65dbfa8 100644
>> --- a/arch/arm/plat-s5p/Kconfig
>> +++ b/arch/arm/plat-s5p/Kconfig
>> @@ -32,6 +32,11 @@ config S5P_EXT_INT
>> =A0 =A0 =A0 =A0 Use the external interrupts (other than GPIO interrupts.)
>> =A0 =A0 =A0 =A0 Note: Do not choose this for S5P6440 and S5P6450.
>>
>> +config S5P_GPIO_INT
>> + =A0 =A0 bool
>> + =A0 =A0 help
>> + =A0 =A0 =A0 Common code for the GPIO interrupts (other than external
> interrupts.)
>> +
>> =A0config S5P_DEV_FIMC0
>> =A0 =A0 =A0 bool
>> =A0 =A0 =A0 help
>> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
>> index f3e917e..e0823be 100644
>> --- a/arch/arm/plat-s5p/Makefile
>> +++ b/arch/arm/plat-s5p/Makefile
>> @@ -18,6 +18,7 @@ obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 +=3D cpu.o
>> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
+=3D clock.o
>> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
+=3D irq.o
>> =A0obj-$(CONFIG_S5P_EXT_INT) =A0 =A0+=3D irq-eint.o
>> +obj-$(CONFIG_S5P_GPIO_INT) =A0 +=3D irq-gpioint.o
>>
>> =A0# devices
>>
>> diff --git a/arch/arm/plat-s5p/include/plat/irqs.h b/arch/arm/plat-
>> s5p/include/plat/irqs.h
>> index 3fb3a3a..5a7bf96 100644
>> --- a/arch/arm/plat-s5p/include/plat/irqs.h
>> +++ b/arch/arm/plat-s5p/include/plat/irqs.h
>> @@ -94,4 +94,13 @@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 ((irq) - S5P_EINT_BASE1) : \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 ((irq) + 16 -
>> S5P_EINT_BASE2))
>>
>> +/* Typically only a few gpio chips require gpio interrupt support.
>> + =A0 To avoid memory waste irq descriptors are allocated only for
>> + =A0 S5P_GPIOINT_GROUP_COUNT chips, each with total number of
>> + =A0 S5P_GPIOINT_GROUP_SIZE pins/irqs. Each GPIOINT group can be assiged
>> + =A0 to any gpio chip with the s5p_register_gpio_interrupt() function */
>> +#define S5P_GPIOINT_GROUP_COUNT 4
>> +#define S5P_GPIOINT_GROUP_SIZE =A0 =A0 =A0 8
>> +#define S5P_GPIOINT_COUNT =A0 =A0(S5P_GPIOINT_GROUP_COUNT *
>> S5P_GPIOINT_GROUP_SIZE)
>> +
>> =A0#endif /* __ASM_PLAT_S5P_IRQS_H */
>> diff --git a/arch/arm/plat-s5p/irq-gpioint.c
> b/arch/arm/plat-s5p/irq-gpioint.c
>> new file mode 100644
>> index 0000000..32263a3
>> --- /dev/null
>> +++ b/arch/arm/plat-s5p/irq-gpioint.c
>> @@ -0,0 +1,242 @@
>> +/* linux/arch/arm/plat-s5p/irq-gpioint.c
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * Author: Kyungmin Park <kyungmin.park@samsung.com>
>> + * Author: Joonyoung Shim <jy0922.shim@samsung.com>
>> + * Author: Marek Szyprowski <m.szyprowski@samsung.com>
>> + *
>> + * =A0This program is free software; you can redistribute =A0it and/or =
modify
> it
>> + * =A0under =A0the terms of =A0the GNU General =A0Public License as pub=
lished by
> the
>> + * =A0Free Software Foundation; =A0either version 2 of the =A0License, =
or (at
> your
>> + * =A0option) any later version.
>> + *
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/irq.h>
>> +#include <linux/io.h>
>> +#include <linux/gpio.h>
>> +
>> +#include <mach/map.h>
>> +#include <plat/gpio-core.h>
>> +#include <plat/gpio-cfg.h>
>> +
>> +#define S5P_GPIOREG(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (S5P=
_VA_GPIO + (x))
>> +
>> +#define GPIOINT_CON_OFFSET =A0 =A0 =A0 =A0 =A0 0x700
>> +#define GPIOINT_MASK_OFFSET =A0 =A0 =A0 =A0 =A00x900
>> +#define GPIOINT_PEND_OFFSET =A0 =A0 =A0 =A0 =A00xA00
>> +
>> +#define GPIOINT_LEVEL_LOW =A0 =A0 =A0 =A0 =A0 =A00x0
>> +#define GPIOINT_LEVEL_HIGH =A0 =A0 =A0 =A0 =A0 0x1
>> +#define GPIOINT_EDGE_FALLING =A0 =A0 =A0 =A0 0x2
>> +#define GPIOINT_EDGE_RISING =A0 =A0 =A0 =A0 =A00x3
>> +#define GPIOINT_EDGE_BOTH =A0 =A0 =A0 =A0 =A0 =A00x4
>> +
>> +static struct s3c_gpio_chip *irq_chips[S5P_GPIOINT_GROUP_MAXNR];
>> +
>> +static int s5p_gpioint_get_group(unsigned int irq)
>> +{
>> + =A0 =A0 struct gpio_chip *chip =3D get_irq_data(irq);
>> + =A0 =A0 struct s3c_gpio_chip *s3c_chip =3D container_of(chip,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct s3c_gpio_chip, chip);
>> + =A0 =A0 int group;
>> +
>> + =A0 =A0 for (group =3D 0; group < S5P_GPIOINT_GROUP_MAXNR; group++)
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (s3c_chip =3D=3D irq_chips[group])
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> + =A0 =A0 return group;
>> +}
>> +
>> +static int s5p_gpioint_get_offset(unsigned int irq)
>> +{
>> + =A0 =A0 struct gpio_chip *chip =3D get_irq_data(irq);
>> + =A0 =A0 struct s3c_gpio_chip *s3c_chip =3D container_of(chip,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct s3c_gpio_chip, chip);
>> +
>> + =A0 =A0 return irq - s3c_chip->irq_base;
>> +}
>> +
>> +static void s5p_gpioint_ack(unsigned int irq)
>> +{
>> + =A0 =A0 int group, offset, pend_offset;
>> + =A0 =A0 unsigned int value;
>> +
>> + =A0 =A0 group =3D s5p_gpioint_get_group(irq);
>> + =A0 =A0 offset =3D s5p_gpioint_get_offset(irq);
>> + =A0 =A0 pend_offset =3D group << 2;
>> +
>> + =A0 =A0 value =3D __raw_readl(S5P_GPIOREG(GPIOINT_PEND_OFFSET) +
>> pend_offset);
>> + =A0 =A0 value |=3D 1 << offset;
>> + =A0 =A0 __raw_writel(value, S5P_GPIOREG(GPIOINT_PEND_OFFSET) +
>> pend_offset);
>> +}
>> +
>> +static void s5p_gpioint_mask(unsigned int irq)
>> +{
>> + =A0 =A0 int group, offset, mask_offset;
>> + =A0 =A0 unsigned int value;
>> +
>> + =A0 =A0 group =3D s5p_gpioint_get_group(irq);
>> + =A0 =A0 offset =3D s5p_gpioint_get_offset(irq);
>> + =A0 =A0 mask_offset =3D group << 2;
>> +
>> + =A0 =A0 value =3D __raw_readl(S5P_GPIOREG(GPIOINT_MASK_OFFSET) +
>> mask_offset);
>> + =A0 =A0 value |=3D 1 << offset;
>> + =A0 =A0 __raw_writel(value, S5P_GPIOREG(GPIOINT_MASK_OFFSET) +
>> mask_offset);
>> +}
>> +
>> +static void s5p_gpioint_unmask(unsigned int irq)
>> +{
>> + =A0 =A0 int group, offset, mask_offset;
>> + =A0 =A0 unsigned int value;
>> +
>> + =A0 =A0 group =3D s5p_gpioint_get_group(irq);
>> + =A0 =A0 offset =3D s5p_gpioint_get_offset(irq);
>> + =A0 =A0 mask_offset =3D group << 2;
>> +
>> + =A0 =A0 value =3D __raw_readl(S5P_GPIOREG(GPIOINT_MASK_OFFSET) +
>> mask_offset);
>> + =A0 =A0 value &=3D ~(1 << offset);
>> + =A0 =A0 __raw_writel(value, S5P_GPIOREG(GPIOINT_MASK_OFFSET) +
>> mask_offset);
>> +}
>> +
>> +static void s5p_gpioint_mask_ack(unsigned int irq)
>> +{
>> + =A0 =A0 s5p_gpioint_mask(irq);
>> + =A0 =A0 s5p_gpioint_ack(irq);
>> +}
>> +
>> +static int s5p_gpioint_set_type(unsigned int irq, unsigned int type)
>> +{
>> + =A0 =A0 int group, offset, con_offset;
>> + =A0 =A0 unsigned int value;
>> +
>> + =A0 =A0 group =3D s5p_gpioint_get_group(irq);
>> + =A0 =A0 offset =3D s5p_gpioint_get_offset(irq);
>> + =A0 =A0 con_offset =3D group << 2;
>> +
>> + =A0 =A0 switch (type) {
>> + =A0 =A0 case IRQ_TYPE_EDGE_RISING:
>> + =A0 =A0 =A0 =A0 =A0 =A0 type =3D GPIOINT_EDGE_RISING;
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 case IRQ_TYPE_EDGE_FALLING:
>> + =A0 =A0 =A0 =A0 =A0 =A0 type =3D GPIOINT_EDGE_FALLING;
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 case IRQ_TYPE_EDGE_BOTH:
>> + =A0 =A0 =A0 =A0 =A0 =A0 type =3D GPIOINT_EDGE_BOTH;
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 case IRQ_TYPE_LEVEL_HIGH:
>> + =A0 =A0 =A0 =A0 =A0 =A0 type =3D GPIOINT_LEVEL_HIGH;
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 case IRQ_TYPE_LEVEL_LOW:
>> + =A0 =A0 =A0 =A0 =A0 =A0 type =3D GPIOINT_LEVEL_LOW;
>> + =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 case IRQ_TYPE_NONE:
>> + =A0 =A0 default:
>> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "No irq type\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 value =3D __raw_readl(S5P_GPIOREG(GPIOINT_CON_OFFSET) +
>> con_offset);
>> + =A0 =A0 value &=3D ~(0x7 << (offset * 0x4));
>> + =A0 =A0 value |=3D (type << (offset * 0x4));
>> + =A0 =A0 __raw_writel(value, S5P_GPIOREG(GPIOINT_CON_OFFSET) +
>> con_offset);
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +struct irq_chip s5p_gpioint =3D {
>> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s5p_gpioint",
>> + =A0 =A0 .ack =A0 =A0 =A0 =A0 =A0 =A0=3D s5p_gpioint_ack,
>> + =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D s5p_gpioint_mask,
>> + =A0 =A0 .mask_ack =A0 =A0 =A0 =3D s5p_gpioint_mask_ack,
>> + =A0 =A0 .unmask =A0 =A0 =A0 =A0 =3D s5p_gpioint_unmask,
>> + =A0 =A0 .set_type =A0 =A0 =A0 =3D s5p_gpioint_set_type,
>> +};
>> +
>> +static void s5p_gpioint_handler(unsigned int irq, struct irq_desc *desc)
>> +{
>> + =A0 =A0 int group, offset, pend_offset, mask_offset;
>> + =A0 =A0 int real_irq;
>> + =A0 =A0 unsigned int pend, mask;
>> +
>> + =A0 =A0 for (group =3D 0; group < S5P_GPIOINT_GROUP_MAXNR; group++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pend_offset =3D group << 2;
>> + =A0 =A0 =A0 =A0 =A0 =A0 pend =3D __raw_readl(S5P_GPIOREG(GPIOINT_PEND_=
OFFSET) +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pend_offset);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!pend)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 mask_offset =3D group << 2;
>> + =A0 =A0 =A0 =A0 =A0 =A0 mask =3D __raw_readl(S5P_GPIOREG(GPIOINT_MASK_=
OFFSET) +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask_offset);
>> + =A0 =A0 =A0 =A0 =A0 =A0 pend &=3D ~mask;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 for (offset =3D 0; offset < 8; offset++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pend & (1 << offset)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct s3c_gpi=
o_chip *chip =3D
> irq_chips[group];
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (chip) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 real_irq =3D chip->irq_base + offset;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 generic_handle_irq(real_irq);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +}
>> +
>> +static __init int s5p_gpioint_add(struct s3c_gpio_chip *chip)
>> +{
>> + =A0 =A0 static int used_gpioint_groups =3D 0;
>> + =A0 =A0 static bool handler_registered =3D 0;
>> + =A0 =A0 int irq, group =3D chip->group;
>> + =A0 =A0 int i;
>> +
>> + =A0 =A0 if (used_gpioint_groups >=3D S5P_GPIOINT_GROUP_COUNT)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> +
>> + =A0 =A0 chip->irq_base =3D S5P_GPIOINT_BASE +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0used_gpioint_groups * S5P_G=
PIOINT_GROUP_SIZE;
>> + =A0 =A0 used_gpioint_groups++;
>> +
>> + =A0 =A0 if (!handler_registered) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 set_irq_chained_handler(IRQ_GPIOINT, s5p_gpioi=
nt_handler);
>> + =A0 =A0 =A0 =A0 =A0 =A0 handler_registered =3D 1;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 irq_chips[group] =3D chip;
>> + =A0 =A0 for (i =3D 0; i < chip->chip.ngpio; i++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 irq =3D chip->irq_base + i;
>> + =A0 =A0 =A0 =A0 =A0 =A0 set_irq_chip(irq, &s5p_gpioint);
>> + =A0 =A0 =A0 =A0 =A0 =A0 set_irq_data(irq, &chip->chip);
>> + =A0 =A0 =A0 =A0 =A0 =A0 set_irq_handler(irq, handle_level_irq);
>> + =A0 =A0 =A0 =A0 =A0 =A0 set_irq_flags(irq, IRQF_VALID);
>> + =A0 =A0 }
>> + =A0 =A0 return 0;
>> +}
>> +
>> +int __init s5p_register_gpio_interrupt(int pin)
>> +{
>> + =A0 =A0 struct s3c_gpio_chip *my_chip =3D s3c_gpiolib_getchip(pin);
>> + =A0 =A0 int offset, group;
>> + =A0 =A0 int ret;
>> +
>> + =A0 =A0 if (!my_chip)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 offset =3D pin - my_chip->chip.base;
>> + =A0 =A0 group =3D my_chip->group;
>> +
>> + =A0 =A0 /* check if the group has been already registered */
>> + =A0 =A0 if (my_chip->irq_base)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return my_chip->irq_base + offset;
>> +
>> + =A0 =A0 /* register gpio group */
>> + =A0 =A0 ret =3D s5p_gpioint_add(my_chip);
>> + =A0 =A0 if (ret =3D=3D 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "Registered interrupt support=
 for gpio
>> group %d.\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0group);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return my_chip->irq_base + offset;
>> + =A0 =A0 }
>> + =A0 =A0 return ret;
>> +}
>> diff --git a/arch/arm/plat-samsung/include/plat/gpio-cfg.h
> b/arch/arm/plat-
>> samsung/include/plat/gpio-cfg.h
>> index 1c6b929..5b43b95 100644
>> --- a/arch/arm/plat-samsung/include/plat/gpio-cfg.h
>> +++ b/arch/arm/plat-samsung/include/plat/gpio-cfg.h
>> @@ -169,4 +169,22 @@ extern s5p_gpio_drvstr_t s5p_gpio_get_drvstr(unsign=
ed
>> int pin);
>> =A0*/
>> =A0extern int s5p_gpio_set_drvstr(unsigned int pin, s5p_gpio_drvstr_t
> drvstr);
>>
>> +/**
>> + * s5p_register_gpio_interrupt() - register interrupt support for a gpio
> group
>> + * @pin: The pin number from the group to be registered
>> + *
>> + * This function registers gpio interrupt support for the group that the
>> + * specified pin belongs to.
>> + *
>> + * The total number of gpio pins is quite large ob s5p series.
> Registering
>> + * irq support for all of them would be a resource waste. Because of th=
at
> the
>> + * interrupt support for standard gpio pins is registered dynamically.
>> + *
>> + * It will return the irq number of the interrupt that has been
> registered
>> + * or -ENOMEM if no more gpio interrupts can be registered. It is allow=
ed
>> + * to call this function more than once for the same gpio group (the
> group
>> + * will be registered only once).
>> + */
>> +extern int s5p_register_gpio_interrupt(int pin);
>> +
>> =A0#endif /* __PLAT_GPIO_CFG_H */
>> diff --git a/arch/arm/plat-samsung/include/plat/gpio-core.h
> b/arch/arm/plat-
>> samsung/include/plat/gpio-core.h
>> index e358c7d..c22c27c 100644
>> --- a/arch/arm/plat-samsung/include/plat/gpio-core.h
>> +++ b/arch/arm/plat-samsung/include/plat/gpio-core.h
>> @@ -43,6 +43,8 @@ struct s3c_gpio_cfg;
>> =A0 * struct s3c_gpio_chip - wrapper for specific implementation of gpio
>> =A0 * @chip: The chip structure to be exported via gpiolib.
>> =A0 * @base: The base pointer to the gpio configuration registers.
>> + * @group: The group register number for gpio interrupt support.
>> + * @irq_base: The base irq number.
>> =A0 * @config: special function and pull-resistor control information.
>> =A0 * @lock: Lock for exclusive access to this gpio bank.
>> =A0 * @pm_save: Save information for suspend/resume support.
>> @@ -63,6 +65,8 @@ struct s3c_gpio_chip {
>> =A0 =A0 =A0 struct s3c_gpio_cfg =A0 =A0 *config;
>> =A0 =A0 =A0 struct s3c_gpio_pm =A0 =A0 =A0*pm;
>> =A0 =A0 =A0 void __iomem =A0 =A0 =A0 =A0 =A0 =A0*base;
>> + =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_base;
>> + =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 group;
>> =A0 =A0 =A0 spinlock_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 lock;
>> =A0#ifdef CONFIG_PM
>> =A0 =A0 =A0 u32 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm_save[4];
>> --
>
> Looks ok to me...will apply.

I hope I want to see the applied patches tomorrow since there are more patc=
hes.

One more, what's going on s5pc110 features. especially suspend &
resume. If you need I'll add Ack-by that patches.

Thank you,
Kyungmin Park
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-s=
oc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
