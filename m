From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH v3 13/15] ARM: dts: exynos5: add system register support
Date: Thu, 5 Jun 2014 10:41:03 +0530
Message-ID: <CAFp+6iE2RL=duZSXKCoiu-zRA=cLq5p2fO8XzFkYJiaa22FdGg@mail.gmail.com>
References: <1401686571-22148-1-git-send-email-yj44.cho@samsung.com>
	<1401686571-22148-14-git-send-email-yj44.cho@samsung.com>
	<CAFp+6iFpSHWwH68BSNzetrTdxt2wpZC3y3WfQ+nuRDBeask_MA@mail.gmail.com>
	<538FDB89.70504@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f54.google.com ([209.85.216.54]:64525 "EHLO
	mail-qa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751706AbaFEFLF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 01:11:05 -0400
In-Reply-To: <538FDB89.70504@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, robh+dt <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, inki.dae@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, sw0312.kim@samsung.com, a.hajda@samsung.com

Hi YoungJun,


On Thu, Jun 5, 2014 at 8:22 AM, YoungJun Cho <yj44.cho@samsung.com> wrote:
> Hi Vivek,
>
>
> On 06/04/2014 08:50 PM, Vivek Gautam wrote:
>>
>> On Mon, Jun 2, 2014 at 10:52 AM, YoungJun Cho <yj44.cho@samsung.com>
>> wrote:
>>>
>>> This patch adds sysreg device node, and sysreg property
>>> to fimd device node which is required to use I80 interface.
>>
>>
>> Same here. The system register nodes have been added to exynos5250 and
>> exynos5420 by the patch:
>> dfbbdbf ARM: dts: Add sysreg sytem controller node to exynos5250 and
>> exynos5420
>>
>> May be, you may want to move those two nodes to this common file
>> (exynos5.dtsi).
>>
>
> Thank you for reporting.
> I didn't check linux-samsung-soc.
>
> The exynos5410, 5420 and 5422 use system register with base address
> 0x10050000.
> But exynos5260 and 5430 are different.
> And I can't check exynos5250.

Exynos5250 too starts with same register base address as Exynos5420,
but as you say Exynos5430 and Exynos5260 starts with different base address
then it make sense to keep them separate in their dtsi. (I couldn't
check Exynos5430)

>
> So with this condition, it is reasonable to remove these sysreg relevant
> patches.

Sure.

[snip]


-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
