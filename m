From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH V4] ARM: EXYNOS4: Implement kernel timers using MCT
Date: Tue, 1 Mar 2011 12:14:24 +0900
Message-ID: <AANLkTim9XMD=x5dbm0vOcrCcrL0TRKvdb7CuXBv3r_qX@mail.gmail.com>
References: <1298870207-1850-1-git-send-email-kgene.kim@samsung.com>
	<1298870207-1850-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:52732 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755327Ab1CADO0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Feb 2011 22:14:26 -0500
Received: by gxk8 with SMTP id 8so1826168gxk.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Feb 2011 19:14:26 -0800 (PST)
In-Reply-To: <1298870207-1850-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi,

MCT is only possible from EVT1.0 or later. The current universal_c210
used the EVT0 version.
So can you remove the ifdef and board can select which timer is used?
Please refer the omap implementation and how to use it.

If we use the same configuration, It will be boot failed at
universal_c210 board.

Thank you,
Kyungmin Park

On Mon, Feb 28, 2011 at 2:16 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> From: Changhwan Youn <chaos.youn@samsung.com>
>
> The Multi-Core Timer(MCT) of EXYNOS4 is designed for implementing
> clock source timer and clock event timers. This patch implements
> 1 clock source timer with 64 bit free running counter of MCT and
> 2 clock event timers with two of 31-bit tick counters.
>
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> Changes since v3:
> - Re-worked based on exynos4
> - Changed member of clock_evetn_device like following
> =A0struct mct_clock_event_device {
> =A0 =A0 =A0 =A0struct clock_event_device *evt;
> =A0...
> - Address comments from Russell King
> =A0Added static into "irqreturn_t exynos4_mct_comp_isr()"
> =A0Added .dev_id member into "struct irqaction mct_comp_event_irq"
>
> Changes since v2:
> - Addressed comments from Russell King
> =A0Added mct_clock_event_device structure
> - Removed suspend()/resume() which are not used now
>
> Changes since v1:
> - Addressed comments from Russell King
> =A0(implemented global timer, used local timer and so on)
> - Fixed small things
>
> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A05 +
> =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 11 +-
> =A0arch/arm/mach-exynos4/include/mach/regs-mct.h | =A0 52 +++
> =A0arch/arm/mach-exynos4/mct.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0421 +++++++++++++++++++++++++
> =A05 files changed, 488 insertions(+), 3 deletions(-)
> =A0create mode 100644 arch/arm/mach-exynos4/include/mach/regs-mct.h
> =A0create mode 100644 arch/arm/mach-exynos4/mct.c
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index ec3bf98..b4db99b 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1366,7 +1366,7 @@ config LOCAL_TIMERS
> =A0 =A0 =A0 =A0bool "Use local timer interrupts"
> =A0 =A0 =A0 =A0depends on SMP
> =A0 =A0 =A0 =A0default y
> - =A0 =A0 =A0 select HAVE_ARM_TWD if !ARCH_MSM_SCORPIONMP
> + =A0 =A0 =A0 select HAVE_ARM_TWD if (!ARCH_MSM_SCORPIONMP && !EXYNOS=
4_MCT)
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Enable support for local timers on SMP platforms, =
rather then the
> =A0 =A0 =A0 =A0 =A0legacy IPI broadcast method. =A0Local timers allow=
s the system
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kc=
onfig
> index ad03840..77b5d93 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -15,6 +15,11 @@ config CPU_EXYNOS4210
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Enable EXYNOS4210 CPU support
>
> +config EXYNOS4_MCT
> + =A0 =A0 =A0 bool "Kernel timer support by MCT"
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Use MCT (Multi Core Timer) as kernel timers
> +
> =A0config EXYNOS4_DEV_PD
> =A0 =A0 =A0 =A0bool
> =A0 =A0 =A0 =A0help
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/M=
akefile
> index 0558235..de20b91 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -13,11 +13,18 @@ obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0:=3D
> =A0# Core support for EXYNOS4 system
>
> =A0obj-$(CONFIG_CPU_EXYNOS4210) =A0 +=3D cpu.o init.o clock.o irq-com=
biner.o
> -obj-$(CONFIG_CPU_EXYNOS4210) =A0 +=3D setup-i2c0.o time.o gpiolib.o =
irq-eint.o dma.o
> +obj-$(CONFIG_CPU_EXYNOS4210) =A0 +=3D setup-i2c0.o gpiolib.o irq-ein=
t.o dma.o
> =A0obj-$(CONFIG_CPU_FREQ) =A0 =A0 =A0 =A0 +=3D cpufreq.o
>
> =A0obj-$(CONFIG_SMP) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D platsmp.o headsm=
p.o
> -obj-$(CONFIG_LOCAL_TIMERS) =A0 =A0 +=3D localtimer.o
> +
> +ifeq ($(CONFIG_EXYNOS4_MCT),y)
> +obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D mct.o
> +else
> +obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D time.o
> +obj-$(CONFIG_LOCAL_TIMERS) =A0 =A0 +=3D localtimer.o
> +endif
> +
> =A0obj-$(CONFIG_HOTPLUG_CPU) =A0 =A0 =A0+=3D hotplug.o
>
> =A0# machine support
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-mct.h b/arch/arm=
/mach-exynos4/include/mach/regs-mct.h
> new file mode 100644
> index 0000000..ca9c843
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/include/mach/regs-mct.h
> @@ -0,0 +1,52 @@
> +/* arch/arm/mach-exynos4/include/mach/regs-mct.h
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + *
> + * EXYNOS4 MCT configutation
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_REGS_MCT_H
> +#define __ASM_ARCH_REGS_MCT_H __FILE__
> +
> +#include <mach/map.h>
> +
> +#define EXYNOS4_MCTREG(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0(S5P_VA_SYSTIME=
R + (x))
> +
> +#define EXYNOS4_MCT_G_CNT_L =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_MCTREG(0x=
100)
> +#define EXYNOS4_MCT_G_CNT_U =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_MCTREG(0x=
104)
> +#define EXYNOS4_MCT_G_CNT_WSTAT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNO=
S4_MCTREG(0x110)
> +
> +#define EXYNOS4_MCT_G_COMP0_L =A0 =A0 =A0 =A0 =A0EXYNOS4_MCTREG(0x20=
0)
> +#define EXYNOS4_MCT_G_COMP0_U =A0 =A0 =A0 =A0 =A0EXYNOS4_MCTREG(0x20=
4)
> +#define EXYNOS4_MCT_G_COMP0_ADD_INCR =A0 EXYNOS4_MCTREG(0x208)
> +
> +#define EXYNOS4_MCT_G_TCON =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_MCTREG(0x=
240)
> +
> +#define EXYNOS4_MCT_G_INT_CSTAT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNO=
S4_MCTREG(0x244)
> +#define EXYNOS4_MCT_G_INT_ENB =A0 =A0 =A0 =A0 =A0EXYNOS4_MCTREG(0x24=
8)
> +#define EXYNOS4_MCT_G_WSTAT =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_MCTREG(0x=
24C)
> +
> +#define EXYNOS4_MCT_L0_BASE =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_MCTREG(0x=
300)
> +#define EXYNOS4_MCT_L1_BASE =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_MCTREG(0x=
400)
> +
> +#define MCT_L_TCNTB_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 (0x00)
> +#define MCT_L_ICNTB_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 (0x08)
> +#define MCT_L_TCON_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x20)
> +#define MCT_L_INT_CSTAT_OFFSET =A0 =A0 =A0 =A0 (0x30)
> +#define MCT_L_INT_ENB_OFFSET =A0 =A0 =A0 =A0 =A0 (0x34)
> +#define MCT_L_WSTAT_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 (0x40)
> +
> +#define MCT_G_TCON_START =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 << 8)
> +#define MCT_G_TCON_COMP0_AUTO_INC =A0 =A0 =A0(1 << 1)
> +#define MCT_G_TCON_COMP0_ENABLE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 <<=
 0)
> +
> +#define MCT_L_TCON_INTERVAL_MODE =A0 =A0 =A0 (1 << 2)
> +#define MCT_L_TCON_INT_START =A0 =A0 =A0 =A0 =A0 (1 << 1)
> +#define MCT_L_TCON_TIMER_START =A0 =A0 =A0 =A0 (1 << 0)
> +
> +#endif /* __ASM_ARCH_REGS_MCT_H */
> diff --git a/arch/arm/mach-exynos4/mct.c b/arch/arm/mach-exynos4/mct.=
c
> new file mode 100644
> index 0000000..6bb4b50
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/mct.c
> @@ -0,0 +1,421 @@
> +/* linux/arch/arm/mach-exynos4/mct.c
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + *
> + * EXYNOS4 MCT(Multi-Core Timer) support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/sched.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/err.h>
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/platform_device.h>
> +#include <linux/delay.h>
> +#include <linux/percpu.h>
> +
> +#include <mach/map.h>
> +#include <mach/regs-mct.h>
> +#include <asm/mach/time.h>
> +
> +static unsigned long clk_cnt_per_tick;
> +static unsigned long clk_rate;
> +
> +struct mct_clock_event_device {
> + =A0 =A0 =A0 struct clock_event_device *evt;
> + =A0 =A0 =A0 void __iomem *base;
> +};
> +
> +struct mct_clock_event_device mct_tick[2];
> +
> +static void exynos4_mct_write(unsigned int value, void *addr)
> +{
> + =A0 =A0 =A0 void __iomem *stat_addr;
> + =A0 =A0 =A0 u32 mask;
> + =A0 =A0 =A0 u32 i;
> +
> + =A0 =A0 =A0 __raw_writel(value, addr);
> +
> + =A0 =A0 =A0 switch ((u32) addr) {
> + =A0 =A0 =A0 case (u32) EXYNOS4_MCT_G_TCON:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat_addr =3D EXYNOS4_MCT_G_WSTAT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << 16; =A0 =A0 =A0 =A0 /* G_=
TCON write status */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case (u32) EXYNOS4_MCT_G_COMP0_L:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat_addr =3D EXYNOS4_MCT_G_WSTAT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << 0; =A0 =A0 =A0 =A0 =A0/* =
G_COMP0_L write status */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case (u32) EXYNOS4_MCT_G_COMP0_U:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat_addr =3D EXYNOS4_MCT_G_WSTAT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << 1; =A0 =A0 =A0 =A0 =A0/* =
G_COMP0_U write status */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case (u32) EXYNOS4_MCT_G_COMP0_ADD_INCR:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat_addr =3D EXYNOS4_MCT_G_WSTAT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << 2; =A0 =A0 =A0 =A0 =A0/* =
G_COMP0_ADD_INCR write status */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case (u32) EXYNOS4_MCT_G_CNT_L:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat_addr =3D EXYNOS4_MCT_G_CNT_WSTAT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << 0; =A0 =A0 =A0 =A0 =A0/* =
G_CNT_L write status */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case (u32) EXYNOS4_MCT_G_CNT_U:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat_addr =3D EXYNOS4_MCT_G_CNT_WSTAT;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << 1; =A0 =A0 =A0 =A0 =A0/* =
G_CNT_U write status */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case (u32)(EXYNOS4_MCT_L0_BASE + MCT_L_TCON_OFFSET):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat_addr =3D EXYNOS4_MCT_L0_BASE + MCT=
_L_WSTAT_OFFSET;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << 3; =A0 =A0 =A0 =A0 =A0/* =
L0_TCON write status */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case (u32)(EXYNOS4_MCT_L1_BASE + MCT_L_TCON_OFFSET):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat_addr =3D EXYNOS4_MCT_L1_BASE + MCT=
_L_WSTAT_OFFSET;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << 3; =A0 =A0 =A0 =A0 =A0/* =
L1_TCON write status */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case (u32)(EXYNOS4_MCT_L0_BASE + MCT_L_TCNTB_OFFSET):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat_addr =3D EXYNOS4_MCT_L0_BASE + MCT=
_L_WSTAT_OFFSET;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << 0; =A0 =A0 =A0 =A0 =A0/* =
L0_TCNTB write status */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case (u32)(EXYNOS4_MCT_L1_BASE + MCT_L_TCNTB_OFFSET):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat_addr =3D EXYNOS4_MCT_L1_BASE + MCT=
_L_WSTAT_OFFSET;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << 0; =A0 =A0 =A0 =A0 =A0/* =
L1_TCNTB write status */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case (u32)(EXYNOS4_MCT_L0_BASE + MCT_L_ICNTB_OFFSET):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat_addr =3D EXYNOS4_MCT_L0_BASE + MCT=
_L_WSTAT_OFFSET;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << 1; =A0 =A0 =A0 =A0 =A0/* =
L0_ICNTB write status */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case (u32)(EXYNOS4_MCT_L1_BASE + MCT_L_ICNTB_OFFSET):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat_addr =3D EXYNOS4_MCT_L1_BASE + MCT=
_L_WSTAT_OFFSET;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mask =3D 1 << 1; =A0 =A0 =A0 =A0 =A0/* =
L1_ICNTB write status */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Wait maximum 1 ms until written values are applied *=
/
> + =A0 =A0 =A0 for (i =3D 0; i < loops_per_jiffy / 1000 * HZ; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (__raw_readl(stat_addr) & mask) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(mask, stat=
_addr);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 panic("MCT hangs after writing %d (addr:0x%08x)\n", val=
ue, (u32)addr);
> +}
> +
> +/* Clocksource handling */
> +static void exynos4_mct_frc_start(u32 hi, u32 lo)
> +{
> + =A0 =A0 =A0 u32 reg;
> +
> + =A0 =A0 =A0 exynos4_mct_write(lo, EXYNOS4_MCT_G_CNT_L);
> + =A0 =A0 =A0 exynos4_mct_write(hi, EXYNOS4_MCT_G_CNT_U);
> +
> + =A0 =A0 =A0 reg =3D __raw_readl(EXYNOS4_MCT_G_TCON);
> + =A0 =A0 =A0 reg |=3D MCT_G_TCON_START;
> + =A0 =A0 =A0 exynos4_mct_write(reg, EXYNOS4_MCT_G_TCON);
> +}
> +
> +static cycle_t exynos4_frc_read(struct clocksource *cs)
> +{
> + =A0 =A0 =A0 unsigned int lo, hi;
> + =A0 =A0 =A0 u32 hi2 =3D __raw_readl(EXYNOS4_MCT_G_CNT_U);
> +
> + =A0 =A0 =A0 do {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 hi =3D hi2;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 lo =3D __raw_readl(EXYNOS4_MCT_G_CNT_L)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 hi2 =3D __raw_readl(EXYNOS4_MCT_G_CNT_U=
);
> + =A0 =A0 =A0 } while (hi !=3D hi2);
> +
> + =A0 =A0 =A0 return ((cycle_t)hi << 32) | lo;
> +}
> +
> +struct clocksource mct_frc =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mct-frc",
> + =A0 =A0 =A0 .rating =A0 =A0 =A0 =A0 =3D 400,
> + =A0 =A0 =A0 .read =A0 =A0 =A0 =A0 =A0 =3D exynos4_frc_read,
> + =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D CLOCKSOURCE_MASK(64),
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D CLOCK_SOURCE_IS_CONTINUOU=
S,
> +};
> +
> +static void __init exynos4_clocksource_init(void)
> +{
> + =A0 =A0 =A0 exynos4_mct_frc_start(0, 0);
> +
> + =A0 =A0 =A0 if (clocksource_register_hz(&mct_frc, clk_rate))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("%s: can't register clocksource\n=
", mct_frc.name);
> +}
> +
> +static void exynos4_mct_comp0_stop(void)
> +{
> + =A0 =A0 =A0 unsigned int tcon;
> +
> + =A0 =A0 =A0 tcon =3D __raw_readl(EXYNOS4_MCT_G_TCON);
> + =A0 =A0 =A0 tcon &=3D ~(MCT_G_TCON_COMP0_ENABLE | MCT_G_TCON_COMP0_=
AUTO_INC);
> +
> + =A0 =A0 =A0 exynos4_mct_write(tcon, EXYNOS4_MCT_G_TCON);
> + =A0 =A0 =A0 exynos4_mct_write(0, EXYNOS4_MCT_G_INT_ENB);
> +}
> +
> +static void exynos4_mct_comp0_start(enum clock_event_mode mode,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 unsigned long cycles)
> +{
> + =A0 =A0 =A0 unsigned int tcon;
> + =A0 =A0 =A0 cycle_t comp_cycle;
> +
> + =A0 =A0 =A0 tcon =3D __raw_readl(EXYNOS4_MCT_G_TCON);
> +
> + =A0 =A0 =A0 if (mode =3D=3D CLOCK_EVT_MODE_PERIODIC) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D MCT_G_TCON_COMP0_AUTO_INC;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_mct_write(cycles, EXYNOS4_MCT_G=
_COMP0_ADD_INCR);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 comp_cycle =3D exynos4_frc_read(&mct_frc) + cycles;
> + =A0 =A0 =A0 exynos4_mct_write((u32)comp_cycle, EXYNOS4_MCT_G_COMP0_=
L);
> + =A0 =A0 =A0 exynos4_mct_write((u32)(comp_cycle >> 32), EXYNOS4_MCT_=
G_COMP0_U);
> +
> + =A0 =A0 =A0 exynos4_mct_write(0x1, EXYNOS4_MCT_G_INT_ENB);
> +
> + =A0 =A0 =A0 tcon |=3D MCT_G_TCON_COMP0_ENABLE;
> + =A0 =A0 =A0 exynos4_mct_write(tcon , EXYNOS4_MCT_G_TCON);
> +}
> +
> +static int exynos4_comp_set_next_event(unsigned long cycles,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0struct clock_event_device *evt)
> +{
> + =A0 =A0 =A0 exynos4_mct_comp0_start(evt->mode, cycles);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static void exynos4_comp_set_mode(enum clock_event_mode mode,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 str=
uct clock_event_device *evt)
> +{
> + =A0 =A0 =A0 exynos4_mct_comp0_stop();
> +
> + =A0 =A0 =A0 switch (mode) {
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_PERIODIC:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_mct_comp0_start(mode, clk_cnt_p=
er_tick);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_ONESHOT:
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_UNUSED:
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_SHUTDOWN:
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_RESUME:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +}
> +
> +static struct clock_event_device mct_comp_device =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mct-comp",
> + =A0 =A0 =A0 .features =A0 =A0 =A0 =3D CLOCK_EVT_FEAT_PERIODIC | CLO=
CK_EVT_FEAT_ONESHOT,
> + =A0 =A0 =A0 .rating =A0 =A0 =A0 =A0 =3D 250,
> + =A0 =A0 =A0 .set_next_event =3D exynos4_comp_set_next_event,
> + =A0 =A0 =A0 .set_mode =A0 =A0 =A0 =3D exynos4_comp_set_mode,
> +};
> +
> +static irqreturn_t exynos4_mct_comp_isr(int irq, void *dev_id)
> +{
> + =A0 =A0 =A0 struct clock_event_device *evt =3D dev_id;
> +
> + =A0 =A0 =A0 exynos4_mct_write(0x1, EXYNOS4_MCT_G_INT_CSTAT);
> +
> + =A0 =A0 =A0 evt->event_handler(evt);
> +
> + =A0 =A0 =A0 return IRQ_HANDLED;
> +}
> +
> +static struct irqaction mct_comp_event_irq =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mct_comp_irq",
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D IRQF_TIMER | IRQF_IRQPOLL=
,
> + =A0 =A0 =A0 .handler =A0 =A0 =A0 =A0=3D exynos4_mct_comp_isr,
> + =A0 =A0 =A0 .dev_id =A0 =A0 =A0 =A0 =3D &mct_comp_device,
> +};
> +
> +static void exynos4_clockevent_init(void)
> +{
> + =A0 =A0 =A0 clk_cnt_per_tick =3D clk_rate / 2 / HZ;
> +
> + =A0 =A0 =A0 clockevents_calc_mult_shift(&mct_comp_device, clk_rate =
/ 2, 5);
> + =A0 =A0 =A0 mct_comp_device.max_delta_ns =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(0xffffffff, &mct_co=
mp_device);
> + =A0 =A0 =A0 mct_comp_device.min_delta_ns =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(0xf, &mct_comp_devi=
ce);
> + =A0 =A0 =A0 mct_comp_device.cpumask =3D cpumask_of(0);
> + =A0 =A0 =A0 clockevents_register_device(&mct_comp_device);
> +
> + =A0 =A0 =A0 setup_irq(IRQ_MCT_G0, &mct_comp_event_irq);
> +}
> +
> +#ifdef CONFIG_LOCAL_TIMERS
> +/* Clock event handling */
> +static void exynos4_mct_tick_stop(struct mct_clock_event_device *mev=
t)
> +{
> + =A0 =A0 =A0 unsigned long tmp;
> + =A0 =A0 =A0 unsigned long mask =3D MCT_L_TCON_INT_START | MCT_L_TCO=
N_TIMER_START;
> + =A0 =A0 =A0 void __iomem *addr =3D mevt->base + MCT_L_TCON_OFFSET;
> +
> + =A0 =A0 =A0 tmp =3D __raw_readl(addr);
> + =A0 =A0 =A0 if (tmp & mask) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp &=3D ~mask;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_mct_write(tmp, addr);
> + =A0 =A0 =A0 }
> +}
> +
> +static void exynos4_mct_tick_start(unsigned long cycles,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
struct mct_clock_event_device *mevt)
> +{
> + =A0 =A0 =A0 unsigned long tmp;
> +
> + =A0 =A0 =A0 exynos4_mct_tick_stop(mevt);
> +
> + =A0 =A0 =A0 tmp =3D (1 << 31) | cycles; =A0 =A0 =A0 /* MCT_L_UPDATE=
_ICNTB */
> +
> + =A0 =A0 =A0 /* update interrupt count buffer */
> + =A0 =A0 =A0 exynos4_mct_write(tmp, mevt->base + MCT_L_ICNTB_OFFSET)=
;
> +
> + =A0 =A0 =A0 /* enable MCT tick interupt */
> + =A0 =A0 =A0 exynos4_mct_write(0x1, mevt->base + MCT_L_INT_ENB_OFFSE=
T);
> +
> + =A0 =A0 =A0 tmp =3D __raw_readl(mevt->base + MCT_L_TCON_OFFSET);
> + =A0 =A0 =A0 tmp |=3D MCT_L_TCON_INT_START | MCT_L_TCON_TIMER_START =
|
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0MCT_L_TCON_INTERVAL_MODE;
> + =A0 =A0 =A0 exynos4_mct_write(tmp, mevt->base + MCT_L_TCON_OFFSET);
> +}
> +
> +static int exynos4_tick_set_next_event(unsigned long cycles,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0struct clock_event_device *evt)
> +{
> + =A0 =A0 =A0 struct mct_clock_event_device *mevt =3D &mct_tick[smp_p=
rocessor_id()];
> +
> + =A0 =A0 =A0 exynos4_mct_tick_start(cycles, mevt);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static inline void exynos4_tick_set_mode(enum clock_event_mode mode,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0struct clock_event_device *evt)
> +{
> + =A0 =A0 =A0 struct mct_clock_event_device *mevt =3D &mct_tick[smp_p=
rocessor_id()];
> +
> + =A0 =A0 =A0 exynos4_mct_tick_stop(mevt);
> +
> + =A0 =A0 =A0 switch (mode) {
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_PERIODIC:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_mct_tick_start(clk_cnt_per_tick=
, mevt);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_ONESHOT:
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_UNUSED:
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_SHUTDOWN:
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_RESUME:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +}
> +
> +static irqreturn_t exynos4_mct_tick_isr(int irq, void *dev_id)
> +{
> + =A0 =A0 =A0 struct mct_clock_event_device *mevt =3D dev_id;
> + =A0 =A0 =A0 struct clock_event_device *evt =3D mevt->evt;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* This is for supporting oneshot mode.
> + =A0 =A0 =A0 =A0* Mct would generate interrupt periodically
> + =A0 =A0 =A0 =A0* without explicit stopping.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (evt->mode !=3D CLOCK_EVT_MODE_PERIODIC)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_mct_tick_stop(mevt);
> +
> + =A0 =A0 =A0 /* Clear the MCT tick interrupt */
> + =A0 =A0 =A0 exynos4_mct_write(0x1, mevt->base + MCT_L_INT_CSTAT_OFF=
SET);
> +
> + =A0 =A0 =A0 evt->event_handler(evt);
> +
> + =A0 =A0 =A0 return IRQ_HANDLED;
> +}
> +
> +static struct irqaction mct_tick0_event_irq =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mct_tick0_irq",
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D IRQF_TIMER | IRQF_NOBALAN=
CING,
> + =A0 =A0 =A0 .handler =A0 =A0 =A0 =A0=3D exynos4_mct_tick_isr,
> +};
> +
> +static struct irqaction mct_tick1_event_irq =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mct_tick1_irq",
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D IRQF_TIMER | IRQF_NOBALAN=
CING,
> + =A0 =A0 =A0 .handler =A0 =A0 =A0 =A0=3D exynos4_mct_tick_isr,
> +};
> +
> +static void exynos4_mct_tick_init(struct clock_event_device *evt)
> +{
> + =A0 =A0 =A0 unsigned int cpu =3D smp_processor_id();
> +
> + =A0 =A0 =A0 mct_tick[cpu].evt =3D evt;
> +
> + =A0 =A0 =A0 if (cpu =3D=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mct_tick[cpu].base =3D EXYNOS4_MCT_L0_B=
ASE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 evt->name =3D "mct_tick0";
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mct_tick[cpu].base =3D EXYNOS4_MCT_L1_B=
ASE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 evt->name =3D "mct_tick1";
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 evt->cpumask =3D cpumask_of(cpu);
> + =A0 =A0 =A0 evt->set_next_event =3D exynos4_tick_set_next_event;
> + =A0 =A0 =A0 evt->set_mode =3D exynos4_tick_set_mode;
> + =A0 =A0 =A0 evt->features =3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_F=
EAT_ONESHOT;
> + =A0 =A0 =A0 evt->rating =3D 450;
> +
> + =A0 =A0 =A0 clockevents_calc_mult_shift(evt, clk_rate / 2, 5);
> + =A0 =A0 =A0 evt->max_delta_ns =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(0x7fffffff, evt);
> + =A0 =A0 =A0 evt->min_delta_ns =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(0xf, evt);
> +
> + =A0 =A0 =A0 clockevents_register_device(evt);
> +
> + =A0 =A0 =A0 exynos4_mct_write(0x1, mct_tick[cpu].base + MCT_L_TCNTB=
_OFFSET);
> +
> + =A0 =A0 =A0 if (cpu =3D=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mct_tick0_event_irq.dev_id =3D &mct_tic=
k[cpu];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 setup_irq(IRQ_MCT_L0, &mct_tick0_event_=
irq);
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mct_tick1_event_irq.dev_id =3D &mct_tic=
k[cpu];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_set_affinity(IRQ_MCT1, cpumask_of(1=
));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 setup_irq(IRQ_MCT_L1, &mct_tick1_event_=
irq);
> + =A0 =A0 =A0 }
> +}
> +
> +/* Setup the local clock events for a CPU */
> +void __cpuinit local_timer_setup(struct clock_event_device *evt)
> +{
> + =A0 =A0 =A0 exynos4_mct_tick_init(evt);
> +}
> +
> +int local_timer_ack(void)
> +{
> + =A0 =A0 =A0 return 0;
> +}
> +
> +#endif /* CONFIG_LOCAL_TIMERS */
> +
> +static void __init exynos4_timer_resources(void)
> +{
> + =A0 =A0 =A0 struct clk *mct_clk;
> + =A0 =A0 =A0 mct_clk =3D clk_get(NULL, "xtal");
> +
> + =A0 =A0 =A0 clk_rate =3D clk_get_rate(mct_clk);
> +}
> +
> +static void __init exynos4_timer_init(void)
> +{
> + =A0 =A0 =A0 exynos4_timer_resources();
> + =A0 =A0 =A0 exynos4_clocksource_init();
> + =A0 =A0 =A0 exynos4_clockevent_init();
> +}
> +
> +struct sys_timer exynos4_timer =3D {
> + =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D exynos4_timer_init,
> +};
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
