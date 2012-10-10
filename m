From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 01/16] ARM: dts: exynos4210: Replace legacy GPIO bank
 nodes with pinctrl bank nodes
Date: Wed, 10 Oct 2012 10:27:27 -0600
Message-ID: <5075A1EF.60900@wwwdotorg.org>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com> <1349685556-23718-2-git-send-email-t.figa@samsung.com> <CACRpkdZgH9TSr2uWQW+-8-U7BxJCscQgStVOndGixGmRz74TWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:36416 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752752Ab2JJQfP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 12:35:15 -0400
In-Reply-To: <CACRpkdZgH9TSr2uWQW+-8-U7BxJCscQgStVOndGixGmRz74TWw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On 10/10/2012 01:26 AM, Linus Walleij wrote:
> On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> 
>> Seuqential patches from this series introduce SoC-specific data parsing
>> from device tree.
>>
>> This patch removes legacy GPIO bank nodes from exynos4210.dtsi and
>> replaces them with nodes and properties required for these patches.
> 
> So to be clear:
> 
>> +       pinctrl-bank-types {
>> +               bank_off: bank-off {
>> +                       samsung,reg-names = "func", "dat", "pud",
>> +                                               "drv", "conpdn", "pudpdn";
>> +                       samsung,reg-params = <0x00 4>, <0x04 1>, <0x08 2>,
>> +                                               <0x0C 2>, <0x10 2>, <0x14 2>;
>> +               };
> 
> This is starting to look like a firmware language, I have mixed
> feelings about this. Shall this be read:
> 
> "Poke 4 into 0x00, poke 1 into 0x04, poke 2 into 0x08" etc?
> 
> We really need to discuss this, Grant has already NACK:ed
> such approaches once.

Well, I don't think he NACK'd Tony Lindgren's generic pinctrl driver,
which is doing this exact same thing. I did raise the same point about
Tony's driver when he posted it, but nobody seemed inclined to NACK it
based on that at the time, IIRC...

BTW, the idea here is IIRC to create a generic Samsung pinctrl driver
that works across N different Samsung SoCs, each with different register
layout, without having to encode the register layout into tables in the
kernel.

> If you're still going to do this, it is mandatory
> to NOT use magic hex numbers anymore, because Stephen has
> merged preprocessor support to the DTC compiler so you
> can use #defined macros.
> 
> See commit:
> cd296721a9645f9f28800a072490fa15458d1fb7

That feature isn't enabled yet. While dtc has been modified to be able
to accept input that's been generated/processed by cpp, there is still
ongoing discussion about how/whether to actually enable *.dts to use
that feature.
