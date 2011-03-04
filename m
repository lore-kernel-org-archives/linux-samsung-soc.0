From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH V2 1/3] ARM: S5P: Add s5p_timer support for HRT
Date: Fri, 4 Mar 2011 15:31:59 +0900
Message-ID: <AANLkTikywhikDP1a4cMb=SYDhVROn_mk+zkHVLcg92T+@mail.gmail.com>
References: <1299216099-7709-1-git-send-email-sbkim73@samsung.com>
	<1299216099-7709-2-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:56220 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751260Ab1CDGcA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Mar 2011 01:32:00 -0500
Received: by yxs7 with SMTP id 7so657384yxs.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Mar 2011 22:31:59 -0800 (PST)
In-Reply-To: <1299216099-7709-2-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

On Fri, Mar 4, 2011 at 2:21 PM, Sangbeom Kim <sbkim73@samsung.com> wrot=
e:
> This patch adds support HR-Timer(High Resolution Timer) and dynamic
> tick system for S5P SoCs. There are many clock sources for HR-Timer
> on S5P SoCs. The PWM timer, RTC, System Timer, and MCT can be used
> for clock source.
> This patch can only support PWM timer for clocksource of
> S5P64x0 and S5PV210.
>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
1 +
> =A0arch/arm/plat-s5p/include/plat/s5p-time.h | =A0 40 +++
> =A0arch/arm/plat-s5p/s5p-time.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0452 +=
++++++++++++++++++++++++++++
> =A03 files changed, 493 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/plat-s5p/include/plat/s5p-time.h
> =A0create mode 100644 arch/arm/plat-s5p/s5p-time.c
>
> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
> index 4bd5cf9..3b8cc2f 100644
> --- a/arch/arm/plat-s5p/Makefile
> +++ b/arch/arm/plat-s5p/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_S5P_GPIO_INT) =A0 =A0+=3D irq-gpioint.=
o
> =A0obj-$(CONFIG_S5P_SYSTEM_MMU) =A0 +=3D sysmmu.o
> =A0obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm.o
> =A0obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D irq-pm.o
> +obj-$(CONFIG_GENERIC_CLOCKEVENTS) +=3D s5p-time.o

Do you test it with exynos4 configuration? it's affect the exynos compi=
le.
=46irst select SAMSUNG_DEV_PWM, it can't compile it since no init_sched=
_clock
Second select HAVE_SCHED_CLOCK, it can't boot.

I used the for-exynos4 branch.

Thank you,
Kyungmin Park
>
> =A0# devices
>
> diff --git a/arch/arm/plat-s5p/include/plat/s5p-time.h b/arch/arm/pla=
t-s5p/include/plat/s5p-time.h
> new file mode 100644
> index 0000000..9956136
> --- /dev/null
> +++ b/arch/arm/plat-s5p/include/plat/s5p-time.h
> @@ -0,0 +1,40 @@
> +/* linux/arch/arm/plat-s5p/include/plat/s5p-time.h
> + *
> + * Copyright 2011 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * Header file for s5p time support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_PLAT_S5P_TIME_H
> +#define __ASM_PLAT_S5P_TIME_H __FILE__
> +
> +/* S5P HR-Timer Clock mode */
> +enum s5p_timer_mode {
> + =A0 =A0 =A0 S5P_PWM0,
> + =A0 =A0 =A0 S5P_PWM1,
> + =A0 =A0 =A0 S5P_PWM2,
> + =A0 =A0 =A0 S5P_PWM3,
> + =A0 =A0 =A0 S5P_PWM4,
> +};
> +
> +struct s5p_timer_source {
> + =A0 =A0 =A0 unsigned int event_id;
> + =A0 =A0 =A0 unsigned int source_id;
> +};
> +
> +/* Be able to sleep for atleast 4 seconds (usually more) */
> +#define S5PTIMER_MIN_RANGE =A0 =A0 4
> +
> +#define TCNT_MAX =A0 =A0 =A0 =A0 =A0 =A0 =A0 0xffffffff
> +#define NON_PERIODIC =A0 =A0 =A0 =A0 =A0 0
> +#define PERIODIC =A0 =A0 =A0 =A0 =A0 =A0 =A0 1
> +
> +extern void __init s5p_set_timer_source(enum s5p_timer_mode event,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 enum s5p_timer_mode source);
> +extern struct sys_timer s5p_timer;
> +#endif /* __ASM_PLAT_S5P_TIME_H */
> diff --git a/arch/arm/plat-s5p/s5p-time.c b/arch/arm/plat-s5p/s5p-tim=
e.c
> new file mode 100644
> index 0000000..1d2447e
> --- /dev/null
> +++ b/arch/arm/plat-s5p/s5p-time.c
> @@ -0,0 +1,452 @@
> +/* linux/arch/arm/plat-s5p/s5p-time.c
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * S5P - Common hr-timer support
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
> +
> +#include <asm/smp_twd.h>
> +#include <asm/mach/time.h>
> +#include <asm/mach/arch.h>
> +#include <asm/mach/map.h>
> +#include <asm/sched_clock.h>
> +
> +#include <mach/map.h>
> +#include <plat/devs.h>
> +#include <plat/regs-timer.h>
> +#include <plat/s5p-time.h>
> +
> +static struct clk *tin_event;
> +static struct clk *tin_source;
> +static struct clk *tdiv_event;
> +static struct clk *tdiv_source;
> +static struct clk *timerclk;
> +static struct s5p_timer_source timer_source;
> +static unsigned long clock_count_per_tick;
> +static void s5p_timer_resume(void);
> +
> +static void s5p_time_stop(enum s5p_timer_mode mode)
> +{
> + =A0 =A0 =A0 unsigned long tcon;
> +
> + =A0 =A0 =A0 tcon =3D __raw_readl(S3C2410_TCON);
> +
> + =A0 =A0 =A0 switch (mode) {
> + =A0 =A0 =A0 case S5P_PWM0:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON_T0START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM1:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON_T1START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM2:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON_T2START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM3:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON_T3START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON_T4START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Invalid Timer %d\n", m=
ode);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 __raw_writel(tcon, S3C2410_TCON);
> +}
> +
> +static void s5p_time_setup(enum s5p_timer_mode mode, unsigned long t=
cnt)
> +{
> + =A0 =A0 =A0 unsigned long tcon;
> +
> + =A0 =A0 =A0 tcon =3D __raw_readl(S3C2410_TCON);
> +
> + =A0 =A0 =A0 tcnt--;
> +
> + =A0 =A0 =A0 switch (mode) {
> + =A0 =A0 =A0 case S5P_PWM0:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~(0x0f << 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_T0MANUALUPD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM1:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~(0x0f << 8);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_T1MANUALUPD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM2:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~(0x0f << 12);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_T2MANUALUPD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM3:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~(0x0f << 16);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_T3MANUALUPD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~(0x07 << 20);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_T4MANUALUPD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Invalid Timer %d\n", m=
ode);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 __raw_writel(tcnt, S3C2410_TCNTB(mode));
> + =A0 =A0 =A0 __raw_writel(tcnt, S3C2410_TCMPB(mode));
> + =A0 =A0 =A0 __raw_writel(tcon, S3C2410_TCON);
> +}
> +
> +static void s5p_time_start(enum s5p_timer_mode mode, bool periodic)
> +{
> + =A0 =A0 =A0 unsigned long tcon;
> +
> + =A0 =A0 =A0 tcon =A0=3D __raw_readl(S3C2410_TCON);
> +
> + =A0 =A0 =A0 switch (mode) {
> + =A0 =A0 =A0 case S5P_PWM0:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_T0START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON_T0MANUALUPD;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (periodic)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_=
T0RELOAD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON=
_T0RELOAD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM1:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_T1START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON_T1MANUALUPD;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (periodic)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_=
T1RELOAD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON=
_T1RELOAD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM2:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_T2START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON_T2MANUALUPD;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (periodic)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_=
T2RELOAD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON=
_T2RELOAD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM3:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_T3START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON_T3MANUALUPD;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (periodic)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_=
T3RELOAD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON=
_T3RELOAD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_T4START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON_T4MANUALUPD;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (periodic)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_=
T4RELOAD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON=
_T4RELOAD;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Invalid Timer %d\n", m=
ode);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 __raw_writel(tcon, S3C2410_TCON);
> +}
> +
> +static int s5p_set_next_event(unsigned long cycles,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
clock_event_device *evt)
> +{
> + =A0 =A0 =A0 s5p_time_setup(timer_source.event_id, cycles);
> + =A0 =A0 =A0 s5p_time_start(timer_source.event_id, NON_PERIODIC);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static void s5p_set_mode(enum clock_event_mode mode,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
clock_event_device *evt)
> +{
> + =A0 =A0 =A0 s5p_time_stop(timer_source.event_id);
> +
> + =A0 =A0 =A0 switch (mode) {
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_PERIODIC:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s5p_time_setup(timer_source.event_id, c=
lock_count_per_tick);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s5p_time_start(timer_source.event_id, P=
ERIODIC);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_ONESHOT:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_UNUSED:
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_SHUTDOWN:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_RESUME:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s5p_timer_resume();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +}
> +
> +static void s5p_timer_resume(void)
> +{
> + =A0 =A0 =A0 /* event timer restart */
> + =A0 =A0 =A0 s5p_time_setup(timer_source.event_id, clock_count_per_t=
ick);
> + =A0 =A0 =A0 s5p_time_start(timer_source.event_id, PERIODIC);
> +
> + =A0 =A0 =A0 /* source timer restart */
> + =A0 =A0 =A0 s5p_time_setup(timer_source.source_id, TCNT_MAX);
> + =A0 =A0 =A0 s5p_time_start(timer_source.source_id, PERIODIC);
> +}
> +
> +void __init s5p_set_timer_source(enum s5p_timer_mode event,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enum=
 s5p_timer_mode source)
> +{
> + =A0 =A0 =A0 s3c_device_timer[event].dev.bus =3D &platform_bus_type;
> + =A0 =A0 =A0 s3c_device_timer[source].dev.bus =3D &platform_bus_type=
;
> +
> + =A0 =A0 =A0 timer_source.event_id =3D event;
> + =A0 =A0 =A0 timer_source.source_id =3D source;
> +}
> +
> +static struct clock_event_device time_event_device =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s5p_event_timer",
> + =A0 =A0 =A0 .features =A0 =A0 =A0 =3D CLOCK_EVT_FEAT_PERIODIC | CLO=
CK_EVT_FEAT_ONESHOT,
> + =A0 =A0 =A0 .rating =A0 =A0 =A0 =A0 =3D 200,
> + =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D 32,
> + =A0 =A0 =A0 .set_next_event =3D s5p_set_next_event,
> + =A0 =A0 =A0 .set_mode =A0 =A0 =A0 =3D s5p_set_mode,
> +};
> +
> +static irqreturn_t s5p_clock_event_isr(int irq, void *dev_id)
> +{
> + =A0 =A0 =A0 struct clock_event_device *evt =3D dev_id;
> +
> + =A0 =A0 =A0 evt->event_handler(evt);
> +
> + =A0 =A0 =A0 return IRQ_HANDLED;
> +}
> +
> +static struct irqaction s5p_clock_event_irq =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s5p_time_irq",
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D IRQF_DISABLED | IRQF_TIME=
R | IRQF_IRQPOLL,
> + =A0 =A0 =A0 .handler =A0 =A0 =A0 =A0=3D s5p_clock_event_isr,
> + =A0 =A0 =A0 .dev_id =A0 =A0 =A0 =A0 =3D &time_event_device,
> +};
> +
> +static void __init s5p_clockevent_init(void)
> +{
> + =A0 =A0 =A0 unsigned long pclk;
> + =A0 =A0 =A0 unsigned long clock_rate;
> + =A0 =A0 =A0 unsigned int irq_number;
> + =A0 =A0 =A0 struct clk *tscaler;
> +
> + =A0 =A0 =A0 pclk =3D clk_get_rate(timerclk);
> +
> + =A0 =A0 =A0 tscaler =3D clk_get_parent(tdiv_event);
> +
> + =A0 =A0 =A0 clk_set_rate(tscaler, pclk / 2);
> + =A0 =A0 =A0 clk_set_rate(tdiv_event, pclk / 2);
> + =A0 =A0 =A0 clk_set_parent(tin_event, tdiv_event);
> +
> + =A0 =A0 =A0 clock_rate =3D clk_get_rate(tin_event);
> + =A0 =A0 =A0 clock_count_per_tick =3D clock_rate / HZ;
> +
> + =A0 =A0 =A0 clockevents_calc_mult_shift(&time_event_device,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 clock_rate, S5PTIMER_MIN_RANGE);
> + =A0 =A0 =A0 time_event_device.max_delta_ns =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(-1, &time_event_dev=
ice);
> + =A0 =A0 =A0 time_event_device.min_delta_ns =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(1, &time_event_devi=
ce);
> +
> + =A0 =A0 =A0 time_event_device.cpumask =3D cpumask_of(0);
> + =A0 =A0 =A0 clockevents_register_device(&time_event_device);
> +
> + =A0 =A0 =A0 irq_number =3D timer_source.event_id + IRQ_TIMER0;
> + =A0 =A0 =A0 setup_irq(irq_number, &s5p_clock_event_irq);
> +}
> +
> +static cycle_t s5p_timer_read(struct clocksource *cs)
> +{
> + =A0 =A0 =A0 unsigned long offset =3D 0;
> +
> + =A0 =A0 =A0 switch (timer_source.source_id) {
> + =A0 =A0 =A0 case S5P_PWM0:
> + =A0 =A0 =A0 case S5P_PWM1:
> + =A0 =A0 =A0 case S5P_PWM2:
> + =A0 =A0 =A0 case S5P_PWM3:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 offset =3D (timer_source.source_id * 0x=
0c) + 0x14;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 offset =3D 0x40;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Invalid Timer %d\n", t=
imer_source.source_id);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return (cycle_t) ~__raw_readl(S3C_TIMERREG(offset));
> +}
> +
> +/*
> + * Override the global weak sched_clock symbol with this
> + * local implementation which uses the clocksource to get some
> + * better resolution when scheduling the kernel. We accept that
> + * this wraps around for now, since it is just a relative time
> + * stamp. (Inspired by U300 implementation.)
> + */
> +static DEFINE_CLOCK_DATA(cd);
> +
> +unsigned long long notrace sched_clock(void)
> +{
> + =A0 =A0 =A0 u32 cyc;
> + =A0 =A0 =A0 unsigned long offset =3D 0;
> +
> + =A0 =A0 =A0 switch (timer_source.source_id) {
> + =A0 =A0 =A0 case S5P_PWM0:
> + =A0 =A0 =A0 case S5P_PWM1:
> + =A0 =A0 =A0 case S5P_PWM2:
> + =A0 =A0 =A0 case S5P_PWM3:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 offset =3D (timer_source.source_id * 0x=
0c) + 0x14;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 offset =3D 0x40;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Invalid Timer %d\n", t=
imer_source.source_id);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 cyc =3D ~__raw_readl(S3C_TIMERREG(offset));
> + =A0 =A0 =A0 return cyc_to_sched_clock(&cd, cyc, (u32)~0);
> +}
> +
> +static void notrace s5p_update_sched_clock(void)
> +{
> + =A0 =A0 =A0 u32 cyc;
> + =A0 =A0 =A0 unsigned long offset =3D 0;
> +
> + =A0 =A0 =A0 switch (timer_source.source_id) {
> + =A0 =A0 =A0 case S5P_PWM0:
> + =A0 =A0 =A0 case S5P_PWM1:
> + =A0 =A0 =A0 case S5P_PWM2:
> + =A0 =A0 =A0 case S5P_PWM3:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 offset =3D (timer_source.source_id * 0x=
0c) + 0x14;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case S5P_PWM4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 offset =3D 0x40;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Invalid Timer %d\n", t=
imer_source.source_id);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 cyc =3D ~__raw_readl(S3C_TIMERREG(offset));
> + =A0 =A0 =A0 update_sched_clock(&cd, cyc, (u32)~0);
> +}
> +
> +struct clocksource time_clocksource =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "s5p_clocksource_timer",
> + =A0 =A0 =A0 .rating =A0 =A0 =A0 =A0 =3D 250,
> + =A0 =A0 =A0 .read =A0 =A0 =A0 =A0 =A0 =3D s5p_timer_read,
> + =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D CLOCKSOURCE_MASK(32),
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D CLOCK_SOURCE_IS_CONTINUOU=
S,
> +};
> +
> +static void __init s5p_clocksource_init(void)
> +{
> + =A0 =A0 =A0 unsigned long pclk;
> + =A0 =A0 =A0 unsigned long clock_rate;
> +
> + =A0 =A0 =A0 pclk =3D clk_get_rate(timerclk);
> +
> + =A0 =A0 =A0 clk_set_rate(tdiv_source, pclk / 2);
> + =A0 =A0 =A0 clk_set_parent(tin_source, tdiv_source);
> +
> + =A0 =A0 =A0 clock_rate =3D clk_get_rate(tin_source);
> +
> + =A0 =A0 =A0 init_sched_clock(&cd, s5p_update_sched_clock, 32, clock=
_rate);
> +
> + =A0 =A0 =A0 s5p_time_setup(timer_source.source_id, TCNT_MAX);
> + =A0 =A0 =A0 s5p_time_start(timer_source.source_id, PERIODIC);
> +
> + =A0 =A0 =A0 if (clocksource_register_hz(&time_clocksource, clock_ra=
te))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("%s: can't register clocksource\n=
", time_clocksource.name);
> +}
> +
> +static void __init s5p_timer_resources(void)
> +{
> +
> + =A0 =A0 =A0 unsigned long event_id =3D timer_source.event_id;
> + =A0 =A0 =A0 unsigned long source_id =3D timer_source.source_id;
> +
> + =A0 =A0 =A0 timerclk =3D clk_get(NULL, "timers");
> +
> + =A0 =A0 =A0 clk_enable(timerclk);
> +
> + =A0 =A0 =A0 if (IS_ERR(timerclk))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("failed to get timers clock for t=
imer");
> +
> + =A0 =A0 =A0 tin_event =3D clk_get(&s3c_device_timer[event_id].dev, =
"pwm-tin");
> +
> + =A0 =A0 =A0 if (IS_ERR(tin_event))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("failed to get pwm-tin clock for =
event timer");
> +
> + =A0 =A0 =A0 tdiv_event =3D clk_get(&s3c_device_timer[event_id].dev,=
 "pwm-tdiv");
> +
> + =A0 =A0 =A0 if (IS_ERR(tdiv_event))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("failed to get pwm-tdiv clock for=
 event timer");
> +
> + =A0 =A0 =A0 clk_enable(tin_event);
> +
> + =A0 =A0 =A0 tin_source =3D clk_get(&s3c_device_timer[source_id].dev=
, "pwm-tin");
> + =A0 =A0 =A0 if (IS_ERR(tin_source))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("failed to get pwm-tin clock for =
source timer");
> +
> + =A0 =A0 =A0 tdiv_source =3D clk_get(&s3c_device_timer[source_id].de=
v, "pwm-tdiv");
> + =A0 =A0 =A0 if (IS_ERR(tdiv_source))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("failed to get pwm-tdiv clock for=
 source timer");
> +
> + =A0 =A0 =A0 clk_enable(tin_source);
> +}
> +
> +static void __init s5p_timer_init(void)
> +{
> + =A0 =A0 =A0 s5p_timer_resources();
> + =A0 =A0 =A0 s5p_clockevent_init();
> + =A0 =A0 =A0 s5p_clocksource_init();
> +}
> +
> +struct sys_timer s5p_timer =3D {
> + =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D s5p_timer_init,
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
