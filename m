From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 02/10] ARM: EXYNOS: Correct file path in comment message
Date: Thu, 03 Apr 2014 10:40:40 +0900
Message-ID: <533CBC18.8050106@samsung.com>
References: <1396425058-4012-1-git-send-email-pankaj.dubey@samsung.com>
 <1396425058-4012-3-git-send-email-pankaj.dubey@samsung.com>
 <533BFC31.1080203@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:24153 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030190AbaDCBX1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Apr 2014 21:23:27 -0400
In-reply-to: <533BFC31.1080203@monstr.eu>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: monstr@monstr.eu
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, chow.kim@samsung.com

Hi Michal,

On 04/02/2014 09:01 PM, Michal Simek wrote:
> On 04/02/2014 09:50 AM, Pankaj Dubey wrote:
>> This patch corrects file path mentioned in file comment message.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   arch/arm/mach-exynos/platsmp.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
>> index 03e5e9f..d8d1555 100644
>> --- a/arch/arm/mach-exynos/platsmp.c
>> +++ b/arch/arm/mach-exynos/platsmp.c
>> @@ -1,4 +1,4 @@
>> -/* linux/arch/arm/mach-exynos4/platsmp.c
>> +/* linux/arch/arm/mach-exynos/platsmp.c
>>    *
>>    * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
>>    *		http://www.samsung.com
>>
> Shouldn't you just remove it entirely?
> I had the same file names in the whole microblaze tree
> and some months/years later this was just broken everywhere.
> That's why it is just easier to remove it entirely.

Thanks for review and suggestion.
Removing of file name makes more sense to me also.
Will take care of this in some other files also under "mach-exynos"
in next version of patch.

>
> Thanks,
> Michal
>
>


-- 
Best Regards,
Pankaj Dubey
