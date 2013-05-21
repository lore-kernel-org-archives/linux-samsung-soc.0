From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Tue, 21 May 2013 21:09:37 +0200
Message-ID: <20130521190937.GH1952@game.jcrosoft.org>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
 <519426A8.8090908@wwwdotorg.org>
 <20130517122625.GC1952@game.jcrosoft.org>
 <1816755.NQW3rXcpAL@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from 14.mo4.mail-out.ovh.net ([46.105.40.29]:33814 "EHLO
	mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752887Ab3EUTNx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 May 2013 15:13:53 -0400
Received: from mail623.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id AABB610550D9
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 May 2013 21:13:51 +0200 (CEST)
Content-Disposition: inline
In-Reply-To: <1816755.NQW3rXcpAL@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Doug Anderson <dianders@google.com>, Kukjin Kim <kgene.kim@gmail.com>

On 11:28 Tue 21 May     , Tomasz Figa wrote:
> On Friday 17 of May 2013 14:26:25 Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 18:22 Wed 15 May     , Stephen Warren wrote:
> > > On 05/15/2013 06:13 PM, Tomasz Figa wrote:
> > > > On Wednesday 15 of May 2013 16:55:37 Doug Anderson wrote:
> > > >> Tomasz / Linus,
> > > >> 
> > > >> On Wed, May 15, 2013 at 3:06 PM, Tomasz Figa
> > > >> <tomasz.figa@gmail.com>
> > > > 
> > > > wrote:
> > > >>> Yes. I don't like the current way too much either, duplication
> > > >>> being
> > > >>> one of the reasons.
> > > >> 
> > > >> Do you have any other ideas?  It sounds like Linus didn't like my
> > > >> suggestion and makes some good points...
> > > > 
> > > > I don't have anything interesting at the moment. It's a bit late now
> > > > here (2 AM), so I'm going to get some sleep first.
> > > > 
> > > > Also after reading Stephen's reply, I'm wondering if hogging
> > > > wouldn't
> > > > solve the problem indeed. (It might have to be fixed on
> > > > pinctrl-samsung
> > > > first, as last time I tried to use it, it caused some errors from
> > > > pinctrl core, but haven't time to track them down, as it wasn't
> > > > anything important at that time).
> > > 
> > > One issue I noticed with the DT fragments earlier in this thread. It
> > > looks like hogs in the Samsung pinctrl bingings end up looking like:
> > > 
> > > pinctrl {
> > > 
> > >     pina {
> > >     
> > >         samsung,pins = <PIN_A PIN_B PIN_C>;
> > >         samsung,pin-function = <0xf>;
> > >         samsung,pin-pud = <0>;
> > >         ...
> > 
> > I have a huge issue here that we had on at91 too
> > 
> > we are going to have a huge numbet of node
> > 
> > and on at91 we handle the pin the same way as samsung
> > and ST have also a similiar IP
> > 
> > so I'll prefer to reuse the AT91 DT bindings
> > 
> > as said by Linus I just push a cleanup of the magic by using Macro
> > which make it really readable now
> > 
> > some extract of the sama5 pinctrl
> > 
> > 	mmc0 {
> > 		pinctrl_mmc0_clk_cmd_dat0: mmc0_clk_cmd_dat0 {
> > 			atmel,pins =
> > 				<AT91_PIOD 9 AT91_PERIPH_A 
> AT91_PINCTRL_NONE	/* PD9 periph A MCI0_CK
> > */ AT91_PIOD 0 AT91_PERIPH_A AT91_PINCTRL_PULL_UP	/* PD0 periph A
> > MCI0_CDA with pullup */ AT91_PIOD 1 AT91_PERIPH_A
> > AT91_PINCTRL_PULL_UP>;	/* PD1 periph A MCI0_DA0 with pullup */ };
> > 		pinctrl_mmc0_dat1_3: mmc0_dat1_3 {
> > 			atmel,pins =
> > 				<AT91_PIOD 2 AT91_PERIPH_A 
> AT91_PINCTRL_PULL_UP	/* PD2 periph A
> > MCI0_DA1 with pullup */ AT91_PIOD 3 AT91_PERIPH_A
> > AT91_PINCTRL_PULL_UP	/* PD3 periph A MCI0_DA2 with pullup */ AT91_PIOD
> > 4 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;	/* PD4 periph A MCI0_DA3 
> with
> > pullup */ };
> > 		pinctrl_mmc0_dat4_7: mmc0_dat4_7 {
> > 			atmel,pins =
> > 				<AT91_PIOD 5 AT91_PERIPH_A 
> AT91_PINCTRL_PULL_UP	/* PD5 periph A
> > MCI0_DA4 with pullup, conflicts with TIOA0, PWMH2 */ AT91_PIOD 6
> > AT91_PERIPH_A AT91_PINCTRL_PULL_UP	/* PD6 periph A MCI0_DA5 with
> > pullup, conflicts with TIOB0, PWML2 */ AT91_PIOD 7 AT91_PERIPH_A
> > AT91_PINCTRL_PULL_UP	/* PD7 periph A MCI0_DA6 with pullup, conlicts
> > with TCLK0, PWMH3 */ AT91_PIOD 8 AT91_PERIPH_A
> > AT91_PINCTRL_PULL_UP>;	/* PD8 periph A MCI0_DA7 with pullup, 
> conflicts
> > with PWML3 */ };
> > 	};
> > 
> > of sam9g45
> > 
> > 	i2c_gpio2 {
> > 		pinctrl_i2c_gpio2: i2c_gpio2-0 {
> > 			atmel,pins =
> > 				<AT91_PIOB 4 AT91_PERIPH_GPIO 
> AT91_PINCTRL_MULTI_DRIVE	/* PB4 gpio
> > multidrive I2C2 data */ AT91_PIOB 5 AT91_PERIPH_GPIO
> > AT91_PINCTRL_MULTI_DRIVE>;	/* PB5 gpio multidrive I2C2 clock */ };
> > 	};
> > 
> > so we could share the c code too
> 
> OK. After thinking about it a bit more recently, I think your solution 
> might be fine.
> 
> However there is one thing I'm worried about. As far as I remember, when 
> setting a function (mux selector), pinctrl core calls pin_request() to 
> request all pins of the group for the device which requested the 
> configuration.
> 
> Now if we use hogs to set up default configuration of pins, all of them 
> would get requested for the pin controller and then further pin control 
> configuration done by device drivers would fail. This is why I wanted to 
> allow setting pinmux and pinconf separately, without one requiring 
> another.
> 

I undertatnd you use default config for power management optimisation, is it
not?

so you need to set different state in the device instead of using hogs.
default, sleep, etc..

I get an other issue too I have the same pin requested more than one time by
multiple driver.

As thoses pins are used for external memory interface, but they have the same
config. The current pinctrl implementation does not allow share pin.

Best Regards,
J.
