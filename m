From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4: Fix reg sizes of GIC
Date: Tue, 10 Jun 2014 17:28:45 +0200
Message-ID: <5397242D.8040303@samsung.com>
References: <1400855960-22033-1-git-send-email-t.figa@samsung.com>
 <53886E53.70206@gmail.com> <5388CB76.2030806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:61913 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbaFJP3D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 11:29:03 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N6Y007B6LO90240@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jun 2014 16:28:57 +0100 (BST)
In-reply-to: <5388CB76.2030806@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Kukjin,

On 30.05.2014 20:18, Kukjin Kim wrote:
> On 05/30/14 20:41, Tomasz Figa wrote:
>> Hi,
>>
>> On 23.05.2014 16:39, Tomasz Figa wrote:
>>> This patch fixes reg entry sizes in GIC node that were not large enough
>>> to cover whole regions.
>>>
>>> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
>>> ---
>>>   arch/arm/boot/dts/exynos4.dtsi | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
>>> index b8ece4b..fbaf426 100644
>>> --- a/arch/arm/boot/dts/exynos4.dtsi
>>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>>> @@ -113,7 +113,7 @@
>>>   		compatible = "arm,cortex-a9-gic";
>>>   		#interrupt-cells =<3>;
>>>   		interrupt-controller;
>>> -		reg =<0x10490000 0x1000>,<0x10480000 0x100>;
>>> +		reg =<0x10490000 0x10000>,<0x10480000 0x10000>;
>>>   	};
>>>
>>>   	combiner: interrupt-controller@10440000 {
>>>
>>
>> Ping.
>>
> Yeah, SZ_64K is used for GIC_CPU and GIC_DIST before moving on DT 
> support. Applied, but I need to check this is required for stable tree...

Not sure if you already managed, but I think it might not be necessary
in stable trees, as the (correct) static mapping is still there and it
causes ioremap() to return correctly mapped area, ignoring the length
specified in device tree.

Best regards,
Tomasz
