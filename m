From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/4] ARM: EXYNOS4: Add DMC1, allow PPMU access for DMC.
Date: Mon, 19 Dec 2011 00:58:15 +0900
Message-ID: <4EEE0D97.9060001@samsung.com>
References: <1322730317-8171-1-git-send-email-myungjoo.ham@samsung.com>	<1322730317-8171-2-git-send-email-myungjoo.ham@samsung.com> <CAH9JG2VS3_dBar-wMAA=9wn_+hT0FgFHDsnBsOWTDGJE_v_qKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:52627 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751085Ab1LRP6V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Dec 2011 10:58:21 -0500
In-Reply-To: <CAH9JG2VS3_dBar-wMAA=9wn_+hT0FgFHDsnBsOWTDGJE_v_qKA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Russell King <linux@arm.linux.org.uk>, myungjoo.ham@gmail.com

On 12/16/11 17:24, Kyungmin Park wrote:
> Hi Mr. Kim,
>
> It's maybe missing for v3.3 merge at samsung soc.
> Please give your opinion, how to handle it?

Looks ok to me at the moment, and as a note, I'm sorting it out now.

>
> If you don't mind it, it can merge it by devfreq.

Hmm, I think, it should be handled in samsung tree to avoid useless 
conflicts with others. And if you need this in the devfreq tree now, 
please let me know so that I can create topic branch for it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> On 12/1/11, MyungJoo Ham<myungjoo.ham@samsung.com>  wrote:
>> - Add DMC1
>> - Enlarge address space for DMC from 4k to 64k so that PPMU registers
>>    may be accessed.
>>
>> Signed-off-by: MyungJoo Ham<myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> ---
>>   arch/arm/mach-exynos/cpu.c              |    7 ++++++-
>>   arch/arm/mach-exynos/include/mach/map.h |    1 +
>>   2 files changed, 7 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/cpu.c b/arch/arm/mach-exynos/cpu.c
>> index 90ec247..8bdcba9 100644
>> --- a/arch/arm/mach-exynos/cpu.c
>> +++ b/arch/arm/mach-exynos/cpu.c
>> @@ -108,7 +108,12 @@ static struct map_desc exynos4_iodesc[] __initdata = {
>>   	}, {
>>   		.virtual	= (unsigned long)S5P_VA_DMC0,
>>   		.pfn		= __phys_to_pfn(EXYNOS4_PA_DMC0),
>> -		.length		= SZ_4K,
>> +		.length		= SZ_64K,
>> +		.type		= MT_DEVICE,
>> +	}, {
>> +		.virtual	= (unsigned long)S5P_VA_DMC1,
>> +		.pfn		= __phys_to_pfn(EXYNOS4_PA_DMC1),
>> +		.length		= SZ_64K,
>>   		.type		= MT_DEVICE,
>>   	}, {
>>   		.virtual	= (unsigned long)S5P_VA_SROMC,
>> diff --git a/arch/arm/mach-exynos/include/mach/map.h
>> b/arch/arm/mach-exynos/include/mach/map.h
>> index 058541d..870a980 100644
>> --- a/arch/arm/mach-exynos/include/mach/map.h
>> +++ b/arch/arm/mach-exynos/include/mach/map.h
>> @@ -57,6 +57,7 @@
>>   #define EXYNOS4_PA_KEYPAD		0x100A0000
>>
>>   #define EXYNOS4_PA_DMC0			0x10400000
>> +#define EXYNOS4_PA_DMC1			0x10410000
>>
>>   #define EXYNOS4_PA_COMBINER		0x10440000
>>
>> --
>> 1.7.4.1
