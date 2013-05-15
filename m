From: Doug Anderson <dianders@google.com>
Subject: Pulls and drive strengths in the pinctrl world
Date: Wed, 15 May 2013 09:44:22 -0700
Message-ID: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:55880 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932899Ab3EOQoY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 12:44:24 -0400
Received: by mail-la0-f45.google.com with SMTP id ec20so1674382lab.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 09:44:22 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

Linus,

I'm currently working towards adapting exynos5250-snow (the ARM
Chromebook) to work well in the new world of pinctrl.  We've got a
backport of exynos5250 pinctrl in our kernel-3.8 tree and are now
fixing all of the bugs that have popped up.  Patches will be sent
upstream (where applicable) shortly.


...but I'm running into an issue when trying to specify pullups /
pulldowns and drive strengths on lines that are just GPIOs or just
interrupts.  This is important not just for power usage but also for
proper functioning (the default internal pulldown was overpowering the
weak external pullup in one case).  In the old GPIO specifier you
could do specify pulls, but the new simpler one doesn't allow it.

I've managed to make things work and you can see my progress at
<https://gerrit.chromium.org/gerrit/#/c/51232/>, but it feels a bit
awkward.  Is there a better way?  If so, then I'm all ears!  :)


If not, then I guess that what I have will have to do for now.  ...but
I really wish that:

* The GPIO specifier could specify initial drive strength and pull
values for pins.
* The interrupt specifier could specify pull values for pins (drive
strength shouldn't be needed since these are inputs).

Some examples from the gerrit CL referenced above...

Here's how I need to do things when I'm using "just an interrupt":

  pinctrl@11400000 {
    cyapa_irq: cyapa-irq {
      samsung,pins = "gpx1-2";
      samsung,pin-function = <0xf>;
      samsung,pin-pud = <0>;
      samsung,pin-drv = <0>;
    };
  };

  trackpad {
    reg = <0x67>;
    compatible = "cypress,cyapa";
    interrupts = <2 0>;
    interrupt-parent = <&gpx1>;
    pinctrl-names = "default";
    pinctrl-0 = <&cyapa_irq>;
    wakeup-source;
  };


I really wish I could add a 3rd number to the interrupt specifier for
pud and skip the pinctrl bit:

  trackpad {
    reg = <0x67>;
    compatible = "cypress,cyapa";
    interrupts = <2 0 0>;
    interrupt-parent = <&gpx1>;
    wakeup-source;
  };


An example with the GPIO specifier instead of the interrupt one:

  pinctrl@11400000 {
    ptn3460_gpios: ptn3460-gpios {
      samsung,pins = "gpy2-5", "gpx1-5";
      samsung,pin-function = <1>;
      samsung,pin-pud = <0>;
      samsung,pin-drv = <0>;
    };
  };

  ptn3460-bridge@20 {
    compatible = "nxp,ptn3460";
    reg = <0x20>;
    powerdown-gpio = <&gpy2 5 0>;
    reset-gpio = <&gpx1 5 0>;
    edid-emulation = <5>;
    pinctrl-names = "default";
    pinctrl-0 = <&ptn3460_gpios>;
  };


I don't want to specify function/direction (code can handle that), but do wish
I could specify the pulls and strength.  Perhaps:

  ptn3460-bridge@20 {
    compatible = "nxp,ptn3460";
    reg = <0x20>;
    powerdown-gpio = <&gpy2 5 0 0 0>;
    reset-gpio = <&gpx1 5 0 0 0>;
    edid-emulation = <5>;
  };


-Doug
