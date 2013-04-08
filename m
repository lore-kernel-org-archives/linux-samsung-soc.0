From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 04/14] mfd: Add Samsung PWM/timer master driver
Date: Mon, 08 Apr 2013 18:53:13 +0200
Message-ID: <5357756.gKmBOZlWcd@flatron>
References: <1365093431-30621-1-git-send-email-t.figa@samsung.com> <201304052154.21361.arnd@arndb.de> <2359597.ofbj7Kvioz@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f179.google.com ([209.85.215.179]:48429 "EHLO
	mail-ea0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934558Ab3DHQxM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 12:53:12 -0400
Received: by mail-ea0-f179.google.com with SMTP id f15so2368110eak.38
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Apr 2013 09:53:11 -0700 (PDT)
In-Reply-To: <2359597.ofbj7Kvioz@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <t.figa@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, john.stultz@linaro.org, tglx@linutronix.de

On Saturday 06 of April 2013 00:24:18 Tomasz Figa wrote:
> On Friday 05 of April 2013 21:54:21 Arnd Bergmann wrote:
> > On Friday 05 April 2013, Tomasz Figa wrote:
> > > > I don't think anyone ever suggested using a private API though.
> > > 
> > > I must have gotten the last paragraph of
> > > http://article.gmane.org/gmane.linux.kernel.samsung-soc/16638
> > > wrong then. For me it seemed like the timer driver would expose a
> > > private API to the PWM driver.
> > 
> > Yes, sorry I wasn't clear enough. I meant a register-level interface
> > exposed from the base driver, not a high-level interface like you
> > did.
> 
> I'm not sure what you mean by a register-level interface. Something like
> samsung_pwm_update_reg(reg, mask, val), which modifies bitfields
> according to the mask and value with appropriate synchronization? If
> yes, this solves only the problem of access to shared registers.
> 
> The other problems that remain:
> 
> - negotiation of PWM channels to use for clock source and clock events,
>   because each board can use different channels for PWM outputs,
> 
> - code duplication caused by both of the drivers doing mostly the same
>   things and or having to parse the same data from device tree,
> 
> - both non-DT and DT platforms must be supported,
> 
> - how to keep the ability to load PWM driver as a module (or not load it
> at all when PWM is not used on particular board), while retaining
> everything that is needed for the clocksource driver in kernel,
> 
> - some platforms can't use PWM timers as system clocksources, while on
>   others this is the only timekeeping hardware available.
> 

Hmm. Does anybody have an idea of a better way of implementing this PWM 
timer support, which solves the above problems?

This series is a dependency for moving Universal C210 board to DT-based 
description and it's already almost out of time to get this included for 
3.10...

Best regards,
Tomasz

> > > > I think
> > > > it's ok if the driver lives in drivers/mfd when it doesn't fit
> > > > anywhere
> > > > else easily, but you should really register it to the pwm
> > > > subsystem
> > > > to
> > > > expose that functionality, not export functions that can be used
> > > > by
> > > > a pwm shim driver, which even seems to be missing from the series.
> > > 
> > > Anyway, using PWM API in a clocksource driver that needs to be
> > > running
> > > very early (before any initcalls get called) seems a bit weird for
> > > me, especially when PWM API doesn't provide such fine grained
> > > control
> > > over PWM timers that is required in the clocksource drivers.
> > 
> > Exactly, that's why you should have a regular PWM driver that gets
> > loaded at a convenient time and just uses an interface exported by the
> > base driver to access the common registers.
> 
> Well, this is basically what my patches do, except that the PWM driver
> isn't reworked to use the base driver yet.
> 
> The private API exported to the samsung-time and pwm-samsung drivers
> isn't maybe the most fortunate one, but it clearly has the advantage of
> solving all the problems I mentioned before.
> 
> Same goes for calling this an MFD driver. It doesn't even use the MFD
> core, but there seems to be no better place to put it. Maybe
> drivers/platform/arm would be better, if it existed, just as currently
> available drivers/platform/x86?
> 
> Best regards,
> Tomasz
