From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 11/14] arm64: dts: Add initial device tree support for EXYNOS7
Date: Thu, 28 Aug 2014 12:54:11 -0500
Message-ID: <CAL_JsqLVsjJVL+GoJVMoXGiGxVKSh0oyJ-nwKEkXfa+fWid7yA@mail.gmail.com>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
 <1409132660-1898-3-git-send-email-ch.naveen@samsung.com> <20140828035639.GB4972@localhost>
 <20140828094846.GD14650@leverpostej> <CAOesGMjY8wfAcq2fLgs=ZWHdiWtFqxr+ncUKTje0SnXqO-CCgQ@mail.gmail.com>
 <20140828170306.GQ14650@leverpostej> <CAOesGMgYeFObKHA9znzBq9t2mLv8WWT1QaKugQ6yf7RgV09Qyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:42373 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750820AbaH1Ryd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Aug 2014 13:54:33 -0400
In-Reply-To: <CAOesGMgYeFObKHA9znzBq9t2mLv8WWT1QaKugQ6yf7RgV09Qyg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "naveenkrishna.ch@gmail.com" <naveenkrishna.ch@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "cpgs@samsung.com" <cpgs@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

On Thu, Aug 28, 2014 at 12:19 PM, Olof Johansson <olof@lixom.net> wrote:
> On Thu, Aug 28, 2014 at 10:03 AM, Mark Rutland <mark.rutland@arm.com> wrote:
>> On Thu, Aug 28, 2014 at 05:28:22PM +0100, Olof Johansson wrote:
>>> On Thu, Aug 28, 2014 at 2:48 AM, Mark Rutland <mark.rutland@arm.com> wrote:
>>> > Hi,
>>> >
>>> >> > +   cpus {
>>> >> > +           #address-cells = <2>;
>>> >> > +           #size-cells = <0>;
>>> >>
>>> >> Why size-cells=2? Can you not fit a cpuid in 32 bits?
>>> >
>>> > As of commit 72aea393a2e7 (arm64: smp: honour #address-size when parsing
>>> > CPU reg property) Linux can handle single-cell cpu node reg entries
>>> > where /cpus/#address-cells = <1>.
>>> >
>>> > I can't make any guarantees about other code (e.g. bootloaders) which
>>> > might try to do things with cpu nodes, YMMV.
>>>
>>> Ok. If address-cells is kept at 2 the unit address needs to be changed
>>> to "0,0". So one or the other has to be changed.
>>
>> I'm happy either way.
>>
>> I'm not sure the rest of the tree had "0," prefixes on all of the
>> unit-addresses for 64-bit addresses that were under 4GB, and I'm not
>> sure that existing dts consistently do that either.
>>
>> Do we want to enforce that for all 64-bit unit-addresses?
>
> Yeah, I believe that's the only valid format for a 2-address-cell unit address.

But we don't do leading 0's anywhere else like single cell unit
addresses. Buses expressed with ranges and offsets are one example.
Also, I2C addresses have a 32-bit size in DT yet are only 8-bit and we
don't do leading zero's there.

Rob
