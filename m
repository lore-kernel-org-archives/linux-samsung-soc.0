From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/7] ARM: S5P6440: CPU initialization
Date: Sun, 13 Dec 2009 16:47:31 +0900
Message-ID: <1b68c6790912122347p6fa6cf99jf4c733e666a15f8f@mail.gmail.com>
References: <1260525250-4160-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f192.google.com ([209.85.212.192]:34754 "HELO
	mail-vw0-f192.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751354AbZLMHrd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Dec 2009 02:47:33 -0500
Received: by vws30 with SMTP id 30so367467vws.33
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Dec 2009 23:47:32 -0800 (PST)
In-Reply-To: <1260525250-4160-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Adityapratap Sharma <aditya.ps@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

On Fri, Dec 11, 2009 at 6:54 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> This patch adds S5P6440 support.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Adityapratap Sharma <aditya.ps@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> ---
> =C2=A0arch/arm/mach-s5p6440/cpu.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0120 ++++++++++++++++++=
++++
> =C2=A0arch/arm/mach-s5p6440/include/mach/debug-macro.S | =C2=A0 37 ++=
+++++
> =C2=A0arch/arm/mach-s5p6440/include/mach/entry-macro.S | =C2=A0 42 ++=
++++++
> =C2=A0arch/arm/mach-s5p6440/include/mach/gpio-core.h =C2=A0 | =C2=A0 =
19 ++++
> =C2=A0arch/arm/mach-s5p6440/include/mach/gpio.h =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 79 ++++++++++++++
> =C2=A0arch/arm/mach-s5p6440/include/mach/hardware.h =C2=A0 =C2=A0| =C2=
=A0 18 ++++
> =C2=A0arch/arm/mach-s5p6440/include/mach/idle.h =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 23 ++++
> =C2=A0arch/arm/mach-s5p6440/include/mach/map.h =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0100 ++++++++++++++++++
> =C2=A0arch/arm/mach-s5p6440/include/mach/memory.h =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 22 ++++
> =C2=A0arch/arm/mach-s5p6440/include/mach/system.h =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 40 +++++++
> =C2=A0arch/arm/mach-s5p6440/include/mach/uncompress.h =C2=A0| =C2=A0 =
24 +++++
> =C2=A0arch/arm/plat-s3c/include/plat/cpu.h =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0arch/arm/plat-s5p/cpu.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 88 ++++++++++=
++++++
> =C2=A0arch/arm/plat-s5p/include/plat/s5p6440.h =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 33 ++++++
> =C2=A0arch/arm/plat-s5p/s5p6440-init.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 23 ++++
> =C2=A0arch/arm/plat-s5p/setup-i2c0.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 23 ++++
> =C2=A016 files changed, 693 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/cpu.c
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/include/mach/debug-mac=
ro.S
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/include/mach/entry-mac=
ro.S
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/include/mach/gpio-core=
=2Eh
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/include/mach/gpio.h
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/include/mach/hardware.=
h
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/include/mach/idle.h
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/include/mach/map.h
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/include/mach/memory.h
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/include/mach/system.h
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/include/mach/uncompres=
s.h
> =C2=A0create mode 100644 arch/arm/plat-s5p/cpu.c
> =C2=A0create mode 100644 arch/arm/plat-s5p/include/plat/s5p6440.h
> =C2=A0create mode 100644 arch/arm/plat-s5p/s5p6440-init.c
> =C2=A0create mode 100644 arch/arm/plat-s5p/setup-i2c0.c
>
> diff --git a/arch/arm/mach-s5p6440/cpu.c b/arch/arm/mach-s5p6440/cpu.=
c
> new file mode 100644
> index 0000000..6aab6d2
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/cpu.c
> @@ -0,0 +1,120 @@
> +/* linux/arch/arm/mach-s5p6440/cpu.c
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/interrupt.h>
> +#include <linux/list.h>
> +#include <linux/timer.h>
> +#include <linux/init.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/sysdev.h>
> +#include <linux/serial_core.h>
> +#include <linux/platform_device.h>
> +
> +#include <asm/mach/arch.h>
> +#include <asm/mach/map.h>
> +#include <asm/mach/irq.h>
> +
> +#include <asm/proc-fns.h>
> +#include <mach/idle.h>
> +
> +#include <mach/hardware.h>
> +#include <mach/map.h>
> +#include <asm/irq.h>
> +
> +#include <plat/regs-serial.h>
> +#include <mach/regs-clock.h>
> +
> +#include <plat/cpu.h>
> +#include <plat/devs.h>
> +#include <plat/clock.h>
> +#include <plat/s5p6440.h>
> +
> +/* Initial IO mappings */
> +
> +static struct map_desc s5p6440_iodesc[] __initdata =3D {
> +};
> +
> +static void s5p6440_idle(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned long val;
> +
> + =C2=A0 =C2=A0 =C2=A0 val =3D __raw_readl(S5P_PWR_CFG);
> + =C2=A0 =C2=A0 =C2=A0 val &=3D ~(0x3<<5);
> + =C2=A0 =C2=A0 =C2=A0 val |=3D (0x1<<5);
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(val, S5P_PWR_CFG);
> +
> + =C2=A0 =C2=A0 =C2=A0 cpu_do_idle();
> +}
> +
> +/* s5p6440_map_io
> + *
> + * register the standard cpu IO areas
> +*/
> +
> +void __init s5p6440_map_io(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 iotable_init(s5p6440_iodesc, ARRAY_SIZE(s5p644=
0_iodesc));
> +
> + =C2=A0 =C2=A0 =C2=A0 /* set idle function */
> + =C2=A0 =C2=A0 =C2=A0 s5p6440_idle_fn =3D s5p6440_idle;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* initialize device information early */
> +}
> +
> +void __init s5p6440_init_clocks(int xtal)
> +{
> + =C2=A0 =C2=A0 =C2=A0 printk(KERN_DEBUG "%s: initializing clocks\n",=
 __func__);
> +
> + =C2=A0 =C2=A0 =C2=A0 s3c24xx_register_baseclocks(xtal);
> + =C2=A0 =C2=A0 =C2=A0 s5p_register_clocks(xtal);
> + =C2=A0 =C2=A0 =C2=A0 s5p6440_register_clocks();
> + =C2=A0 =C2=A0 =C2=A0 s5p6440_setup_clocks();
> +}
> +
> +void __init s5p6440_init_irq(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 /* S5P6440 supports only 2 VIC */
> + =C2=A0 =C2=A0 =C2=A0 int num_vic =3D 2;
> + =C2=A0 =C2=A0 =C2=A0 u32 vic[num_vic];
> +
> + =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* VIC0 is missing IRQ_VIC0[3, 4, 8, 10, =
(12-22)]
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* VIC1 is missing IRQ VIC1[1, 3, 4, 10, =
11, 12, 14, 15, 22]
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> + =C2=A0 =C2=A0 =C2=A0 vic[0] =3D 0xff800ae7;
> + =C2=A0 =C2=A0 =C2=A0 vic[1] =3D 0xffbf23e5;
> +
> + =C2=A0 =C2=A0 =C2=A0 s5p_init_irq(vic, num_vic);
> +}
> +
> +struct sysdev_class s5p6440_sysclass =3D {
> + =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =3D "s5p6440-core",
> +};
> +
> +static struct sys_device s5p6440_sysdev =3D {
> + =C2=A0 =C2=A0 =C2=A0 .cls =C2=A0 =C2=A0=3D &s5p6440_sysclass,
> +};
> +
> +static int __init s5p6440_core_init(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return sysdev_class_register(&s5p6440_sysclass=
);
> +}
> +
> +core_initcall(s5p6440_core_init);
> +
> +int __init s5p6440_init(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 printk("S5P6440: Initializing architecture\n")=
;
> +
> + =C2=A0 =C2=A0 =C2=A0 return sysdev_register(&s5p6440_sysdev);
> +}
> diff --git a/arch/arm/mach-s5p6440/include/mach/debug-macro.S b/arch/=
arm/mach-s5p6440/include/mach/debug-macro.S
> new file mode 100644
> index 0000000..2947407
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/include/mach/debug-macro.S
> @@ -0,0 +1,37 @@
> +/* linux/arch/arm/mach-s5p6440/include/mach/debug-macro.S
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/* pull in the relevant register and map files. */
> +
> +#include <mach/map.h>
> +#include <plat/regs-serial.h>
> +
> + =C2=A0 =C2=A0 =C2=A0 /* note, for the boot process to work we have =
to keep the UART
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* virtual address aligned to an 1MiB bou=
ndary for the L1
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* mapping the head code makes. We keep t=
he UART virtual address
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* aligned and add in the offset when we =
load the value here.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> +
> + =C2=A0 =C2=A0 =C2=A0 .macro addruart, rx
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mrc =C2=A0 =C2=A0 =
p15, 0, \rx, c1, c0
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst =C2=A0 =C2=A0 =
\rx, #1
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldreq =C2=A0 \rx, =
=3D S5P_PA_UART
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldrne =C2=A0 \rx, =
=3D (S5P_VA_UART + S5P_PA_UART & 0xfffff)
> +#if CONFIG_DEBUG_S3C_UART !=3D 0
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add =C2=A0 =C2=A0 =
\rx, \rx, #(0x400 * CONFIG_DEBUG_S3C_UART)
> +#endif
> + =C2=A0 =C2=A0 =C2=A0 .endm
> +
> +/* include the reset of the code which will do the work, we're only
> + * compiling for a single cpu processor type so the default of s3c24=
40
> + * will be fine with us.
> + */
> +
> +#include <plat/debug-macro.S>
> diff --git a/arch/arm/mach-s5p6440/include/mach/entry-macro.S b/arch/=
arm/mach-s5p6440/include/mach/entry-macro.S
> new file mode 100644
> index 0000000..ded1e1f
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/include/mach/entry-macro.S
> @@ -0,0 +1,42 @@
> +/* linux/arch/arm/mach-s5p6440/include/mach/entry-macro.S
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * Low-level IRQ helper macros for the Samsung S5P6440
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <asm/hardware/vic.h>
> +#include <mach/map.h>
> +#include <plat/irqs.h>
> +
> + =C2=A0 =C2=A0 =C2=A0 .macro =C2=A0disable_fiq
> + =C2=A0 =C2=A0 =C2=A0 .endm
> +
> + =C2=A0 =C2=A0 =C2=A0 .macro =C2=A0get_irqnr_preamble, base, tmp
> + =C2=A0 =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 \base, =3DS5P_VA_VIC0
> + =C2=A0 =C2=A0 =C2=A0 .endm
> +
> + =C2=A0 =C2=A0 =C2=A0 .macro =C2=A0arch_ret_to_user, tmp1, tmp2
> + =C2=A0 =C2=A0 =C2=A0 .endm
> +
> + =C2=A0 =C2=A0 =C2=A0 .macro =C2=A0get_irqnr_and_base, irqnr, irqsta=
t, base, tmp
> +
> + =C2=A0 =C2=A0 =C2=A0 @ check the vic0
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 \irqnr, # S5P_IRQ_OFFSET + 3=
1
> + =C2=A0 =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 \irqstat, [ \base, # VIC_IRQ=
_STATUS ]
> + =C2=A0 =C2=A0 =C2=A0 teq =C2=A0 =C2=A0 \irqstat, #0
> +
> + =C2=A0 =C2=A0 =C2=A0 @ otherwise try vic1
> + =C2=A0 =C2=A0 =C2=A0 addeq =C2=A0 \tmp, \base, #(S5P_VA_VIC1 - S5P_=
VA_VIC0)
> + =C2=A0 =C2=A0 =C2=A0 addeq =C2=A0 \irqnr, \irqnr, #32
> + =C2=A0 =C2=A0 =C2=A0 ldreq =C2=A0 \irqstat, [ \tmp, # VIC_IRQ_STATU=
S ]
> + =C2=A0 =C2=A0 =C2=A0 teqeq =C2=A0 \irqstat, #0
> +
> + =C2=A0 =C2=A0 =C2=A0 clzne =C2=A0 \irqstat, \irqstat
> + =C2=A0 =C2=A0 =C2=A0 subne =C2=A0 \irqnr, \irqnr, \irqstat
> + =C2=A0 =C2=A0 =C2=A0 .endm
> diff --git a/arch/arm/mach-s5p6440/include/mach/gpio-core.h b/arch/ar=
m/mach-s5p6440/include/mach/gpio-core.h
> new file mode 100644
> index 0000000..054d982
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/include/mach/gpio-core.h
> @@ -0,0 +1,19 @@
> +/* linux/arch/arm/mach-s5p6440/include/mach/gpio-core.h
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * S5P6440 - GPIO core support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_GPIO_CORE_H
> +#define __ASM_ARCH_GPIO_CORE_H __FILE__
> +
> +/* currently we just include the platform support */
> +#include <plat/gpio-core.h>
> +
> +#endif /* __ASM_ARCH_GPIO_CORE_H */
> diff --git a/arch/arm/mach-s5p6440/include/mach/gpio.h b/arch/arm/mac=
h-s5p6440/include/mach/gpio.h
> new file mode 100644
> index 0000000..35e7e29
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/include/mach/gpio.h
> @@ -0,0 +1,79 @@
> +/* linux/arch/arm/mach-s5p6440/include/mach/gpio.h
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * S5P6440 - GPIO lib support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_GPIO_H
> +#define __ASM_ARCH_GPIO_H __FILE__
> +
> +#define gpio_get_value __gpio_get_value
> +#define gpio_set_value __gpio_set_value
> +#define gpio_cansleep =C2=A0__gpio_cansleep
> +#define gpio_to_irq =C2=A0 =C2=A0__gpio_to_irq
> +
> +/* GPIO bank sizes */
> +#define S5P6440_GPIO_A_NR =C2=A0 =C2=A0 =C2=A0(6)
> +#define S5P6440_GPIO_B_NR =C2=A0 =C2=A0 =C2=A0(7)
> +#define S5P6440_GPIO_C_NR =C2=A0 =C2=A0 =C2=A0(8)
> +#define S5P6440_GPIO_F_NR =C2=A0 =C2=A0 =C2=A0(2)
> +#define S5P6440_GPIO_G_NR =C2=A0 =C2=A0 =C2=A0(7)
> +#define S5P6440_GPIO_H_NR =C2=A0 =C2=A0 =C2=A0(10)
> +#define S5P6440_GPIO_I_NR =C2=A0 =C2=A0 =C2=A0(16)
> +#define S5P6440_GPIO_J_NR =C2=A0 =C2=A0 =C2=A0(12)
> +#define S5P6440_GPIO_N_NR =C2=A0 =C2=A0 =C2=A0(16)
> +#define S5P6440_GPIO_P_NR =C2=A0 =C2=A0 =C2=A0(8)
> +#define S5P6440_GPIO_R_NR =C2=A0 =C2=A0 =C2=A0(15)
> +
> +/* GPIO bank numbers */
> +
> +/* CONFIG_S3C_GPIO_SPACE allows the user to select extra
> + * space for debugging purposes so that any accidental
> + * change from one gpio bank to another can be caught.
> +*/
> +#define S5P6440_GPIO_NEXT(__gpio) \
> + =C2=A0 =C2=A0 =C2=A0 ((__gpio##_START) + (__gpio##_NR) + CONFIG_S3C=
_GPIO_SPACE + 1)
> +
> +enum s5p_gpio_number {
> + =C2=A0 =C2=A0 =C2=A0 S5P6440_GPIO_A_START =3D 0,
> + =C2=A0 =C2=A0 =C2=A0 S5P6440_GPIO_B_START =3D S5P6440_GPIO_NEXT(S5P=
6440_GPIO_A),
> + =C2=A0 =C2=A0 =C2=A0 S5P6440_GPIO_C_START =3D S5P6440_GPIO_NEXT(S5P=
6440_GPIO_B),
> + =C2=A0 =C2=A0 =C2=A0 S5P6440_GPIO_F_START =3D S5P6440_GPIO_NEXT(S5P=
6440_GPIO_C),
> + =C2=A0 =C2=A0 =C2=A0 S5P6440_GPIO_G_START =3D S5P6440_GPIO_NEXT(S5P=
6440_GPIO_F),
> + =C2=A0 =C2=A0 =C2=A0 S5P6440_GPIO_H_START =3D S5P6440_GPIO_NEXT(S5P=
6440_GPIO_G),
> + =C2=A0 =C2=A0 =C2=A0 S5P6440_GPIO_I_START =3D S5P6440_GPIO_NEXT(S5P=
6440_GPIO_H),
> + =C2=A0 =C2=A0 =C2=A0 S5P6440_GPIO_J_START =3D S5P6440_GPIO_NEXT(S5P=
6440_GPIO_I),
> + =C2=A0 =C2=A0 =C2=A0 S5P6440_GPIO_N_START =3D S5P6440_GPIO_NEXT(S5P=
6440_GPIO_J),
> + =C2=A0 =C2=A0 =C2=A0 S5P6440_GPIO_P_START =3D S5P6440_GPIO_NEXT(S5P=
6440_GPIO_N),
> + =C2=A0 =C2=A0 =C2=A0 S5P6440_GPIO_R_START =3D S5P6440_GPIO_NEXT(S5P=
6440_GPIO_P),
> +};
> +
> +/* S5P6440 GPIO number definitions. */
> +#define S5P6440_GPA(_nr) =C2=A0 =C2=A0 =C2=A0 (S5P6440_GPIO_A_START =
+ (_nr))
> +#define S5P6440_GPB(_nr) =C2=A0 =C2=A0 =C2=A0 (S5P6440_GPIO_B_START =
+ (_nr))
> +#define S5P6440_GPC(_nr) =C2=A0 =C2=A0 =C2=A0 (S5P6440_GPIO_C_START =
+ (_nr))
> +#define S5P6440_GPF(_nr) =C2=A0 =C2=A0 =C2=A0 (S5P6440_GPIO_F_START =
+ (_nr))
> +#define S5P6440_GPG(_nr) =C2=A0 =C2=A0 =C2=A0 (S5P6440_GPIO_G_START =
+ (_nr))
> +#define S5P6440_GPH(_nr) =C2=A0 =C2=A0 =C2=A0 (S5P6440_GPIO_H_START =
+ (_nr))
> +#define S5P6440_GPI(_nr) =C2=A0 =C2=A0 =C2=A0 (S5P6440_GPIO_I_START =
+ (_nr))
> +#define S5P6440_GPJ(_nr) =C2=A0 =C2=A0 =C2=A0 (S5P6440_GPIO_J_START =
+ (_nr))
> +#define S5P6440_GPN(_nr) =C2=A0 =C2=A0 =C2=A0 (S5P6440_GPIO_N_START =
+ (_nr))
> +#define S5P6440_GPP(_nr) =C2=A0 =C2=A0 =C2=A0 (S5P6440_GPIO_P_START =
+ (_nr))
> +#define S5P6440_GPR(_nr) =C2=A0 =C2=A0 =C2=A0 (S5P6440_GPIO_R_START =
+ (_nr))
> +
> +/* the end of the S5P6440 specific gpios */
> +#define S5P6440_GPIO_END =C2=A0 =C2=A0 =C2=A0 (S5P6440_GPR(S5P6440_G=
PIO_R_NR) + 1)
> +#define S3C_GPIO_END =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P6440_GPIO=
_END
> +
> +/* define the number of gpios we need to the one after the GPR() ran=
ge */
> +#define ARCH_NR_GPIOS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(S5P6440_GPR=
(S5P6440_GPIO_R_NR) + 1)
> +
> +#include <asm-generic/gpio.h>
> +
> +#endif /* __ASM_ARCH_GPIO_H */
> diff --git a/arch/arm/mach-s5p6440/include/mach/hardware.h b/arch/arm=
/mach-s5p6440/include/mach/hardware.h
> new file mode 100644
> index 0000000..9d3f9eb
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/include/mach/hardware.h
> @@ -0,0 +1,18 @@
> +/* linux/arch/arm/mach-s5p6440/include/mach/hardware.h
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * S5P6440 - Hardware support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_HARDWARE_H
> +#define __ASM_ARCH_HARDWARE_H __FILE__
> +
> +/* currently nothing here, placeholder */
> +
> +#endif /* __ASM_ARCH_HARDWARE_H */
> diff --git a/arch/arm/mach-s5p6440/include/mach/idle.h b/arch/arm/mac=
h-s5p6440/include/mach/idle.h
> new file mode 100644
> index 0000000..1d012a1
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/include/mach/idle.h
> @@ -0,0 +1,23 @@
> +/* linux/arch/arm/mach-s5p6440/include/mach/idle.h
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * S5P6440 - Idle support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_IDLE_H
> +#define __ASM_ARCH_IDLE_H __FILE__
> +
> +/*
> + * This allows the over-ride of the default idle code, in case there
> + * is any other things to be done over idle (like DVS)
> +*/
> +extern void (*s5p6440_idle_fn)(void);
> +extern void s5p6440_default_idle(void);
> +
> +#endif /* __ASM_ARCH_IDLE_H */
> diff --git a/arch/arm/mach-s5p6440/include/mach/map.h b/arch/arm/mach=
-s5p6440/include/mach/map.h
> new file mode 100644
> index 0000000..ac6b07c
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/include/mach/map.h
> @@ -0,0 +1,100 @@
> +/* linux/arch/arm/mach-s5p6440/include/mach/map.h
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * S5P6440 - Memory map definitions
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_MAP_H
> +#define __ASM_ARCH_MAP_H __FILE__
> +
> +#include <plat/map-base.h>
> +
> +/* SYSCON */
> +#define S5P6440_PA_SYSCON =C2=A0 =C2=A0 =C2=A0(0xE0100000)
> +#define S5P_PA_SYSCON =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5P6440_PA_S=
YSCON
> +#define S5P_VA_SYSCON =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C_VA_SYS
> +
> +#define S5P6440_PA_CLK =C2=A0 =C2=A0 =C2=A0 =C2=A0 (S5P6440_PA_SYSCO=
N + 0x0)
> +#define S5P_PA_CLK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P6440=
_PA_CLK
> +#define S5P_VA_CLK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (S5P_VA=
_SYSCON + 0x0)
> +
> +#define S5P6440_PA_OTHER =C2=A0 =C2=A0 =C2=A0 (S5P6440_PA_SYSCON + 0=
x100)
> +#define S5P_PA_OTHER =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P6440_PA_O=
THER
> +#define S5P_VA_OTHER =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (S5P_VA_SYSC=
ON + 0x100)
> +
> +#define S5P6440_PA_PWR =C2=A0 =C2=A0 =C2=A0 =C2=A0 (S5P6440_PA_SYSCO=
N + 0x800)
> +#define S5P_PA_PWR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P6440=
_PA_PWR
> +#define S5P_VA_PWR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (S5P_VA=
_SYSCON + 0x800)
> +
> +/* GPIO */
> +#define S5P6440_PA_GPIO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0xE0308000)
> +#define S5P_PA_GPIO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5P6440=
_PA_GPIO
> +#define S5P_VA_GPIO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C_ADD=
R(0x00500000)
> +
> +/* VIC0 */
> +#define S5P6440_PA_VIC0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0xE4000000)
> +#define S5P_PA_VIC0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5P6440=
_PA_VIC0
> +#define S5P_VA_VIC0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(S3C_VA=
_IRQ + 0x0)
> +
> +/* VIC1 */
> +#define S5P6440_PA_VIC1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0xE4100000)
> +#define S5P_PA_VIC1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5P6440=
_PA_VIC1
> +#define S5P_VA_VIC1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(S3C_VA=
_IRQ + 0x10000)
> +
> +/* Timer */
> +#define S5P6440_PA_TIMER =C2=A0 =C2=A0 =C2=A0 (0xEA000000)
> +#define S5P_PA_TIMER =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P6440_PA_T=
IMER
> +#define S5P_VA_TIMER =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S3C_VA_TIMER
> +
> +/* RTC */
> +#define S5P6440_PA_RTC =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0xEA100000)
> +#define S5P_PA_RTC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P6440=
_PA_RTC
> +#define S5P_VA_RTC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S3C_ADD=
R(0x00600000)
> +
> +/* WDT */
> +#define S5P6440_PA_WDT =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0xEA200000)
> +#define S5P_PA_WDT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P6440=
_PA_WDT
> +#define S5p_VA_WDT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S3C_VA_=
WATCHDOG
> +
> +/* UART */
> +#define S5P6440_PA_UART =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0xEC000000)
> +#define S5P_PA_UART =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5P6440=
_PA_UART
> +#define S5P_VA_UART =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C_VA_=
UART
> +
> +#define S5P_PA_UART0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (S5P_PA_UART=
 + 0x0)
> +#define S5P_PA_UART1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (S5P_PA_UART=
 + 0x400)
> +#define S5P_PA_UART2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (S5P_PA_UART=
 + 0x800)
> +#define S5P_PA_UART3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (S5P_PA_UART=
 + 0xC00)
> +#define S5P_UART_OFFSET =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x400)
> +
> +#define S5P_VA_UARTx(x) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(S5P_VA_UART + (S5P_PA_UART & 0xfffff) \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + ((x) * S5P_UART_OFFSET))
> +
> +#define S5P_VA_UART0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P_VA_UARTx=
(0)
> +#define S5P_VA_UART1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P_VA_UARTx=
(1)
> +#define S5P_VA_UART2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P_VA_UARTx=
(2)
> +#define S5P_VA_UART3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P_VA_UARTx=
(3)
> +#define S5P_SZ_UART =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SZ_256
> +
> +/* I2C */
> +#define S5P6440_PA_IIC0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0xEC104000)
> +#define S5P_PA_IIC0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5P6440=
_PA_IIC0
> +#define S5p_VA_IIC0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S3C_ADD=
R(0x00700000)
> +
> +/* SDRAM */
> +#define S5P6440_PA_SDRAM =C2=A0 =C2=A0 =C2=A0 (0x20000000)
> +#define S5P_PA_SDRAM =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P6440_PA_S=
DRAM
> +
> +/* compatibiltiy defines. */
> +#define S3C_PA_UART =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S5P_PA_=
UART
> +#define S3C_UART_OFFSET =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0S5P_UART_OFFSET
> +#define S3C_PA_TIMER =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P_PA_TIMER
> +#define S3C_PA_IIC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S5P_PA_=
IIC0
> +
> +#endif /* __ASM_ARCH_MAP_H */
> diff --git a/arch/arm/mach-s5p6440/include/mach/memory.h b/arch/arm/m=
ach-s5p6440/include/mach/memory.h
> new file mode 100644
> index 0000000..f0666a3
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/include/mach/memory.h
> @@ -0,0 +1,22 @@
> +/* linux/arch/arm/mach-s5p6440/include/mach/memory.h
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * S5P6440 - Memory definitions
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_MEMORY_H
> +#define __ASM_ARCH_MEMORY_H
> +
> +#define PHYS_OFFSET =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UL(0x20=
000000)
> +#define CONSISTENT_DMA_SIZE =C2=A0 =C2=A0SZ_8M
> +
> +#define __virt_to_bus(x) =C2=A0 =C2=A0 =C2=A0 __virt_to_phys(x)
> +#define __bus_to_virt(x) =C2=A0 =C2=A0 =C2=A0 __phys_to_virt(x)
> +
> +#endif /* __ASM_ARCH_MEMORY_H */
> diff --git a/arch/arm/mach-s5p6440/include/mach/system.h b/arch/arm/m=
ach-s5p6440/include/mach/system.h
> new file mode 100644
> index 0000000..2ec9618
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/include/mach/system.h
> @@ -0,0 +1,40 @@
> +/* linux/arch/arm/mach-s5p6440/include/mach/system.h
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * S5P6440 - system implementation
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_SYSTEM_H
> +#define __ASM_ARCH_SYSTEM_H __FILE__
> +
> +#include <linux/io.h>
> +#include <mach/map.h>
> +
> +void (*s5p6440_idle_fn)(void);
> +void (*s5p6440_reset_hook_fn)(void);
> +
> +void s5p6440_default_idle(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 /* nothing here yet */
> +}
> +
> +static void arch_idle(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 if (s5p6440_idle_fn !=3D NULL)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (s5p6440_idle_fn)(=
);
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s5p6440_default_id=
le();
> +}
> +
> +static void arch_reset(char mode, const char *cmd)
> +{
> + =C2=A0 =C2=A0 =C2=A0 /* nothing here yet */
> +}
> +
> +#endif /* __ASM_ARCH_SYSTEM_H */
> diff --git a/arch/arm/mach-s5p6440/include/mach/uncompress.h b/arch/a=
rm/mach-s5p6440/include/mach/uncompress.h
> new file mode 100644
> index 0000000..42e6694
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/include/mach/uncompress.h
> @@ -0,0 +1,24 @@
> +/* linux/arch/arm/mach-s5p6440/include/mach/uncompress.h
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * S5P6440 - uncompress code
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_UNCOMPRESS_H
> +#define __ASM_ARCH_UNCOMPRESS_H
> +
> +#include <mach/map.h>
> +#include <plat/uncompress.h>
> +
> +static void arch_detect_cpu(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 /* we do not need to do any cpu detection here=
 at the moment. */
> +}
> +
> +#endif /* __ASM_ARCH_UNCOMPRESS_H */
> diff --git a/arch/arm/plat-s3c/include/plat/cpu.h b/arch/arm/plat-s3c=
/include/plat/cpu.h
> index fbc3d49..3aa53f0 100644
> --- a/arch/arm/plat-s3c/include/plat/cpu.h
> +++ b/arch/arm/plat-s3c/include/plat/cpu.h
> @@ -45,9 +45,11 @@ extern void s3c_init_cpu(unsigned long idcode,
>
> =C2=A0extern void s3c24xx_init_irq(void);
> =C2=A0extern void s3c64xx_init_irq(u32 vic0, u32 vic1);
> +extern void s5p_init_irq(u32 *vic, u32 num_vic);
>
> =C2=A0extern void s3c24xx_init_io(struct map_desc *mach_desc, int siz=
e);
> =C2=A0extern void s3c64xx_init_io(struct map_desc *mach_desc, int siz=
e);
> +extern void s5p_init_io(struct map_desc *mach_desc, int size);
>
> =C2=A0extern void s3c24xx_init_uarts(struct s3c2410_uartcfg *cfg, int=
 no);
>
> diff --git a/arch/arm/plat-s5p/cpu.c b/arch/arm/plat-s5p/cpu.c
> new file mode 100644
> index 0000000..007d1a5
> --- /dev/null
> +++ b/arch/arm/plat-s5p/cpu.c
> @@ -0,0 +1,88 @@
> +/* linux/arch/arm/plat-s5p/cpu.c
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * S5P CPU Support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <mach/map.h>
> +#include <asm/mach/arch.h>
> +#include <asm/mach/map.h>
> +#include <mach/regs-clock.h>
> +#include <plat/cpu.h>
> +#include <plat/s5p6440.h>
> +
> +/* table of supported CPUs */
> +
> +static const char name_s5p6440[] =3D "S5P6440";
> +
> +static struct cpu_table cpu_ids[] __initdata =3D {
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .idcode =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 0x56440100,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .idmask =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 0xffffff00,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .map_io =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D s5p6440_map_io,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .init_clocks =C2=A0=
 =C2=A0=3D s5p6440_init_clocks,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .init_uarts =C2=A0=
 =C2=A0 =3D s5p6440_init_uarts,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .init =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D s5p6440_init,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D name_s5p6440,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +/* minimal IO mapping */
> +
> +#define UART_OFFS (S5P_PA_UART & 0xfffff)
> +
> +static struct map_desc s5p_iodesc[] __initdata =3D {
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virtual =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D (unsigned long)S5P_VA_SYSCON,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pfn =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D __phys_to_pfn(S5P_PA_SYSCON),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .length =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D SZ_4K,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D MT_DEVICE,
> + =C2=A0 =C2=A0 =C2=A0 }, {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virtual =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D (unsigned long)(S5P_VA_UART + UART_OFFS),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pfn =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D __phys_to_pfn(S5P_PA_UART),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .length =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D SZ_4K,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D MT_DEVICE,
> + =C2=A0 =C2=A0 =C2=A0 }, {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virtual =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D (unsigned long)S5P_VA_VIC0,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pfn =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D __phys_to_pfn(S5P_PA_VIC0),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .length =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D SZ_16K,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D MT_DEVICE,
> + =C2=A0 =C2=A0 =C2=A0 }, {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virtual =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D (unsigned long)S5P_VA_VIC1,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pfn =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D __phys_to_pfn(S5P_PA_VIC1),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .length =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D SZ_16K,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D MT_DEVICE,
> + =C2=A0 =C2=A0 =C2=A0 }, {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virtual =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D (unsigned long)S5P_VA_TIMER,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pfn =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D __phys_to_pfn(S5P_PA_TIMER),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .length =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D SZ_16K,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D MT_DEVICE,
> + =C2=A0 =C2=A0 =C2=A0 }, {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virtual =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D (unsigned long)S5P_VA_GPIO,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pfn =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D __phys_to_pfn(S5P_PA_GPIO),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .length =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D SZ_4K,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D MT_DEVICE,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +/* read cpu identification code */
> +
> +void __init s5p_init_io(struct map_desc *mach_desc, int size)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned long idcode;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* initialize the io descriptors we need for i=
nitialization */
> + =C2=A0 =C2=A0 =C2=A0 iotable_init(s5p_iodesc, ARRAY_SIZE(s5p_iodesc=
));
> + =C2=A0 =C2=A0 =C2=A0 iotable_init(mach_desc, size);
> +
> + =C2=A0 =C2=A0 =C2=A0 idcode =3D __raw_readl(S5P_SYS_ID);
> + =C2=A0 =C2=A0 =C2=A0 s3c_init_cpu(idcode, cpu_ids, ARRAY_SIZE(cpu_i=
ds));
> +}
> diff --git a/arch/arm/plat-s5p/include/plat/s5p6440.h b/arch/arm/plat=
-s5p/include/plat/s5p6440.h
> new file mode 100644
> index 0000000..dfda4b2
> --- /dev/null
> +++ b/arch/arm/plat-s5p/include/plat/s5p6440.h
> @@ -0,0 +1,33 @@
> +/* arch/arm/plat-s5p/include/plat/s5p6440.h
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * Header file for s5p6440 cpu support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> + /* Common init code for S5P6440 related SoCs */
> +
> +extern void s5p6440_common_init_uarts(struct s3c2410_uartcfg *cfg, i=
nt no);
> +extern void s5p6440_register_clocks(void);
> +extern void s5p6440_setup_clocks(void);
> +
> +#ifdef CONFIG_CPU_S5P6440
> +
> +extern =C2=A0int s5p6440_init(void);
> +extern void s5p6440_init_irq(void);
> +extern void s5p6440_map_io(void);
> +extern void s5p6440_init_clocks(int xtal);
> +
> +#define s5p6440_init_uarts s5p6440_common_init_uarts
> +
> +#else
> +#define s5p6440_init_clocks NULL
> +#define s5p6440_init_uarts NULL
> +#define s5p6440_map_io NULL
> +#define s5p6440_init NULL
> +#endif
> diff --git a/arch/arm/plat-s5p/s5p6440-init.c b/arch/arm/plat-s5p/s5p=
6440-init.c
> new file mode 100644
> index 0000000..36f004e
> --- /dev/null
> +++ b/arch/arm/plat-s5p/s5p6440-init.c
> @@ -0,0 +1,23 @@
> +/* linux/arch/arm/plat-s5p/s5p6440-init.c
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/init.h>
> +
> +#include <plat/cpu.h>
> +#include <plat/devs.h>
> +#include <plat/s5p6440.h>
> +
> +/* uart registration process */
> +void __init s5p6440_common_init_uarts(struct s3c2410_uartcfg *cfg, i=
nt no)
> +{
> + =C2=A0 =C2=A0 =C2=A0 s3c24xx_init_uartdevs("s3c6400-uart", s5p_uart=
_resources, cfg, no);
> +}
> diff --git a/arch/arm/plat-s5p/setup-i2c0.c b/arch/arm/plat-s5p/setup=
-i2c0.c
> new file mode 100644
> index 0000000..c913377
> --- /dev/null
> +++ b/arch/arm/plat-s5p/setup-i2c0.c
> @@ -0,0 +1,23 @@
> +/* linux/arch/arm/plat-s5p/setup-i2c0.c
> + *
> + * Copyright (c) 2009 Samsung Electronics
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> + * I2C0 GPIO configuration.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +
> +struct platform_device; /* don't need the contents */
> +
> +#include <plat/iic.h>
> +
> +void s3c_i2c0_cfg_gpio(struct platform_device *dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 /* Will be populated later */
> +}
Perhaps arch/arm/plat-s5p/Makefile shud be in this patch, rather than
the first one.
Otherwise, you enable compilation before having the code.

Also, we need to look at the order of defining and using functions in
patches in wrong order.
Though, it wud be okay if we don't consider patch atomicity.
