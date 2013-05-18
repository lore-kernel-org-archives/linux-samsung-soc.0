From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Sat, 18 May 2013 10:18:47 +0200
Message-ID: <20130518081847.GD1952@game.jcrosoft.org>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
 <519426A8.8090908@wwwdotorg.org>
 <20130517122625.GC1952@game.jcrosoft.org>
 <1426243.rhL8pXoalu@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426243.rhL8pXoalu@flatron>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 14:17 Fri 17 May     , Tomasz Figa wrote:
> Hi Jean-Christophe,
> 
> On Friday 17 of May 2013 14:26:25 Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 18:22 Wed 15 May     , Stephen Warren wrote:
> > > On 05/15/2013 06:13 PM, Tomasz Figa wrote:
> > > > On Wednesday 15 of May 2013 16:55:37 Doug Anderson wrote:
> > > >> Tomasz / Linus,
> > > >> 
> > > >> On Wed, May 15, 2013 at 3:06 PM, Tomasz Figa
> > > >> <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
> I'd have a question with regard to AT91 bindings.
> 
> Using Samsung bindings we don't need to specify all configuration options 
> for a pin, only those that are relevant for the platform. Do your bindings 
> allow this?
on at91 we have this too we just put NONE, and I'm planning to allow to drop
the last option too (not yet implement)
> 
> Apparently AT91 has less configurable things and those available are 
> usually always configured together so it's not a problem. But on our SoCs 
> we have a bit more of them:
> - function (input, output, special functions)
> - pull-down/-up
> - driver strength
> - power down mode function (input, output low, output high, retention)
> - power down mode pull-down/-up
> - one could argue that default output value could be set this way as well, 
> by adding samsung,pin-value property.

on Atmel you have

first a pin need to be muxed as a gpio or a function name periph
 depending on the SoC we can have up to 4 function mode + gpio

then each pin have feature that are independent of the mux function

Bits used for CONFIG: (4th parameter)
PULL_UP         (1 << 0): indicate this pin need a pull up.
MULTIDRIVE      (1 << 1): indicate this pin need to be configured as multidrive.
DEGLITCH        (1 << 2): indicate this pin need deglitch.
PULL_DOWN       (1 << 3): indicate this pin need a pull down.
DIS_SCHMIT      (1 << 4): indicate this pin need to disable schmit trigger.
DEBOUNCE        (1 << 16): indicate this pin need debounce.
DEBOUNCE_VAL    (0x3fff << 17): debounce val.

today I was planning to update the binding to allow to this

instead of writing this

dbgu {
	pinctrl_dbgu: dbgu-0 {
		atmel,pins =
			<AT91_PIOB 30 AT91_PERIPH_A AT91_PINCTRL_NONE
			 AT91_PIOB 31 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;
	};
};

we will write this

dbgu {
	pinctrl_dbgu: dbgu-0 {
		atmel,pins =
			<AT91_PIOB 30 AT91_PERIPH_A>,
			 AT91_PIOB 31 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;
	};
};

so a pin can have 3 or more parameter

so as a generic binding only the 3 first will be namdatory (bank pinnp muxid)
the rest will driver specific

for power down I plan to define an other node
dbgu {
	pinctrl_dbgu_sleep: dbgu_sleep-0 {
		atmel,pins =
			<AT91_PIOB 30 AT91_PERIPH_GPIO>,
			 AT91_PIOB 31 AT91_PERIPH_A AT91_PINCTRL_PULL_DOWN>;
	};
};

Best Regards,
J.
> 
> Best regards,
> Tomasz
> 
> > Best Regards,
> > J,
> > 
> > >     };
> > >     pinp {
> > >     
> > >         samsung,pins = <PIN_P PIN_Q>;
> > >         samsung,pin-function = <0xe>;
> > >         samsung,pin-pud = <1>;
> > >         ...
> > >     
> > >     };
> > >     pinx {
> > >     
> > >         samsung,pins = <PIN_X PIN_Y PIN_Z>;
> > >         samsung,pin-function = <0xd>;
> > >         samsung,pin-pud = <2>;
> > >         ...
> > >     
> > >     };
> > >     
> > >     pinctrl-names = "default";
> > >     pinctrl-0 = <&pina &pinp &pinx>;
> > > 
> > > };
> > > 
> > > That pinctrl-0 property could get rather large (hard to
> > > write/maintain,
> > > unwieldy) if it needs to set up lots of different configurations.
> > > That's why I made the equivalent Tegra bindings be:
> > > 
> > > pinctrl {
> > > 
> > >     pins_default {
> > >     
> > >         pina {
> > >         
> > >             samsung,pins = <PIN_A PIN_B PIN_C>;
> > >             samsung,pin-function = <0xf>;
> > >             samsung,pin-pud = <0>;
> > >             ...
> > >         
> > >         };
> > >         pinp {
> > >         
> > >             samsung,pins = <PIN_P PIN_Q>;
> > >             samsung,pin-function = <0xe>;
> > >             samsung,pin-pud = <1>;
> > >             ...
> > >         
> > >         };
> > >         pinx {
> > >         
> > >             samsung,pins = <PIN_X PIN_Y PIN_Z>;
> > >             samsung,pin-function = <0xd>;
> > >             samsung,pin-pud = <2>;
> > >             ...
> > >         
> > >         };
> > >     
> > >     };
> > >     
> > >     pinctrl-names = "default";
> > >     pinctrl-0 = <&pins_default>;
> > > 
> > > };
> > > 
> > > The extra level within the "pinctrl configuration node"
> > > ("pins_default"
> > > here) makes the pinctrl-0 property a lot easier to write, and the
> > > advantage happens at every use-site that needs to configure different
> > > subsets of the relevant pins in different ways.
> > > 
> > > If you're changing all the bindings anyway, introducing this extra
> > > level might be something to think about.
> > > 
> > > I did try to explain my philosophy here when we all got together to
> > > design the pinctrl bindings, but I obviously didn't explain it well
> > > enough, or people didn't like it anyway.
> > > _______________________________________________
> > > devicetree-discuss mailing list
> > > devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > > https://lists.ozlabs.org/listinfo/devicetree-discuss
