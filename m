From: Doug Anderson <dianders@chromium.org>
Subject: State of pinctrl and exynos5250?
Date: Fri, 1 Mar 2013 16:19:39 -0800
Message-ID: <CAD=FV=XTHs5De3hrZu5BMPD3sTzBLikHwdS88XA0KOn-XG499Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:56676 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751688Ab3CBATl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Mar 2013 19:19:41 -0500
Received: by mail-lb0-f176.google.com with SMTP id s4so2615092lbc.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Mar 2013 16:19:39 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Prathyush <prathyush.k@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Olof Johansson <olofj@chromium.org>, Simon Glass <sjg@chromium.org>, Katie Roberts-Hoffman <katierh@chromium.org>, Linus Walleij <linus.walleij@linaro.org>

Thomas and Tomasz,

I'm trying to get my head wrapped around the state of pinctrl for
exynos5250.  I see various patches that have floated around at times
but it doesn't look like anything has landed.  It would be really nice
to get this resolved since I think it blocks getting eint support
landed for exynos5250 and that blocks getting many peripherals working
on the ARM Chromebook.

I'm still a little new to the world on pinctrl so hopefully nothing
below is too stupidly wrong...

---

Patches that seem to be relevant (NOTE: all of these need
"pinctrl-exynos5250" fixed to "exynos5250-pinctrl"):

pinctrl: exynos: add exynos5250 SoC specific data
- https://patchwork.kernel.org/patch/1871901/

gpio: samsung: skip gpiolib registration if pinctrl support is enabled
for exynos5250
- https://patchwork.kernel.org/patch/1871911/

arm: exynos: skip wakeup interrupt registration for exynos5250 if
pinctrl is enabled
- https://patchwork.kernel.org/patch/1871921/

ARM: dts: add pinctrl nodes for Exynos5250 SoC
- https://patchwork.kernel.org/patch/1871991/
--> NOTE: Appears to be missing pinctrl_1 and pinctrl_2.  That
prevents me from compiling with i2c arbitration patches landed since I
need gpf0.
--> NOTE: Appears (IIRC) to have incorrect interrupt for pinctrl_3.  I
believe that 45 is pinctrl_1.  Maybe 3 is 47?
--> NIT NOTE: It appears sd0_busN is strangely specified.
Specifically sd0_bus4 includes the pins for sd0_bus1 but sd0_bus8
doesn't.

---

I've got all of the above patches "fixed up" in my local tree
(including adding really basic support for pinctrl_1 and pinctrl_2).
...but my machine doesn't boot all the way.  I think that's because
many of the peripherals don't yet understand pinctrl.  Specifically I
get delightful looking error messages at bootup that look like:

[    0.440000] _gpio_request: gpio-36 (i2c-bus) status -16
[    0.445000] s3c-i2c s3c2440-i2c.0: gpio [36] request failed

I then replaced some of the "muxing via GPIO" with "muxing via
pinctrl" for i2c parts, like:
-               gpios = <&gpb3 0 2 3 0>,
-                       <&gpb3 1 2 3 0>;
+               pinctrl-0 = <&i2c0_bus>;
+               pinctrl-names = "default";

...and I got rid of those errors, but it looks like we're missing
pinctrl support for the ever-important "dw_mmc".

[    0.910000] Synopsys Designware Multimedia Card Interface Driver
[    0.915000] dwmmc_exynos dw_mmc.0: Using internal DMA controller.
[    0.920000] dwmmc_exynos dw_mmc.0: DW MMC controller at irq 107, 32
bit host data width, 128 deep fifo
[    0.930000] of_get_named_gpio_flags exited with status 40
[    0.935000] of_get_named_gpio_flags: can't parse gpios property
[    0.940000] dwmmc_exynos dw_mmc.0: invalid gpio: -2
[    0.945000] dwmmc_exynos: probe of dw_mmc.0 failed with error -22

We also need it for "spi-s3c64xx.c" but that's less of a critical component.
[    0.405000] of_get_named_gpio_flags exited with status 18
[    0.410000] /spi@12d30000: could not get #gpio-cells for
/pinctrl@11400000/i2c0-bus
[    0.415000] of_get_named_gpio_flags: can't parse gpios property
[    0.420000] s3c64xx-spi exynos4210-spi.1: invalid gpio[1]: -22
[    0.425000] s3c64xx-spi: probe of exynos4210-spi.1 failed with error -16

Those are the drivers that have their muxing state defined using the
old hacky samsung gpio descriptor.


Hmmm, it also looks like I need to update other "gpio" references too
(gpio-keys, i2c-arbitrator, hpd-gpio) since the GPIO specifier has
changed now that it's based on pinmux.  I guess you either need to
move a whole architecture (all of exynos5250) at once since you can't
mix and match.


IMHO that means we've got the following work ahead of us:
1. Add pinctrl support to dw_mmc-exynos (with backward compability for
GPIO specifier)
2. Add pinctrl support to spi-s3c64xx.c (with backward compability for
GPIO specifier)
3. In one fell swoop convert all exynos5 dts / dtsi files over to use
pinctrl since things will be broken with a "half" conversion.

Assuming I'm understanding #3 above, I guess that means that I "NAK"
the "ARM: dts: add pinctrl nodes for Exynos5250 SoC" patch since it
doesn't include fixup for all of the exynos5250 platforms (smdk5250
and snow) out there.

---

I'd appreciate any thoughts that you have.  I'd also appreciate a
timeframe for when this work will be picked back up, since the old
patches are 2.5 months old now...  I may be able to help a little
(especially with bits relevant to the ARM Chromebook) but I'm not sure
I can do all of the heavy lifting...  ...and I'd hate to rebase/repost
Thomas's patches myself without checking...

NOTE: I've actually hacked something together that seems to get dw_mmc
happy with pinmuxing and I can boot the system, so I guess that proves
that the above can't all be wrong.  ;)


Thanks much and sorry for the super long email!  :)

-Doug
