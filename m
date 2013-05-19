From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Sun, 19 May 2013 11:17:36 +0200
Message-ID: <20130519091736.GF1952@game.jcrosoft.org>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
 <1855701.nJQdRzsWsg@flatron>
 <20130518163001.GE1952@game.jcrosoft.org>
 <91263163.s2uhtsH4YZ@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mo3.mail-out.ovh.net ([178.32.228.3]:42787 "EHLO
	mo3.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751378Ab3ESJ1k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 19 May 2013 05:27:40 -0400
Received: from mail632.ha.ovh.net (gw6.ovh.net [213.251.189.206])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 1AC2FFF8451
	for <linux-samsung-soc@vger.kernel.org>; Sun, 19 May 2013 11:21:51 +0200 (CEST)
Content-Disposition: inline
In-Reply-To: <91263163.s2uhtsH4YZ@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Doug Anderson <dianders@google.com>, Kukjin Kim <kgene.kim@gmail.com>

> > > > PULL_UP         (1 << 0): indicate this pin need a pull up.
> > > > MULTIDRIVE      (1 << 1): indicate this pin need to be configured as
> > > > multidrive. DEGLITCH        (1 << 2): indicate this pin need
> > > > deglitch.
> > > > PULL_DOWN       (1 << 3): indicate this pin need a pull down.
> > > > DIS_SCHMIT      (1 << 4): indicate this pin need to disable schmit
> > > > trigger. DEBOUNCE        (1 << 16): indicate this pin need debounce.
> > > > DEBOUNCE_VAL    (0x3fff << 17): debounce val.
> > > > 
> > > > today I was planning to update the binding to allow to this
> > > > 
> > > > instead of writing this
> > > > 
> > > > dbgu {
> > > > 
> > > > 	pinctrl_dbgu: dbgu-0 {
> > > > 	
> > > > 		atmel,pins =
> > > > 		
> > > > 			<AT91_PIOB 30 AT91_PERIPH_A AT91_PINCTRL_NONE
> > > > 			
> > > > 			 AT91_PIOB 31 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;
> > > > 	
> > > > 	};
> > > > 
> > > > };
> > > > 
> > > > we will write this
> > > > 
> > > > dbgu {
> > > > 
> > > > 	pinctrl_dbgu: dbgu-0 {
> > > > 	
> > > > 		atmel,pins =
> > > > 		
> > > > 			<AT91_PIOB 30 AT91_PERIPH_A>,
> > > > 			
> > > > 			 AT91_PIOB 31 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;
> > > > 	
> > > > 	};
> > > > 
> > > > };
> > > > 
> > > > so a pin can have 3 or more parameter
> > > > 
> > > > so as a generic binding only the 3 first will be namdatory (bank
> > > > pinnp
> > > > muxid) the rest will driver specific
> > > > 
> > > > for power down I plan to define an other node
> > > > dbgu {
> > > > 
> > > > 	pinctrl_dbgu_sleep: dbgu_sleep-0 {
> > > > 	
> > > > 		atmel,pins =
> > > > 		
> > > > 			<AT91_PIOB 30 AT91_PERIPH_GPIO>,
> > > > 			
> > > > 			 AT91_PIOB 31 AT91_PERIPH_A
> > > 
> > > AT91_PINCTRL_PULL_DOWN>;
> > > 
> > > > 	};
> > > > 
> > > > };
> > > 
> > > I'm afraid this won't work for Samsung SoCs. In our case normal and
> > > power down settings are completely unrelated, i.e. stored in separate
> > > registers and one doesn't affect another (a system controller
> > > automatically switches between normal and power down settings when
> > > entering or leaving low power modes, like SoC-level suspend).
> > 
> > and?
> 
> Pin configuration node on Exynos SoCs will need 7 values for each pin in 
> samsung,pins property, just like in following example:
> 
> mmc0 {
> 	mmc0_bus1: mmc0-bus1 {
> 		pins = <GPA0 4 SFN3 PULL_UP DRV4 PDN_IN PDN_PULL_UP>;
> 	};
> 	/* ... */
> };
> 
> Now if I just want to enable pull-up for a single pin, I will have to add 
> following node:
> 
> foo {
> 	pins = <GPK1 2 NONE PULL_UP NONE NONE NONE>;
> };
> 

no you will not

foo {
	pins = <GPK1 2 NONE PULL_UP>;
};

how a pin can not have mux?

> while with current bindings I can simply omit properties that I don't care 
> about (or are going to be set up correctly by other means - e.g. 
> gpio_direction_input() or request_irq(), ending with following node:
> 
> foo {
> 	samsung,pins = "gpk1-2";
> 	samsung,pin-pud = <3>;
> };

except here you will 100s of NODE which we do NOT want in the dtb
> 
> This is all I need to configure for simple things like open-drain 
> interrupt lines.
> 
> Another thing is that we're using one driver for many SoCs, which have 
> different variants of the controller. So for example some of them don't 
> have driver strength configuration (S3C24xx, S3C64xx), other don't have 
> power down mode configuration (S3C24xx) and even some of the banks on some 
> SoCs don't support particular type of configuration (alive banks of SoCs 

same on at91 some IP have less feature
and some SoC have the IP/die but not the same pins package

the key point is to share the pin DT handling between at91, ST and Samsung
ofcourse all the IP will have more or less parameter per pin but the basic is
the same for DT and C code

> >= S3C64xx don't have power down mode configuration, because they are 
> always on).
> 
> > on at91 I've x banks of registers to handle each gpio bank
> > 
> > on ST with have same situation but the controller work the same way at
> > the end
> > 
> > so we need to factorise code
> > 
> > > Personally I'd prefer a solution with separate property for each
> > > parameter, because it's much more flexible and allows shorter lines,
> > > making device tree sources more readable.
> > 
> > we already discuss this on the ML the one property perline will endup
> > with 100s of node if not 1000s so we all do agree we do not want this
> > in the DT
> 
> Could you point me to this discussion, please? I'd really like to take a 
> look.

you have to search this on the dt ML, it was about the clk bindings IIRC and
agree on this at Prague durring kernel Summit

Best Regards,
J.
