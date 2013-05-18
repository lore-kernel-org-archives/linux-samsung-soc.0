From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Sat, 18 May 2013 19:13:59 +0200
Message-ID: <91263163.s2uhtsH4YZ@flatron>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com> <1855701.nJQdRzsWsg@flatron> <20130518163001.GE1952@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:63233 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752543Ab3ERROB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 18 May 2013 13:14:01 -0400
Received: by mail-ee0-f47.google.com with SMTP id t10so3123643eei.6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 May 2013 10:13:59 -0700 (PDT)
In-Reply-To: <20130518163001.GE1952@game.jcrosoft.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Doug Anderson <dianders@google.com>, Kukjin Kim <kgene.kim@gmail.com>

On Saturday 18 of May 2013 18:30:01 Jean-Christophe PLAGNIOL-VILLARD 
wrote:
> On 16:57 Sat 18 May     , Tomasz Figa wrote:
> > On Saturday 18 of May 2013 10:18:47 Jean-Christophe PLAGNIOL-VILLARD
> > 
> > wrote:
> > > On 14:17 Fri 17 May     , Tomasz Figa wrote:
> > > > Hi Jean-Christophe,
> > > > 
> > > > On Friday 17 of May 2013 14:26:25 Jean-Christophe PLAGNIOL-VILLARD
> > 
> > wrote:
> > > > > On 18:22 Wed 15 May     , Stephen Warren wrote:
> > > > > > On 05/15/2013 06:13 PM, Tomasz Figa wrote:
> > > > > > > On Wednesday 15 of May 2013 16:55:37 Doug Anderson wrote:
> > > > > > >> Tomasz / Linus,
> > > > > > >> 
> > > > > > >> On Wed, May 15, 2013 at 3:06 PM, Tomasz Figa
> > > > > > >> <tomasz.figa@gmail.com>
> > > > > > > 
> > > > > > > wrote:
> > > > > > >>> Yes. I don't like the current way too much either,
> > > > > > >>> duplication
> > > > > > >>> being
> > > > > > >>> one of the reasons.
> > > > > > >> 
> > > > > > >> Do you have any other ideas?  It sounds like Linus didn't
> > > > > > >> like
> > > > > > >> my
> > > > > > >> suggestion and makes some good points...
> > > > > > > 
> > > > > > > I don't have anything interesting at the moment. It's a bit
> > > > > > > late
> > > > > > > now
> > > > > > > here (2 AM), so I'm going to get some sleep first.
> > > > > > > 
> > > > > > > Also after reading Stephen's reply, I'm wondering if hogging
> > > > > > > wouldn't
> > > > > > > solve the problem indeed. (It might have to be fixed on
> > > > > > > pinctrl-samsung
> > > > > > > first, as last time I tried to use it, it caused some errors
> > > > > > > from
> > > > > > > pinctrl core, but haven't time to track them down, as it
> > > > > > > wasn't
> > > > > > > anything important at that time).
> > > > > > 
> > > > > > One issue I noticed with the DT fragments earlier in this
> > > > > > thread.
> > > > > > It
> > > > > > looks like hogs in the Samsung pinctrl bingings end up looking
> > > > > > like:
> > > > > > 
> > > > > > pinctrl {
> > > > > > 
> > > > > >     pina {
> > > > > >     
> > > > > >         samsung,pins = <PIN_A PIN_B PIN_C>;
> > > > > >         samsung,pin-function = <0xf>;
> > > > > >         samsung,pin-pud = <0>;
> > > > > >         ...
> > > > > 
> > > > > I have a huge issue here that we had on at91 too
> > > > > 
> > > > > we are going to have a huge numbet of node
> > > > > 
> > > > > and on at91 we handle the pin the same way as samsung
> > > > > and ST have also a similiar IP
> > > > > 
> > > > > so I'll prefer to reuse the AT91 DT bindings
> > > > > 
> > > > > as said by Linus I just push a cleanup of the magic by using
> > > > > Macro
> > > > > which make it really readable now
> > > > > 
> > > > > some extract of the sama5 pinctrl
> > > > > 
> > > > > 	mmc0 {
> > > > > 	
> > > > > 		pinctrl_mmc0_clk_cmd_dat0: mmc0_clk_cmd_dat0 {
> > > > > 		
> > > > > 			atmel,pins =
> > > > > 			
> > > > > 				<AT91_PIOD 9 AT91_PERIPH_A
> > > > 
> > > > AT91_PINCTRL_NONE	/* PD9 periph A MCI0_CK
> > > > 
> > > > > */ AT91_PIOD 0 AT91_PERIPH_A AT91_PINCTRL_PULL_UP	/* PD0 
periph
> > > > > A
> > > > > MCI0_CDA with pullup */ AT91_PIOD 1 AT91_PERIPH_A
> > > > > AT91_PINCTRL_PULL_UP>;	/* PD1 periph A MCI0_DA0 with 
pullup */
> > > > > };
> > > > > 
> > > > > 		pinctrl_mmc0_dat1_3: mmc0_dat1_3 {
> > > > > 		
> > > > > 			atmel,pins =
> > > > > 			
> > > > > 				<AT91_PIOD 2 AT91_PERIPH_A
> > > > 
> > > > AT91_PINCTRL_PULL_UP	/* PD2 periph A
> > > > 
> > > > > MCI0_DA1 with pullup */ AT91_PIOD 3 AT91_PERIPH_A
> > > > > AT91_PINCTRL_PULL_UP	/* PD3 periph A MCI0_DA2 with pullup */
> > > > > AT91_PIOD
> > > > > 4 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;	/* PD4 periph A 
MCI0_DA3
> > > > 
> > > > with
> > > > 
> > > > > pullup */ };
> > > > > 
> > > > > 		pinctrl_mmc0_dat4_7: mmc0_dat4_7 {
> > > > > 		
> > > > > 			atmel,pins =
> > > > > 			
> > > > > 				<AT91_PIOD 5 AT91_PERIPH_A
> > > > 
> > > > AT91_PINCTRL_PULL_UP	/* PD5 periph A
> > > > 
> > > > > MCI0_DA4 with pullup, conflicts with TIOA0, PWMH2 */ AT91_PIOD 6
> > > > > AT91_PERIPH_A AT91_PINCTRL_PULL_UP	/* PD6 periph A MCI0_DA5
> > 
> > with
> > 
> > > > > pullup, conflicts with TIOB0, PWML2 */ AT91_PIOD 7 AT91_PERIPH_A
> > > > > AT91_PINCTRL_PULL_UP	/* PD7 periph A MCI0_DA6 with pullup,
> > 
> > conlicts
> > 
> > > > > with TCLK0, PWMH3 */ AT91_PIOD 8 AT91_PERIPH_A
> > > > > AT91_PINCTRL_PULL_UP>;	/* PD8 periph A MCI0_DA7 with 
pullup,
> > > > 
> > > > conflicts
> > > > 
> > > > > with PWML3 */ };
> > > > > 
> > > > > 	};
> > > > > 
> > > > > of sam9g45
> > > > > 
> > > > > 	i2c_gpio2 {
> > > > > 	
> > > > > 		pinctrl_i2c_gpio2: i2c_gpio2-0 {
> > > > > 		
> > > > > 			atmel,pins =
> > > > > 			
> > > > > 				<AT91_PIOB 4 AT91_PERIPH_GPIO
> > > > 
> > > > AT91_PINCTRL_MULTI_DRIVE	/* PB4 gpio
> > > > 
> > > > > multidrive I2C2 data */ AT91_PIOB 5 AT91_PERIPH_GPIO
> > > > > AT91_PINCTRL_MULTI_DRIVE>;	/* PB5 gpio multidrive I2C2 clock
> > 
> > */ };
> > 
> > > > > 	};
> > > > > 
> > > > > so we could share the c code too
> > > > 
> > > > I'd have a question with regard to AT91 bindings.
> > > > 
> > > > Using Samsung bindings we don't need to specify all configuration
> > > > options for a pin, only those that are relevant for the platform.
> > > > Do
> > > > your bindings allow this?
> > > 
> > > on at91 we have this too we just put NONE, and I'm planning to allow
> > > to
> > > drop the last option too (not yet implement)
> > > 
> > > > Apparently AT91 has less configurable things and those available
> > > > are
> > > > usually always configured together so it's not a problem. But on
> > > > our
> > > > SoCs we have a bit more of them:
> > > > - function (input, output, special functions)
> > > > - pull-down/-up
> > > > - driver strength
> > > > - power down mode function (input, output low, output high,
> > > > retention)
> > > > - power down mode pull-down/-up
> > > > - one could argue that default output value could be set this way
> > > > as
> > > > well, by adding samsung,pin-value property.
> > > 
> > > on Atmel you have
> > > 
> > > first a pin need to be muxed as a gpio or a function name periph
> > > 
> > >  depending on the SoC we can have up to 4 function mode + gpio
> > > 
> > > then each pin have feature that are independent of the mux function
> > > 
> > > Bits used for CONFIG: (4th parameter)
> > > PULL_UP         (1 << 0): indicate this pin need a pull up.
> > > MULTIDRIVE      (1 << 1): indicate this pin need to be configured as
> > > multidrive. DEGLITCH        (1 << 2): indicate this pin need
> > > deglitch.
> > > PULL_DOWN       (1 << 3): indicate this pin need a pull down.
> > > DIS_SCHMIT      (1 << 4): indicate this pin need to disable schmit
> > > trigger. DEBOUNCE        (1 << 16): indicate this pin need debounce.
> > > DEBOUNCE_VAL    (0x3fff << 17): debounce val.
> > > 
> > > today I was planning to update the binding to allow to this
> > > 
> > > instead of writing this
> > > 
> > > dbgu {
> > > 
> > > 	pinctrl_dbgu: dbgu-0 {
> > > 	
> > > 		atmel,pins =
> > > 		
> > > 			<AT91_PIOB 30 AT91_PERIPH_A AT91_PINCTRL_NONE
> > > 			
> > > 			 AT91_PIOB 31 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;
> > > 	
> > > 	};
> > > 
> > > };
> > > 
> > > we will write this
> > > 
> > > dbgu {
> > > 
> > > 	pinctrl_dbgu: dbgu-0 {
> > > 	
> > > 		atmel,pins =
> > > 		
> > > 			<AT91_PIOB 30 AT91_PERIPH_A>,
> > > 			
> > > 			 AT91_PIOB 31 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;
> > > 	
> > > 	};
> > > 
> > > };
> > > 
> > > so a pin can have 3 or more parameter
> > > 
> > > so as a generic binding only the 3 first will be namdatory (bank
> > > pinnp
> > > muxid) the rest will driver specific
> > > 
> > > for power down I plan to define an other node
> > > dbgu {
> > > 
> > > 	pinctrl_dbgu_sleep: dbgu_sleep-0 {
> > > 	
> > > 		atmel,pins =
> > > 		
> > > 			<AT91_PIOB 30 AT91_PERIPH_GPIO>,
> > > 			
> > > 			 AT91_PIOB 31 AT91_PERIPH_A
> > 
> > AT91_PINCTRL_PULL_DOWN>;
> > 
> > > 	};
> > > 
> > > };
> > 
> > I'm afraid this won't work for Samsung SoCs. In our case normal and
> > power down settings are completely unrelated, i.e. stored in separate
> > registers and one doesn't affect another (a system controller
> > automatically switches between normal and power down settings when
> > entering or leaving low power modes, like SoC-level suspend).
> 
> and?

Pin configuration node on Exynos SoCs will need 7 values for each pin in 
samsung,pins property, just like in following example:

mmc0 {
	mmc0_bus1: mmc0-bus1 {
		pins = <GPA0 4 SFN3 PULL_UP DRV4 PDN_IN PDN_PULL_UP>;
	};
	/* ... */
};

Now if I just want to enable pull-up for a single pin, I will have to add 
following node:

foo {
	pins = <GPK1 2 NONE PULL_UP NONE NONE NONE>;
};

while with current bindings I can simply omit properties that I don't care 
about (or are going to be set up correctly by other means - e.g. 
gpio_direction_input() or request_irq(), ending with following node:

foo {
	samsung,pins = "gpk1-2";
	samsung,pin-pud = <3>;
};

This is all I need to configure for simple things like open-drain 
interrupt lines.

Another thing is that we're using one driver for many SoCs, which have 
different variants of the controller. So for example some of them don't 
have driver strength configuration (S3C24xx, S3C64xx), other don't have 
power down mode configuration (S3C24xx) and even some of the banks on some 
SoCs don't support particular type of configuration (alive banks of SoCs 
>= S3C64xx don't have power down mode configuration, because they are 
always on).

> on at91 I've x banks of registers to handle each gpio bank
> 
> on ST with have same situation but the controller work the same way at
> the end
> 
> so we need to factorise code
> 
> > Personally I'd prefer a solution with separate property for each
> > parameter, because it's much more flexible and allows shorter lines,
> > making device tree sources more readable.
> 
> we already discuss this on the ML the one property perline will endup
> with 100s of node if not 1000s so we all do agree we do not want this
> in the DT

Could you point me to this discussion, please? I'd really like to take a 
look.

Best regards,
Tomasz
