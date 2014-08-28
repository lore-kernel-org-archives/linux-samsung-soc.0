From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 11/14] arm64: dts: Add initial device tree support for EXYNOS7
Date: Thu, 28 Aug 2014 19:47:00 +0200
Message-ID: <CAMuHMdXTo+JN+eSgvU_HkMKcv3RS1Dr+D3VnHF8x+EdKiK8j1g@mail.gmail.com>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
	<1409132660-1898-3-git-send-email-ch.naveen@samsung.com>
	<20140828035639.GB4972@localhost>
	<20140828094846.GD14650@leverpostej>
	<CAOesGMjY8wfAcq2fLgs=ZWHdiWtFqxr+ncUKTje0SnXqO-CCgQ@mail.gmail.com>
	<20140828170306.GQ14650@leverpostej>
	<CAOesGMgYeFObKHA9znzBq9t2mLv8WWT1QaKugQ6yf7RgV09Qyg@mail.gmail.com>
	<20140828173931.GB18005@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:50329 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751240AbaH1RrC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Aug 2014 13:47:02 -0400
In-Reply-To: <20140828173931.GB18005@leverpostej>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Olof Johansson <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Rob Herring <robh@kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Thomas Abraham <thomas.ab@samsung.com>, "cpgs@samsung.com" <cpgs@samsung.com>, "naveenkrishna.ch@gmail.com" <naveenkrishna.ch@gmail.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Mark,

On Thu, Aug 28, 2014 at 7:39 PM, Mark Rutland <mark.rutland@arm.com> wrote:
>> >> Ok. If address-cells is kept at 2 the unit address needs to be changed
>> >> to "0,0". So one or the other has to be changed.
>> >
>> > I'm happy either way.
>> >
>> > I'm not sure the rest of the tree had "0," prefixes on all of the
>> > unit-addresses for 64-bit addresses that were under 4GB, and I'm not
>> > sure that existing dts consistently do that either.
>> >
>> > Do we want to enforce that for all 64-bit unit-addresses?
>>
>> Yeah, I believe that's the only valid format for a 2-address-cell unit address.
>
> Fair enough. I didn't spot this explicitly mentioned anywhere in ePAPR,
> but the examples match.

I couldn't find much about how the unit-addresses should really look like.

Power_ePAPR_APPROVED_v1.1.pdf:
"The unit-address component of the name is specific to the bus type on
which the node sits. It consists
of one or more ASCII characters from the set of characters in Table
2-1. The unit-address must
match the first address specified in the reg property of the node. If
the node has no reg property, the
@ and unit-address must be omitted and the node-name alone
differentiates the node from other nodes
at the same level in the tree. The binding for a particular bus may
specify additional, more specific
requirements for the format of reg and the unit-address."

"Table 2.1" contains lot of characters, definitely not limited to hex numbers.
Also nothing about (not) needing a "0x" prefix.

> I should probably re-jig that checkpatch test I had for unit-addresses.

It would be great if dtc started complaining about unit-addresses not
matching the first reg property.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
