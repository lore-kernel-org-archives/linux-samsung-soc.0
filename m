From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS5: Add bus clock and set parent clock for FIMD
Date: Tue, 11 Sep 2012 11:32:11 +0200
Message-ID: <504F051B.5070903@samsung.com>
References: <1347307866-30641-1-git-send-email-l.krishna@samsung.com>
 <000101cd8fb3$90d10db0$b2732910$%han@samsung.com>
 <CAL1wa8f1=hVMYrw2qdnQK5wFh8CtLxjP79+8POOG7HHqOBU5yA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44709 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757312Ab2IKJcP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Sep 2012 05:32:15 -0400
Received: from eusync1.samsung.com (mailout3.w1.samsung.com [210.118.77.13])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MA6005M9IIJ4M80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Sep 2012 10:32:43 +0100 (BST)
Received: from [106.116.147.32] by eusync1.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MA6006AUIHNEF00@eusync1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Sep 2012 10:32:12 +0100 (BST)
In-reply-to: <CAL1wa8f1=hVMYrw2qdnQK5wFh8CtLxjP79+8POOG7HHqOBU5yA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: Jingoo Han <jg1.han@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com

On 09/11/2012 11:19 AM, Leela Krishna Amudala wrote:
>>> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
>>> index 774533c..f1281cf 100644
>>> --- a/arch/arm/mach-exynos/clock-exynos5.c
>>> +++ b/arch/arm/mach-exynos/clock-exynos5.c
>>> @@ -891,6 +891,13 @@ static struct clk exynos5_clk_mdma1 = {
>>>       .ctrlbit        = (1 << 4),
>>>  };
>>>
>>> +static struct clk exynos5_clk_fimd = {
>>> +     .name           = "fimd",
>>> +     .devname        = "exynos5-fb",
>>
>>
>> Replace 'exynos5-fb' with 'exynos5-fb.1', as exynos4 fimd uses exynos4-fb.0
>> as devname. Exynos5 can use fimd0 or fimd1. Also, Exynos5250 uses fimd1.
>>
>>
> Currently s3c-fb driver using "exynos5-fb" as device name, hence used
> the same name in the clock.
> This code is tested with both drm-fimd and s3c-fb fimd and it is
> working fine showing the display on LCD.
> If I change the device name in clock file then I have to change it in
> s3c-fb driver also.
> So I feel it is better to keep the name as "exynos5-fb" in clock file
> instead of changing in the driver.

Yeah, makes sense. We can always add a clkdev entry with CLKDEV_INIT()
if driver needs it. There is so much confusion now with having device name
associated with platform clock name. It should be possible to freely define
clock connection id and a platform clock association, not at the platform
clock definition.

I guess we can now clean all this up only during conversion to common clock
framework.


Regards,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
