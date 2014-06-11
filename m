From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2 v2] spi: s3c64xx: use "cs-gpios" from spi node instead
 of "cs-gpio"
Date: Wed, 11 Jun 2014 14:22:08 +0200
Message-ID: <539849F0.3000308@samsung.com>
References: <1402394881-31564-1-git-send-email-ch.naveen@samsung.com>
 <1402394881-31564-2-git-send-email-ch.naveen@samsung.com>
 <5396E051.8050803@samsung.com>
 <CAHfPSqAq9L5Zu7z3-y6Y2pG8AhE4Y1j8DE35LDfMW_DYc_x-gw@mail.gmail.com>
 <CAD=FV=XtdgKEg7fTHe+tsFM1Y_YwqNNk_DBW7ZX83YERGJsHBg@mail.gmail.com>
 <CAL_JsqLk7rfDaf4gn5_p3dcSNBfQ9BF3U8mUqBQ6YjKWXb5tDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:40352 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750730AbaFKMWM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 08:22:12 -0400
In-reply-to: <CAL_JsqLk7rfDaf4gn5_p3dcSNBfQ9BF3U8mUqBQ6YjKWXb5tDg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: Rob Herring <robherring2@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "cpgs ." <cpgs@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Grant Likely <grant.likely@secretlab.ca>, Jaswinder Singh <jaswinder.singh@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>, spi-devel-general@lists.sourceforge.net, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 10/06/14 22:32, Rob Herring wrote:
> On Tue, Jun 10, 2014 at 1:09 PM, Doug Anderson <dianders@chromium.org> wrote:
>> Naveen / Sylwester,
>>
>> On Tue, Jun 10, 2014 at 4:00 AM, Naveen Krishna Ch
>> <naveenkrishna.ch@gmail.com> wrote:
>>>> Can we support both "cs-gpio" and "cs-gpios" for backward compatibility ?
>>>> After your change all DTBs using the original pattern will not work with
>>>> new kernels any more. At least I would expect such backward compatibility
>>>> maintained for few kernel releases.
>>>
>>> The reason behind removing the "cs-gpio" or not providing backward
>>> compatibility was
>>>
>>> 1. Since spi-core started using "cs-gpios" string from spi device node
>>> several months ago.
>>>   The spi-s3c64xx.c driver is partially broken for more than 6 months.
>>>
>>> 2. Supporting "cs-gpio" would add extra bit of code.
>>>
>>> I've corrected the dts files that were using "cs-gpio" under
>>> "controller-data"(child node)
>>> to use "cs-gpio" from spi device node (parent node).

Normally properties get removed from existing dts files and then
marked in the binding documentation as deprecated.  Or least in the
commit messages it would be good to have clearly explained what was
replaced with what and what were the main reasons.  This is especially
useful for out-of-tree dts files, when you port a board to newer
kernel, things suddenly stop working and you're left with little
or no clue why.

>>> I will make another version if you insist.

I'm OK with dropping the old binding, I'm generally not a proponent
of a strict DT backward compatibility.  But we _must_ have things
documented properly, so it all doesn't turn into a debugging nightmare.

>> Yup, as near as I can tell this has been broken since (3146bee spi:
>> s3c64xx: Added provision for dedicated cs pin).  That landed June 25th
>> of 2013 into the SPI tree.
>>
>> ...so clearly nobody was really testing Samsung's SPI driver on ToT
>> Linux.  1 year of unnoticed brokenness seems like enough time that we
>> could do away with the old code.  If someone comes out of the woodwork
>> and claims a dire need to support the old binding then it can be added
>> then.
>>
>> In-tree users of this appear to be:
>>
>> arch/arm/boot/dts/exynos4210-smdkv310.dts:
>>  cs-gpio = <&gpc1 2 0>;
>> arch/arm/boot/dts/exynos4412-trats2.dts:
>>  cs-gpio = <&gpb 5 0>;
>> arch/arm/boot/dts/exynos5250-smdk5250.dts:
>>  cs-gpio = <&gpa2 5 0>;
>>
>> ...and I guess nobody has bothered using the SPI flash on those boards
>> for the last year?

I guess the SMDK boards are not really well maintained now.  I've got a
working kernel for trats2 based on v3.15-rc4, the SPI is working fine
there, despite the offending commit you point out.

It seems the GPB[5]/SPI_1_nSS pin is in the reset default state, i.e.
an input with pull down enabled (gpb-5 is not a part of the SPI
interface pinctrl group).  So in case we don't pass the CS GPIO in the
SPI controller node or the driver doesn't handle it properly for any
other reason the chip select signal is always active and the SPI
communication works.

> I always try to warn people if they are breaking compatibility, but in
> this case I agree it is okay. Presumably no one expects BSD or vxworks
> support for this platform either?
> 
> For the binding change:
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
> Rob

--
Thanks,
Sylwester
