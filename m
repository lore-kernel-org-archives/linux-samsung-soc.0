From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v8 1/7] irqchip: vic: Parse interrupt and resume masks
 from device tree
Date: Sat, 24 Aug 2013 11:35:03 -0500
Message-ID: <5218E0B7.4020701@gmail.com>
References: <1377120111-25601-1-git-send-email-tomasz.figa@gmail.com> <2159266.zeHHUDxisq@flatron> <CAL_JsqJzLJkozUd1sh4xb2O0hwoALq67xKhc6hgCKO0VGYbmyw@mail.gmail.com> <11592715.CyyL3y3PT6@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:57101 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755019Ab3HXQfH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Aug 2013 12:35:07 -0400
In-Reply-To: <11592715.CyyL3y3PT6@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-gpio@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 08/24/2013 10:31 AM, Tomasz Figa wrote:
> On Saturday 24 of August 2013 10:25:26 Rob Herring wrote:
>> On Fri, Aug 23, 2013 at 6:04 PM, Tomasz Figa <tomasz.figa@gmail.com> 
> wrote:
>>> On Friday 23 of August 2013 16:11:18 Stephen Warren wrote:
>>>> On 08/22/2013 05:22 PM, Tomasz Figa wrote:
>>>>> This patch extends vic_of_init to parse valid interrupt sources
>>>>> and resume sources masks from device tree.
>>>>>
>>>>> If mask values are not specified in device tree, all sources
>>>>> are assumed to be valid, as before this patch.
>>>>
>>>> Can you explain further why the VIC needs this information up-front?
>>>> Presumably it can accumulate it as devices request interrupts.
>>>
>>> It does not need this information just for operation, but this makes
>>> the hardware description more detailed and allows better sanity
>>> checking of interrupts being requested.
>>>
>>> To clarify, this is a mask of valid interrupt sources of the VIC,
>>> where
>>> set bit indicates that given signal is wired and clear bit that it is
>>> not.
>> I agree with Stephen here. The valid interrupts are the ones in the
>> DT. The reserved ones are the ones not present. If it is not needed
>> for the operation of the VIC, then remove it. The argument of sanity
>> checking could apply to all interrupt controllers.
> 
> Sorry, but I don't get what's wrong in having a more detailed description 
> than required just for operation of the hardware.
> 
> The feature of sanity checks based on interrupt_mask (here now called 
> valid-mask) has been present in the VIC driver since a long time already 
> (if not from the beginning of existence of this driver) and before we 
> started using DT, the mask was being passed from platform code as VIC init 
> function argument.

So we should base the binding on the Linux software design?

> I'd prefer this feature to be available when using DT as well, unless we 
> really want to move things backwards, just because we want to use DT...

As I mentioned all these arguments apply to ALL interrupt controllers
except ones which a mask does not work. So IF this makes sense, then
this should be a generic property and generic code to support.

You simply have the same information twice. One is distributed and one
is centralized. While it adds a way to validate things it also adds a
way to introduce errors. Suppose someone writes a dts such that
valid-mask matches the irq lines present in that dts (simply because
they were lazy or don't have documentation of all interrupt lines). Then
you go add a node with a new interrupt (because the initial dts was not
complete). Updating the valid-mask could very easily be forgotten. Yes,
this should all be found by testing, but people don't always have access
to all the h/w. This issue would also not likely be obvious in a review.

Rob
