From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Sun, 19 May 2013 12:56:43 +0200
Message-ID: <1569578.9PVtSf9N5i@flatron>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com> <2052598.uZo1hJQL7b@flatron> <20130519103926.GG1952@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f179.google.com ([209.85.215.179]:55533 "EHLO
	mail-ea0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753858Ab3ESK4s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 19 May 2013 06:56:48 -0400
Received: by mail-ea0-f179.google.com with SMTP id z16so3327889ead.10
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 May 2013 03:56:47 -0700 (PDT)
In-Reply-To: <20130519103926.GG1952@game.jcrosoft.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Doug Anderson <dianders@google.com>, Kukjin Kim <kgene.kim@gmail.com>, Linus Walleij <linus.walleij@linaro.org>

On Sunday 19 of May 2013 12:39:26 Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 11:46 Sun 19 May     , Tomasz Figa wrote:
> > On Sunday 19 of May 2013 11:17:36 Jean-Christophe PLAGNIOL-VILLARD 
wrote:
> > > > > > > PULL_UP         (1 << 0): indicate this pin need a pull up.
> > > > > > > MULTIDRIVE      (1 << 1): indicate this pin need to be
> > > > > > > configured as
> > > > > > > multidrive. DEGLITCH        (1 << 2): indicate this pin need
> > > > > > > deglitch.
> > > > > > > PULL_DOWN       (1 << 3): indicate this pin need a pull
> > > > > > > down.
> > > > > > > DIS_SCHMIT      (1 << 4): indicate this pin need to disable
> > > > > > > schmit
> > > > > > > trigger. DEBOUNCE        (1 << 16): indicate this pin need
> > > > > > > debounce.
> > > > > > > DEBOUNCE_VAL    (0x3fff << 17): debounce val.
> > > > > > > 
> > > > > > > today I was planning to update the binding to allow to this
> > > > > > > 
> > > > > > > instead of writing this
> > > > > > > 
> > > > > > > dbgu {
> > > > > > > 
> > > > > > > 	pinctrl_dbgu: dbgu-0 {
> > > > > > > 	
> > > > > > > 		atmel,pins =
> > > > > > > 		
> > > > > > > 			<AT91_PIOB 30 AT91_PERIPH_A
> > 
> > AT91_PINCTRL_NONE
> > 
> > > > > > > 			 AT91_PIOB 31 AT91_PERIPH_A
> > 
> > AT91_PINCTRL_PULL_UP>;
> > 
> > > > > > > 	};
> > > > > > > 
> > > > > > > };
> > > > > > > 
> > > > > > > we will write this
> > > > > > > 
> > > > > > > dbgu {
> > > > > > > 
> > > > > > > 	pinctrl_dbgu: dbgu-0 {
> > > > > > > 	
> > > > > > > 		atmel,pins =
> > > > > > > 		
> > > > > > > 			<AT91_PIOB 30 AT91_PERIPH_A>,
> > > > > > > 			
> > > > > > > 			 AT91_PIOB 31 AT91_PERIPH_A
> > 
> > AT91_PINCTRL_PULL_UP>;
> > 
> > > > > > > 	};
> > > > > > > 
> > > > > > > };
> > > > > > > 
> > > > > > > so a pin can have 3 or more parameter
> > > > > > > 
> > > > > > > so as a generic binding only the 3 first will be namdatory
> > > > > > > (bank
> > > > > > > pinnp
> > > > > > > muxid) the rest will driver specific
> > > > > > > 
> > > > > > > for power down I plan to define an other node
> > > > > > > dbgu {
> > > > > > > 
> > > > > > > 	pinctrl_dbgu_sleep: dbgu_sleep-0 {
> > > > > > > 	
> > > > > > > 		atmel,pins =
> > > > > > > 		
> > > > > > > 			<AT91_PIOB 30 AT91_PERIPH_GPIO>,
> > > > > > > 			
> > > > > > > 			 AT91_PIOB 31 AT91_PERIPH_A
> > > > > > 
> > > > > > AT91_PINCTRL_PULL_DOWN>;
> > > > > > 
> > > > > > > 	};
> > > > > > > 
> > > > > > > };
> > > > > > 
> > > > > > I'm afraid this won't work for Samsung SoCs. In our case
> > > > > > normal
> > > > > > and
> > > > > > power down settings are completely unrelated, i.e. stored in
> > > > > > separate
> > > > > > registers and one doesn't affect another (a system controller
> > > > > > automatically switches between normal and power down settings
> > > > > > when
> > > > > > entering or leaving low power modes, like SoC-level suspend).
> > > > > 
> > > > > and?
> > > > 
> > > > Pin configuration node on Exynos SoCs will need 7 values for each
> > > > pin
> > > > in samsung,pins property, just like in following example:
> > > > 
> > > > mmc0 {
> > > > 
> > > > 	mmc0_bus1: mmc0-bus1 {
> > > > 	
> > > > 		pins = <GPA0 4 SFN3 PULL_UP DRV4 PDN_IN 
PDN_PULL_UP>;
> > > > 	
> > > > 	};
> > > > 	/* ... */
> > > > 
> > > > };
> > > > 
> > > > Now if I just want to enable pull-up for a single pin, I will have
> > > > to
> > > > add following node:
> > > > 
> > > > foo {
> > > > 
> > > > 	pins = <GPK1 2 NONE PULL_UP NONE NONE NONE>;
> > > > 
> > > > };
> > > 
> > > no you will not
> > > 
> > > foo {
> > > 
> > > 	pins = <GPK1 2 NONE PULL_UP>;
> > > 
> > > };
> > 
> > OK, this will work in case of one pin, but if you need two it starts
> > to
> > become problematic. Let's look at an example:
> > 
> > We have two pins for which we don't need to specify power down mode
> > settings (e.g. they are in alive banks):
> > 
> > foo {
> > 
> >  	pins = <GPK1 2 NONE PULL_UP>,
> >  	
> > 		<GPK1 3 NONE PULL_UP>;
> > 
> > };
> 
> as done for cs-gpios

Hmm? Could you explain?

> > After compilation you will get just a series of u32 values, like
> > 
> > foo {
> > 
> > 	pins = <1 2 255 3 1 3 255 3>;
> > 
> > };
> > 
> > 
> > 
> > 
> > How are you going to distinguish such setup with:
> > 
> > foo {
> > 
> >  	pins = <GPK1 2 NONE PULL_UP NONE NONE NONE>,
> >  	
> > 		<GPK1 3 NONE PULL_UP NONE NONE NONE>;
> > 
> > };
> > 
> >> which translates to
> > 
> > foo {
> > 
> > 	pins = <1 2 255 3 255 255 255 1 3 255 3 255 255 255>;
> > 
> > };
> > 
> > I mean, you don't know where one entry ends and another starts, if you
> > allow to left out some values.
> 
> on gpios we can do so, I want to have the same feature here
>

AFAIK, in case of GPIOs it depends on #gpio-cells property of GPIO 
provider node and GPIO specifiers of the same provider always need the 
same amount of cells. Correct me if I'm missing something.

> > > how a pin can not have mux?
> > 
> > I don't always want to change the mux. Sometimes I just want to change
> > one of the other parameters. For example, I don't want to switch the
> > pin to interrupt mode on driver probe (it is a separate pin mux
> > value), but rather after the trigger type gets configured, which is
> > done by request_irq() based on trigger flags.
> 
> so request the same

Sure, this will work, but is respecifying the same value and reconfiguring 
the pin with the same value multiple times really what we want?

As opposed to the amount of device tree nodes, this has the potential of 
slowing down the boot.

> > > > while with current bindings I can simply omit properties that I
> > > > don't
> > > > care about (or are going to be set up correctly by other means -
> > > > e.g.
> > > > gpio_direction_input() or request_irq(), ending with following
> > > > node:
> > > > 
> > > > foo {
> > > > 
> > > > 	samsung,pins = "gpk1-2";
> > > > 	samsung,pin-pud = <3>;
> > > > 
> > > > };
> > > 
> > > except here you will 100s of NODE which we do NOT want in the dtb
> > 
> > Is this really an issue?
> 
> just one example
> 
> slow down the boot

I haven't noticed any slow down. (533 MHz ARM1176jzf-s in S3C6410)

Best regards,
Tomasz

> > We are already using this method to describe really complex boards
> > (not
> > necessarily in mainline) and we don't have any problems.
> > 
> > > > This is all I need to configure for simple things like open-drain
> > > > interrupt lines.
> > > > 
> > > > Another thing is that we're using one driver for many SoCs, which
> > > > have
> > > > different variants of the controller. So for example some of them
> > > > don't
> > > > have driver strength configuration (S3C24xx, S3C64xx), other don't
> > > > have
> > > > power down mode configuration (S3C24xx) and even some of the banks
> > > > on
> > > > some SoCs don't support particular type of configuration (alive
> > > > banks
> > > > of SoCs
> > > 
> > > same on at91 some IP have less feature
> > > and some SoC have the IP/die but not the same pins package
> > > 
> > > the key point is to share the pin DT handling between at91, ST and
> > > Samsung ofcourse all the IP will have more or less parameter per pin
> > > but the basic is the same for DT and C code
> > > 
> > > > >= S3C64xx don't have power down mode configuration, because they
> > > > >are
> > > > 
> > > > always on).
> > > > 
> > > > > on at91 I've x banks of registers to handle each gpio bank
> > > > > 
> > > > > on ST with have same situation but the controller work the same
> > > > > way
> > > > > at
> > > > > the end
> > > > > 
> > > > > so we need to factorise code
> > > > > 
> > > > > > Personally I'd prefer a solution with separate property for
> > > > > > each
> > > > > > parameter, because it's much more flexible and allows shorter
> > > > > > lines,
> > > > > > making device tree sources more readable.
> > > > > 
> > > > > we already discuss this on the ML the one property perline will
> > > > > endup
> > > > > with 100s of node if not 1000s so we all do agree we do not want
> > > > > this
> > > > > in the DT
> > > > 
> > > > Could you point me to this discussion, please? I'd really like to
> > > > take
> > > > a look.
> > > 
> > > you have to search this on the dt ML, it was about the clk bindings
> > > IIRC and agree on this at Prague durring kernel Summit
> > 
> > OK. Will look for it.
> > 
> > Best regards,
> > Tomasz
