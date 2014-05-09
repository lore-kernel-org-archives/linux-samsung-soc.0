From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH] arm: exynos: add generic function to calculate cpu number
Date: Fri, 9 May 2014 13:20:56 +0530
Message-ID: <CANuQgHGJ98s6c7Y-wJ+xFuiwqZXVziyXZzp7oYDpwU7CGzRTyg@mail.gmail.com>
References: <1398404653-14407-1-git-send-email-chander.kashyap@linaro.org>
	<CANuQgHGtTFcP1baipTwTTPw_t3JV42nn-Kh4n72_9VRZ8ZwaPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:57459 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751779AbaEIHu5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 03:50:57 -0400
Received: by mail-oa0-f47.google.com with SMTP id i7so4447206oag.34
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 May 2014 00:50:56 -0700 (PDT)
In-Reply-To: <CANuQgHGtTFcP1baipTwTTPw_t3JV42nn-Kh4n72_9VRZ8ZwaPA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chander Kashyap <chander.kashyap@linaro.org>, Chander Kashyap <k.chander@samsung.com>

On 5 May 2014 09:37, Chander Kashyap <chander.kashyap@linaro.org> wrote:
> On 25 April 2014 11:14, Chander Kashyap <chander.kashyap@linaro.org> wrote:
>> The address of cpu power registers in pmu is based on cpu number
>> offsets. This function calculate the same. This is essentially
>> required in case of multicluster SoC's e.g Exynos5420.
>>
>> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
>> Signed-off-by: Chander Kashyap <k.chander@samsung.com>
>> ---
>>  arch/arm/mach-exynos/regs-pmu.h |    9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
>> index 4f6a256..217da2e 100644
>> --- a/arch/arm/mach-exynos/regs-pmu.h
>> +++ b/arch/arm/mach-exynos/regs-pmu.h
>> @@ -313,4 +313,13 @@
>>
>>  #define EXYNOS5_OPTION_USE_RETENTION                           (1 << 4)
>>
>> +#include <asm/cputype.h>
>> +#define MAX_CPUS_IN_CLUSTER    4
>> +
>> +static inline unsigned int exynos_pmu_cpunr(unsigned int mpidr)
>> +{
>> +       return ((MPIDR_AFFINITY_LEVEL(mpidr, 1) * MAX_CPUS_IN_CLUSTER)
>> +                + MPIDR_AFFINITY_LEVEL(mpidr, 0));
>> +}
>> +
>>  #endif /* __ASM_ARCH_REGS_PMU_H */
>> --
>> 1.7.9.5
>>
>
> Kukjin, Can you please have a look.
>
>
>
> --
> with warm regards,
> Chander Kashyap
Hi Kgene,
Can you take this patch if no issues with it.


-- 
with warm regards,
Chander Kashyap
