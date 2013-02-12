From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 12/12] clocksource: samsung-time: Add Device Tree
 support
Date: Tue, 12 Feb 2013 11:06:45 +0000
Message-ID: <20130212110645.GC826@e106331-lin.cambridge.arm.com>
References: <1360502423-2246-1-git-send-email-tomasz.figa@gmail.com>
 <1360502423-2246-13-git-send-email-tomasz.figa@gmail.com>
 <20130211110056.GC32455@e106331-lin.cambridge.arm.com>
 <3641123.j8hijCHc7L@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:60399 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758734Ab3BLLGt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Feb 2013 06:06:49 -0500
In-Reply-To: <3641123.j8hijCHc7L@flatron>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "kwangwoo.lee@gmail.com" <kwangwoo.lee@gmail.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "mcuelenaere@gmail.com" <mcuelenaere@gmail.com>, "christer@weinigel.se" <christer@weinigel.se>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "buserror@gmail.com" <buserror@gmail.com>, "augulis.darius@gmail.com" <augulis.darius@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "ghcstop@gmail.com" <ghcstop@gmail.com>, "linux@simtec.co.uk" <linux@simtec.co.uk>, "jekhor@gmail.com" <jekhor@gmail.com>

Hi Tomasz,

[...]

> > > +Required properties:
> > > +- compatible : should be one of following:
> > > +    samsung,s3c24xx-pwm-timer - for 16-bit timers present on S3C24xx
> > > +    samsung,s3c64xx-pwm-timer - for 32-bit timers present on S3C64xx
> > > and newer +- reg: base address and size of register area
> > > +- interrupts: interrupt list for all five PWM timers.
> > 
> > Is this a set of combined interrupts, or one per timer?
> 
> It is one per timer, however the node represents a single PWM timer block 
> that contains several timers (usually 5).
> 
> > Which order are they in?
> > 
> > Assuming they're one per timer, in order, how about something like:
> > 
> > "- interrupts: one interrupt per timer, starting at timer 0".
> 
> Sounds fine to me. I will modify the description in next version.

Great.

> > > +- samsung,source-timer: index of timer to be used as clocksource
> > > +- samsung,event-timer: index of timer to be used as clock event
> > 
> > Is there any reason this needs to be specified in the dt?
> 
> Yes. On some SoCs selected channels of PWM block can be used as PWM 
> outputs and so thsoe cannot be used for system timers. This property makes 
> it possible to specify channels used as system timers on particular 
> platform (board).
> 
> > Can the driver not just select two arbitrary timers from the hardware?
> 
> In most cases I could statically choose channel 3 and 4 as it was done 
> before my patches on S3C24xx and S3C64xx. I can make those channels 
> default if others are not specified in properties.

That would be nice, it would mean we could have some less verbose dts :)

[...]

> > > -	timer_base = ioremap_nocache(timer_variant.reg_base, SZ_4K);
> > > -	if (!timer_base)
> > > -		panic("failed to map timer registers");
> > > +	if (!timer_base) {
> > > +		timer_base = ioremap_nocache(timer_variant.reg_base, SZ_4K);
> > > +		if (!timer_base)
> > > +			panic("failed to map timer registers");
> > > +	}
> > 
> > You map 4K here, but the binding didn't mention that 4K is always the
> > expected size of the reg.
> 
> This is a compatibility mapping for legacy (non-DT) platforms that will be 
> removed once all platforms get moved to DT.

Sounds reasonable.

[...]

> > > +	if (of_property_read_u32(np, "samsung,source-timer", &val))
> > > +		panic("no samsung,source-timer property provided");
> > > +	if (val > ARRAY_SIZE(timer_variant.irqs))
> > > +		panic("samsung,source-timer property out of range");
> > 
> > This check doesn't tell you if you actually had an irq in the dt for the
> > timer at that index.
> 
> Hmm, this line is probably a bit confusing. I will add a define with 
> maximum number of channels and use it here. This is only a check whether 
> the index given is not out of range.

Ok.

> > Do you really need to panic here? Can you not just warn?
> > 
> > What if a future platform has another timer driver that can at least get
> > the board to boot?
> 
> It's rather unlikely that new platforms using samsung-time will show up. 
> This clocksource is used only for non-SMP platforms based on S3C and S5P 
> SoCs, where it is the only possible supported clocksource.

Ok.

[...]

> > > +	if (!of_property_read_u32(np, "samsung,divisor", &val)) {
> > > +		if (val > 16 || (1 << (fls(val) - 1)) != val)
> > > +			panic("divsor must be 1, 2, 4, 8 or 16");
> > > +		timer_variant.divisor = timer_variant.prescale * val;
> > 
> > Maybe it's just me, but I find this somewhat difficult to read.
> > 
> > How about something like:
> > 
> > switch (val) {
> > case 1:
> > case 2:
> > case 4:
> > case 8:
> > case 16:
> > 	timer_variant.divisor = timer_variant.prescale * val;
> > 	break;
> > default:
> > 	warn("no divisor specified");
> > };
> 
> It looks better indeed. I will change this part in next version.

Great.

Thanks,
Mark.
