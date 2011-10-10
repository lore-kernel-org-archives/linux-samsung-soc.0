From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: enabling FIMC from default config
Date: Mon, 10 Oct 2011 12:16:43 +0200
Message-ID: <4E92C60B.2040607@samsung.com>
References: <4E9295CD.7020304@gmail.com> <4E92994E.10601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:65091 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753097Ab1JJKQq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 06:16:46 -0400
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LSU00K47HVVIE30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 11:16:43 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LSU00C9OHVV65@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 11:16:43 +0100 (BST)
In-reply-to: <4E92994E.10601@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Subash Patel <subashrp@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi Subash,

On 10/10/2011 09:05 AM, Subash Patel wrote:
> I forgot to add:
> 
> instead of choosing them through config MACH_**** in arch/arm/mach-exynos4/Kconfig
> 
> Regards,
> Subash
> 
> On 10/10/2011 12:20 PM, Subash Patel wrote:
>> Hi Sylwester,
>>
>> In the file arch/arm/plat-s5p/Kconfig, why dont we change the below
>>
>> config S5P_DEV_FIMC0/1/2/3
>> bool
>> help
>> Compile in platform device definitions for FIMC controller 0/1/2/3
>>
>> as
>>
>> config S5P_DEV_FIMC0/1/2/3
>> bool
>> depends on VIDEO_SAMSUNG_S5P_FIMC
>> default y
>> help
>> Compile in platform device definitions for FIMC controller 0/1/2/3
>>
>> I find that every time I need to use FIMC, I need to make some
>> un-necessary hacks into Kconfig, even though I choose the menu item
>> "Samsung S5P and EXYNOS4 camera host interface driver"


I'm all for automating these things, although please note plat-s5p/Kconfig
is for all relevant mach-* and the number of available FIMC instances
is specific to each mach-*. E.g. s5pv210 has only 3 instances, while
on exynos4 there are 4. So each mach-* currently selects S5P_DEV_FIMC?.
I agree the current scheme might not be the most optimal.
I'm open to any suggestions on this.


Regards,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
