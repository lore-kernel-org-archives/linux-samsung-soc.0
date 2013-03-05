From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/23] RFC: exynos multiplatform support
Date: Tue, 5 Mar 2013 19:19:02 +0000
Message-ID: <201303051919.02638.arnd@arndb.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de> <1579361.FL4RHMlS27@amdc1227>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:61878 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758806Ab3CETTL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 14:19:11 -0500
In-Reply-To: <1579361.FL4RHMlS27@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Tuesday 05 March 2013, Tomasz Figa wrote:
> > 
> > With this patch set, we can build mach-exynos as part
> > of a multiplatform kernel, with the following caveats:
> > 
> > * Only DT based boards are supported
> 
> As far as I'm aware, there are plans to drop non-DT Exynos support. Kgene 
> should know more on this.

Yes, that was my understanding as well. It might not actually be too 
hard to get multiplatform working with the ATAGS based board files
(we do that on some of the other platforms), but there is probably
no reason to try hard.
 
> > * Moving to common-clk breaks things including cpufreq
> >   and others. Thomas is working on a patch for this
> 
> We have several patches internally for fixing things up to run correclty with 
> common-clk. I'll see if we can post some patches.

Ok, excellent.

> > * We disable the gpio implementation, which also breaks
> >   stuff, but Thomas has a patch already
> 
> The legacy GPIO code is needed only for non-DT case. DT-case uses the new 
> pinctrl-samsung driver, which is (AFAIK) multiplatform-aware.

Please have a closer look at the "ARM: exynos: work around missing gpio
code on multiplatform" patch, I think there a few files I had to touch
that actually rely on the legacy gpio code:

* the pm-gpio.c file
* the s3c_i2c0_cfg_gpio function
* the eint irqchip

If none of these are needed for DT-based systems, we should probably
build that code conditionally based on the CONFIG_EXYNOS_ATAGS symbol
I introduced.

> > * sparsemem support is not available on multiplatform
> 
> There was some discussion some time ago whether we really need sparsemem on 
> Exynos. If I remember correctly, it turned out that we don't. So this is not 
> really an issue.

Ok, good.
 
> > Arnd Bergmann (23):
> >   ARM: exynos: introduce EXYNOS_ATAGS symbol
> >   irqchip: exynos: remove dependency on mach/irqs.h
> >   tty: serial/samsung: prepare for common clock API
> >   tty: serial/samsung: make register definitions global
> >   tty: serial/samsung: fix modular build
> >   ARM: exynos: move debug-macro.S to include/debug/
> >   i2c: s3c2410: make header file local
> >   mmc: sdhci-s3c: remove platform dependencies
> >   usb: exynos: do not include plat/usb-phy.h
> >   [media] exynos: remove unnecessary header inclusions
> >   video/exynos: remove unnecessary header inclusions
> >   thermal/exynos: remove unnecessary header inclusions
> >   mtd: onenand/samsung: make regs-onenand.h file local
> >   rtc: s3c: make header file local
> >   spi: s3c64xx: move to generic dmaengine API
> >   pwm: samsung: repair the worst MMIO abuses
> 
> I'm currently working (in my free time) on a series of cleanup patches 
> sanitizing Samsung PWM code for S3C64xx and S5PV210 DT (and multiplatform) 
> support.

Ah, nice.

> On those platforms it is a bit more complex case as there are two blocks of 
> code that access the same hardware - samsung-time (using two PWM channels for 
> clocksource and clock events) and pwm-samsung.
> 
> Hopefully, I will have some patches ready soon.

How are you planning to solve this? Do you want to have a combined driver that
registers both a clocksource and a pwm?

	Arnd
