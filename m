From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 00/23] RFC: exynos multiplatform support
Date: Wed, 6 Mar 2013 23:14:56 +0100
Message-ID: <201303062314.57183.heiko@sntech.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de> <201303051919.02638.arnd@arndb.de> <1781901.cQ9rKScpd8@flatron>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:35612 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753809Ab3CFWPJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 17:15:09 -0500
In-Reply-To: <1781901.cQ9rKScpd8@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

Am Dienstag, 5. M=E4rz 2013, 23:48:45 schrieb Tomasz Figa:
> On Tuesday 05 of March 2013 19:19:02 Arnd Bergmann wrote:
> > On Tuesday 05 March 2013, Tomasz Figa wrote:
> > > > With this patch set, we can build mach-exynos as part
> > > > of a multiplatform kernel, with the following caveats:
> > > >=20
> > > > * Only DT based boards are supported
> > >=20
> > > As far as I'm aware, there are plans to drop non-DT Exynos suppor=
t.
> > > Kgene should know more on this.
> >=20
> > Yes, that was my understanding as well. It might not actually be to=
o
> > hard to get multiplatform working with the ATAGS based board files
> > (we do that on some of the other platforms), but there is probably
> > no reason to try hard.
> >=20
> > > > * Moving to common-clk breaks things including cpufreq
> > > >=20
> > > >   and others. Thomas is working on a patch for this
> > >=20
> > > We have several patches internally for fixing things up to run
> > > correclty with common-clk. I'll see if we can post some patches.
> >=20
> > Ok, excellent.
> >=20
> > > > * We disable the gpio implementation, which also breaks
> > > >=20
> > > >   stuff, but Thomas has a patch already
> > >=20
> > > The legacy GPIO code is needed only for non-DT case. DT-case uses=
 the
> > > new pinctrl-samsung driver, which is (AFAIK) multiplatform-aware.
> >=20
> > Please have a closer look at the "ARM: exynos: work around missing =
gpio
> > code on multiplatform" patch, I think there a few files I had to to=
uch
> > that actually rely on the legacy gpio code:
> >=20
> > * the pm-gpio.c file
> > * the s3c_i2c0_cfg_gpio function
> > * the eint irqchip
> >=20
> > If none of these are needed for DT-based systems, we should probabl=
y
> > build that code conditionally based on the CONFIG_EXYNOS_ATAGS symb=
ol
> > I introduced.
>=20
> Yes, none of them are needed for DT-based systems.
>=20
> > > > * sparsemem support is not available on multiplatform
> > >=20
> > > There was some discussion some time ago whether we really need
> > > sparsemem on Exynos. If I remember correctly, it turned out that =
we
> > > don't. So this is not really an issue.
> >=20
> > Ok, good.
> >=20
> > > > Arnd Bergmann (23):
> > > >   ARM: exynos: introduce EXYNOS_ATAGS symbol
> > > >   irqchip: exynos: remove dependency on mach/irqs.h
> > > >   tty: serial/samsung: prepare for common clock API
> > > >   tty: serial/samsung: make register definitions global
> > > >   tty: serial/samsung: fix modular build
> > > >   ARM: exynos: move debug-macro.S to include/debug/
> > > >   i2c: s3c2410: make header file local
> > > >   mmc: sdhci-s3c: remove platform dependencies
> > > >   usb: exynos: do not include plat/usb-phy.h
> > > >   [media] exynos: remove unnecessary header inclusions
> > > >   video/exynos: remove unnecessary header inclusions
> > > >   thermal/exynos: remove unnecessary header inclusions
> > > >   mtd: onenand/samsung: make regs-onenand.h file local
> > > >   rtc: s3c: make header file local
> > > >   spi: s3c64xx: move to generic dmaengine API
> > > >   pwm: samsung: repair the worst MMIO abuses
> > >=20
> > > I'm currently working (in my free time) on a series of cleanup pa=
tches
> > > sanitizing Samsung PWM code for S3C64xx and S5PV210 DT (and
> > > multiplatform) support.
> >=20
> > Ah, nice.
> >=20
> > > On those platforms it is a bit more complex case as there are two
> > > blocks of code that access the same hardware - samsung-time (usin=
g
> > > two PWM channels for clocksource and clock events) and pwm-samsun=
g.
> > >=20
> > > Hopefully, I will have some patches ready soon.
> >=20
> > How are you planning to solve this? Do you want to have a combined
> > driver that registers both a clocksource and a pwm?
>=20
> Let's start with a quick introduction to the s3c-pwm hardware. Each
> channel has its own timer value, compare and reload value registers, =
so
> they don't need any extra locking. However there are additional share=
d
> configuration registers, containing things such as start and reload b=
its
> for all channels, prescaler and main divisor values, etc. Those regis=
ters
> needs synchronization.
>=20
> Now there are several possible approaches:
>=20
> 1) A brute force one - two separate drivers, based on the fact that t=
he
>    clocksource driver will be used only on uniprocessor systems, so
>    a simple _irqsave when accessing a shared register in both will
>    guarantee correct synchronization.
>=20
> 2) Two separate drivers with some synchronized shared code accessing
>    registers (_start, _stop, _set_reload, _set_prescaler, _set_diviso=
r,
>    etc.; all using a shared spinlock).
>=20
> 3) Single driver registering PWM channels, clocksource and clock even=
t
>    device. This does not seem like a bad idea, since the whole code f=
or
>    configuration of the PWM block would reside in one location and th=
ere
>    would be no redundancy. However there is a question where such dri=
ver
>    should be placed - drivers/clocksource, drivers/pwm, or maybe some=
where
>    else?
>=20
> Personally I wanted to go with first option, which would require leas=
t
> amount of changes to existing code, at a cost of some code duplicatio=
n
> (but some PWM code is duplicated already).


Do you also want to include the prescaler and divider handling (that is
currently sitting pwm-clock.c in plat-samsung) into this new driver?

Because for my current common-clk work I ported the pwm-clock stuff to =
the
common-clk-fw to keep the timer running. Unfinished code below. The pwm=
 and
time drivers do not use the TCFG registers at the beginning of the bloc=
k.

Either way is fine with me, I just want to prevent me doing more cleanu=
ps
there, when the right way is thru your new driver :-)


Heiko


unfinished but working clk-pwm.c:

/*
 * Copyright (c) 2007 Simtec Electronics
 * Copyright (c) 2007, 2008 Ben Dooks
 *	Ben Dooks <ben-linux@fluff.org>
 * Copyright (c) 2013 Heiko Stuebner <heiko@sntech.de>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License.
 *
 * Common Clock Framework support for Samsung pwm clocks
*/

#include <linux/clk.h>
#include <linux/clkdev.h>
#include <linux/clk-provider.h>
#include <linux/of.h>
#include <linux/of_address.h>
#include <linux/syscore_ops.h>
#include <linux/io.h>

#include <plat/cpu.h>
#include <mach/map.h>

#include "clk.h"

/* Each of the timers 0 through 5 go through the following
 * clock tree, with the inputs depending on the timers.
 *
 * pclk ---- [ prescaler 0 ] -+---> timer 0
 *			      +---> timer 1
 *
 * pclk ---- [ prescaler 1 ] -+---> timer 2
 *			      +---> timer 3
 *			      \---> timer 4
 *
 * Which are fed into the timers as so:
 *
 * prescaled 0 ---- [ div 2,4,8,16 ] ---\
 *				       [mux] -> timer 0
 * tclk 0 ------------------------------/
 *
 * prescaled 0 ---- [ div 2,4,8,16 ] ---\
 *				       [mux] -> timer 1
 * tclk 0 ------------------------------/
 *
 *
 * prescaled 1 ---- [ div 2,4,8,16 ] ---\
 *				       [mux] -> timer 2
 * tclk 1 ------------------------------/
 *
 * prescaled 1 ---- [ div 2,4,8,16 ] ---\
 *				       [mux] -> timer 3
 * tclk 1 ------------------------------/
 *
 * prescaled 1 ---- [ div 2,4,8, 16 ] --\
 *				       [mux] -> timer 4
 * tclk 1 ------------------------------/
 *
 * Since the mux and the divider are tied together in the
 * same register space, it is impossible to set the parent
 * and the rate at the same time. To avoid this, we add an
 * intermediate 'prescaled-and-divided' clock to select
 * as the parent for the timer input clock called tdiv.
 *
 * prescaled clk --> pwm-tdiv ---\
 *                             [ mux ] --> timer X
 * tclk -------------------------/
*/

enum pwm_clks {
	none,

	tclk0, tclk1, tdiv0, tdiv1, tdiv2, tdiv3, tdiv4,
	tin0, tin1, tin2, tin3, tin4,

	nr_clks,
};

/* the soc types */
enum supported_socs {
	S3C24XX,
	S3C64XX, /* also S5PC100 */
	S5P64XX,
};

/* clock controller register offsets */
#define TCFG0	0
#define TCFG1	0x4

static DEFINE_SPINLOCK(lock);
static int current_soc;
static void __iomem *reg_base;
static struct clk **clk_table;
#ifdef CONFIG_OF
static struct clk_onecell_data clk_data;
#endif

#ifdef CONFIG_PM_SLEEP
static struct samsung_clk_reg_dump reg_dump[2] =3D {
  { .offset =3D TCFG0 },
  { .offset =3D TCFG1 },
};

static int samsung_clk_pwm_suspend(void)
{
	reg_dump[0].value =3D readl_relaxed(reg_base + reg_dump[0].offset);
	reg_dump[1].value =3D readl_relaxed(reg_base + reg_dump[1].offset);
	return 0;
}

static void samsung_clk_pwm_resume(void)
{
	writel_relaxed(reg_dump[0].value, reg_base + reg_dump[0].offset);
	writel_relaxed(reg_dump[1].value, reg_base + reg_dump[1].offset);
}

static struct syscore_ops samsung_clk_pwm_syscore_ops =3D {
	.suspend	=3D samsung_clk_pwm_suspend,
	.resume		=3D samsung_clk_pwm_resume,
};
#endif /* CONFIG_PM_SLEEP */

#define S3C2410_TCFG1_MUX_TCLK    (4 << 0)
#define S3C64XX_TCFG1_MUX_TCLK    (5 << 0)

/**
 * pwm_cfg_src_is_tclk() - return whether the given mux config is a tcl=
k
 * @tcfg: The timer TCFG1 register bits shifted down to 0.
 *
 * Return true if the given configuration from TCFG1 is a TCLK instead
 * any of the TDIV clocks.
 */
static inline int pwm_cfg_src_is_tclk(unsigned long tcfg)
{
	if (current_soc =3D=3D S3C24XX)
		return tcfg =3D=3D S3C2410_TCFG1_MUX_TCLK;
	else if (current_soc =3D=3D S3C64XX)
		return tcfg >=3D S3C64XX_TCFG1_MUX_TCLK;
	else if (current_soc =3D=3D S5P64XX)
		return 0;
	else
		return tcfg =3D=3D S3C64XX_TCFG1_MUX_TCLK;
}

struct clk_tdiv {
	struct clk_divider 	divider;
	const struct clk_ops 	*ops;
	void __iomem 		*reg;
	unsigned int		divisor;
};

static inline struct clk_tdiv *to_clk_tdiv(struct clk_hw *hw)
{
	struct clk_divider *divider =3D container_of(hw, struct clk_divider, h=
w);

	return container_of(divider, struct clk_tdiv, divider);
}

static unsigned long clk_tdiv_recalc_rate(struct clk_hw *hw,
					 unsigned long parent_rate)
{
	struct clk_tdiv *tdiv =3D to_clk_tdiv(hw);
	unsigned long tcfg1 =3D readl_relaxed(tdiv->reg);

	tcfg1 >>=3D tdiv->divider.shift;
	tcfg1 &=3D ((1 << (tdiv->divider.width)) - 1);

	if (pwm_cfg_src_is_tclk(tcfg1))
		return parent_rate / tdiv->divisor;
	else
		return tdiv->ops->recalc_rate(&tdiv->divider.hw, parent_rate);

}

static long clk_tdiv_round_rate(struct clk_hw *hw, unsigned long rate,
			       unsigned long *parent_rate)
{
	struct clk_tdiv *tdiv =3D to_clk_tdiv(hw);

	return tdiv->ops->round_rate(&tdiv->divider.hw, rate, parent_rate);
}

static int clk_tdiv_set_rate(struct clk_hw *hw, unsigned long rate,
			    unsigned long parent_rate)
{
	struct clk_tdiv *tdiv =3D to_clk_tdiv(hw);
	unsigned long tcfg1 =3D readl_relaxed(tdiv->reg);
	unsigned long divisor;
	int ret =3D 0;

	tcfg1 >>=3D tdiv->divider.shift;
	tcfg1 &=3D ((1 << (tdiv->divider.width)) - 1);

	rate =3D tdiv->ops->round_rate(&tdiv->divider.hw, rate, &parent_rate);
	divisor =3D parent_rate / rate;

	if (divisor > 16)
		return -EINVAL;

	tdiv->divisor =3D divisor;

	/* Update the current MUX settings if we are currently
	 * selected as the clock source for this clock. */

	if (!pwm_cfg_src_is_tclk(tcfg1))
		ret =3D tdiv->ops->set_rate(&tdiv->divider.hw, rate, parent_rate);

	return ret;
}

static struct clk_ops clk_tdiv_ops =3D {
	.recalc_rate =3D clk_tdiv_recalc_rate,
	.round_rate =3D clk_tdiv_round_rate,
	.set_rate =3D clk_tdiv_set_rate,
};

static struct clk *samsung_clk_register_tdiv(const char *name,
		const char *parent_name, unsigned long flags,
		void __iomem *reg, u8 shift,
		u8 clk_divider_flags, const struct clk_div_table *table)
{
	unsigned long tcfg1;
	const struct clk_div_table *clkt;
	struct clk_tdiv *tdiv;
	struct clk *clk;
	struct clk_init_data init;

	tdiv =3D kzalloc(sizeof(struct clk_tdiv), GFP_KERNEL);
	if (!tdiv)
		return ERR_PTR(-ENOMEM);

	init.name =3D name;
	init.ops =3D &clk_tdiv_ops;
	init.flags =3D flags;
	init.parent_names =3D (parent_name ? &parent_name: NULL);
	init.num_parents =3D (parent_name ? 1 : 0);

	/* struct clk_divider assignments */
	tdiv->divider.reg =3D reg;
	tdiv->divider.shift =3D shift;
	tdiv->divider.width =3D 4;
	tdiv->divider.flags =3D clk_divider_flags;
	tdiv->divider.lock =3D &lock;
	tdiv->divider.hw.init =3D &init;
	tdiv->divider.table =3D table;
	tdiv->ops =3D &clk_divider_ops;

	tcfg1 =3D readl_relaxed(reg);
	tcfg1 >>=3D tdiv->divider.shift;
	tcfg1 &=3D ((1 << (tdiv->divider.width)) - 1);

	tdiv->reg =3D reg;

	tdiv->divisor =3D 1;
	for (clkt =3D table; clkt->div; clkt++)
		if (clkt->val =3D=3D tcfg1)
			tdiv->divisor =3D clkt->div;

	clk =3D clk_register(NULL, &tdiv->divider.hw);
	if (IS_ERR(clk))
		kfree(tdiv);

	return clk;
}

struct clk_tin {
	struct clk_hw	hw;
	void __iomem	*reg;
	u8		shift;
	u8		width;
	spinlock_t	*lock;
};

#define to_clk_tin(_hw) container_of(_hw, struct clk_tin, hw)

static u8 clk_tin_get_parent(struct clk_hw *hw)
{
	struct clk_tin *tin =3D to_clk_tin(hw);
	unsigned long tcfg1 =3D readl_relaxed(tin->reg);

	tcfg1 >>=3D tin->shift;
	tcfg1 &=3D ((1 << (tin->width)) - 1);

	/* assume tclk is parent 0 and tdiv is parent 1 */
	return pwm_cfg_src_is_tclk(tcfg1) ? 0 : 1;
}

static int clk_tin_set_parent(struct clk_hw *hw, u8 index)
{
	struct clk_tin *tin =3D to_clk_tin(hw);
	struct clk *tdiv;
	struct clk *prescaler;
	unsigned long tcfg1;
	unsigned long flags =3D 0;
	unsigned long div;
	int bits;

	switch (index) {
	case 0:
		if (current_soc =3D=3D S3C24XX)
			bits =3D S3C2410_TCFG1_MUX_TCLK << tin->shift;
		else if (current_soc =3D=3D S5P64XX)
			bits =3D 0;
		else
			bits =3D S3C64XX_TCFG1_MUX_TCLK << tin->shift;
		break;
	case 1:
		tdiv =3D clk_get(NULL, hw->init->parent_names[0]);

		prescaler =3D clk_get_parent(tdiv);
		div =3D clk_get_rate(prescaler) / clk_get_rate(tdiv);

		bits =3D (current_soc =3D=3D S3C24XX) ? (ilog2(div) - 1) : ilog2(div)=
;
		bits &=3D ((1 << (tin->width)) - 1);
		bits <<=3D tin->shift;

		clk_put(tdiv);
		break;
	default:
		return -EINVAL;
	}

	spin_lock_irqsave(tin->lock, flags);

	tcfg1 =3D readl_relaxed(tin->reg);
	tcfg1 &=3D ~(((1 << tin->width) - 1) << tin->shift);
	tcfg1 |=3D bits;
	writel_relaxed(tcfg1, tin->reg);

	spin_unlock_irqrestore(tin->lock, flags);

	return 0;
}

static const struct clk_ops clk_tin_ops =3D {
	.get_parent =3D clk_tin_get_parent,
	.set_parent =3D clk_tin_set_parent,
};

static struct clk *samsung_clk_register_tin(const char *name,
		const char **parent_names, u8 num_parents,
		void __iomem *reg, u8 shift, u8 width)
{
	struct clk_tin *tin;
	struct clk *clk;
	struct clk_init_data init;

	/* allocate the mux */
	tin =3D kzalloc(sizeof(struct clk_tin), GFP_KERNEL);
	if (!tin) {
		pr_err("%s: could not allocate tin clk\n", __func__);
		return ERR_PTR(-ENOMEM);
	}

	init.name =3D name;
	init.ops =3D &clk_tin_ops;
	init.parent_names =3D parent_names;
	init.num_parents =3D num_parents;

	/* struct clk_mux assignments */
	tin->reg =3D reg;
	tin->shift =3D shift;
	tin->width =3D width;
	tin->lock =3D &lock;
	tin->hw.init =3D &init;

	clk =3D clk_register(NULL, &tin->hw);

	if (IS_ERR(clk))
		kfree(tin);

	return clk;
}


PNAME(tin0_p) =3D { "pwm-tclk0", "pwm-tdiv0" };
PNAME(tin1_p) =3D { "pwm-tclk0", "pwm-tdiv1" };
PNAME(tin2_p) =3D { "pwm-tclk1", "pwm-tdiv2" };
PNAME(tin3_p) =3D { "pwm-tclk1", "pwm-tdiv3" };
PNAME(tin4_p) =3D { "pwm-tclk1", "pwm-tdiv4" };

static struct clk_div_table tdiv_s3c24xx_d[] =3D {
	{ .val =3D 0, .div =3D 2 },
	{ .val =3D 1, .div =3D 4 },
	{ .val =3D 2, .div =3D 8 },
	{ .val =3D 3, .div =3D 16 },
	{ .div =3D 0 },
};
struct samsung_div_clock pwm_s3c24xx_tdiv_dividers[] __initdata =3D {
	DIV_T(tdiv0, "pwm-tdiv0", "pwm-scaler0", TCFG1, 0, 4, tdiv_s3c24xx_d),
	DIV_T(tdiv1, "pwm-tdiv1", "pwm-scaler0", TCFG1, 4, 4, tdiv_s3c24xx_d),
	DIV_T(tdiv2, "pwm-tdiv2", "pwm-scaler1", TCFG1, 8, 4, tdiv_s3c24xx_d),
	DIV_T(tdiv3, "pwm-tdiv3", "pwm-scaler1", TCFG1, 12, 4, tdiv_s3c24xx_d)=
,
	DIV_T(tdiv4, "pwm-tdiv4", "pwm-scaler1", TCFG1, 16, 4, tdiv_s3c24xx_d)=
,
};

static struct clk_div_table tdiv_s3c64xx_d[] =3D {
	{ .val =3D 0, .div =3D 1 },
	{ .val =3D 1, .div =3D 2 },
	{ .val =3D 2, .div =3D 4 },
	{ .val =3D 3, .div =3D 8 },
	{ .val =3D 4, .div =3D 16 },
	{ .div =3D 0 },
};
struct samsung_div_clock pwm_s3c64xx_tdiv_dividers[] __initdata =3D {
	DIV_T(tdiv0, "pwm-tdiv0", "pwm-scaler0", TCFG1, 0, 4, tdiv_s3c64xx_d),
	DIV_T(tdiv1, "pwm-tdiv1", "pwm-scaler0", TCFG1, 4, 4, tdiv_s3c64xx_d),
	DIV_T(tdiv2, "pwm-tdiv2", "pwm-scaler1", TCFG1, 8, 4, tdiv_s3c64xx_d),
	DIV_T(tdiv3, "pwm-tdiv3", "pwm-scaler1", TCFG1, 12, 4, tdiv_s3c64xx_d)=
,
	DIV_T(tdiv4, "pwm-tdiv4", "pwm-scaler1", TCFG1, 16, 4, tdiv_s3c64xx_d)=
,
};

struct samsung_mux_clock pwm_tin[] __initdata =3D {
	MUX(tin0, "pwm-tin0", tin0_p, TCFG1, 0, 4),
	MUX(tin1, "pwm-tin1", tin1_p, TCFG1, 4, 4),
	MUX(tin2, "pwm-tin2", tin2_p, TCFG1, 8, 4),
	MUX(tin3, "pwm-tin3", tin3_p, TCFG1, 12, 4),
	MUX(tin4, "pwm-tin4", tin4_p, TCFG1, 16, 4),
};

struct samsung_clock_alias pwm_aliases[] __initdata =3D {
	ALIAS(tdiv0, "s3c24xx-pwm.0", "pwm-tdiv"),
	ALIAS(tdiv1, "s3c24xx-pwm.1", "pwm-tdiv"),
	ALIAS(tdiv2, "s3c24xx-pwm.2", "pwm-tdiv"),
	ALIAS(tdiv3, "s3c24xx-pwm.3", "pwm-tdiv"),
	ALIAS(tdiv4, "s3c24xx-pwm.4", "pwm-tdiv"),
	ALIAS(tin0, "s3c24xx-pwm.0", "pwm-tin"),
	ALIAS(tin1, "s3c24xx-pwm.1", "pwm-tin"),
	ALIAS(tin2, "s3c24xx-pwm.2", "pwm-tin"),
	ALIAS(tin3, "s3c24xx-pwm.3", "pwm-tin"),
	ALIAS(tin4, "s3c24xx-pwm.4", "pwm-tin"),
};


#ifdef CONFIG_OF
static struct of_device_id pwm_clk_ids[] __initdata =3D {
	{ .compatible =3D "samsung,s3c24xx-clock-pwm",
			.data =3D (void *)S3C24XX, },
	{ .compatible =3D "samsung,s3c64xx-clock-pwm",
			.data =3D (void *)S3C64XX, },
	{ .compatible =3D "samsung,s5p64xx-clock-pwm",
			.data =3D (void *)S5P64XX, },
	{ },
};
#endif


void __init samsung_pwm_clk_init(struct device_node *np)
{
	struct clk *clk;
	struct samsung_div_clock *tdiv_list;
	struct samsung_mux_clock *tin_list;
	struct samsung_clock_alias *alias_list;
	unsigned int idx;
	int ret;

	if (np) {
		const struct of_device_id *match;
		match =3D of_match_node(pwm_clk_ids, np);
		current_soc =3D (u32)match->data;

		reg_base =3D of_iomap(np, 0);
		if (!reg_base)
			panic("%s: failed to map registers\n", __func__);
	} else {
		reg_base =3D S3C_VA_TIMER;
		if (soc_is_s3c24xx())
			current_soc =3D S3C24XX;
		else if (soc_is_s3c64xx() || soc_is_s5pc100())
			current_soc =3D S3C64XX;
		else if (soc_is_s5p6440() || soc_is_s5p6450())
			current_soc =3D S5P64XX;
		else
			panic("%s: unable to determine soc\n", __func__);
	}

	clk_table =3D kzalloc(sizeof(struct clk *) * nr_clks, GFP_KERNEL);
	if (!clk_table)
		panic("could not allocate clock lookup table\n");

#ifdef CONFIG_OF
	clk_data.clks =3D clk_table;
	clk_data.clk_num =3D nr_clks;
	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
#endif

#ifdef CONFIG_PM_SLEEP
	register_syscore_ops(&samsung_clk_pwm_syscore_ops);
#endif


	clk =3D clk_register_fixed_rate(NULL, "pwm-tclk0", NULL, CLK_IS_ROOT, =
0);
	clk =3D clk_register_fixed_rate(NULL, "pwm-tclk1", NULL, CLK_IS_ROOT, =
0);

	clk =3D clk_register_divider(NULL, "pwm-scaler0", "pwm", 0, reg_base +=
 TCFG0, 0, 8, 0, &lock);
	clk =3D clk_register_divider(NULL, "pwm-scaler1", "pwm", 0, reg_base +=
 TCFG0, 8, 8, 0, &lock);

	tdiv_list =3D (current_soc =3D=3D S3C24XX) ? pwm_s3c24xx_tdiv_dividers
					      : pwm_s3c64xx_tdiv_dividers;

	for (idx =3D 0; idx < 5; idx++, tdiv_list++) {
		clk =3D samsung_clk_register_tdiv(tdiv_list->name, tdiv_list->parent_=
name,
				tdiv_list->flags, reg_base + tdiv_list->offset,
				tdiv_list->shift, tdiv_list->div_flags, tdiv_list->table);
		if (IS_ERR(clk)) {
			pr_err("%s: failed to register clock %s\n", __func__,
				tdiv_list->name);
			continue;
		}

		if (clk_table && tdiv_list->id)
			clk_table[tdiv_list->id] =3D clk;
	}

	tin_list =3D pwm_tin;
	for (idx =3D 0; idx < 5; idx++, tin_list++) {
		clk =3D samsung_clk_register_tin(tin_list->name,
				tin_list->parent_names, tin_list->num_parents,
				reg_base + tin_list->offset, tin_list->shift,
				tin_list->width);

		if (IS_ERR(clk)) {
			pr_err("%s: failed to register clock %s\n", __func__,
				tin_list->name);
			continue;
		}

		if (clk_table && tin_list->id)
			clk_table[tin_list->id] =3D clk;
	}

	alias_list =3D pwm_aliases;
	for (idx =3D 0; idx < ARRAY_SIZE(pwm_aliases); idx++, alias_list++) {
		if (!alias_list->id) {
			pr_err("%s: clock id missing for index %d\n", __func__,
				idx);
			continue;
		}

		clk =3D clk_table[alias_list->id];
		if (!clk) {
			pr_err("%s: failed to find clock %d\n", __func__,
				alias_list->id);
			continue;
		}

		ret =3D clk_register_clkdev(clk, alias_list->alias,
					  alias_list->dev_name);
		if (ret)
			pr_err("%s: failed to register lookup %s\n",
						__func__, alias_list->alias);
	}
}
