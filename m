From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Fri, 17 May 2013 14:17:00 -0700 (PDT)
Message-ID: <1426243.rhL8pXoalu@flatron>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com> <519426A8.8090908@wwwdotorg.org> <20130517122625.GC1952@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:65219 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755998Ab3EQVRD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 17:17:03 -0400
Received: by mail-ea0-f174.google.com with SMTP id z7so2827070eaf.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 14:17:01 -0700 (PDT)
In-Reply-To: <20130517122625.GC1952@game.jcrosoft.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Doug Anderson <dianders@google.com>, Kukjin Kim <kgene.kim@gmail.com>

Hi Jean-Christophe,

On Friday 17 of May 2013 14:26:25 Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 18:22 Wed 15 May     , Stephen Warren wrote:
> > On 05/15/2013 06:13 PM, Tomasz Figa wrote:
> > > On Wednesday 15 of May 2013 16:55:37 Doug Anderson wrote:
> > >> Tomasz / Linus,
> > >> 
> > >> On Wed, May 15, 2013 at 3:06 PM, Tomasz Figa
> > >> <tomasz.figa@gmail.com>
> > > 
> > > wrote:
> > >>> Yes. I don't like the current way too much either, duplication
> > >>> being
> > >>> one of the reasons.
> > >> 
> > >> Do you have any other ideas?  It sounds like Linus didn't like my
> > >> suggestion and makes some good points...
> > > 
> > > I don't have anything interesting at the moment. It's a bit late now
> > > here (2 AM), so I'm going to get some sleep first.
> > > 
> > > Also after reading Stephen's reply, I'm wondering if hogging
> > > wouldn't
> > > solve the problem indeed. (It might have to be fixed on
> > > pinctrl-samsung
> > > first, as last time I tried to use it, it caused some errors from
> > > pinctrl core, but haven't time to track them down, as it wasn't
> > > anything important at that time).
> > 
> > One issue I noticed with the DT fragments earlier in this thread. It
> > looks like hogs in the Samsung pinctrl bingings end up looking like:
> > 
> > pinctrl {
> > 
> >     pina {
> >     
> >         samsung,pins = <PIN_A PIN_B PIN_C>;
> >         samsung,pin-function = <0xf>;
> >         samsung,pin-pud = <0>;
> >         ...
> 
> I have a huge issue here that we had on at91 too
> 
> we are going to have a huge numbet of node
> 
> and on at91 we handle the pin the same way as samsung
> and ST have also a similiar IP
> 
> so I'll prefer to reuse the AT91 DT bindings
> 
> as said by Linus I just push a cleanup of the magic by using Macro
> which make it really readable now
> 
> some extract of the sama5 pinctrl
> 
> 	mmc0 {
> 		pinctrl_mmc0_clk_cmd_dat0: mmc0_clk_cmd_dat0 {
> 			atmel,pins =
> 				<AT91_PIOD 9 AT91_PERIPH_A 
AT91_PINCTRL_NONE	/* PD9 periph A MCI0_CK
> */ AT91_PIOD 0 AT91_PERIPH_A AT91_PINCTRL_PULL_UP	/* PD0 periph A
> MCI0_CDA with pullup */ AT91_PIOD 1 AT91_PERIPH_A
> AT91_PINCTRL_PULL_UP>;	/* PD1 periph A MCI0_DA0 with pullup */ };
> 		pinctrl_mmc0_dat1_3: mmc0_dat1_3 {
> 			atmel,pins =
> 				<AT91_PIOD 2 AT91_PERIPH_A 
AT91_PINCTRL_PULL_UP	/* PD2 periph A
> MCI0_DA1 with pullup */ AT91_PIOD 3 AT91_PERIPH_A
> AT91_PINCTRL_PULL_UP	/* PD3 periph A MCI0_DA2 with pullup */ AT91_PIOD
> 4 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;	/* PD4 periph A MCI0_DA3 
with
> pullup */ };
> 		pinctrl_mmc0_dat4_7: mmc0_dat4_7 {
> 			atmel,pins =
> 				<AT91_PIOD 5 AT91_PERIPH_A 
AT91_PINCTRL_PULL_UP	/* PD5 periph A
> MCI0_DA4 with pullup, conflicts with TIOA0, PWMH2 */ AT91_PIOD 6
> AT91_PERIPH_A AT91_PINCTRL_PULL_UP	/* PD6 periph A MCI0_DA5 with
> pullup, conflicts with TIOB0, PWML2 */ AT91_PIOD 7 AT91_PERIPH_A
> AT91_PINCTRL_PULL_UP	/* PD7 periph A MCI0_DA6 with pullup, conlicts
> with TCLK0, PWMH3 */ AT91_PIOD 8 AT91_PERIPH_A
> AT91_PINCTRL_PULL_UP>;	/* PD8 periph A MCI0_DA7 with pullup, 
conflicts
> with PWML3 */ };
> 	};
> 
> of sam9g45
> 
> 	i2c_gpio2 {
> 		pinctrl_i2c_gpio2: i2c_gpio2-0 {
> 			atmel,pins =
> 				<AT91_PIOB 4 AT91_PERIPH_GPIO 
AT91_PINCTRL_MULTI_DRIVE	/* PB4 gpio
> multidrive I2C2 data */ AT91_PIOB 5 AT91_PERIPH_GPIO
> AT91_PINCTRL_MULTI_DRIVE>;	/* PB5 gpio multidrive I2C2 clock */ };
> 	};
> 
> so we could share the c code too

I'd have a question with regard to AT91 bindings.

Using Samsung bindings we don't need to specify all configuration options 
for a pin, only those that are relevant for the platform. Do your bindings 
allow this?

Apparently AT91 has less configurable things and those available are 
usually always configured together so it's not a problem. But on our SoCs 
we have a bit more of them:
- function (input, output, special functions)
- pull-down/-up
- driver strength
- power down mode function (input, output low, output high, retention)
- power down mode pull-down/-up
- one could argue that default output value could be set this way as well, 
by adding samsung,pin-value property.

Best regards,
Tomasz

> Best Regards,
> J,
> 
> >     };
> >     pinp {
> >     
> >         samsung,pins = <PIN_P PIN_Q>;
> >         samsung,pin-function = <0xe>;
> >         samsung,pin-pud = <1>;
> >         ...
> >     
> >     };
> >     pinx {
> >     
> >         samsung,pins = <PIN_X PIN_Y PIN_Z>;
> >         samsung,pin-function = <0xd>;
> >         samsung,pin-pud = <2>;
> >         ...
> >     
> >     };
> >     
> >     pinctrl-names = "default";
> >     pinctrl-0 = <&pina &pinp &pinx>;
> > 
> > };
> > 
> > That pinctrl-0 property could get rather large (hard to
> > write/maintain,
> > unwieldy) if it needs to set up lots of different configurations.
> > That's why I made the equivalent Tegra bindings be:
> > 
> > pinctrl {
> > 
> >     pins_default {
> >     
> >         pina {
> >         
> >             samsung,pins = <PIN_A PIN_B PIN_C>;
> >             samsung,pin-function = <0xf>;
> >             samsung,pin-pud = <0>;
> >             ...
> >         
> >         };
> >         pinp {
> >         
> >             samsung,pins = <PIN_P PIN_Q>;
> >             samsung,pin-function = <0xe>;
> >             samsung,pin-pud = <1>;
> >             ...
> >         
> >         };
> >         pinx {
> >         
> >             samsung,pins = <PIN_X PIN_Y PIN_Z>;
> >             samsung,pin-function = <0xd>;
> >             samsung,pin-pud = <2>;
> >             ...
> >         
> >         };
> >     
> >     };
> >     
> >     pinctrl-names = "default";
> >     pinctrl-0 = <&pins_default>;
> > 
> > };
> > 
> > The extra level within the "pinctrl configuration node"
> > ("pins_default"
> > here) makes the pinctrl-0 property a lot easier to write, and the
> > advantage happens at every use-site that needs to configure different
> > subsets of the relevant pins in different ways.
> > 
> > If you're changing all the bindings anyway, introducing this extra
> > level might be something to think about.
> > 
> > I did try to explain my philosophy here when we all got together to
> > design the pinctrl bindings, but I obviously didn't explain it well
> > enough, or people didn't like it anyway.
> > _______________________________________________
> > devicetree-discuss mailing list
> > devicetree-discuss@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/devicetree-discuss
