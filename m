From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 12/12] clocksource: samsung-time: Add Device Tree support
Date: Tue, 12 Feb 2013 00:46:09 +0100
Message-ID: <3641123.j8hijCHc7L@flatron>
References: <1360502423-2246-1-git-send-email-tomasz.figa@gmail.com> <1360502423-2246-13-git-send-email-tomasz.figa@gmail.com> <20130211110056.GC32455@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:33210 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932188Ab3BKXqO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Feb 2013 18:46:14 -0500
Received: by mail-ee0-f53.google.com with SMTP id e53so3583103eek.40
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Feb 2013 15:46:12 -0800 (PST)
In-Reply-To: <20130211110056.GC32455@e106331-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "kwangwoo.lee@gmail.com" <kwangwoo.lee@gmail.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "mcuelenaere@gmail.com" <mcuelenaere@gmail.com>, "christer@weinigel.se" <christer@weinigel.se>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "buserror@gmail.com" <buserror@gmail.com>, "augulis.darius@gmail.com" <augulis.darius@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "ghcstop@gmail.com" <ghcstop@gmail.com>, "linux@simtec.co.uk" <linux@simtec.co.uk>, "jekhor@gmail.com" <jekhor@gmail.com>

Hi Mark,

Thanks for your comments. See my replies inline.

On Monday 11 of February 2013 11:00:56 Mark Rutland wrote:
> On Sun, Feb 10, 2013 at 01:20:23PM +0000, Tomasz Figa wrote:
> > This patch adds support for parsing all platform-specific data from
> > Device Tree and instantiation using clocksource_of_init to
> > samsung-time
> > clocksource driver.
> > 
> > Cc: devicetree-discuss@lists.ozlabs.org
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> > ---
> > 
> >  .../devicetree/bindings/arm/samsung-timer.txt      |  32 +++++++
> >  drivers/clocksource/samsung-time.c                 | 102
> >  ++++++++++++++++++++- 2 files changed, 131 insertions(+), 3
> >  deletions(-)
> >  create mode 100644
> >  Documentation/devicetree/bindings/arm/samsung-timer.txt> 
> > diff --git a/Documentation/devicetree/bindings/arm/samsung-timer.txt
> > b/Documentation/devicetree/bindings/arm/samsung-timer.txt new file
> > mode 100644
> > index 0000000..8eb7030
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/samsung-timer.txt
> > @@ -0,0 +1,32 @@
> > +* Samsung PWM timer
> > +
> > +Samsung SoCs contain PWM timer blocks which can be used for system
> > clock source +and clock event timers.
> > +
> > +Be aware that this configuration is supported only on uniprocessor
> > platforms. +For SMP SoCs, SMP-aware timers should be used, like MCT.
> > +
> > +Required properties:
> > +- compatible : should be one of following:
> > +    samsung,s3c24xx-pwm-timer - for 16-bit timers present on S3C24xx
> > +    samsung,s3c64xx-pwm-timer - for 32-bit timers present on S3C64xx
> > and newer +- reg: base address and size of register area
> > +- interrupts: interrupt list for all five PWM timers.
> 
> Is this a set of combined interrupts, or one per timer?

It is one per timer, however the node represents a single PWM timer block 
that contains several timers (usually 5).

> Which order are they in?
> 
> Assuming they're one per timer, in order, how about something like:
> 
> "- interrupts: one interrupt per timer, starting at timer 0".

Sounds fine to me. I will modify the description in next version.

> > +- samsung,source-timer: index of timer to be used as clocksource
> > +- samsung,event-timer: index of timer to be used as clock event
> 
> Is there any reason this needs to be specified in the dt?

Yes. On some SoCs selected channels of PWM block can be used as PWM 
outputs and so thsoe cannot be used for system timers. This property makes 
it possible to specify channels used as system timers on particular 
platform (board).

> Can the driver not just select two arbitrary timers from the hardware?

In most cases I could statically choose channel 3 and 4 as it was done 
before my patches on S3C24xx and S3C64xx. I can make those channels 
default if others are not specified in properties.

> > +
> > +Optional properties:
> > +- samsung,prescale: PWM prescaler divisor (from 1 to 256)
> 
> It might be better to have this named "samsung,prescale-divisor" to make
> it clear to the average reader that its a divisor value rather than a
> multiplier value.

Right.

> 
> > +- samsung,divisor: PWM main divider divisor (1, 2, 4, 8 or 16)
> > +
> > +Example:
> > +	timer@7f006000 {
> > +		compatible = "samsung,s3c64xx-pwm-timer";
> > +		reg = <0x7f006000 0x1000>;
> > +		interrupt-parent = <&vic0>;
> > +		interrupts = <23>, <24>, <25>, <27>, <28>;
> > +		samsung,source-timer = <4>;
> > +		samsung,event-timer = <3>;
> > +		samsung,prescale = <2>;
> > +		samsung,divisor = <1>;
> > +	};
> > diff --git a/drivers/clocksource/samsung-time.c
> > b/drivers/clocksource/samsung-time.c index 19a1c8a..63d2992 100644
> > --- a/drivers/clocksource/samsung-time.c
> > +++ b/drivers/clocksource/samsung-time.c
> > @@ -14,6 +14,9 @@
> > 
> >  #include <linux/err.h>
> >  #include <linux/clk.h>
> >  #include <linux/clockchips.h>
> > 
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
> > 
> >  #include <linux/platform_device.h>
> >  #include <linux/samsung-time.h>
> > 
> > @@ -479,9 +482,11 @@ static void __init samsung_timer_resources(void)
> > 
> >  	unsigned long source_id = timer_source.source_id;
> >  	char devname[15];
> > 
> > -	timer_base = ioremap_nocache(timer_variant.reg_base, SZ_4K);
> > -	if (!timer_base)
> > -		panic("failed to map timer registers");
> > +	if (!timer_base) {
> > +		timer_base = ioremap_nocache(timer_variant.reg_base, SZ_4K);
> > +		if (!timer_base)
> > +			panic("failed to map timer registers");
> > +	}
> 
> You map 4K here, but the binding didn't mention that 4K is always the
> expected size of the reg.

This is a compatibility mapping for legacy (non-DT) platforms that will be 
removed once all platforms get moved to DT.

> >  	timerclk = clk_get(NULL, "timers");
> >  	if (IS_ERR(timerclk))
> > 
> > @@ -514,8 +519,92 @@ static void __init samsung_timer_resources(void)
> > 
> >  	clk_enable(tin_source);
> >  
> >  }
> > 
> > +enum {
> > +	TYPE_S3C24XX,
> > +	TYPE_S3C64XX,
> > +};
> > +
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id samsung_timer_ids[] = {
> > +	{ .compatible = "samsung,s3c24xx-pwm-timer",
> > +					.data = (void *)TYPE_S3C24XX, },
> > +	{ .compatible = "samsung,s3c64xx-pwm-timer",
> > +					.data = (void *)TYPE_S3C64XX, },
> > +	{},
> > +};
> > +
> > +static void samsung_timer_parse_dt(struct device_node *np,
> > +					const struct of_device_id *match)
> > +{
> > +	int i;
> > +	u32 val;
> > +
> > +	if (of_property_read_u32(np, "samsung,source-timer", &val))
> > +		panic("no samsung,source-timer property provided");
> > +	if (val > ARRAY_SIZE(timer_variant.irqs))
> > +		panic("samsung,source-timer property out of range");
> 
> This check doesn't tell you if you actually had an irq in the dt for the
> timer at that index.

Hmm, this line is probably a bit confusing. I will add a define with 
maximum number of channels and use it here. This is only a check whether 
the index given is not out of range.

> Do you really need to panic here? Can you not just warn?
> 
> What if a future platform has another timer driver that can at least get
> the board to boot?

It's rather unlikely that new platforms using samsung-time will show up. 
This clocksource is used only for non-SMP platforms based on S3C and S5P 
SoCs, where it is the only possible supported clocksource.

> > +	timer_source.source_id = val;
> > +
> > +	if (of_property_read_u32(np, "samsung,event-timer", &val))
> > +		panic("no samsung,event-timer property provided");
> > +	if (val > ARRAY_SIZE(timer_variant.irqs))
> > +		panic("samsung,event-timer property out of range");
> > +	timer_source.event_id = val;
> 
> I have the same problems here as with the source-timer block above.
> 
> > +
> > +	timer_base = of_iomap(np, 0);
> > +	if (!timer_base)
> > +		panic("failed to map timer registers");
> 
> Similarly here and every other place that panics: I think warning might
> be a better bet.
> 
> > +
> > +	for (i = 0; i < ARRAY_SIZE(timer_variant.irqs); ++i)
> > +		timer_variant.irqs[i] = irq_of_parse_and_map(np, i);
> > +
> > +	if (!timer_variant.irqs[timer_source.event_id])
> > +		panic("no clock event irq provided");
> > +
> > +	switch ((unsigned int)match->data) {
> > +	case TYPE_S3C24XX:
> > +		timer_variant.bits = 16;
> > +		timer_variant.prescale = 25;
> > +		timer_variant.prescale = 50;
> > +		timer_variant.has_tint_cstat = false;
> > +		break;
> > +	case TYPE_S3C64XX:
> > +		timer_variant.bits = 32;
> > +		timer_variant.prescale = 2;
> > +		timer_variant.divisor = 2;
> > +		timer_variant.has_tint_cstat = true;
> > +		break;
> > +	}
> > +
> > +	if (!of_property_read_u32(np, "samsung,prescale", &val)) {
> > +		if (val < 1 || val > 256)
> > +			panic("prescale must be from 1 to 256 range");
> > +		timer_variant.prescale = val;
> > +	}
> > +
> > +	if (!of_property_read_u32(np, "samsung,divisor", &val)) {
> > +		if (val > 16 || (1 << (fls(val) - 1)) != val)
> > +			panic("divsor must be 1, 2, 4, 8 or 16");
> > +		timer_variant.divisor = timer_variant.prescale * val;
> 
> Maybe it's just me, but I find this somewhat difficult to read.
> 
> How about something like:
> 
> switch (val) {
> case 1:
> case 2:
> case 4:
> case 8:
> case 16:
> 	timer_variant.divisor = timer_variant.prescale * val;
> 	break;
> default:
> 	warn("no divisor specified");
> };

It looks better indeed. I will change this part in next version.

Best regards,
Tomasz
