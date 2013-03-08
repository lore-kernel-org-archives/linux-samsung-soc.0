From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 00/23] RFC: exynos multiplatform support
Date: Fri, 08 Mar 2013 01:40:53 +0100
Message-ID: <3271021.WsP8f9ZEBl@flatron>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de> <201303070302.46593.arnd@arndb.de> <20130307072203.GC3451@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f41.google.com ([74.125.83.41]:61341 "EHLO
	mail-ee0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759872Ab3CHAlB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 19:41:01 -0500
Received: by mail-ee0-f41.google.com with SMTP id c13so777858eek.28
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Mar 2013 16:40:59 -0800 (PST)
In-Reply-To: <20130307072203.GC3451@avionic-0098.mockup.avionic-design.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Thursday 07 of March 2013 08:22:03 Thierry Reding wrote:
> On Thu, Mar 07, 2013 at 03:02:46AM +0000, Arnd Bergmann wrote:
> > On Wednesday 06 March 2013, Thierry Reding wrote:
> > > > Option 2 would probably come down to having a trivial MFD driver
> > > > exposing a regmap. You can probably reuse drivers/mfd/syscon.c
> > > > for this and make the node compatible with "syscon" to designate
> > > > the clock registers as a system-wide resource, making the other
> > > > device nodes register-less.> > 
> > > I think option 2 is the standard method if one hardware block
> > > provides
> > > several logical devices. I find it to be a pretty nice solution to
> > > this
> > > problem. We also have precedent in the PWM subsystem. The TWL chips
> > > for
> > > instance use it to create a platform device which is later driven by
> > > a
> > > PWM driver.
> > 
> > One difference though is that the TWL chip is a heterogenous MFD that
> > has a lot of different sub-devices, where in case of Exynos the timer
> > device has a set of identical units, each of which can be used either
> > as a PWM or as a clocksource or other timer.
> 
> I didn't know that. However I still making this an MFD driver is a good
> fit because it'll move the logic of defining the mode of each unit is
> kept in a parent driver which can instantiate the proper child devices
> for the corresponding subsystems.
> 
> One big disadvantage of this approach is that if this is continued there
> is a risk that MFD will turn into a dump for all kinds of devices that
> provide more than a single service.
> 
> So if people prefer option 3 I'm fine with it as well.

I have a question regarding making this an MFD driver.

As you know, the main clocksource driver must be initialized early, from 
init_time callback of machine_desc. How does using the MFD subsystem fit 
into this scheme?

P.S. I'm still not convinced about any benefits of options 2 and 3 over 
option 1, which has the obvious advantage of requiring least amount of 
changes to existing code and not binding the PWM and clocksource drivers 
together (on Exynos SoCs only the PWM driver is used, clocksource is 
handled by different hardware block - MCT).

Best regards,
Tomasz
