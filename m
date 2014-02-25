From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: Exynos: Add generic compatible string
Date: Tue, 25 Feb 2014 09:35:35 +0900
Message-ID: <530BE557.20106@samsung.com>
References: <1392809645-631-1-git-send-email-sachin.kamat@linaro.org>	<CAK9yfHyWG1ac6isTRSB3VWfxER9cSuDJHwY3b7svyEk9EozpWQ@mail.gmail.com>	<53075239.4010603@samsung.com>	<2200834.G3JJLYQl5i@wuerfel>	<53076F00.7000001@samsung.com>	<53077160.5030202@samsung.com> <CAK9yfHxiHkrf1xmSFbfoKqFFSCU6w4QqwPnQNdv1m1PGtrwsLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:45891 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752096AbaBYAfx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Feb 2014 19:35:53 -0500
In-Reply-To: <CAK9yfHxiHkrf1xmSFbfoKqFFSCU6w4QqwPnQNdv1m1PGtrwsLQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>

On 02/24/14 21:03, Sachin Kamat wrote:
> On 21 February 2014 21:01, Tomasz Figa<t.figa@samsung.com>  wrote:
>> On 21.02.2014 16:21, Tomasz Figa wrote:
>>>
>>> On 21.02.2014 15:48, Arnd Bergmann wrote:
>>>>
>>>> On Friday 21 February 2014 14:18:49 Tomasz Figa wrote:
>>>>>
>>>>>
>>>>>> Now that we have a broader agreement on this, I think we can go
>>>>>> ahead with the
>>>>>> following steps as an initial approach:
>>>>>> 1. Have a common machine file for both exynos4 and 5 files,
>>>>>> mach-exynos-dt.c.
>>>>>> 2. Introduce a generic compatible string "samsung,exynos".

Well, I think, we need to consider to use compatible string 
"samsung,exynos" again because "exynos" name can be used on ARMv8 as 
well and I don't want to say that generic/common something is always 
good. So IMHO still using exynos4 and exynos5 would be better.

>>>>>> 3. Append this to the compatible property list for existing boards.
>>>>>>
>>>>>> If this plan looks OK, I can send across patches doing this.
>>>>>>
>>>>>
>>>>> Looks good. I would also merge common.c with this resulting
>>>>> mach-exynos-dt.c, as it would be the only user of the code there.
>>>>
>>>>
>>>> Sounds good. While the naming is not important, I would just call the
>>>> file 'exynos.c', in line with some of the other platforms we have.
>>>> Both the 'mach-' and the '-dt' part of the file name are redundant.
>>>>
>>>> Alternatively, you could merge it all into common.c.
>>>
>>>
>>> exynos.c sounds good to me.
>>

Well, let me see common.c and mach-exynos.c, one is for SoC specific 
stuff and the other is for Board specific so I think, keeping current 
file would be good, we can change the file name mach-exynos.c or 
board-exynos.c though.

Thanks,
Kukjin

>>
>> One minor thing. It might be a good idea to base on top of my PM
>> consolidation part 2 series, to avoid merge conflicts:
>>
>> http://thread.gmane.org/gmane.linux.ports.arm.kernel/299340
>>
>> It should hit Kgene's tree this weekend.
>
> Sure.
>
