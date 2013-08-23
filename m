From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v8 1/7] irqchip: vic: Parse interrupt and resume masks from device tree
Date: Sat, 24 Aug 2013 01:04:44 +0200
Message-ID: <2159266.zeHHUDxisq@flatron>
References: <1377120111-25601-1-git-send-email-tomasz.figa@gmail.com> <1500724.07LRpFtgcx@flatron> <5217DE06.3070005@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f54.google.com ([209.85.214.54]:54299 "EHLO
	mail-bk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754044Ab3HWXEw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Aug 2013 19:04:52 -0400
In-Reply-To: <5217DE06.3070005@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-gpio@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Mark Brown <broonie@kernel.org>

On Friday 23 of August 2013 16:11:18 Stephen Warren wrote:
> On 08/22/2013 05:22 PM, Tomasz Figa wrote:
> > This patch extends vic_of_init to parse valid interrupt sources
> > and resume sources masks from device tree.
> > 
> > If mask values are not specified in device tree, all sources
> > are assumed to be valid, as before this patch.
> 
> Can you explain further why the VIC needs this information up-front?
> Presumably it can accumulate it as devices request interrupts.

It does not need this information just for operation, but this makes the 
hardware description more detailed and allows better sanity checking of 
interrupts being requested.

To clarify, this is a mask of valid interrupt sources of the VIC, where 
set bit indicates that given signal is wired and clear bit that it is not.

> > diff --git a/Documentation/devicetree/bindings/arm/vic.txt
> > b/Documentation/devicetree/bindings/arm/vic.txt
> > 
> > +- valid-mask : Bit mask of valid interrupt sources (defaults to all
> > valid)
> Until a device requests an interrupt, it can be left disabled. Once
> something does request it, it gets enabled. If nothing requests it, it
> never gets enabled. Doesn't the result of that logic end up being the
> same thing as valid-mask represents? The only difference would be if
> some device requests an invalid interrupt source, but then why not just
> fix the interrupt client instead of adding this property to reject the
> request?

This property does not have anything to do with enabling or disabling (aka 
unmasking/masking) of interrupts. It just lists valid interrupt signals of 
given VIC.

> > +- wakeup-mask : Bit mask of interrupt sources that can wake up the
> > system +  (defaults to all allowed)
> 
> Shouldn't drivers for end-devices request interrupts, and then set wake
> enable on those interrupts, which would then trickle up the IRQ chain to
> tell the VIC which interrupts to enable wakeup on?

This is the same as previous property. It does not have anything to do 
with requesting particular signal to wake up the system, but rather 
indicating that particular signal _can_ be requested to do so.

Again, this is not strictly needed for correct operation, but this way you 
wouldn't get any sanity check over wake up signals being requested.

Best regards,
Tomasz
