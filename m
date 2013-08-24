From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v8 1/7] irqchip: vic: Parse interrupt and resume masks from device tree
Date: Sat, 24 Aug 2013 17:31:45 +0200
Message-ID: <11592715.CyyL3y3PT6@flatron>
References: <1377120111-25601-1-git-send-email-tomasz.figa@gmail.com> <2159266.zeHHUDxisq@flatron> <CAL_JsqJzLJkozUd1sh4xb2O0hwoALq67xKhc6hgCKO0VGYbmyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:46601 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754252Ab3HXPbx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Aug 2013 11:31:53 -0400
In-Reply-To: <CAL_JsqJzLJkozUd1sh4xb2O0hwoALq67xKhc6hgCKO0VGYbmyw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-gpio@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Saturday 24 of August 2013 10:25:26 Rob Herring wrote:
> On Fri, Aug 23, 2013 at 6:04 PM, Tomasz Figa <tomasz.figa@gmail.com> 
wrote:
> > On Friday 23 of August 2013 16:11:18 Stephen Warren wrote:
> >> On 08/22/2013 05:22 PM, Tomasz Figa wrote:
> >> > This patch extends vic_of_init to parse valid interrupt sources
> >> > and resume sources masks from device tree.
> >> > 
> >> > If mask values are not specified in device tree, all sources
> >> > are assumed to be valid, as before this patch.
> >> 
> >> Can you explain further why the VIC needs this information up-front?
> >> Presumably it can accumulate it as devices request interrupts.
> > 
> > It does not need this information just for operation, but this makes
> > the hardware description more detailed and allows better sanity
> > checking of interrupts being requested.
> > 
> > To clarify, this is a mask of valid interrupt sources of the VIC,
> > where
> > set bit indicates that given signal is wired and clear bit that it is
> > not.
> I agree with Stephen here. The valid interrupts are the ones in the
> DT. The reserved ones are the ones not present. If it is not needed
> for the operation of the VIC, then remove it. The argument of sanity
> checking could apply to all interrupt controllers.

Sorry, but I don't get what's wrong in having a more detailed description 
than required just for operation of the hardware.

The feature of sanity checks based on interrupt_mask (here now called 
valid-mask) has been present in the VIC driver since a long time already 
(if not from the beginning of existence of this driver) and before we 
started using DT, the mask was being passed from platform code as VIC init 
function argument.

I'd prefer this feature to be available when using DT as well, unless we 
really want to move things backwards, just because we want to use DT...

Best regards,
Tomasz
