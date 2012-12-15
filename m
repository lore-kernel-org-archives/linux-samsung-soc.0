From: Romain Naour <romain.naour@openwide.fr>
Subject: Re: [PATCH 5/5 v2] Remove unused plat-samsung/time.c
Date: Sat, 15 Dec 2012 22:40:23 +0100
Message-ID: <50CCEE47.1050900@openwide.fr>
References: <50885608.1030503@openwide.fr> <201211280057.16345.heiko@sntech.de> <50BBAF96.2000209@openwide.fr> <201212101357.54716.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zimbra3.corp.accelance.fr ([213.162.49.233]:38687 "EHLO
	zimbra3.corp.accelance.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751889Ab2LOVkZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Dec 2012 16:40:25 -0500
In-Reply-To: <201212101357.54716.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: tomasz.figa@gmail.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Le 10/12/2012 13:57, Heiko St=FCbner a =E9crit :
> Am Sonntag, 2. Dezember 2012, 20:44:22 schrieb Romain Naour:
>> Since all Samsung devices use clocksource/clockevent API, we can rem=
ove
>> unused sys_timer s3c24xx-timer (plat-samsung/time.c)
>=20
> The patch is corrupted, as it contains wrapped lines and does not app=
ly=20
> against the current linux-next tree
>=20

Sorry for my late reply, I work on theses patches on my free time.
Ok, I'll resend this patch.

>> Signed-off-by: Naour Romain <romain.naour@openwide.fr>
>>
>>  delete mode 100644 arch/arm/plat-samsung/time.c
>=20
> and what does this line do in the patch description? It seems your ma=
il client=20
> mangled the "--" parting the patch message from the stats/comment sec=
tion.
>=20

Solved.

>=20
>> diff --git a/arch/arm/plat-samsung/Makefile
>> b/arch/arm/plat-samsung/Makefile index 06f2312..162e0df 100644
>> --- a/arch/arm/plat-samsung/Makefile
>> +++ b/arch/arm/plat-samsung/Makefile
>> @@ -12,7 +12,6 @@ obj-				:=3D
>>  # Objects we always build independent of SoC choice
>>
>>  obj-y				+=3D init.o cpu.o
>> -obj-$(CONFIG_ARCH_USES_GETTIMEOFFSET)   +=3D time.o
>>  obj-$(CONFIG_SAMSUNG_HRT) 		+=3D samsung-time.o
>>
>>  obj-$(CONFIG_SAMSUNG_CLOCK)	+=3D clock.o
>> diff --git a/arch/arm/plat-samsung/include/plat/cpu.h
>> b/arch/arm/plat-samsung/include/plat/cpu.h
>> index 86fb5f3..84a50ee 100644
>> --- a/arch/arm/plat-samsung/include/plat/cpu.h
>> +++ b/arch/arm/plat-samsung/include/plat/cpu.h
>> @@ -184,11 +184,6 @@ extern void s3c24xx_init_uartdevs(char *name,
>>  				  struct s3c24xx_uart_resources *res,
>>  				  struct s3c2410_uartcfg *cfg, int no);
>>
>> -/* timer for s5pc100 only */
>> -
>> -struct sys_timer;
>> -extern struct sys_timer s3c24xx_timer;
>> -
>>  extern struct syscore_ops s3c2410_pm_syscore_ops;
>>  extern struct syscore_ops s3c2412_pm_syscore_ops;
>>  extern struct syscore_ops s3c2416_pm_syscore_ops;
>> diff --git a/arch/arm/plat-samsung/time.c b/arch/arm/plat-samsung/ti=
me.c
>> deleted file mode 100644
>> index 60552e2..0000000
>> --- a/arch/arm/plat-samsung/time.c
>> +++ /dev/null
>> @@ -1,285 +0,0 @@
>> -/* linux/arch/arm/plat-samsung/time.c
>> - *
>> - * Copyright (C) 2003-2005 Simtec Electronics
>> - *	Ben Dooks, <ben@simtec.co.uk>
>> - *
>> - * This program is free software; you can redistribute it and/or mo=
dify
>> - * it under the terms of the GNU General Public License as publishe=
d by
>> - * the Free Software Foundation; either version 2 of the License, o=
r
>> - * (at your option) any later version.
>> - *
>> - * This program is distributed in the hope that it will be useful,
>> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> - * GNU General Public License for more details.
>> - *
>> - * You should have received a copy of the GNU General Public Licens=
e
>> - * along with this program; if not, write to the Free Software
>> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-=
1307
>>  USA
>> - */
>> -
>> -#include <linux/kernel.h>
>> -#include <linux/sched.h>
>> -#include <linux/init.h>
>> -#include <linux/interrupt.h>
>> -#include <linux/irq.h>
>> -#include <linux/err.h>
>> -#include <linux/clk.h>
>> -#include <linux/io.h>
>> -#include <linux/platform_device.h>
>> -
>> -#include <asm/mach-types.h>
>> -
>> -#include <asm/irq.h>
>> -#include <mach/map.h>
>> -#include <plat/regs-timer.h>
>> -#include <mach/regs-irq.h>
>> -#include <asm/mach/time.h>
>> -#include <mach/tick.h>
>> -
>> -#include <plat/clock.h>
>> -#include <plat/cpu.h>
>> -
>> -static unsigned long timer_startval;
>> -static unsigned long timer_usec_ticks;
>> -
>> -#ifndef TICK_MAX
>> -#define TICK_MAX (0xffff)
>> -#endif
>> -
>> -#define TIMER_USEC_SHIFT 16
>> -
>> -/* we use the shifted arithmetic to work out the ratio of timer tic=
ks
>> - * to usecs, as often the peripheral clock is not a nice even multi=
ple
>> - * of 1MHz.
>> - *
>> - * shift of 14 and 15 are too low for the 12MHz, 16 seems to be ok
>> - * for the current HZ value of 200 without producing overflows.
>> - *
>> - * Original patch by Dimitry Andric, updated by Ben Dooks
>> -*/
>> -
>> -
>> -/* timer_mask_usec_ticks
>> - *
>> - * given a clock and divisor, make the value to pass into
>> timer_ticks_to_usec
>> - * to scale the ticks into usecs
>> -*/
>> -
>> -static inline unsigned long
>> -timer_mask_usec_ticks(unsigned long scaler, unsigned long pclk)
>> -{
>> -	unsigned long den =3D pclk / 1000;
>> -
>> -	return ((1000 << TIMER_USEC_SHIFT) * scaler + (den >> 1)) / den;
>> -}
>> -
>> -/* timer_ticks_to_usec
>> - *
>> - * convert timer ticks to usec.
>> -*/
>> -
>> -static inline unsigned long timer_ticks_to_usec(unsigned long ticks=
)
>> -{
>> -	unsigned long res;
>> -
>> -	res =3D ticks * timer_usec_ticks;
>> -	res +=3D 1 << (TIMER_USEC_SHIFT - 4);	/* round up slightly */
>> -
>> -	return res >> TIMER_USEC_SHIFT;
>> -}
>> -
>> -/***
>> - * Returns microsecond  since last clock interrupt.  Note that inte=
rrupts
>> - * will have been disabled by do_gettimeoffset()
>> - * IRQs are disabled before entering here from do_gettimeofday()
>> - */
>> -
>> -static unsigned long s3c2410_gettimeoffset (void)
>> -{
>> -	unsigned long tdone;
>> -	unsigned long tval;
>> -
>> -	/* work out how many ticks have gone since last timer interrupt */
>> -
>> -	tval =3D  __raw_readl(S3C2410_TCNTO(4));
>> -	tdone =3D timer_startval - tval;
>> -
>> -	/* check to see if there is an interrupt pending */
>> -
>> -	if (s3c24xx_ostimer_pending()) {
>> -		/* re-read the timer, and try and fix up for the missed
>> -		 * interrupt. Note, the interrupt may go off before the
>> -		 * timer has re-loaded from wrapping.
>> -		 */
>> -
>> -		tval =3D  __raw_readl(S3C2410_TCNTO(4));
>> -		tdone =3D timer_startval - tval;
>> -
>> -		if (tval !=3D 0)
>> -			tdone +=3D timer_startval;
>> -	}
>> -
>> -	return timer_ticks_to_usec(tdone);
>> -}
>> -
>> -
>> -/*
>> - * IRQ handler for the timer
>> - */
>> -static irqreturn_t
>> -s3c2410_timer_interrupt(int irq, void *dev_id)
>> -{
>> -	timer_tick();
>> -	return IRQ_HANDLED;
>> -}
>> -
>> -static struct irqaction s3c2410_timer_irq =3D {
>> -	.name		=3D "S3C2410 Timer Tick",
>> -	.flags		=3D IRQF_DISABLED | IRQF_TIMER | IRQF_IRQPOLL,
>> -	.handler	=3D s3c2410_timer_interrupt,
>> -};
>> -
>> -#define use_tclk1_12() ( \
>> -	machine_is_bast()	|| \
>> -	machine_is_vr1000()	|| \
>> -	machine_is_anubis()	|| \
>> -	machine_is_osiris())
>> -
>> -static struct clk *tin;
>> -static struct clk *tdiv;
>> -static struct clk *timerclk;
>> -
>> -/*
>> - * Set up timer interrupt, and return the current time in seconds.
>> - *
>> - * Currently we only use timer4, as it is the only timer which has =
no
>> - * other function that can be exploited externally
>> - */
>> -static void s3c2410_timer_setup (void)
>> -{
>> -	unsigned long tcon;
>> -	unsigned long tcnt;
>> -	unsigned long tcfg1;
>> -	unsigned long tcfg0;
>> -
>> -	tcnt =3D TICK_MAX;  /* default value for tcnt */
>> -
>> -	/* configure the system for whichever machine is in use */
>> -
>> -	if (use_tclk1_12()) {
>> -		/* timer is at 12MHz, scaler is 1 */
>> -		timer_usec_ticks =3D timer_mask_usec_ticks(1, 12000000);
>> -		tcnt =3D 12000000 / HZ;
>> -
>> -		tcfg1 =3D __raw_readl(S3C2410_TCFG1);
>> -		tcfg1 &=3D ~S3C2410_TCFG1_MUX4_MASK;
>> -		tcfg1 |=3D S3C2410_TCFG1_MUX4_TCLK1;
>> -		__raw_writel(tcfg1, S3C2410_TCFG1);
>> -	} else {
>> -		unsigned long pclk;
>> -		struct clk *tscaler;
>> -
>> -		/* for the h1940 (and others), we use the pclk from the core
>> -		 * to generate the timer values. since values around 50 to
>> -		 * 70MHz are not values we can directly generate the timer
>> -		 * value from, we need to pre-scale and divide before using it.
>> -		 *
>> -		 * for instance, using 50.7MHz and dividing by 6 gives 8.45MHz
>> -		 * (8.45 ticks per usec)
>> -		 */
>> -
>> -		pclk =3D clk_get_rate(timerclk);
>> -
>> -		/* configure clock tick */
>> -
>> -		timer_usec_ticks =3D timer_mask_usec_ticks(6, pclk);
>> -
>> -		tscaler =3D clk_get_parent(tdiv);
>> -
>> -		clk_set_rate(tscaler, pclk / 3);
>> -		clk_set_rate(tdiv, pclk / 6);
>> -		clk_set_parent(tin, tdiv);
>> -
>> -		tcnt =3D clk_get_rate(tin) / HZ;
>> -	}
>> -
>> -	tcon =3D __raw_readl(S3C2410_TCON);
>> -	tcfg0 =3D __raw_readl(S3C2410_TCFG0);
>> -	tcfg1 =3D __raw_readl(S3C2410_TCFG1);
>> -
>> -	/* timers reload after counting zero, so reduce the count by 1 */
>> -
>> -	tcnt--;
>> -
>> -	printk(KERN_DEBUG "timer tcon=3D%08lx, tcnt %04lx, tcfg %08lx,%08l=
x,
>> usec %08lx\n",
>> -	       tcon, tcnt, tcfg0, tcfg1, timer_usec_ticks);
>> -
>> -	/* check to see if timer is within 16bit range... */
>> -	if (tcnt > TICK_MAX) {
>> -		panic("setup_timer: HZ is too small, cannot configure timer!");
>> -		return;
>> -	}
>> -
>> -	__raw_writel(tcfg1, S3C2410_TCFG1);
>> -	__raw_writel(tcfg0, S3C2410_TCFG0);
>> -
>> -	timer_startval =3D tcnt;
>> -	__raw_writel(tcnt, S3C2410_TCNTB(4));
>> -
>> -	/* ensure timer is stopped... */
>> -
>> -	tcon &=3D ~(7<<20);
>> -	tcon |=3D S3C2410_TCON_T4RELOAD;
>> -	tcon |=3D S3C2410_TCON_T4MANUALUPD;
>> -
>> -	__raw_writel(tcon, S3C2410_TCON);
>> -	__raw_writel(tcnt, S3C2410_TCNTB(4));
>> -	__raw_writel(tcnt, S3C2410_TCMPB(4));
>> -
>> -	/* start the timer running */
>> -	tcon |=3D S3C2410_TCON_T4START;
>> -	tcon &=3D ~S3C2410_TCON_T4MANUALUPD;
>> -	__raw_writel(tcon, S3C2410_TCON);
>> -}
>> -
>> -static void __init s3c2410_timer_resources(void)
>> -{
>> -	struct platform_device tmpdev;
>> -
>> -	tmpdev.dev.bus =3D &platform_bus_type;
>> -	tmpdev.id =3D 4;
>> -
>> -	timerclk =3D clk_get(NULL, "timers");
>> -	if (IS_ERR(timerclk))
>> -		panic("failed to get clock for system timer");
>> -
>> -	clk_enable(timerclk);
>> -
>> -	if (!use_tclk1_12()) {
>> -		tmpdev.id =3D 4;
>> -		tmpdev.dev.init_name =3D "s3c24xx-pwm.4";
>> -		tin =3D clk_get(&tmpdev.dev, "pwm-tin");
>> -		if (IS_ERR(tin))
>> -			panic("failed to get pwm-tin clock for system timer");
>> -
>> -		tdiv =3D clk_get(&tmpdev.dev, "pwm-tdiv");
>> -		if (IS_ERR(tdiv))
>> -			panic("failed to get pwm-tdiv clock for system timer");
>> -	}
>> -
>> -	clk_enable(tin);
>> -}
>> -
>> -static void __init s3c2410_timer_init(void)
>> -{
>> -	s3c2410_timer_resources();
>> -	s3c2410_timer_setup();
>> -	setup_irq(IRQ_TIMER4, &s3c2410_timer_irq);
>> -}
>> -
>> -struct sys_timer s3c24xx_timer =3D {
>> -	.init		=3D s3c2410_timer_init,
>> -	.offset		=3D s3c2410_gettimeoffset,
>> -	.resume		=3D s3c2410_timer_setup
>> -};
>=20
> 4
>=20
