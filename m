From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Wed, 15 May 2013 20:29:47 +0200
Message-ID: <CACRpkdbgjqF3xhxUvfvNJn5Vt-3i0AFBzR_Q8gHdNq919dnNsA@mail.gmail.com>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:54401 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932875Ab3EOS3y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 14:29:54 -0400
Received: by mail-ie0-f175.google.com with SMTP id s9so4370458iec.20
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 11:29:53 -0700 (PDT)
In-Reply-To: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@google.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

On Wed, May 15, 2013 at 6:44 PM, Doug Anderson <dianders@google.com> wrote:

Pls include Stephen Warren on mailings regarding DT mappings,
he's very good at this stuff.

> I'm running into an issue when trying to specify pullups /
> pulldowns and drive strengths on lines that are just GPIOs or just
> interrupts.  This is important not just for power usage but also for
> proper functioning (the default internal pulldown was overpowering the
> weak external pullup in one case).  In the old GPIO specifier you
> could do specify pulls, but the new simpler one doesn't allow it.

Background:

The idea with the subsystems is that the GPIO subsystem will
handle any aspect of "GPIOs" which are not necessarily
synonymous to pins.

So the two subsystems are orthogonal and the decisions in
each subsystem may result on combined electrical effects.

If there are cross-dependencies, GPIO ranges are used to
cross-map the GPIOs to pins.

> I've managed to make things work and you can see my progress at
> <https://gerrit.chromium.org/gerrit/#/c/51232/>, but it feels a bit
> awkward.  Is there a better way?  If so, then I'm all ears!  :

This seems good. default states are used to set up pins.

But please use the preprocessor to provide symbolic names for
the configurations. See for example these two patches from
J-C:
http://www.mail-archive.com/devicetree-discuss@lists.ozlabs.org/msg32164.html

> I really wish that:
>
> * The GPIO specifier could specify initial drive strength and pull
> values for pins.
> * The interrupt specifier could specify pull values for pins (drive
> strength shouldn't be needed since these are inputs).

The subsystem does not differentiate between different configs,
what you say is that you want GPIO and interrupt specifiers
to pass arbitrary configs.

> Here's how I need to do things when I'm using "just an interrupt":
>
>   pinctrl@11400000 {
>     cyapa_irq: cyapa-irq {
>       samsung,pins = "gpx1-2";
>       samsung,pin-function = <0xf>;
>       samsung,pin-pud = <0>;
>       samsung,pin-drv = <0>;
>     };
>   };
>
>   trackpad {
>     reg = <0x67>;
>     compatible = "cypress,cyapa";
>     interrupts = <2 0>;
>     interrupt-parent = <&gpx1>;
>     pinctrl-names = "default";
>     pinctrl-0 = <&cyapa_irq>;
>     wakeup-source;
>   };
>
>
> I really wish I could add a 3rd number to the interrupt specifier for
> pud and skip the pinctrl bit:
>
>   trackpad {
>     reg = <0x67>;
>     compatible = "cypress,cyapa";
>     interrupts = <2 0 0>;
>     interrupt-parent = <&gpx1>;
>     wakeup-source;
>   };

I don't think the idea with device tree is to write as compact trees
as possible, but as expressive and exact yet abstract trees as
possible for OS independence.

Instead of referring to a node containing the config relevant for
another piece of hardware and associating this with the ampersand
notation (as is done with regulators, clocks, dma channels ...)
you here want to break that pattern totally and just hardcode
a numeric argument into the specifier. (Well could be a #define
using includes, but...)

That is not the pattern used so far I've seen to indicate dependent
resources. Dependent resources are passed using the ampersand.

While a number may suffice to describe all config for your hardware,
other pinctrl hardware needs more than one single numeric
argument. And device trees should be similar to each other.

If you're not doing that using the ampersand, the same could
potentially be done for a regulator powering a GPIO pin
and you get a fourth argument, and a fifth argument supplying
the color of the LED at the other end and ... I guess this is
why ampersands are being used.

Other than that I think you should ask a DT expert and I'm
no such.

> An example with the GPIO specifier instead of the interrupt one:
>
>   pinctrl@11400000 {
>     ptn3460_gpios: ptn3460-gpios {
>       samsung,pins = "gpy2-5", "gpx1-5";
>       samsung,pin-function = <1>;
>       samsung,pin-pud = <0>;
>       samsung,pin-drv = <0>;
>     };
>   };
>
>   ptn3460-bridge@20 {
>     compatible = "nxp,ptn3460";
>     reg = <0x20>;
>     powerdown-gpio = <&gpy2 5 0>;
>     reset-gpio = <&gpx1 5 0>;
>     edid-emulation = <5>;
>     pinctrl-names = "default";
>     pinctrl-0 = <&ptn3460_gpios>;
>   };
>
>
> I don't want to specify function/direction (code can handle that), but do wish
> I could specify the pulls and strength.  Perhaps:
>
>   ptn3460-bridge@20 {
>     compatible = "nxp,ptn3460";
>     reg = <0x20>;
>     powerdown-gpio = <&gpy2 5 0 0 0>;
>     reset-gpio = <&gpx1 5 0 0 0>;
>     edid-emulation = <5>;
>   };

Dito.

Yours,
Linus Walleij
