From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v3 2/8] ARM: S5PV310: Add new CPU initialization support
Date: Wed, 21 Jul 2010 11:55:21 +0900
Message-ID: <AANLkTikYjSIZzT-WHpAYbaHC1R9DU2T89qUVoAYASEZv@mail.gmail.com>
References: <1279627861-23047-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:54883 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758652Ab0GUCzX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jul 2010 22:55:23 -0400
Received: by pvc7 with SMTP id 7so2427655pvc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Jul 2010 19:55:22 -0700 (PDT)
In-Reply-To: <1279627861-23047-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Jongpill Lee <boyko.lee@samsung.com>, Jiseong Oh <jiseong.oh@samsung.com>

On Tue, Jul 20, 2010 at 9:11 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> From: Changhwan Youn <chaos.youn@samsung.com>
>
> This patch adds Samsung S5PV310/S5PC210 CPU support.
> The S5PV310/S5PC210 integrates a ARM Cortex A9 multi-core.
>
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: Jiseong Oh <jiseong.oh@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> Changes since v2:
> - Re-model platsmp.c on the Versatile Express as per Russell King's s=
uggestion.
> =A0And tested on the board.
>
> - Compared Versatile Express SMP code with Realview SMP code and modi=
fied as needed.
>
> =A0arch/arm/mach-s5pv310/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0122 ++++++++++++++
> =A0arch/arm/mach-s5pv310/headsmp.S =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 41 +++++
> =A0arch/arm/mach-s5pv310/include/mach/debug-macro.S | =A0 36 ++++
> =A0arch/arm/mach-s5pv310/include/mach/entry-macro.S | =A0 84 ++++++++=
++
> =A0arch/arm/mach-s5pv310/include/mach/gpio.h =A0 =A0 =A0 =A0| =A0135 =
+++++++++++++++
> =A0arch/arm/mach-s5pv310/include/mach/hardware.h =A0 =A0| =A0 18 ++
> =A0arch/arm/mach-s5pv310/include/mach/io.h =A0 =A0 =A0 =A0 =A0| =A0 2=
6 +++
> =A0arch/arm/mach-s5pv310/include/mach/map.h =A0 =A0 =A0 =A0 | =A0 66 =
++++++++
> =A0arch/arm/mach-s5pv310/include/mach/memory.h =A0 =A0 =A0| =A0 22 ++=
+
> =A0arch/arm/mach-s5pv310/include/mach/smp.h =A0 =A0 =A0 =A0 | =A0 29 =
++++
> =A0arch/arm/mach-s5pv310/include/mach/system.h =A0 =A0 =A0| =A0 22 ++=
+
> =A0arch/arm/mach-s5pv310/include/mach/timex.h =A0 =A0 =A0 | =A0 29 ++=
++
> =A0arch/arm/mach-s5pv310/include/mach/uncompress.h =A0| =A0 27 +++
> =A0arch/arm/mach-s5pv310/include/mach/vmalloc.h =A0 =A0 | =A0 22 +++
> =A0arch/arm/mach-s5pv310/init.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 41 +++++
> =A0arch/arm/mach-s5pv310/platsmp.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0192 ++++++++++++++++++++++
> =A0arch/arm/mach-s5pv310/setup-i2c0.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 20 +++
> =A0arch/arm/plat-s5p/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 12 ++
> =A0arch/arm/plat-s5p/include/plat/map-s5p.h =A0 =A0 =A0 =A0 | =A0 12 =
++
> =A0arch/arm/plat-s5p/include/plat/s5pv310.h =A0 =A0 =A0 =A0 | =A0 33 =
++++
> =A020 files changed, 989 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-s5pv310/cpu.c
> =A0create mode 100644 arch/arm/mach-s5pv310/headsmp.S
> =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/debug-macro.=
S
> =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/entry-macro.=
S
> =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/gpio.h
> =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/hardware.h
> =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/io.h
> =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/map.h
> =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/memory.h
> =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/smp.h
> =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/system.h
> =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/timex.h
> =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/uncompress.h
> =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/vmalloc.h
> =A0create mode 100644 arch/arm/mach-s5pv310/init.c
> =A0create mode 100644 arch/arm/mach-s5pv310/platsmp.c
> =A0create mode 100644 arch/arm/mach-s5pv310/setup-i2c0.c
> =A0create mode 100644 arch/arm/plat-s5p/include/plat/s5pv310.h
>
> diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/cpu.=
c
> new file mode 100644
> index 0000000..196c9f1
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/cpu.c
> @@ -0,0 +1,122 @@
> +/* linux/arch/arm/mach-s5pv310/cpu.c
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
> +#include <linux/sched.h>
> +#include <linux/sysdev.h>
> +
> +#include <asm/mach/map.h>
> +#include <asm/mach/irq.h>
> +
> +#include <asm/proc-fns.h>
> +
> +#include <plat/cpu.h>
> +#include <plat/clock.h>
> +#include <plat/s5pv310.h>
> +
> +#include <mach/regs-irq.h>
> +
> +void __iomem *gic_cpu_base_addr;
> +
> +extern int combiner_init(unsigned int combiner_nr, void __iomem *bas=
e,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int irq_sta=
rt);
> +extern void combiner_cascade_irq(unsigned int combiner_nr, unsigned =
int irq);
> +
> +/* Initial IO mappings */
> +static struct map_desc s5pv310_iodesc[] __initdata =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_COREPERI_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV310_PA_COREPERI),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_8K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_COMBINER_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV310_PA_COMBINER),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_L2CC,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S5PV310_PA_L2CC),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 },
> +};
> +
> +static void s5pv310_idle(void)
> +{
> + =A0 =A0 =A0 if (!need_resched())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu_do_idle();
> +
> + =A0 =A0 =A0 local_irq_enable();
> +}
> +
> +/* s5pv310_map_io
> + *
> + * register the standard cpu IO areas
> +*/
> +void __init s5pv310_map_io(void)
> +{
> + =A0 =A0 =A0 iotable_init(s5pv310_iodesc, ARRAY_SIZE(s5pv310_iodesc)=
);
> +}
> +
> +void __init s5pv310_init_clocks(int xtal)
> +{
> + =A0 =A0 =A0 printk(KERN_DEBUG "%s: initializing clocks\n", __func__=
);
> +
> + =A0 =A0 =A0 s3c24xx_register_baseclocks(xtal);
> + =A0 =A0 =A0 s5p_register_clocks(xtal);
> + =A0 =A0 =A0 s5pv310_register_clocks();
> + =A0 =A0 =A0 s5pv310_setup_clocks();
> +}
> +
> +void __init s5pv310_init_irq(void)
> +{
> + =A0 =A0 =A0 int irq;
> +
> + =A0 =A0 =A0 gic_cpu_base_addr =3D S5P_VA_GIC_CPU;
> + =A0 =A0 =A0 gic_dist_init(0, S5P_VA_GIC_DIST, IRQ_LOCALTIMER);
> + =A0 =A0 =A0 gic_cpu_init(0, S5P_VA_GIC_CPU);
> +
> + =A0 =A0 =A0 for (irq =3D 0; irq < MAX_COMBINER_NR; irq++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 combiner_init(irq, (void __iomem *)S5P_=
VA_COMBINER(irq),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 COMBINE=
R_IRQ(irq, 0));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 combiner_cascade_irq(irq, IRQ_SPI(irq))=
;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* The parameters of s5p_init_irq() are for VIC init.
> + =A0 =A0 =A0 =A0* Theses parameters should be NULL and 0 because S5P=
V310
> + =A0 =A0 =A0 =A0* uses GIC instead of VIC.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 s5p_init_irq(NULL, 0);
> +}
> +
> +struct sysdev_class s5pv310_sysclass =3D {
> + =A0 =A0 =A0 .name =A0 =3D "s5pv310-core",
> +};
> +
> +static struct sys_device s5pv310_sysdev =3D {
> + =A0 =A0 =A0 .cls =A0 =A0=3D &s5pv310_sysclass,
> +};
> +
> +static int __init s5pv310_core_init(void)
> +{
> + =A0 =A0 =A0 return sysdev_class_register(&s5pv310_sysclass);
> +}
> +
> +core_initcall(s5pv310_core_init);
> +
> +int __init s5pv310_init(void)
> +{
> + =A0 =A0 =A0 printk(KERN_INFO "S5PV310: Initializing architecture\n"=
);
> +
> + =A0 =A0 =A0 /* set idle function */
> + =A0 =A0 =A0 pm_idle =3D s5pv310_idle;
> +
> + =A0 =A0 =A0 return sysdev_register(&s5pv310_sysdev);
> +}
> diff --git a/arch/arm/mach-s5pv310/headsmp.S b/arch/arm/mach-s5pv310/=
headsmp.S
> new file mode 100644
> index 0000000..164b7b0
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/headsmp.S
> @@ -0,0 +1,41 @@
> +/*
> + * =A0linux/arch/arm/mach-s5pv310/headsmp.S
> + *
> + * =A0Cloned from linux/arch/arm/mach-realview/headsmp.S
> + *
> + * =A0Copyright (c) 2003 ARM Limited
> + * =A0All Rights Reserved
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +#include <linux/linkage.h>
> +#include <linux/init.h>
> +
> + =A0 =A0 =A0 __INIT
> +
> +/*
> + * s5pv310 specific entry point for secondary CPUs. =A0This provides
> + * a "holding pen" into which all secondary cores are held until we'=
re
> + * ready for them to initialise.
> + */
> +ENTRY(s5pv310_secondary_startup)
> + =A0 =A0 =A0 mrc =A0 =A0 p15, 0, r0, c0, c0, 5
> + =A0 =A0 =A0 and =A0 =A0 r0, r0, #15
> + =A0 =A0 =A0 adr =A0 =A0 r4, 1f
> + =A0 =A0 =A0 ldmia =A0 r4, {r5, r6}
> + =A0 =A0 =A0 sub =A0 =A0 r4, r4, r5
> + =A0 =A0 =A0 add =A0 =A0 r6, r6, r4
> +pen: =A0 ldr =A0 =A0 r7, [r6]
> + =A0 =A0 =A0 cmp =A0 =A0 r7, r0
> + =A0 =A0 =A0 bne =A0 =A0 pen
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* we've been released from the holding pen: secondar=
y_stack
> + =A0 =A0 =A0 =A0* should now contain the SVC stack for this core
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 b =A0 =A0 =A0 secondary_startup
> +
> +1: =A0 =A0 .long =A0 .
> + =A0 =A0 =A0 .long =A0 pen_release
> diff --git a/arch/arm/mach-s5pv310/include/mach/debug-macro.S b/arch/=
arm/mach-s5pv310/include/mach/debug-macro.S
> new file mode 100644
> index 0000000..6fb3893
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/include/mach/debug-macro.S
> @@ -0,0 +1,36 @@
> +/* linux/arch/arm/mach-s5pv310/include/mach/debug-macro.S
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
> + =A0 =A0 =A0 .macro addruart, rx, tmp
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mrc =A0 =A0 p15, 0, \rx, c1, c0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tst =A0 =A0 \rx, #1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldreq =A0 \rx, =3D S3C_PA_UART
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldrne =A0 \rx, =3D S3C_VA_UART
> +#if CONFIG_DEBUG_S3C_UART !=3D 0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 add =A0 =A0 \rx, \rx, #(0x10000 * CONFI=
G_DEBUG_S3C_UART)
> +#endif
> + =A0 =A0 =A0 .endm
> +
> +#define fifo_full fifo_full_s5pv210
> +#define fifo_level fifo_level_s5pv210
> +
> +#include <plat/debug-macro.S>
> diff --git a/arch/arm/mach-s5pv310/include/mach/entry-macro.S b/arch/=
arm/mach-s5pv310/include/mach/entry-macro.S
> new file mode 100644
> index 0000000..e600e1d
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/include/mach/entry-macro.S
> @@ -0,0 +1,84 @@
> +/* arch/arm/mach-s5pv310/include/mach/entry-macro.S
> + *
> + * Cloned from arch/arm/mach-realview/include/mach/entry-macro.S
> + *
> + * Low-level IRQ helper macros for S5PV310 platforms
> + *
> + * This file is licensed under =A0the terms of the GNU General Publi=
c
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> +*/
> +
> +#include <mach/hardware.h>
> +#include <asm/hardware/gic.h>
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .macro =A0disable_fiq
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .endm
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .macro =A0get_irqnr_preamble, base, tmp
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldr =A0 =A0 \base, =3Dgic_cpu_base_addr
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldr =A0 =A0 \base, [\base]
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .endm
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .macro =A0arch_ret_to_user, tmp1, tmp2
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .endm
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* The interrupt numbering scheme is =
defined in the
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* interrupt controller spec. =A0To w=
it:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Interrupts 0-15 are IPI
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 16-28 are reserved
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 29-31 are local. =A0We allow 30 to=
 be used for the watchdog.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 32-1020 are global
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 1021-1022 are reserved
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 1023 is "spurious" (no interrupt)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* For now, we ignore all local inter=
rupts so only return an interrupt if it's
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* between 30 and 1020. =A0The test_f=
or_ipi routine below will pick up on IPIs.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* A simple read from the controller =
will tell us the number of the highest
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * priority enabled interrupt. =A0We=
 then just need to check whether it is in the
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* valid range for an IRQ (30-1020 in=
clusive).
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .macro =A0get_irqnr_and_base, irqnr, ir=
qstat, base, tmp
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldr =A0 =A0 \irqstat, [\base, #GIC_CPU_=
INTACK] /* bits 12-10 =3D src CPU, 9-0 =3D int # */
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldr =A0 =A0 \tmp, =3D1021
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bic =A0 =A0 \irqnr, \irqstat, #0x1c00
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmp =A0 =A0 \irqnr, #29
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmpcc =A0 \irqnr, \irqnr
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmpne =A0 \irqnr, \tmp
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmpcs =A0 \irqnr, \irqnr
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 addne =A0 \irqnr, \irqnr, #32
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .endm
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* We assume that irqstat (the raw valu=
e of the IRQ acknowledge
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* register) is preserved from the ma=
cro above.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* If there is an IPI, we immediately=
 signal end of interrupt on the
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* controller, since this requires th=
e original irqstat value which
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* we won't easily be able to recreat=
e later.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .macro test_for_ipi, irqnr, irqstat, ba=
se, tmp
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bic =A0 =A0 \irqnr, \irqstat, #0x1c00
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmp =A0 =A0 \irqnr, #16
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 strcc =A0 \irqstat, [\base, #GIC_CPU_EO=
I]
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmpcs =A0 \irqnr, \irqnr
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .endm
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* As above, this assumes that irqstat =
and base are preserved.. */
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .macro test_for_ltirq, irqnr, irqstat, =
base, tmp
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bic =A0 =A0 \irqnr, \irqstat, #0x1c00
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mov =A0 =A0 \tmp, #0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmp =A0 =A0 \irqnr, #29
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 moveq =A0 \tmp, #1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 streq =A0 \irqstat, [\base, #GIC_CPU_EO=
I]
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmp =A0 =A0 \tmp, #0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .endm
> diff --git a/arch/arm/mach-s5pv310/include/mach/gpio.h b/arch/arm/mac=
h-s5pv310/include/mach/gpio.h
> new file mode 100644
> index 0000000..20cb80c
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/include/mach/gpio.h
> @@ -0,0 +1,135 @@
> +/* linux/arch/arm/mach-s5pv310/include/mach/gpio.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV310 - GPIO lib support
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
> +/* Practically, GPIO banks upto GPZ are the configurable gpio banks =
*/
> +
> +/* GPIO bank sizes */
> +#define S5PV310_GPIO_A0_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_A1_NR =A0 =A0 (6)
> +#define S5PV310_GPIO_B_NR =A0 =A0 =A0(8)
> +#define S5PV310_GPIO_C0_NR =A0 =A0 (5)
> +#define S5PV310_GPIO_C1_NR =A0 =A0 (5)
> +#define S5PV310_GPIO_D0_NR =A0 =A0 (4)
> +#define S5PV310_GPIO_D1_NR =A0 =A0 (4)
> +#define S5PV310_GPIO_E0_NR =A0 =A0 (5)
> +#define S5PV310_GPIO_E1_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_E2_NR =A0 =A0 (6)
> +#define S5PV310_GPIO_E3_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_E4_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_F0_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_F1_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_F2_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_F3_NR =A0 =A0 (6)
> +#define S5PV310_GPIO_J0_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_J1_NR =A0 =A0 (5)
> +#define S5PV310_GPIO_K0_NR =A0 =A0 (7)
> +#define S5PV310_GPIO_K1_NR =A0 =A0 (7)
> +#define S5PV310_GPIO_K2_NR =A0 =A0 (7)
> +#define S5PV310_GPIO_K3_NR =A0 =A0 (7)
> +#define S5PV310_GPIO_L0_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_L1_NR =A0 =A0 (3)
> +#define S5PV310_GPIO_L2_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_X0_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_X1_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_X2_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_X3_NR =A0 =A0 (8)
> +#define S5PV310_GPIO_Z_NR =A0 =A0 =A0(7)
> +
> +/* GPIO bank numbers */
> +
> +#define S5PV310_GPIO_NEXT(__gpio) \
> + =A0 =A0 =A0 ((__gpio##_START) + (__gpio##_NR) + CONFIG_S3C_GPIO_SPA=
CE + 1)
> +
> +enum s5p_gpio_number {
> + =A0 =A0 =A0 S5PV310_GPIO_A0_START =A0 =3D 0,
> + =A0 =A0 =A0 S5PV310_GPIO_A1_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_A0),
> + =A0 =A0 =A0 S5PV310_GPIO_B_START =A0 =A0=3D S5PV310_GPIO_NEXT(S5PV3=
10_GPIO_A1),
> + =A0 =A0 =A0 S5PV310_GPIO_C0_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_B),
> + =A0 =A0 =A0 S5PV310_GPIO_C1_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_C0),
> + =A0 =A0 =A0 S5PV310_GPIO_D0_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_C1),
> + =A0 =A0 =A0 S5PV310_GPIO_D1_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_D0),
> + =A0 =A0 =A0 S5PV310_GPIO_E0_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_D1),
> + =A0 =A0 =A0 S5PV310_GPIO_E1_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_E0),
> + =A0 =A0 =A0 S5PV310_GPIO_E2_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_E1),
> + =A0 =A0 =A0 S5PV310_GPIO_E3_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_E2),
> + =A0 =A0 =A0 S5PV310_GPIO_E4_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_E3),
> + =A0 =A0 =A0 S5PV310_GPIO_F0_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_E4),
> + =A0 =A0 =A0 S5PV310_GPIO_F1_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_F0),
> + =A0 =A0 =A0 S5PV310_GPIO_F2_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_F1),
> + =A0 =A0 =A0 S5PV310_GPIO_F3_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_F2),
> + =A0 =A0 =A0 S5PV310_GPIO_J0_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_F3),
> + =A0 =A0 =A0 S5PV310_GPIO_J1_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_J0),
> + =A0 =A0 =A0 S5PV310_GPIO_K0_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_J1),
> + =A0 =A0 =A0 S5PV310_GPIO_K1_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_K0),
> + =A0 =A0 =A0 S5PV310_GPIO_K2_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_K1),
> + =A0 =A0 =A0 S5PV310_GPIO_K3_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_K2),
> + =A0 =A0 =A0 S5PV310_GPIO_L0_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_K3),
> + =A0 =A0 =A0 S5PV310_GPIO_L1_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_L0),
> + =A0 =A0 =A0 S5PV310_GPIO_L2_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_L1),
> + =A0 =A0 =A0 S5PV310_GPIO_X0_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_L2),
> + =A0 =A0 =A0 S5PV310_GPIO_X1_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_X0),
> + =A0 =A0 =A0 S5PV310_GPIO_X2_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_X1),
> + =A0 =A0 =A0 S5PV310_GPIO_X3_START =A0 =3D S5PV310_GPIO_NEXT(S5PV310=
_GPIO_X2),
> + =A0 =A0 =A0 S5PV310_GPIO_Z_START =A0 =A0=3D S5PV310_GPIO_NEXT(S5PV3=
10_GPIO_X3),
> +};
> +
> +/* S5PV310 GPIO number definitions */
> +#define S5PV310_GPA0(_nr) =A0 =A0 =A0(S5PV310_GPIO_A0_START + (_nr))
> +#define S5PV310_GPA1(_nr) =A0 =A0 =A0(S5PV310_GPIO_A1_START + (_nr))
> +#define S5PV310_GPB(_nr) =A0 =A0 =A0 (S5PV310_GPIO_B_START + (_nr))
> +#define S5PV310_GPC0(_nr) =A0 =A0 =A0(S5PV310_GPIO_C0_START + (_nr))
> +#define S5PV310_GPC1(_nr) =A0 =A0 =A0(S5PV310_GPIO_C1_START + (_nr))
> +#define S5PV310_GPD0(_nr) =A0 =A0 =A0(S5PV310_GPIO_D0_START + (_nr))
> +#define S5PV310_GPD1(_nr) =A0 =A0 =A0(S5PV310_GPIO_D1_START + (_nr))
> +#define S5PV310_GPE0(_nr) =A0 =A0 =A0(S5PV310_GPIO_E0_START + (_nr))
> +#define S5PV310_GPE1(_nr) =A0 =A0 =A0(S5PV310_GPIO_E1_START + (_nr))
> +#define S5PV310_GPE2(_nr) =A0 =A0 =A0(S5PV310_GPIO_E2_START + (_nr))
> +#define S5PV310_GPE3(_nr) =A0 =A0 =A0(S5PV310_GPIO_E3_START + (_nr))
> +#define S5PV310_GPE4(_nr) =A0 =A0 =A0(S5PV310_GPIO_E4_START + (_nr))
> +#define S5PV310_GPF0(_nr) =A0 =A0 =A0(S5PV310_GPIO_F0_START + (_nr))
> +#define S5PV310_GPF1(_nr) =A0 =A0 =A0(S5PV310_GPIO_F1_START + (_nr))
> +#define S5PV310_GPF2(_nr) =A0 =A0 =A0(S5PV310_GPIO_F2_START + (_nr))
> +#define S5PV310_GPF3(_nr) =A0 =A0 =A0(S5PV310_GPIO_F3_START + (_nr))
> +#define S5PV310_GPJ0(_nr) =A0 =A0 =A0(S5PV310_GPIO_J0_START + (_nr))
> +#define S5PV310_GPJ1(_nr) =A0 =A0 =A0(S5PV310_GPIO_J1_START + (_nr))
> +#define S5PV310_GPK0(_nr) =A0 =A0 =A0(S5PV310_GPIO_K0_START + (_nr))
> +#define S5PV310_GPK1(_nr) =A0 =A0 =A0(S5PV310_GPIO_K1_START + (_nr))
> +#define S5PV310_GPK2(_nr) =A0 =A0 =A0(S5PV310_GPIO_K2_START + (_nr))
> +#define S5PV310_GPK3(_nr) =A0 =A0 =A0(S5PV310_GPIO_K3_START + (_nr))
> +#define S5PV310_GPL0(_nr) =A0 =A0 =A0(S5PV310_GPIO_L0_START + (_nr))
> +#define S5PV310_GPL1(_nr) =A0 =A0 =A0(S5PV310_GPIO_L1_START + (_nr))
> +#define S5PV310_GPL2(_nr) =A0 =A0 =A0(S5PV310_GPIO_L2_START + (_nr))
> +#define S5PV310_GPX0(_nr) =A0 =A0 =A0(S5PV310_GPIO_X0_START + (_nr))
> +#define S5PV310_GPX1(_nr) =A0 =A0 =A0(S5PV310_GPIO_X1_START + (_nr))
> +#define S5PV310_GPX2(_nr) =A0 =A0 =A0(S5PV310_GPIO_X2_START + (_nr))
> +#define S5PV310_GPX3(_nr) =A0 =A0 =A0(S5PV310_GPIO_X3_START + (_nr))
> +#define S5PV310_GPZ(_nr) =A0 =A0 =A0 (S5PV310_GPIO_Z_START + (_nr))
> +
> +/* the end of the S5PV310 specific gpios */
> +#define S5PV310_GPIO_END =A0 =A0 =A0 (S5PV310_GPZ(S5PV310_GPIO_Z_NR)=
 + 1)
> +#define S3C_GPIO_END =A0 =A0 =A0 =A0 =A0 S5PV310_GPIO_END
> +
> +/* define the number of gpios we need to the one after the GPZ() ran=
ge */
> +#define ARCH_NR_GPIOS =A0 =A0 =A0 =A0 =A0(S5PV310_GPZ(S5PV310_GPIO_Z=
_NR) + =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CONF=
IG_SAMSUNG_GPIO_EXTRA + 1)
> +
> +#include <asm-generic/gpio.h>
> +
> +#endif /* __ASM_ARCH_GPIO_H */
> diff --git a/arch/arm/mach-s5pv310/include/mach/hardware.h b/arch/arm=
/mach-s5pv310/include/mach/hardware.h
> new file mode 100644
> index 0000000..28ff988
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/include/mach/hardware.h
> @@ -0,0 +1,18 @@
> +/* linux/arch/arm/mach-s5pv310/include/mach/hardware.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV310 - Hardware support
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
> diff --git a/arch/arm/mach-s5pv310/include/mach/io.h b/arch/arm/mach-=
s5pv310/include/mach/io.h
> new file mode 100644
> index 0000000..8a7f912
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/include/mach/io.h
> @@ -0,0 +1,26 @@
> +/* linux/arch/arm/mach-s5pv310/include/mach/io.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * Copyright 2008-2010 Ben Dooks <ben-linux@fluff.org>
> + *
> + * Based on arch/arm/mach-s5p6442/include/mach/io.h
> + *
> + * Default IO routines for S5PV310
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARM_ARCH_IO_H
> +#define __ASM_ARM_ARCH_IO_H __FILE__
> +
> +/* No current ISA/PCI bus support. */
> +#define __io(a) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__typesafe_io(a)
> +#define __mem_pci(a) =A0 (a)
> +
> +#define IO_SPACE_LIMIT (0xFFFFFFFF)
> +
> +#endif /* __ASM_ARM_ARCH_IO_H */
> diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach=
-s5pv310/include/mach/map.h
> new file mode 100644
> index 0000000..50e0901
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/include/mach/map.h
> @@ -0,0 +1,66 @@
> +/* linux/arch/arm/mach-s5pv310/include/mach/map.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV310 - Memory map definitions
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
> +/*
> + * S5PV310 UART offset is 0x10000 but the older S5P SoCs are 0x400.
> + * So need to define it, and here is to avoid redefinition warning.
> + */
> +#define S3C_UART_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x10000)
> +
> +#include <plat/map-s5p.h>
> +
> +#define S5PV310_PA_CHIPID =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x10000000)
> +#define S5P_PA_CHIPID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV310_PA_=
CHIPID
> +
> +#define S5PV310_PA_SYSCON =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x10020000)
> +#define S5P_PA_SYSCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV310_PA_=
SYSCON
> +
> +#define S5PV310_PA_COMBINER =A0 =A0 =A0 =A0 =A0 =A0(0x10448000)
> +
> +#define S5PV310_PA_COREPERI =A0 =A0 =A0 =A0 =A0 =A0(0x10500000)
> +#define S5PV310_PA_GIC_CPU =A0 =A0 =A0 =A0 =A0 =A0 (0x10500100)
> +#define S5PV310_PA_TWD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x10500600)
> +#define S5PV310_PA_GIC_DIST =A0 =A0 =A0 =A0 =A0 =A0(0x10501000)
> +#define S5PV310_PA_L2CC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x10502000)
> +
> +#define S5PV310_PA_GPIO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x11000000)
> +#define S5P_PA_GPIO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV310_P=
A_GPIO
> +
> +#define S5PV310_PA_UART =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x13800000)
> +
> +#define S5P_PA_UART(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (S5PV310_PA_U=
ART + ((x) * S3C_UART_OFFSET))
> +#define S5P_PA_UART0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_PA_UART=
(0)
> +#define S5P_PA_UART1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_PA_UART=
(1)
> +#define S5P_PA_UART2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_PA_UART=
(2)
> +#define S5P_PA_UART3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_PA_UART=
(3)
> +#define S5P_PA_UART4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_PA_UART=
(4)
> +
> +#define S5P_SZ_UART =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0SZ_256
> +
> +#define S5PV310_PA_IIC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(0x13860000)
> +
> +#define S5PV310_PA_TIMER =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x139D0000)
> +#define S5P_PA_TIMER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV310_PA_=
TIMER
> +
> +#define S5PV310_PA_SDRAM =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x40000000)
> +#define S5P_PA_SDRAM =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV310_PA_=
SDRAM
> +
> +/* compatibiltiy defines. */
> +#define S3C_PA_UART =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV310_P=
A_UART
> +#define S3C_PA_IIC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV310_P=
A_IIC0
> +
> +#endif /* __ASM_ARCH_MAP_H */
> diff --git a/arch/arm/mach-s5pv310/include/mach/memory.h b/arch/arm/m=
ach-s5pv310/include/mach/memory.h
> new file mode 100644
> index 0000000..1dffb48
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/include/mach/memory.h
> @@ -0,0 +1,22 @@
> +/* linux/arch/arm/mach-s5pv310/include/mach/memory.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV310 - Memory definitions
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_MEMORY_H
> +#define __ASM_ARCH_MEMORY_H __FILE__
> +
> +#define PHYS_OFFSET =A0 =A0 =A0 =A0 =A0 =A0UL(0x40000000)
> +
> +/* Maximum of 256MiB in one bank */
> +#define MAX_PHYSMEM_BITS =A0 =A0 =A0 32
> +#define SECTION_SIZE_BITS =A0 =A0 =A028
> +
> +#endif /* __ASM_ARCH_MEMORY_H */
> diff --git a/arch/arm/mach-s5pv310/include/mach/smp.h b/arch/arm/mach=
-s5pv310/include/mach/smp.h
> new file mode 100644
> index 0000000..990f3ba
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/include/mach/smp.h
> @@ -0,0 +1,29 @@
> +/* linux/arch/arm/mach-s5pv310/include/mach/smp.h
> + *
> + * Cloned from arch/arm/mach-realview/include/mach/smp.h
> +*/
> +
> +#ifndef ASM_ARCH_SMP_H
> +#define ASM_ARCH_SMP_H __FILE__
> +
> +#include <asm/hardware/gic.h>
> +
> +extern void __iomem *gic_cpu_base_addr;
> +
> +#define hard_smp_processor_id() =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0\
> + =A0 =A0 =A0 ({ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int cpunum; =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __asm__("mrc p15, 0, %0, c0, c0, 5" =A0=
 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 : "=3Dr" (cpunum)); =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpunum &=3D 0x03; =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 })
> +
> +/*
> + * We use IRQ1 as the IPI
> + */
> +static inline void smp_cross_call(const struct cpumask *mask)
> +{
> + =A0 =A0 =A0 gic_raise_softirq(mask, 1);
> +}
> +
> +#endif
> diff --git a/arch/arm/mach-s5pv310/include/mach/system.h b/arch/arm/m=
ach-s5pv310/include/mach/system.h
> new file mode 100644
> index 0000000..d10c009
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/include/mach/system.h
> @@ -0,0 +1,22 @@
> +/* linux/arch/arm/mach-s5pv310/include/mach/system.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV310 - system support header
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
> +#include <plat/system-reset.h>
> +
> +static void arch_idle(void)
> +{
> + =A0 =A0 =A0 /* nothing here yet */
> +}
> +#endif /* __ASM_ARCH_SYSTEM_H */
> diff --git a/arch/arm/mach-s5pv310/include/mach/timex.h b/arch/arm/ma=
ch-s5pv310/include/mach/timex.h
> new file mode 100644
> index 0000000..bd2359b
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/include/mach/timex.h
> @@ -0,0 +1,29 @@
> +/* linux/arch/arm/mach-s5pv310/include/mach/timex.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * Copyright (c) 2003-2010 Simtec Electronics
> + * =A0 =A0 Ben Dooks <ben@simtec.co.uk>
> + *
> + * Based on arch/arm/mach-s5p6442/include/mach/timex.h
> + *
> + * S5PV310 - time parameters
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_TIMEX_H
> +#define __ASM_ARCH_TIMEX_H __FILE__
> +
> +/* CLOCK_TICK_RATE needs to be evaluatable by the cpp, so making it
> + * a variable is useless. It seems as long as we make our timers an
> + * exact multiple of HZ, any value that makes a 1->1 correspondence
> + * for the time conversion functions to/from jiffies is acceptable.
> +*/
> +
> +#define CLOCK_TICK_RATE 12000000
> +
> +#endif /* __ASM_ARCH_TIMEX_H */
> diff --git a/arch/arm/mach-s5pv310/include/mach/uncompress.h b/arch/a=
rm/mach-s5pv310/include/mach/uncompress.h
> new file mode 100644
> index 0000000..ad88c24
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/include/mach/uncompress.h
> @@ -0,0 +1,27 @@
> +/* linux/arch/arm/mach-s5pv310/include/mach/uncompress.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5PV310 - uncompress code
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_UNCOMPRESS_H
> +#define __ASM_ARCH_UNCOMPRESS_H __FILE__
> +
> +#include <mach/map.h>
> +#include <plat/uncompress.h>
> +
> +static void arch_detect_cpu(void)
> +{
> + =A0 =A0 =A0 /* we do not need to do any cpu detection here at the m=
oment. */
> +
> + =A0 =A0 =A0 fifo_mask =3D S5PV210_UFSTAT_TXMASK;
> + =A0 =A0 =A0 fifo_max =3D 63 << S5PV210_UFSTAT_TXSHIFT;

It's only valid when use the UART1. others 255 for UART0, 15 for others=
=2E

> +}
> +
> +#endif /* __ASM_ARCH_UNCOMPRESS_H */
> diff --git a/arch/arm/mach-s5pv310/include/mach/vmalloc.h b/arch/arm/=
mach-s5pv310/include/mach/vmalloc.h
> new file mode 100644
> index 0000000..426d997
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/include/mach/vmalloc.h
> @@ -0,0 +1,22 @@
> +/* linux/arch/arm/mach-s5pv310/include/mach/vmalloc.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * Copyright 2010 Ben Dooks <ben-linux@fluff.org>
> + *
> + * Based on arch/arm/mach-s5p6440/include/mach/vmalloc.h
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * S5PV310 vmalloc definition
> +*/
> +
> +#ifndef __ASM_ARCH_VMALLOC_H
> +#define __ASM_ARCH_VMALLOC_H __FILE__
> +
> +#define VMALLOC_END =A0 =A0 =A0(0xE0000000)

Increase to 0xF000'0000. but it will be removed from Eric's patch.

> +
> +#endif /* __ASM_ARCH_VMALLOC_H */
> diff --git a/arch/arm/mach-s5pv310/init.c b/arch/arm/mach-s5pv310/ini=
t.c
> new file mode 100644
> index 0000000..182dcf4
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/init.c
> @@ -0,0 +1,41 @@
> +/* linux/arch/arm/mach-s5pv310/init.c
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
> +#include <linux/serial_core.h>
> +
> +#include <plat/cpu.h>
> +#include <plat/devs.h>
> +#include <plat/regs-serial.h>
> +
> +static struct s3c24xx_uart_clksrc s5pv310_serial_clocks[] =3D {
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "uclk1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divisor =A0 =A0 =A0 =A0=3D 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .min_baud =A0 =A0 =A0 =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .max_baud =A0 =A0 =A0 =3D 0,
> + =A0 =A0 =A0 },
> +};
> +
> +/* uart registration process */
> +void __init s5pv310_common_init_uarts(struct s3c2410_uartcfg *cfg, i=
nt no)
> +{
> + =A0 =A0 =A0 struct s3c2410_uartcfg *tcfg =3D cfg;
> + =A0 =A0 =A0 u32 ucnt;
> +
> + =A0 =A0 =A0 for (ucnt =3D 0; ucnt < no; ucnt++, tcfg++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!tcfg->clocks) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcfg->has_fracval =3D 1=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcfg->clocks =3D s5pv31=
0_serial_clocks;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcfg->clocks_size =3D A=
RRAY_SIZE(s5pv310_serial_clocks);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 s3c24xx_init_uartdevs("s5pv210-uart", s5p_uart_resource=
s, cfg, no);
> +}
> diff --git a/arch/arm/mach-s5pv310/platsmp.c b/arch/arm/mach-s5pv310/=
platsmp.c
> new file mode 100644
> index 0000000..fe9469a
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/platsmp.c
> @@ -0,0 +1,192 @@
> +/* linux/arch/arm/mach-s5pv310/platsmp.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * Cloned from linux/arch/arm/mach-vexpress/platsmp.c
> + *
> + * =A0Copyright (C) 2002 ARM Ltd.
> + * =A0All Rights Reserved
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/init.h>
> +#include <linux/errno.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/jiffies.h>
> +#include <linux/smp.h>
> +#include <linux/io.h>
> +
> +#include <asm/cacheflush.h>
> +#include <asm/localtimer.h>
> +#include <asm/smp_scu.h>
> +#include <asm/unified.h>
> +
> +#include <mach/hardware.h>
> +#include <mach/regs-clock.h>
> +
> +extern void s5pv310_secondary_startup(void);
> +
> +/*
> + * control for which core is the next to come out of the secondary
> + * boot "holding pen"
> + */
> +
> +volatile int __cpuinitdata pen_release =3D -1;
> +
> +static void __iomem *scu_base_addr(void)
> +{
> + =A0 =A0 =A0 return (void __iomem *)(S5P_VA_SCU);
> +}
> +
> +static DEFINE_SPINLOCK(boot_lock);
> +
> +void __cpuinit platform_secondary_init(unsigned int cpu)
> +{
> + =A0 =A0 =A0 trace_hardirqs_off();
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* if any interrupts are already enabled for the prim=
ary
> + =A0 =A0 =A0 =A0* core (e.g. timer irq), then they will not have bee=
n enabled
> + =A0 =A0 =A0 =A0* for us: do so
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 gic_cpu_init(0, gic_cpu_base_addr);
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* let the primary processor know we're out of the
> + =A0 =A0 =A0 =A0* pen, then head off into the C entry point
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 pen_release =3D -1;
> + =A0 =A0 =A0 smp_wmb();
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Synchronise with the boot thread.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 spin_lock(&boot_lock);
> + =A0 =A0 =A0 spin_unlock(&boot_lock);
> +}
> +
> +int __cpuinit boot_secondary(unsigned int cpu, struct task_struct *i=
dle)
> +{
> + =A0 =A0 =A0 unsigned long timeout;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Set synchronisation state between this boot proces=
sor
> + =A0 =A0 =A0 =A0* and the secondary one
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 spin_lock(&boot_lock);
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* The secondary processor is waiting to be released =
from
> + =A0 =A0 =A0 =A0* the holding pen - release it, then wait for it to =
flag
> + =A0 =A0 =A0 =A0* that it has been released by resetting pen_release=
=2E
> + =A0 =A0 =A0 =A0*
> + =A0 =A0 =A0 =A0* Note that "pen_release" is the hardware CPU ID, wh=
ereas
> + =A0 =A0 =A0 =A0* "cpu" is Linux's internal ID.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 pen_release =3D cpu;
> + =A0 =A0 =A0 __cpuc_flush_dcache_area((void *)&pen_release, sizeof(p=
en_release));
> + =A0 =A0 =A0 outer_clean_range(__pa(&pen_release), __pa(&pen_release=
 + 1));
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Send the secondary CPU a soft interrupt, thereby c=
ausing
> + =A0 =A0 =A0 =A0* the boot monitor to read the system wide flags reg=
ister,
> + =A0 =A0 =A0 =A0* and branch to the address found there.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 smp_cross_call(cpumask_of(cpu));
> +
> + =A0 =A0 =A0 timeout =3D jiffies + (1 * HZ);
> + =A0 =A0 =A0 while (time_before(jiffies, timeout)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 smp_rmb();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pen_release =3D=3D -1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(10);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* now the secondary core is starting up let it run i=
ts
> + =A0 =A0 =A0 =A0* calibrations, then wait for it to finish
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 spin_unlock(&boot_lock);
> +
> + =A0 =A0 =A0 return pen_release !=3D -1 ? -ENOSYS : 0;
> +}
> +
> +/*
> + * Initialise the CPU possible map early - this describes the CPUs
> + * which may be present or become present in the system.
> + */
> +
> +void __init smp_init_cpus(void)
> +{
> + =A0 =A0 =A0 void __iomem *scu_base =3D scu_base_addr();
> + =A0 =A0 =A0 unsigned int i, ncores;
> +
> + =A0 =A0 =A0 ncores =3D scu_base ? scu_get_core_count(scu_base) : 1;
> +
> + =A0 =A0 =A0 /* sanity check */
> + =A0 =A0 =A0 if (ncores =3D=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"S5PV310: strange CM cou=
nt of 0? Default to 1\n");
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ncores =3D 1;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (ncores > NR_CPUS) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"S5PV310: no. of cores (=
%d) greater than configured "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"maximum of %d - clippin=
g\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ncores, NR_CPUS);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ncores =3D NR_CPUS;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 for (i =3D 0; i < ncores; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_cpu_possible(i, true);
> +}
> +
> +void __init smp_prepare_cpus(unsigned int max_cpus)
> +{
> + =A0 =A0 =A0 unsigned int ncores =3D num_possible_cpus();
> + =A0 =A0 =A0 unsigned int cpu =3D smp_processor_id();
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 smp_store_cpu_info(cpu);
> +
> + =A0 =A0 =A0 /* are we trying to boot more cores than exist? */
> + =A0 =A0 =A0 if (max_cpus > ncores)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max_cpus =3D ncores;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Initialise the present map, which describes the se=
t of CPUs
> + =A0 =A0 =A0 =A0* actually populated at the present time.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 for (i =3D 0; i < max_cpus; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_cpu_present(i, true);
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Initialise the SCU if there are more than one CPU =
and let
> + =A0 =A0 =A0 =A0* them know where to start.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (max_cpus > 1) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Enable the local timer or broadcas=
t device for the
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* boot CPU, but only if we have more=
 than one CPU.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 percpu_timer_setup();
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 scu_enable(scu_base_addr());
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Write the address of secondary sta=
rtup into the
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* system-wide flags register. The bo=
ot monitor waits
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* until it receives a soft interrupt=
, and then the
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* secondary CPU branches to this add=
ress.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 __raw_writel(BSYM(virt_to_phys(s5pv310_secondary_startu=
p)), S5P_INFORM0);

Do you really use the INFORM0? historically it's used for sleep &
wakeup. new SoC has several INFORM register. So I recommend to use
others.

> + =A0 =A0 =A0 }
> +}
> diff --git a/arch/arm/mach-s5pv310/setup-i2c0.c b/arch/arm/mach-s5pv3=
10/setup-i2c0.c
> new file mode 100644
> index 0000000..d4f5a81
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/setup-i2c0.c
> @@ -0,0 +1,20 @@
> +/* linux/arch/arm/mach-s5pv210/setup-i2c0.c
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * I2C0 GPIO configuration.
> + *
> + * Based on plat-s3c64xx/setup-i2c0.c
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +struct platform_device; /* don't need the contents */
> +
> +void s3c_i2c0_cfg_gpio(struct platform_device *dev)
> +{
> +/* will be implemented later */
> +}

Remove it and send separate patch. e.g.,I2C support on s5pc210.

> diff --git a/arch/arm/plat-s5p/cpu.c b/arch/arm/plat-s5p/cpu.c
> index c478441..9261a27 100644
> --- a/arch/arm/plat-s5p/cpu.c
> +++ b/arch/arm/plat-s5p/cpu.c
> @@ -21,6 +21,7 @@
> =A0#include <plat/s5p6442.h>
> =A0#include <plat/s5pc100.h>
> =A0#include <plat/s5pv210.h>
> +#include <plat/s5pv310.h>
>
> =A0/* table of supported CPUs */
>
> @@ -28,6 +29,7 @@ static const char name_s5p6440[] =3D "S5P6440";
> =A0static const char name_s5p6442[] =3D "S5P6442";
> =A0static const char name_s5pc100[] =3D "S5PC100";
> =A0static const char name_s5pv210[] =3D "S5PV210/S5PC110";
> +static const char name_s5pv310[] =3D "S5PV310";
>
> =A0static struct cpu_table cpu_ids[] __initdata =3D {
> =A0 =A0 =A0 =A0{
> @@ -62,6 +64,14 @@ static struct cpu_table cpu_ids[] __initdata =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.init_uarts =A0 =A0 =3D s5pv210_init_u=
arts,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.init =A0 =A0 =A0 =A0 =A0 =3D s5pv210_=
init,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D name_s5p=
v210,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .idcode =A0 =A0 =A0 =A0 =3D 0x43200000,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .idmask =A0 =A0 =A0 =A0 =3D 0xfffff000,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D s5pv310_map=
_io,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init_clocks =A0 =A0=3D s5pv310_init_cl=
ocks,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init_uarts =A0 =A0 =3D s5pv310_init_ua=
rts,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D s5pv310_i=
nit,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D name_s5pv=
310,
> =A0 =A0 =A0 =A0},
> =A0};
>
> @@ -83,6 +93,7 @@ static struct map_desc s5p_iodesc[] __initdata =3D =
{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S3C_PA_UART),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_512K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> +#ifdef CONFIG_ARM_VIC
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)VA_VIC0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S5P_PA_VIC0),
> @@ -93,6 +104,7 @@ static struct map_desc s5p_iodesc[] __initdata =3D=
 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S5P_PA_VIC1),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_16K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> +#endif
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S3C_VA_TIMER,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S5P_PA_TIMER),
> diff --git a/arch/arm/plat-s5p/include/plat/map-s5p.h b/arch/arm/plat=
-s5p/include/plat/map-s5p.h
> index 3d815f4..54e9fb9 100644
> --- a/arch/arm/plat-s5p/include/plat/map-s5p.h
> +++ b/arch/arm/plat-s5p/include/plat/map-s5p.h
> @@ -18,6 +18,18 @@
> =A0#define S5P_VA_SYSTIMER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x=
01200000)
> =A0#define S5P_VA_SROMC =A0 =A0 =A0 =A0 =A0 S3C_ADDR(0x01100000)
>
> +#define S5P_VA_COMBINER_BASE =A0 S3C_ADDR(0x00600000)
> +#define S5P_VA_COMBINER(x) =A0 =A0 (S5P_VA_COMBINER_BASE + ((x) >> 2=
) * 0x10)
> +
> +#define S5P_VA_COREPERI_BASE =A0 S3C_ADDR(0x00800000)
> +#define S5P_VA_COREPERI(x) =A0 =A0 (S5P_VA_COREPERI_BASE + (x))
> +#define S5P_VA_SCU =A0 =A0 =A0 =A0 =A0 =A0 S5P_VA_COREPERI(0x0)
> +#define S5P_VA_GIC_CPU =A0 =A0 =A0 =A0 S5P_VA_COREPERI(0x100)
> +#define S5P_VA_TWD =A0 =A0 =A0 =A0 =A0 =A0 S5P_VA_COREPERI(0x600)
> +#define S5P_VA_GIC_DIST =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_VA_COREPE=
RI(0x1000)
> +
> +#define S5P_VA_L2CC =A0 =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x00900000)

I'm not sure it's proper prefix.

> +
> =A0#define S5P_VA_UART(x) =A0 =A0 =A0 =A0 (S3C_VA_UART + ((x) * S3C_U=
ART_OFFSET))
> =A0#define S5P_VA_UART0 =A0 =A0 =A0 =A0 =A0 S5P_VA_UART(0)
> =A0#define S5P_VA_UART1 =A0 =A0 =A0 =A0 =A0 S5P_VA_UART(1)
> diff --git a/arch/arm/plat-s5p/include/plat/s5pv310.h b/arch/arm/plat=
-s5p/include/plat/s5pv310.h
> new file mode 100644
> index 0000000..d2f05e1
> --- /dev/null
> +++ b/arch/arm/plat-s5p/include/plat/s5pv310.h
> @@ -0,0 +1,33 @@
> +/* linux/arch/arm/plat-s5p/include/plat/s5pv310.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * Header file for s5pv310 cpu support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/* Common init code for S5PV310 related SoCs */
> +
> +extern void s5pv310_common_init_uarts(struct s3c2410_uartcfg *cfg, i=
nt no);
> +extern void s5pv310_register_clocks(void);
> +extern void s5pv310_setup_clocks(void);
> +
> +#ifdef CONFIG_CPU_S5PV310
> +
> +extern =A0int s5pv310_init(void);
> +extern void s5pv310_init_irq(void);
> +extern void s5pv310_map_io(void);
> +extern void s5pv310_init_clocks(int xtal);
> +
> +#define s5pv310_init_uarts s5pv310_common_init_uarts
> +
> +#else
> +#define s5pv310_init_clocks NULL
> +#define s5pv310_init_uarts NULL
> +#define s5pv310_map_io NULL
> +#define s5pv310_init NULL
> +#endif
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
