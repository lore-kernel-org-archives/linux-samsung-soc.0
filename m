From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v2 5/8] ARM: S5PV310: Add Timer support
Date: Fri, 16 Jul 2010 19:30:45 +0900
Message-ID: <AANLkTimirpioNZmzLoWeAD9hN0gAmWodddeMyxsdY7A6@mail.gmail.com>
References: <1279270714-15146-1-git-send-email-kgene.kim@samsung.com>
	<1279270714-15146-6-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:63931 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964951Ab0GPKaq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jul 2010 06:30:46 -0400
Received: by pxi14 with SMTP id 14so853100pxi.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jul 2010 03:30:46 -0700 (PDT)
In-Reply-To: <1279270714-15146-6-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Hyuk Lee <hyuk1.lee@samsung.com>

On Fri, Jul 16, 2010 at 5:58 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> From: Changhwan Youn <chaos.youn@samsung.com>
>
> This patch adds timer support for S5PV310.
> Until now, all S5P SoCs use CONFIG_ARCH_USES_GETTIMEOFFSET macro as a=
 default
> configuration. Instead, S5PV310 implements clocksource and clock_even=
t_device
> to support the high resolution timer and tickless system.
>
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> Signed-off-by: Hyuk Lee <hyuk1.lee@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5pv310/include/mach/pwm-clock.h | =A0 70 ++++++
> =A0arch/arm/mach-s5pv310/localtimer.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 2=
5 ++
> =A0arch/arm/mach-s5pv310/time.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0287 ++++++++++++++++++++++++
> =A0arch/arm/plat-s5p/include/plat/s5pv310.h =A0 =A0 =A0 | =A0 =A01 +
> =A0arch/arm/plat-samsung/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A05 files changed, 384 insertions(+), 1 deletions(-)
> =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/pwm-clock.h
> =A0create mode 100644 arch/arm/mach-s5pv310/localtimer.c
> =A0create mode 100644 arch/arm/mach-s5pv310/time.c
>
> diff --git a/arch/arm/mach-s5pv310/include/mach/pwm-clock.h b/arch/ar=
m/mach-s5pv310/include/mach/pwm-clock.h
> new file mode 100644
> index 0000000..7e6da27
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/include/mach/pwm-clock.h
> @@ -0,0 +1,70 @@
> +/* linux/arch/arm/mach-s5pv310/include/mach/pwm-clock.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * Copyright 2008 Openmoko, Inc.
> + * Copyright 2008 Simtec Electronics
> + * =A0 =A0 =A0Ben Dooks <ben@simtec.co.uk>
> + * =A0 =A0 =A0http://armlinux.simtec.co.uk/
> + *
> + * Based on arch/arm/mach-s3c64xx/include/mach/pwm-clock.h
> + *
> + * S5PV310 - pwm clock and timer support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_PWMCLK_H
> +#define __ASM_ARCH_PWMCLK_H __FILE__
> +
> +/**
> + * pwm_cfg_src_is_tclk() - return whether the given mux config is a =
tclk
> + * @tcfg: The timer TCFG1 register bits shifted down to 0.
> + *
> + * Return true if the given configuration from TCFG1 is a TCLK inste=
ad
> + * any of the TDIV clocks.
> + */
> +static inline int pwm_cfg_src_is_tclk(unsigned long tcfg)
> +{
> + =A0 =A0 =A0 return tcfg =3D=3D S3C64XX_TCFG1_MUX_TCLK;
> +}
> +
> +/**
> + * tcfg_to_divisor() - convert tcfg1 setting to a divisor
> + * @tcfg1: The tcfg1 setting, shifted down.
> + *
> + * Get the divisor value for the given tcfg1 setting. We assume the
> + * caller has already checked to see if this is not a TCLK source.
> + */
> +static inline unsigned long tcfg_to_divisor(unsigned long tcfg1)
> +{
> + =A0 =A0 =A0 return 1 << tcfg1;
> +}
> +
> +/**
> + * pwm_tdiv_has_div1() - does the tdiv setting have a /1
> + *
> + * Return true if we have a /1 in the tdiv setting.
> + */
> +static inline unsigned int pwm_tdiv_has_div1(void)
> +{
> + =A0 =A0 =A0 return 1;
> +}
> +
> +/**
> + * pwm_tdiv_div_bits() - calculate TCFG1 divisor value.
> + * @div: The divisor to calculate the bit information for.
> + *
> + * Turn a divisor into the necessary bit field for TCFG1.
> + */
> +static inline unsigned long pwm_tdiv_div_bits(unsigned int div)
> +{
> + =A0 =A0 =A0 return ilog2(div);
> +}
> +
> +#define S3C_TCFG1_MUX_TCLK S3C64XX_TCFG1_MUX_TCLK
> +
> +#endif /* __ASM_ARCH_PWMCLK_H */
> diff --git a/arch/arm/mach-s5pv310/localtimer.c b/arch/arm/mach-s5pv3=
10/localtimer.c
> new file mode 100644
> index 0000000..2784036
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/localtimer.c
> @@ -0,0 +1,25 @@
> +/* linux/arch/arm/mach-s5pv310/localtimer.c
> + *
> + * Cloned from linux/arch/arm/mach-realview/localtimer.c
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
> +#include <linux/clockchips.h>
> +
> +#include <asm/irq.h>
> +#include <asm/localtimer.h>
> +
> +/*
> + * Setup the local clock events for a CPU.
> + */
> +void __cpuinit local_timer_setup(struct clock_event_device *evt)
> +{
> + =A0 =A0 =A0 evt->irq =3D IRQ_LOCALTIMER;
> + =A0 =A0 =A0 twd_timer_setup(evt);
> +}
> diff --git a/arch/arm/mach-s5pv310/time.c b/arch/arm/mach-s5pv310/tim=
e.c
> new file mode 100644
> index 0000000..64accf8
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/time.c
> @@ -0,0 +1,287 @@
> +/* linux/arch/arm/mach-s5pv310/time.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + *
> + * S5PV310 (and compatible) HRT support
> + * PWM 2/4 is used for this feature

Please make it configurable, now PWM 2 is used for I2C pin in mobile ha=
rdware.
It seems to smdk specific file.

Why don't use the systimer?

Thank you,
Kyungmin Park

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
> +
> +#include <mach/map.h>
> +#include <plat/regs-timer.h>
> +#include <asm/mach/time.h>
> +
> +static unsigned long clock_count_per_tick;
> +
> +static struct clk *tin2;
> +static struct clk *tin4;
> +static struct clk *tdiv2;
> +static struct clk *tdiv4;
> +static struct clk *timerclk;
> +
> +static void s5pv310_pwm_stop(unsigned int pwm_id)
> +{
> + =A0 =A0 =A0 unsigned long tcon;
> +
> + =A0 =A0 =A0 tcon =3D __raw_readl(S3C2410_TCON);
> +
> + =A0 =A0 =A0 switch (pwm_id) {
> + =A0 =A0 =A0 case 2:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON_T2START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case 4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~S3C2410_TCON_T4START;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 __raw_writel(tcon, S3C2410_TCON);
> +}
> +
> +static void s5pv310_pwm_init(unsigned int pwm_id, unsigned long tcnt=
)
> +{
> + =A0 =A0 =A0 unsigned long tcon;
> +
> + =A0 =A0 =A0 tcon =3D __raw_readl(S3C2410_TCON);
> +
> + =A0 =A0 =A0 /* timers reload after counting zero, so reduce the cou=
nt by 1 */
> + =A0 =A0 =A0 tcnt--;
> +
> + =A0 =A0 =A0 /* ensure timer is stopped... */
> + =A0 =A0 =A0 switch (pwm_id) {
> + =A0 =A0 =A0 case 2:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~(0xf<<12);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_T2MANUALUPD;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(tcnt, S3C2410_TCNTB(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(tcnt, S3C2410_TCMPB(2));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(tcon, S3C2410_TCON);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case 4:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon &=3D ~(7<<20);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tcon |=3D S3C2410_TCON_T4MANUALUPD;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(tcnt, S3C2410_TCNTB(4));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(tcnt, S3C2410_TCMPB(4));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(tcon, S3C2410_TCON);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +}
> +
> +static inline void s5pv310_pwm_start(unsigned int pwm_id, bool perio=
dic)
> +{
> + =A0 =A0 =A0 unsigned long tcon;
> +
> + =A0 =A0 =A0 tcon =A0=3D __raw_readl(S3C2410_TCON);
> +
> + =A0 =A0 =A0 switch (pwm_id) {
> + =A0 =A0 =A0 case 2:
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
> + =A0 =A0 =A0 case 4:
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
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 __raw_writel(tcon, S3C2410_TCON);
> +}
> +
> +static int s5pv310_pwm_set_next_event(unsigned long cycles,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct clock_event_device *evt)
> +{
> + =A0 =A0 =A0 s5pv310_pwm_init(4, cycles);
> + =A0 =A0 =A0 s5pv310_pwm_start(4, 0);
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static void s5pv310_pwm_set_mode(enum clock_event_mode mode,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
clock_event_device *evt)
> +{
> + =A0 =A0 =A0 s5pv310_pwm_stop(4);
> +
> + =A0 =A0 =A0 switch (mode) {
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_PERIODIC:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s5pv310_pwm_init(4, clock_count_per_tic=
k);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s5pv310_pwm_start(4, 1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_ONESHOT:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_UNUSED:
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_SHUTDOWN:
> + =A0 =A0 =A0 case CLOCK_EVT_MODE_RESUME:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +}
> +
> +static struct clock_event_device pwm_event_device =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pwm_timer4",
> + =A0 =A0 =A0 .features =A0 =A0 =A0 =3D CLOCK_EVT_FEAT_PERIODIC | CLO=
CK_EVT_FEAT_ONESHOT,
> + =A0 =A0 =A0 .rating =A0 =A0 =A0 =A0 =3D 200,
> + =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D 32,
> + =A0 =A0 =A0 .set_next_event =3D s5pv310_pwm_set_next_event,
> + =A0 =A0 =A0 .set_mode =A0 =A0 =A0 =3D s5pv310_pwm_set_mode,
> +};
> +
> +irqreturn_t s5pv310_clock_event_isr(int irq, void *dev_id)
> +{
> + =A0 =A0 =A0 struct clock_event_device *evt =3D &pwm_event_device;
> +
> + =A0 =A0 =A0 evt->event_handler(evt);
> +
> + =A0 =A0 =A0 return IRQ_HANDLED;
> +}
> +
> +static struct irqaction s5pv310_clock_event_irq =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pwm_timer4_irq",
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D IRQF_DISABLED | IRQF_TIME=
R | IRQF_IRQPOLL,
> + =A0 =A0 =A0 .handler =A0 =A0 =A0 =A0=3D s5pv310_clock_event_isr,
> +};
> +
> +static void __init s5pv310_clockevent_init(void)
> +{
> + =A0 =A0 =A0 unsigned long pclk;
> + =A0 =A0 =A0 unsigned long clock_rate;
> + =A0 =A0 =A0 struct clk *tscaler;
> +
> + =A0 =A0 =A0 pclk =3D clk_get_rate(timerclk);
> +
> + =A0 =A0 =A0 /* configure clock tick */
> +
> + =A0 =A0 =A0 tscaler =3D clk_get_parent(tdiv4);
> +
> + =A0 =A0 =A0 clk_set_rate(tscaler, pclk / 2);
> + =A0 =A0 =A0 clk_set_rate(tdiv4, pclk / 2);
> + =A0 =A0 =A0 clk_set_parent(tin4, tdiv4);
> +
> + =A0 =A0 =A0 clock_rate =3D clk_get_rate(tin4);
> +
> + =A0 =A0 =A0 clock_count_per_tick =3D clock_rate / HZ;
> +
> + =A0 =A0 =A0 pwm_event_device.mult =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 div_sc(clock_rate, NSEC_PER_SEC, pwm_ev=
ent_device.shift);
> + =A0 =A0 =A0 pwm_event_device.max_delta_ns =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(-1, &pwm_event_devi=
ce);
> + =A0 =A0 =A0 pwm_event_device.min_delta_ns =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(1, &pwm_event_devic=
e);
> +
> + =A0 =A0 =A0 pwm_event_device.cpumask =3D cpumask_of(0);
> + =A0 =A0 =A0 clockevents_register_device(&pwm_event_device);
> +
> + =A0 =A0 =A0 setup_irq(IRQ_TIMER4, &s5pv310_clock_event_irq);
> +}
> +
> +static cycle_t s5pv310_pwm2_read(struct clocksource *cs)
> +{
> + =A0 =A0 =A0 return (cycle_t) ~__raw_readl(S3C_TIMERREG(0x2c));
> +}
> +
> +struct clocksource pwm_clocksource =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pwm_timer2",
> + =A0 =A0 =A0 .rating =A0 =A0 =A0 =A0 =3D 250,
> + =A0 =A0 =A0 .read =A0 =A0 =A0 =A0 =A0 =3D s5pv310_pwm2_read,
> + =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D CLOCKSOURCE_MASK(32),
> + =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D 20,
> + =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D CLOCK_SOURCE_IS_CONTINUOU=
S ,
> +};
> +
> +static void __init s5pv310_clocksource_init(void)
> +{
> + =A0 =A0 =A0 unsigned long pclk;
> + =A0 =A0 =A0 unsigned long clock_rate;
> +
> + =A0 =A0 =A0 pclk =3D clk_get_rate(timerclk);
> +
> + =A0 =A0 =A0 clk_set_rate(tdiv2, pclk / 2);
> + =A0 =A0 =A0 clk_set_parent(tin2, tdiv2);
> +
> + =A0 =A0 =A0 clock_rate =3D clk_get_rate(tin2);
> +
> + =A0 =A0 =A0 s5pv310_pwm_init(2, ~0);
> + =A0 =A0 =A0 s5pv310_pwm_start(2, 1);
> +
> + =A0 =A0 =A0 pwm_clocksource.mult =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clocksource_khz2mult(clock_rate/1000, p=
wm_clocksource.shift);
> +
> + =A0 =A0 =A0 if (clocksource_register(&pwm_clocksource))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("%s: can't register clocksource\n=
", pwm_clocksource.name);
> +}
> +
> +static void __init s5pv310_timer_resources(void)
> +{
> + =A0 =A0 =A0 struct platform_device tmpdev;
> +
> + =A0 =A0 =A0 tmpdev.dev.bus =3D &platform_bus_type;
> +
> + =A0 =A0 =A0 timerclk =3D clk_get(NULL, "timers");
> + =A0 =A0 =A0 if (IS_ERR(timerclk))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("failed to get timers clock for s=
ystem timer");
> +
> + =A0 =A0 =A0 clk_enable(timerclk);
> +
> + =A0 =A0 =A0 tmpdev.id =3D 2;
> + =A0 =A0 =A0 tin2 =3D clk_get(&tmpdev.dev, "pwm-tin");
> + =A0 =A0 =A0 if (IS_ERR(tin2))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("failed to get pwm-tin2 clock for=
 system timer");
> +
> + =A0 =A0 =A0 tdiv2 =3D clk_get(&tmpdev.dev, "pwm-tdiv");
> + =A0 =A0 =A0 if (IS_ERR(tdiv2))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("failed to get pwm-tdiv2 clock fo=
r system timer");
> + =A0 =A0 =A0 clk_enable(tin2);
> +
> + =A0 =A0 =A0 tmpdev.id =3D 4;
> + =A0 =A0 =A0 tin4 =3D clk_get(&tmpdev.dev, "pwm-tin");
> + =A0 =A0 =A0 if (IS_ERR(tin4))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("failed to get pwm-tin4 clock for=
 system timer");
> +
> + =A0 =A0 =A0 tdiv4 =3D clk_get(&tmpdev.dev, "pwm-tdiv");
> + =A0 =A0 =A0 if (IS_ERR(tdiv4))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 panic("failed to get pwm-tdiv4 clock fo=
r system timer");
> +
> + =A0 =A0 =A0 clk_enable(tin4);
> +}
> +
> +static void __init s5pv310_timer_init(void)
> +{
> +#ifdef CONFIG_LOCAL_TIMERS
> + =A0 =A0 =A0 twd_base =3D S5P_VA_TWD;
> +#endif
> +
> + =A0 =A0 =A0 s5pv310_timer_resources();
> + =A0 =A0 =A0 s5pv310_clockevent_init();
> + =A0 =A0 =A0 s5pv310_clocksource_init();
> +}
> +
> +struct sys_timer s5pv310_timer =3D {
> + =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D s5pv310_timer_init,
> +};
> diff --git a/arch/arm/plat-s5p/include/plat/s5pv310.h b/arch/arm/plat=
-s5p/include/plat/s5pv310.h
> index d2f05e1..769c991 100644
> --- a/arch/arm/plat-s5p/include/plat/s5pv310.h
> +++ b/arch/arm/plat-s5p/include/plat/s5pv310.h
> @@ -22,6 +22,7 @@ extern =A0int s5pv310_init(void);
> =A0extern void s5pv310_init_irq(void);
> =A0extern void s5pv310_map_io(void);
> =A0extern void s5pv310_init_clocks(int xtal);
> +extern struct sys_timer s5pv310_timer;
>
> =A0#define s5pv310_init_uarts s5pv310_common_init_uarts
>
> diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/M=
akefile
> index b1d82cc..0d5bf8a 100644
> --- a/arch/arm/plat-samsung/Makefile
> +++ b/arch/arm/plat-samsung/Makefile
> @@ -12,7 +12,7 @@ obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0:=3D
> =A0# Objects we always build independent of SoC choice
>
> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D init=
=2Eo
> -obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D time.o
> +obj-$(CONFIG_ARCH_USES_GETTIMEOFFSET) =A0 +=3D time.o
> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D cloc=
k.o
> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D pwm-=
clock.o
> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D gpio=
=2Eo
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
