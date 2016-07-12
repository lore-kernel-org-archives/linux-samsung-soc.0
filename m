From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/2] soc: samsung: Add support for Exynos7 PMU
Date: Tue, 12 Jul 2016 10:58:29 +0200
Message-ID: <5784B135.2060209@samsung.com>
References: <1467750507-13853-1-git-send-email-a.kesavan@samsung.com>
 <1467750507-13853-3-git-send-email-a.kesavan@samsung.com>
 <CAJKOXPc=RZEe_zQvnmxXRttppJfGJwyjmkF0XxAnV0YnGxvcyA@mail.gmail.com>
 <CAM4voanpvkQJ5GcKeXoLcpmTMXkh7f8aznQHDS-0O5YeaVpeuw@mail.gmail.com>
 <5783CB72.6030501@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:27750 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750778AbcGLI6e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jul 2016 04:58:34 -0400
In-reply-to: <5783CB72.6030501@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 07/11/2016 06:38 PM, Sylwester Nawrocki wrote:
> On 07/11/2016 04:44 PM, Abhilash Kesavan wrote:
>>>> +       /*
>>>>>> +        * Set clock freeze cycle count to 0 before and after arm clamp or
>>>>>> +        * reset signal transition
>>>>>> +        */
>>>>>> +       node = of_find_compatible_node(NULL, NULL,
>>>>>> +                               "samsung,exynos7-clock-atlas");
>>>>>> +       if (node) {
>>>>>> +               atlas_cmu_base = of_iomap(node, 0);
>>>>>> +               if (!atlas_cmu_base)
>>>>>> +                       return;
>>>>>> +
>>>>>> +               __raw_writel(0x0,
>>>>>> +                               atlas_cmu_base + EXYNOS7_CORE_ARMCLK_STOPCTRL);
>>>>>> +               iounmap(atlas_cmu_base);
>>>>
>>>> Missing:
>>>> of_node_put(node);
>>>>
>>>> ...but I think this creates unnecessary dependency on different
>>>> compatible. I understand that disabling the EXTENDED_CLKSTOP is needed
>>>> after configuring the PMU so this code belongs here. However
>>>> everything you need is just a mapping of CMU address. The PMU driver
>>>> should receive in bindings everything it needs to do its work. Either
>>>> it is a phandle to something or an address for iomap. In this case the
>>>> PMU should probably get two addresses: PMU and optionally CMU (part of
>>>> CMU for example). Of course bindings would have to be updated.
>>
>> I will add an optional CMU phandle to the PMU bindings.
> 
> We could additionally split the CMU_ATLAS region into 2 regions in DT
> (derived from exynos7420 documentation):
> 
> reg = <0x11800000 0xF08>, // offsets 0x0000...0x0F04
>       <0x11801000 0x8C>,  // offsets 0x1000...0x1088
> 
> so that the first can be mapped by the clk driver and the second by 
> the PMU driver? It seems the first region is strictly clock functionality
> related, while the second contains power control related and other 
> registers.

Do the clk-exynos7 driver really needs the second region? If not then it
would be sufficient just to reduce the mapping range for CMU_ATLAS.

Best regards,
Krzysztof

> 
> However I'm not sure it is a good idea, for consistency this would need 
> to be done also for CMU_APOLLO, CMU_MIF{0...3}.  All these CMUs don't have 
> DT bindings defined yet though and there is no corresponding dts entries.
> 
