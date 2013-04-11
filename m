From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v4 04/14] mfd: Add Samsung PWM/timer master driver
Date: Thu, 11 Apr 2013 18:44:33 +0200
Message-ID: <1718887.H9vPuvORKd@amdc1227>
References: <1365093431-30621-1-git-send-email-t.figa@samsung.com>
 <5357756.gKmBOZlWcd@flatron> <201304110035.47776.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61405 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932200Ab3DKQos (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 12:44:48 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ML300J2ONU2LA90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Apr 2013 01:44:47 +0900 (KST)
In-reply-to: <201304110035.47776.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, john.stultz@linaro.org, tglx@linutronix.de

On Thursday 11 of April 2013 00:35:47 Arnd Bergmann wrote:
> On Monday 08 April 2013, Tomasz Figa wrote:
> > On Saturday 06 of April 2013 00:24:18 Tomasz Figa wrote:
> > > On Friday 05 of April 2013 21:54:21 Arnd Bergmann wrote:
> > > > On Friday 05 April 2013, Tomasz Figa wrote:
> > > I'm not sure what you mean by a register-level interface. Something like
> > > samsung_pwm_update_reg(reg, mask, val), which modifies bitfields
> > > according to the mask and value with appropriate synchronization? If
> > > yes, this solves only the problem of access to shared registers.
> > > 
> > > The other problems that remain:
> > > 
> > > - negotiation of PWM channels to use for clock source and clock events,
> > > 
> > >   because each board can use different channels for PWM outputs,
> > > 
> > > - code duplication caused by both of the drivers doing mostly the same
> > > 
> > >   things and or having to parse the same data from device tree,
> > > 
> > > - both non-DT and DT platforms must be supported,
> > > 
> > > - how to keep the ability to load PWM driver as a module (or not load it
> > > at all when PWM is not used on particular board), while retaining
> > > everything that is needed for the clocksource driver in kernel,
> > > 
> > > - some platforms can't use PWM timers as system clocksources, while on
> > > 
> > >   others this is the only timekeeping hardware available.
> > 
> > Hmm. Does anybody have an idea of a better way of implementing this PWM
> > timer support, which solves the above problems?
> > 
> > This series is a dependency for moving Universal C210 board to DT-based
> > description and it's already almost out of time to get this included for
> > 3.10...
> 
> Sorry for not replying earlier. My idea for the register level interface
> was to create a platform_device for each PWM, e.g. using the mfd_cell
> infrastructure. You can then pass a "struct regmap" as the platform
> data for each child of the timer node, and all the DT handling code
> can stay in the parent driver.

Hmm. As I said, I'm completely fine with using a regmap for sharing registers 
between subdrivers. However the clocksource can not be registered as an MFD 
cell, because it's needed very early.

I can imagine a solution alternative to my original one, where the MFD cells 
would be registered from the clocksource driver. This would mean that 
platforms that don't need (and can't use) the PWM clocksource would have to 
enable the driver anyway.

Another thing is that I don't see a need to create one cell per PWM channel. 
The PWM core is designed in a way that supports multiple channels per PWM 
controller and so is the generic PWM DT specifier (<&controller channel period 
flags>), so I'd rather see a single cell for all PWM channels.

So, to summarize this alternative concept:
 - two drivers:
   1) clocksource driver - registering clocksource and PWM MFD cell
   2) PWM driver - handling the PWM MFD cell
 - both drivers would share registers using a regmap with custom lock/unlock 
   callbacks (using spin_lock_irqsave/spin_unlock_irqrestore, because the 
   clocksource needs to access PWM registers in IRQ context)
 - the clocksource/master driver would have a samsung_time_init function which 
   would set up the driver early and initialize the clocksource
 - a platform driver would be registered by the clocksource/master driver
   which would register the PWM MFD cell in its probe
 - MFD cell platform data would contain struct regmap * and variant data
   (parsed from DT or received from platform code - as in my original version)

This should indeed work, assuming that I find a solution to make 
clocksource_of_init not initialize the PWM clocksource (from PWM DT node) on 
platforms that can't use it.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
