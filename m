From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 01/10] ARM: S5PV210: Add Samsung S5PV210 CPU support
Date: Wed, 20 Jan 2010 12:18:21 +0900
Message-ID: <9c9fda241001191918h17eb2ff2ma7698de689ef91bd@mail.gmail.com>
References: <1263868047-30646-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.25]:52980 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754803Ab0ATDSX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jan 2010 22:18:23 -0500
Received: by qw-out-2122.google.com with SMTP id 3so1101310qwe.37
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Jan 2010 19:18:22 -0800 (PST)
In-Reply-To: <1263868047-30646-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Jan 19, 2010 at 11:27 AM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> This patch adds support for Samsung S5PV210 CPU. This patch also adds
> an entry for S5PV210 cpu in plat-s5p cpu table.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5pv210/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0126 +++++++++++++++++++++
> =A0arch/arm/mach-s5pv210/include/mach/debug-macro.S | =A0 39 +++++++
> =A0arch/arm/mach-s5pv210/include/mach/entry-macro.S | =A0 54 ++++++++=
+
> =A0arch/arm/mach-s5pv210/include/mach/gpio-core.h =A0 | =A0 19 +++
> =A0arch/arm/mach-s5pv210/include/mach/gpio.h =A0 =A0 =A0 =A0| =A0129 =
++++++++++++++++++++++
> =A0arch/arm/mach-s5pv210/include/mach/hardware.h =A0 =A0| =A0 18 +++
> =A0arch/arm/mach-s5pv210/include/mach/map.h =A0 =A0 =A0 =A0 | =A0102 =
+++++++++++++++++
> =A0arch/arm/mach-s5pv210/include/mach/memory.h =A0 =A0 =A0| =A0 20 ++=
++
> =A0arch/arm/mach-s5pv210/include/mach/system.h =A0 =A0 =A0| =A0 26 ++=
+++
> =A0arch/arm/mach-s5pv210/include/mach/uncompress.h =A0| =A0 24 ++++
> =A0arch/arm/plat-s5p/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 15 +++
> =A0arch/arm/plat-s5p/include/plat/s5pv210.h =A0 =A0 =A0 =A0 | =A0 37 =
++++++
> =A0arch/arm/plat-s5p/s5pv210-init.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 44 ++++++++
> =A013 files changed, 653 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-s5pv210/cpu.c
> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/debug-macro.=
S
> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/entry-macro.=
S
> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/gpio-core.h
> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/gpio.h
> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/hardware.h
> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/map.h
> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/memory.h
> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/system.h
> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/uncompress.h
> =A0create mode 100644 arch/arm/plat-s5p/include/plat/s5pv210.h
> =A0create mode 100644 arch/arm/plat-s5p/s5pv210-init.c
>
> diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.=
c
> new file mode 100644
> index 0000000..778d2dc
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/cpu.c
> @@ -0,0 +1,126 @@
> +/* linux/arch/arm/mach-s5pv210/cpu.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
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
> +#include <linux/module.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/sysdev.h>
> +#include <linux/platform_device.h>
> +
> +#include <asm/mach/arch.h>
> +#include <asm/mach/map.h>
> +#include <asm/mach/irq.h>
> +
> +#include <asm/proc-fns.h>
> +#include <mach/map.h>
> +#include <mach/regs-clock.h>
> +
> +#include <plat/cpu.h>
> +#include <plat/devs.h>
> +#include <plat/clock.h>
> +#include <plat/s5pv210.h>
> +
> +/* Initial IO mappings */
> +
> +static struct map_desc s5pv210_iodesc[] __initdata =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_SYSTIMER,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P_PA_SYSTIMER),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_1M,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_VIC2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P_PA_VIC2),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_16K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_VIC3,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P_PA_VIC3),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_16K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_SROMC,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P_PA_SROMC),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }
> +};
> +
> +static void s5pv210_idle(void)
> +{
> + =A0 =A0 =A0 if (!need_resched())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu_do_idle();
> +
> + =A0 =A0 =A0 local_irq_enable();
> +}
> +
> +/* s5pv210_map_io
> + *
> + * register the standard cpu IO areas
> +*/
> +
> +void __init s5pv210_map_io(void)
> +{
> + =A0 =A0 =A0 iotable_init(s5pv210_iodesc, ARRAY_SIZE(s5pv210_iodesc)=
);
> +}
> +
> +void __init s5pv210_init_clocks(int xtal)
> +{
> + =A0 =A0 =A0 printk(KERN_DEBUG "%s: initializing clocks\n", __func__=
);
> +
> + =A0 =A0 =A0 s3c24xx_register_baseclocks(xtal);
> + =A0 =A0 =A0 s5p_register_clocks(xtal);
> + =A0 =A0 =A0 s5pv210_register_clocks();
> + =A0 =A0 =A0 s5pv210_setup_clocks();
> +}
> +
> +void __init s5pv210_init_irq(void)
> +{
> + =A0 =A0 =A0 u32 vic[4]; =A0 =A0 /* S5PV210 supports 4 VIC */
> +
> + =A0 =A0 =A0 /* All the VICs are fully populated. */
> + =A0 =A0 =A0 vic[0] =3D ~0;
> + =A0 =A0 =A0 vic[1] =3D ~0;
> + =A0 =A0 =A0 vic[2] =3D ~0;
> + =A0 =A0 =A0 vic[3] =3D ~0;
> +
> + =A0 =A0 =A0 s5p_init_irq(vic, ARRAY_SIZE(vic));
> +}
> +
> +static struct sysdev_class s5pv210_sysclass =3D {
> + =A0 =A0 =A0 .name =A0 =3D "s5pv210-core",
> +};
> +
> +static struct sys_device s5pv210_sysdev =3D {
> + =A0 =A0 =A0 .cls =A0 =A0=3D &s5pv210_sysclass,
> +};
> +
> +static int __init s5pv210_core_init(void)
> +{
> + =A0 =A0 =A0 return sysdev_class_register(&s5pv210_sysclass);
> +}
> +
> +core_initcall(s5pv210_core_init);
> +
> +int __init s5pv210_init(void)
> +{
> + =A0 =A0 =A0 printk(KERN_INFO "S5PV210: Initializing architecture\n"=
);
> +
> + =A0 =A0 =A0 /* set idle function */
> + =A0 =A0 =A0 pm_idle =3D s5pv210_idle;
> +
> + =A0 =A0 =A0 return sysdev_register(&s5pv210_sysdev);
> +}
> diff --git a/arch/arm/mach-s5pv210/include/mach/debug-macro.S b/arch/=
arm/mach-s5pv210/include/mach/debug-macro.S
> new file mode 100644
> index 0000000..3c568a3
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/include/mach/debug-macro.S
> @@ -0,0 +1,39 @@
> +/* linux/arch/arm/mach-s5pv210/include/mach/debug-macro.S
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * Based on arch/arm/mach-s3c6400/include/mach/debug-macro.S
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
> + =A0 =A0 =A0 /* note, for the boot process to work we have to keep t=
he UART
> + =A0 =A0 =A0 =A0* virtual address aligned to an 1MiB boundary for th=
e L1
> + =A0 =A0 =A0 =A0* mapping the head code makes. We keep the UART virt=
ual address
> + =A0 =A0 =A0 =A0* aligned and add in the offset when we load the val=
ue here.
> + =A0 =A0 =A0 =A0*/
> +
> + =A0 =A0 =A0 .macro addruart, rx
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrc =A0 =A0 p15, 0, \rx, c1, c0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tst =A0 =A0 \rx, #1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldreq =A0 \rx, =3D S5P_PA_UART
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldrne =A0 \rx, =3D (S5P_VA_UART + S5P_P=
A_UART & 0xfffff)
> +#if CONFIG_DEBUG_S3C_UART !=3D 0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 add =A0 =A0 \rx, \rx, #(0x400 * CONFIG_=
DEBUG_S3C_UART)
> +#endif
> + =A0 =A0 =A0 .endm
> +
> +/* include the reset of the code which will do the work, we're only
> + * compiling for a single cpu processor type so the default of s3c24=
40
> + * will be fine with us.
> + */
> +
> +#include <plat/debug-macro.S>
> diff --git a/arch/arm/mach-s5pv210/include/mach/entry-macro.S b/arch/=
arm/mach-s5pv210/include/mach/entry-macro.S
> new file mode 100644
> index 0000000..503c1ec
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/include/mach/entry-macro.S
> @@ -0,0 +1,54 @@
> +/* linux/arch/arm/mach-s5pv210/include/mach/entry-macro.S
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * Low-level IRQ helper macros for the Samsung S5PV210
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
> + =A0 =A0 =A0 .macro =A0disable_fiq
> + =A0 =A0 =A0 .endm
> +
> + =A0 =A0 =A0 .macro =A0get_irqnr_preamble, base, tmp
> + =A0 =A0 =A0 ldr =A0 =A0 \base, =3DS5P_VA_VIC0
> + =A0 =A0 =A0 .endm
> +
> + =A0 =A0 =A0 .macro =A0arch_ret_to_user, tmp1, tmp2
> + =A0 =A0 =A0 .endm
> +
> + =A0 =A0 =A0 .macro =A0get_irqnr_and_base, irqnr, irqstat, base, tmp
> +
> + =A0 =A0 =A0 @ check the vic0
> + =A0 =A0 =A0 mov =A0 =A0 \irqnr, # S5P_IRQ_OFFSET + 31
> + =A0 =A0 =A0 ldr =A0 =A0 \irqstat, [ \base, # VIC_IRQ_STATUS ]
> + =A0 =A0 =A0 teq =A0 =A0 \irqstat, #0
> +
> + =A0 =A0 =A0 @ otherwise try vic1
> + =A0 =A0 =A0 addeq =A0 \tmp, \base, #(S5P_VA_VIC1 - S5P_VA_VIC0)
> + =A0 =A0 =A0 addeq =A0 \irqnr, \irqnr, #32
> + =A0 =A0 =A0 ldreq =A0 \irqstat, [ \tmp, # VIC_IRQ_STATUS ]
> + =A0 =A0 =A0 teqeq =A0 \irqstat, #0
> +
> + =A0 =A0 =A0 @ otherwise try vic2
> + =A0 =A0 =A0 addeq =A0 \tmp, \base, #(S5P_VA_VIC2 - S5P_VA_VIC0)
> + =A0 =A0 =A0 addeq =A0 \irqnr, \irqnr, #32
> + =A0 =A0 =A0 ldreq =A0 \irqstat, [ \tmp, # VIC_IRQ_STATUS ]
> + =A0 =A0 =A0 teqeq =A0 \irqstat, #0
> +
> + =A0 =A0 =A0 @ otherwise try vic3
> + =A0 =A0 =A0 addeq =A0 \tmp, \base, #(S5P_VA_VIC3 - S5P_VA_VIC0)
> + =A0 =A0 =A0 addeq =A0 \irqnr, \irqnr, #32
> + =A0 =A0 =A0 ldreq =A0 \irqstat, [ \tmp, # VIC_IRQ_STATUS ]
> + =A0 =A0 =A0 teqeq =A0 \irqstat, #0
> +
> + =A0 =A0 =A0 clzne =A0 \irqstat, \irqstat
> + =A0 =A0 =A0 subne =A0 \irqnr, \irqnr, \irqstat
> + =A0 =A0 =A0 .endm
> diff --git a/arch/arm/mach-s5pv210/include/mach/gpio-core.h b/arch/ar=
m/mach-s5pv210/include/mach/gpio-core.h
> new file mode 100644
> index 0000000..acb6a1e
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/include/mach/gpio-core.h
> @@ -0,0 +1,19 @@
> +/* linux/arch/arm/mach-s5pv210/include/mach/gpio-core.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV210 - GPIO core support
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
> diff --git a/arch/arm/mach-s5pv210/include/mach/gpio.h b/arch/arm/mac=
h-s5pv210/include/mach/gpio.h
> new file mode 100644
> index 0000000..533b020
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/include/mach/gpio.h
> @@ -0,0 +1,129 @@
> +/* linux/arch/arm/mach-s5pv210/include/mach/gpio.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV210 - GPIO lib support
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
> +#define gpio_cansleep =A0__gpio_cansleep
> +#define gpio_to_irq =A0 =A0__gpio_to_irq
> +
> +/* GPIO bank sizes */
> +#define S5PV210_GPIO_A0_NR =A0 =A0 (8)
> +#define S5PV210_GPIO_A1_NR =A0 =A0 (4)
> +#define S5PV210_GPIO_B_NR =A0 =A0 =A0(8)
> +#define S5PV210_GPIO_C0_NR =A0 =A0 (5)
> +#define S5PV210_GPIO_C1_NR =A0 =A0 (5)
> +#define S5PV210_GPIO_D0_NR =A0 =A0 (4)
> +#define S5PV210_GPIO_D1_NR =A0 =A0 (6)
> +#define S5PV210_GPIO_E0_NR =A0 =A0 (8)
> +#define S5PV210_GPIO_E1_NR =A0 =A0 (5)
> +#define S5PV210_GPIO_F0_NR =A0 =A0 (8)
> +#define S5PV210_GPIO_F1_NR =A0 =A0 (8)
> +#define S5PV210_GPIO_F2_NR =A0 =A0 (8)
> +#define S5PV210_GPIO_F3_NR =A0 =A0 (6)
> +#define S5PV210_GPIO_G0_NR =A0 =A0 (7)
> +#define S5PV210_GPIO_G1_NR =A0 =A0 (7)
> +#define S5PV210_GPIO_G2_NR =A0 =A0 (7)
> +#define S5PV210_GPIO_G3_NR =A0 =A0 (7)
> +#define S5PV210_GPIO_H0_NR =A0 =A0 (8)
> +#define S5PV210_GPIO_H1_NR =A0 =A0 (8)
> +#define S5PV210_GPIO_H2_NR =A0 =A0 (8)
> +#define S5PV210_GPIO_H3_NR =A0 =A0 (8)
> +#define S5PV210_GPIO_I_NR =A0 =A0 =A0(7)
> +#define S5PV210_GPIO_J0_NR =A0 =A0 (8)
> +#define S5PV210_GPIO_J1_NR =A0 =A0 (6)
> +#define S5PV210_GPIO_J2_NR =A0 =A0 (8)
> +#define S5PV210_GPIO_J3_NR =A0 =A0 (8)
> +#define S5PV210_GPIO_J4_NR =A0 =A0 (5)

Is there any reason to use the actual NR number? How about to define
it's all 8. why not?
E.g., this chip support only 7 at GPIO I. then when we set the 7th
bit. what's the matter?
This make a below macros are simple.

> +
> +/* GPIO bank numbers */
> +
> +/* CONFIG_S3C_GPIO_SPACE allows the user to select extra
> + * space for debugging purposes so that any accidental
> + * change from one gpio bank to another can be caught.
> +*/
> +
> +#define S5PV210_GPIO_NEXT(__gpio) \
> + =A0 =A0 =A0 ((__gpio##_START) + (__gpio##_NR) + CONFIG_S3C_GPIO_SPA=
CE + 1)
> +
> +enum s5p_gpio_number {
> + =A0 =A0 =A0 S5PV210_GPIO_A0_START =A0 =3D 0,
> + =A0 =A0 =A0 S5PV210_GPIO_A1_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_A0),
> + =A0 =A0 =A0 S5PV210_GPIO_B_START =A0 =A0=3D S5PV210_GPIO_NEXT(S5PV2=
10_GPIO_A1),
> + =A0 =A0 =A0 S5PV210_GPIO_C0_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_B),
> + =A0 =A0 =A0 S5PV210_GPIO_C1_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_C0),
> + =A0 =A0 =A0 S5PV210_GPIO_D0_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_C1),
> + =A0 =A0 =A0 S5PV210_GPIO_D1_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_D0),
> + =A0 =A0 =A0 S5PV210_GPIO_E0_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_D1),
> + =A0 =A0 =A0 S5PV210_GPIO_E1_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_E0),
> + =A0 =A0 =A0 S5PV210_GPIO_F0_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_E1),
> + =A0 =A0 =A0 S5PV210_GPIO_F1_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_F0),
> + =A0 =A0 =A0 S5PV210_GPIO_F2_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_F1),
> + =A0 =A0 =A0 S5PV210_GPIO_F3_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_F2),
> + =A0 =A0 =A0 S5PV210_GPIO_G0_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_F3),
> + =A0 =A0 =A0 S5PV210_GPIO_G1_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_G0),
> + =A0 =A0 =A0 S5PV210_GPIO_G2_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_G1),
> + =A0 =A0 =A0 S5PV210_GPIO_G3_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_G2),
> + =A0 =A0 =A0 S5PV210_GPIO_H0_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_G3),
> + =A0 =A0 =A0 S5PV210_GPIO_H1_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_H0),
> + =A0 =A0 =A0 S5PV210_GPIO_H2_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_H1),
> + =A0 =A0 =A0 S5PV210_GPIO_H3_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_H2),
> + =A0 =A0 =A0 S5PV210_GPIO_I_START =A0 =A0=3D S5PV210_GPIO_NEXT(S5PV2=
10_GPIO_H3),
> + =A0 =A0 =A0 S5PV210_GPIO_J0_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_I),
> + =A0 =A0 =A0 S5PV210_GPIO_J1_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_J0),
> + =A0 =A0 =A0 S5PV210_GPIO_J2_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_J1),
> + =A0 =A0 =A0 S5PV210_GPIO_J3_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_J2),
> + =A0 =A0 =A0 S5PV210_GPIO_J4_START =A0 =3D S5PV210_GPIO_NEXT(S5PV210=
_GPIO_J3),
> +};
> +
> +/* S5PV210 GPIO number definitions */
> +#define S5PV210_GPA0(_nr) =A0 =A0 =A0(S5PV210_GPIO_A0_START + (_nr))
> +#define S5PV210_GPA1(_nr) =A0 =A0 =A0(S5PV210_GPIO_A1_START + (_nr))
> +#define S5PV210_GPB(_nr) =A0 =A0 =A0 (S5PV210_GPIO_B_START + (_nr))
> +#define S5PV210_GPC0(_nr) =A0 =A0 =A0(S5PV210_GPIO_C0_START + (_nr))
> +#define S5PV210_GPC1(_nr) =A0 =A0 =A0(S5PV210_GPIO_C1_START + (_nr))
> +#define S5PV210_GPD0(_nr) =A0 =A0 =A0(S5PV210_GPIO_D0_START + (_nr))
> +#define S5PV210_GPD1(_nr) =A0 =A0 =A0(S5PV210_GPIO_D1_START + (_nr))
> +#define S5PV210_GPE0(_nr) =A0 =A0 =A0(S5PV210_GPIO_E0_START + (_nr))
> +#define S5PV210_GPE1(_nr) =A0 =A0 =A0(S5PV210_GPIO_E1_START + (_nr))
> +#define S5PV210_GPF0(_nr) =A0 =A0 =A0(S5PV210_GPIO_F0_START + (_nr))
> +#define S5PV210_GPF1(_nr) =A0 =A0 =A0(S5PV210_GPIO_F1_START + (_nr))
> +#define S5PV210_GPF2(_nr) =A0 =A0 =A0(S5PV210_GPIO_F2_START + (_nr))
> +#define S5PV210_GPF3(_nr) =A0 =A0 =A0(S5PV210_GPIO_F3_START + (_nr))
> +#define S5PV210_GPG0(_nr) =A0 =A0 =A0(S5PV210_GPIO_G0_START + (_nr))
> +#define S5PV210_GPG1(_nr) =A0 =A0 =A0(S5PV210_GPIO_G1_START + (_nr))
> +#define S5PV210_GPG2(_nr) =A0 =A0 =A0(S5PV210_GPIO_G2_START + (_nr))
> +#define S5PV210_GPG3(_nr) =A0 =A0 =A0(S5PV210_GPIO_G3_START + (_nr))
> +#define S5PV210_GPH0(_nr) =A0 =A0 =A0(S5PV210_GPIO_H0_START + (_nr))
> +#define S5PV210_GPH1(_nr) =A0 =A0 =A0(S5PV210_GPIO_H1_START + (_nr))
> +#define S5PV210_GPH2(_nr) =A0 =A0 =A0(S5PV210_GPIO_H2_START + (_nr))
> +#define S5PV210_GPH3(_nr) =A0 =A0 =A0(S5PV210_GPIO_H3_START + (_nr))
> +#define S5PV210_GPI(_nr) =A0 =A0 =A0 (S5PV210_GPIO_I_START + (_nr))
> +#define S5PV210_GPJ0(_nr) =A0 =A0 =A0(S5PV210_GPIO_J0_START + (_nr))
> +#define S5PV210_GPJ1(_nr) =A0 =A0 =A0(S5PV210_GPIO_J1_START + (_nr))
> +#define S5PV210_GPJ2(_nr) =A0 =A0 =A0(S5PV210_GPIO_J2_START + (_nr))
> +#define S5PV210_GPJ3(_nr) =A0 =A0 =A0(S5PV210_GPIO_J3_START + (_nr))
> +#define S5PV210_GPJ4(_nr) =A0 =A0 =A0(S5PV210_GPIO_J4_START + (_nr))
> +
> +/* the end of the S5PV210 specific gpios */
> +#define S5PV210_GPIO_END =A0 =A0 =A0 (S5PV210_GPJ4(S5PV210_GPIO_J4_N=
R) + 1)
> +#define S3C_GPIO_END =A0 =A0 =A0 =A0 =A0 S5PV210_GPIO_END
> +
> +/* define the number of gpios we need to the one after the GPJ4() ra=
nge */
> +#define ARCH_NR_GPIOS =A0 =A0 =A0 =A0 =A0(S5PV210_GPJ4(S5PV210_GPIO_=
J4_NR) + =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF=
IG_SAMSUNG_GPIO_EXTRA + 1)
> +
> +#include <asm-generic/gpio.h>
> +
> +#endif /* __ASM_ARCH_GPIO_H */
> diff --git a/arch/arm/mach-s5pv210/include/mach/hardware.h b/arch/arm=
/mach-s5pv210/include/mach/hardware.h
> new file mode 100644
> index 0000000..fada7a3
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/include/mach/hardware.h
> @@ -0,0 +1,18 @@
> +/* linux/arch/arm/mach-s5pv210/include/mach/hardware.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV210 - Hardware support
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
> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach=
-s5pv210/include/mach/map.h
> new file mode 100644
> index 0000000..dd5a811
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
> @@ -0,0 +1,102 @@
> +/* linux/arch/arm/mach-s5pv210/include/mach/map.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV210 - Memory map definitions
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
> +/* Chip ID */
> +#define S5PV210_PA_CHIPID =A0 =A0 =A0(0xE0000000)
> +#define S5P_PA_CHIPID =A0 =A0 =A0 =A0 =A0S5PV210_PA_CHIPID
> +#define S5P_VA_CHIPID =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x00700000)
> +
> +/* SYSCON */
> +#define S5PV210_PA_SYSCON =A0 =A0 =A0(0xE0100000)
> +#define S5P_PA_SYSCON =A0 =A0 =A0 =A0 =A0S5PV210_PA_SYSCON
> +#define S5P_VA_SYSCON =A0 =A0 =A0 =A0 =A0S3C_VA_SYS
> +
> +/* GPIO */
> +#define S5PV210_PA_GPIO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE0200000)
> +#define S5P_PA_GPIO =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_GPIO
> +#define S5P_VA_GPIO =A0 =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x00500000)
> +
> +/* I2C 0 */
> +#define S5PV210_PA_IIC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE1800000)
> +#define S5P_PA_IIC0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_IIC0
> +
> +/* Timer */
> +#define S5PV210_PA_TIMER =A0 =A0 =A0 (0xE2500000)
> +#define S5P_PA_TIMER =A0 =A0 =A0 =A0 =A0 S5PV210_PA_TIMER
> +#define S5P_VA_TIMER =A0 =A0 =A0 =A0 =A0 S3C_VA_TIMER
> +
> +/* SYSTEM TIMER */
> +#define S5PV210_PA_SYSTIMER =A0 =A0(0xE2600000)
> +#define S5P_PA_SYSTIMER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_SY=
STIMER
> +#define S5P_VA_SYSTIMER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x01=
200000)
> +
> +/* UART */
> +#define S5PV210_PA_UART =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xE2900000)
> +#define S5P_PA_UART =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_UART
> +#define S5P_VA_UART =A0 =A0 =A0 =A0 =A0 =A0S3C_VA_UART
> +
> +#define S5P_PA_UART0 =A0 =A0 =A0 =A0 =A0 (S5P_PA_UART + 0x0)
> +#define S5P_PA_UART1 =A0 =A0 =A0 =A0 =A0 (S5P_PA_UART + 0x400)
> +#define S5P_PA_UART2 =A0 =A0 =A0 =A0 =A0 (S5P_PA_UART + 0x800)
> +#define S5P_PA_UART3 =A0 =A0 =A0 =A0 =A0 (S5P_PA_UART + 0xC00)
> +#define S5P_UART_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x400)
> +
> +#define S5P_VA_UARTx(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_UART =
+ (S5P_PA_UART & 0xfffff) \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 + ((x) =
* S5P_UART_OFFSET))
> +
> +#define S5P_VA_UART0 =A0 =A0 =A0 =A0 =A0 S5P_VA_UARTx(0)
> +#define S5P_VA_UART1 =A0 =A0 =A0 =A0 =A0 S5P_VA_UARTx(1)
> +#define S5P_VA_UART2 =A0 =A0 =A0 =A0 =A0 S5P_VA_UARTx(2)
> +#define S5P_VA_UART3 =A0 =A0 =A0 =A0 =A0 S5P_VA_UARTx(3)
> +#define S5P_SZ_UART =A0 =A0 =A0 =A0 =A0 =A0SZ_256

Please remove unfamiliar x S5P_VA_UARTx -> S5P_VA_UART.

> +
> +/* SROMC */
> +#define S5PV210_PA_SROMC =A0 =A0 =A0 (0xE8000000)
> +#define S5P_PA_SROMC =A0 =A0 =A0 =A0 =A0 S5PV210_PA_SROMC
> +#define S5P_VA_SROMC =A0 =A0 =A0 =A0 =A0 S3C_ADDR(0x01100000)
> +
> +/* VIC 0 */
> +#define S5PV210_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2000000)
> +#define S5P_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_VIC0
> +#define S5P_VA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0(S3C_VA_IRQ + 0x0)
> +
> +/* VIC 1 */
> +#define S5PV210_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2100000)
> +#define S5P_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_VIC1
> +#define S5P_VA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0(S3C_VA_IRQ + 0x10000)
> +
> +/* VIC 2 */
> +#define S5PV210_PA_VIC2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2200000)
> +#define S5P_PA_VIC2 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_VIC2
> +#define S5P_VA_VIC2 =A0 =A0 =A0 =A0 =A0 =A0(S3C_VA_IRQ + 0x20000)
> +
> +/* VIC 3 */
> +#define S5PV210_PA_VIC3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2300000)
> +#define S5P_PA_VIC3 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_VIC3
> +#define S5P_VA_VIC3 =A0 =A0 =A0 =A0 =A0 =A0(S3C_VA_IRQ + 0x30000)
> +
> +/* SDRAM */
> +#define S5PV210_PA_SDRAM =A0 =A0 =A0 (0x20000000)
> +#define S5P_PA_SDRAM =A0 =A0 =A0 =A0 =A0 S5PV210_PA_SDRAM
> +
> +/* compatibiltiy defines. */
> +#define S3C_PA_UART =A0 =A0 =A0 =A0 =A0 =A0S5P_PA_UART
> +#define S3C_UART_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_UART_OFFS=
ET
> +#define S3C_PA_TIMER =A0 =A0 =A0 =A0 =A0 S5P_PA_TIMER
> +#define S3C_PA_IIC =A0 =A0 =A0 =A0 =A0 =A0 S5P_PA_IIC0
> +
> +#endif /* __ASM_ARCH_MAP_H */
> diff --git a/arch/arm/mach-s5pv210/include/mach/memory.h b/arch/arm/m=
ach-s5pv210/include/mach/memory.h
> new file mode 100644
> index 0000000..0f07793
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/include/mach/memory.h
> @@ -0,0 +1,20 @@
> +/* linux/arch/arm/mach-s5pv210/include/mach/memory.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV210 - Memory definitions
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
> +#define PHYS_OFFSET =A0 =A0 =A0 =A0 =A0 =A0UL(0x20000000)
> +#define CONSISTENT_DMA_SIZE =A0 =A0(SZ_8M + SZ_4M + SZ_2M)
> +#define NODE_MEM_SIZE_BITS =A0 =A0 28

Can you confirm the PHYS_OFFSET is right? At previous time LSI guided
that you should use the 0x3000'0000 for MFC issues. And please keep
the consistent If you commit this one. we have to change the our
environment from bootloader and kernel. Now we use the local kernel
and mainline.

Also how can you use if we got the 0x2000'0000 with 128MiB and
0x4000'0000 with 384MiB or 512MiB.
There's too much memory holes. Please don't say use the split the user
and kernel 2G/2G configuration
If we modify the base address, we can use above memory configuration
without any changes.

Thank you,
Kyungmin Park

> +
> +#endif /* __ASM_ARCH_MEMORY_H */
> diff --git a/arch/arm/mach-s5pv210/include/mach/system.h b/arch/arm/m=
ach-s5pv210/include/mach/system.h
> new file mode 100644
> index 0000000..1ca04d5
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/include/mach/system.h
> @@ -0,0 +1,26 @@
> +/* linux/arch/arm/mach-s5pv210/include/mach/system.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV210 - system support header
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
> +static void arch_idle(void)
> +{
> + =A0 =A0 =A0 /* nothing here yet */
> +}
> +
> +static void arch_reset(char mode, const char *cmd)
> +{
> + =A0 =A0 =A0 /* nothing here yet */
> +}
> +
> +#endif /* __ASM_ARCH_SYSTEM_H */
> diff --git a/arch/arm/mach-s5pv210/include/mach/uncompress.h b/arch/a=
rm/mach-s5pv210/include/mach/uncompress.h
> new file mode 100644
> index 0000000..08ff2fd
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/include/mach/uncompress.h
> @@ -0,0 +1,24 @@
> +/* linux/arch/arm/mach-s5pv210/include/mach/uncompress.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV210 - uncompress code
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
> + =A0 =A0 =A0 /* we do not need to do any cpu detection here at the m=
oment. */
> +}
> +
> +#endif /* __ASM_ARCH_UNCOMPRESS_H */
> diff --git a/arch/arm/plat-s5p/cpu.c b/arch/arm/plat-s5p/cpu.c
> index 0895a77..b322e4c 100644
> --- a/arch/arm/plat-s5p/cpu.c
> +++ b/arch/arm/plat-s5p/cpu.c
> @@ -18,10 +18,12 @@
> =A0#include <mach/regs-clock.h>
> =A0#include <plat/cpu.h>
> =A0#include <plat/s5p6440.h>
> +#include <plat/s5pv210.h>
>
> =A0/* table of supported CPUs */
>
> =A0static const char name_s5p6440[] =3D "S5P6440";
> +static const char name_s5pv210[] =3D "S5PV210/S5PC110";
>
> =A0static struct cpu_table cpu_ids[] __initdata =3D {
> =A0 =A0 =A0 =A0{
> @@ -32,6 +34,14 @@ static struct cpu_table cpu_ids[] __initdata =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.init_uarts =A0 =A0 =3D s5p6440_init_u=
arts,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.init =A0 =A0 =A0 =A0 =A0 =3D s5p6440_=
init,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D name_s5p=
6440,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .idcode =A0 =A0 =A0 =A0 =3D 0x43110000,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .idmask =A0 =A0 =A0 =A0 =3D 0xfffff000,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D s5pv210_map=
_io,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init_clocks =A0 =A0=3D s5pv210_init_cl=
ocks,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init_uarts =A0 =A0 =3D s5pv210_init_ua=
rts,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D s5pv210_i=
nit,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D name_s5pv=
210,
> =A0 =A0 =A0 =A0},
> =A0};
>
> @@ -41,6 +51,11 @@ static struct cpu_table cpu_ids[] __initdata =3D {
>
> =A0static struct map_desc s5p_iodesc[] __initdata =3D {
> =A0 =A0 =A0 =A0{
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_CHIPID,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5P_PA_CHIPID),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S5P_VA_SYSCON,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S5P_PA_SYSCON),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_64K,
> diff --git a/arch/arm/plat-s5p/include/plat/s5pv210.h b/arch/arm/plat=
-s5p/include/plat/s5pv210.h
> new file mode 100644
> index 0000000..db1399c
> --- /dev/null
> +++ b/arch/arm/plat-s5p/include/plat/s5pv210.h
> @@ -0,0 +1,37 @@
> +/* linux/arch/arm/plat-s5p/include/plat/s5pv210.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * Header file for s5pv210 cpu support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/* Common init code for S5PV210 related SoCs */
> +
> +extern void s5pv210_common_init_uarts(struct s3c2410_uartcfg *cfg, i=
nt no);
> +extern void s5pv210_register_clocks(void);
> +extern void s5pv210_setup_clocks(void);
> +
> +#ifdef CONFIG_CPU_S5PV210
> +
> +extern =A0int s5pv210_init(void);
> +extern void s5pv210_init_irq(void);
> +extern void s5pv210_map_io(void);
> +extern void s5pv210_init_clocks(int xtal);
> +
> +#define s5pv210_init_uarts s5pv210_common_init_uarts
> +
> +#else
> +#define s5pv210_init_clocks NULL
> +#define s5pv210_init_uarts NULL
> +#define s5pv210_map_io NULL
> +#define s5pv210_init NULL
> +#endif
> +
> +/* S5PV210 timer */
> +
> +extern struct sys_timer s5pv210_timer;
> diff --git a/arch/arm/plat-s5p/s5pv210-init.c b/arch/arm/plat-s5p/s5p=
v210-init.c
> new file mode 100644
> index 0000000..619d058
> --- /dev/null
> +++ b/arch/arm/plat-s5p/s5pv210-init.c
> @@ -0,0 +1,44 @@
> +/* linux/arch/arm/plat-s5p/s5pv210-init.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
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
> +#include <linux/serial_core.h>
> +
> +#include <plat/cpu.h>
> +#include <plat/devs.h>
> +#include <plat/s5pv210.h>
> +#include <plat/regs-serial.h>
> +
> +static struct s3c24xx_uart_clksrc s5pv210_serial_clocks[] =3D {
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pclk",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divisor =A0 =A0 =A0 =A0=3D 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .min_baud =A0 =A0 =A0 =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .max_baud =A0 =A0 =A0 =3D 0,
> + =A0 =A0 =A0 },
> +};
> +
> +/* uart registration process */
> +void __init s5pv210_common_init_uarts(struct s3c2410_uartcfg *cfg, i=
nt no)
> +{
> + =A0 =A0 =A0 struct s3c2410_uartcfg *tcfg =3D cfg;
> + =A0 =A0 =A0 u32 ucnt;
> +
> + =A0 =A0 =A0 for (ucnt =3D 0; ucnt < no; ucnt++, tcfg++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!tcfg->clocks) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcfg->clocks =3D s5pv21=
0_serial_clocks;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcfg->clocks_size =3D A=
RRAY_SIZE(s5pv210_serial_clocks);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 s3c24xx_init_uartdevs("s5pv210-uart", s5p_uart_resource=
s, cfg, no);
> +}
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
