From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] arm: exynos: add generic function to calculate cpu number
Date: Fri, 09 May 2014 10:17:16 +0200
Message-ID: <536C8F0C.9060104@samsung.com>
References: <1398404653-14407-1-git-send-email-chander.kashyap@linaro.org>
 <CANuQgHGtTFcP1baipTwTTPw_t3JV42nn-Kh4n72_9VRZ8ZwaPA@mail.gmail.com>
 <CANuQgHGJ98s6c7Y-wJ+xFuiwqZXVziyXZzp7oYDpwU7CGzRTyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49959 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055AbaEIIRV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 04:17:21 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5A00A0XSCJRZ20@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 May 2014 09:17:08 +0100 (BST)
In-reply-to: <CANuQgHGJ98s6c7Y-wJ+xFuiwqZXVziyXZzp7oYDpwU7CGzRTyg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chander Kashyap <k.chander@samsung.com>

Hi Chander,

On 09.05.2014 09:50, Chander Kashyap wrote:
> On 5 May 2014 09:37, Chander Kashyap <chander.kashyap@linaro.org> wrote:
>> On 25 April 2014 11:14, Chander Kashyap <chander.kashyap@linaro.org> wrote:
>>> The address of cpu power registers in pmu is based on cpu number
>>> offsets. This function calculate the same. This is essentially
>>> required in case of multicluster SoC's e.g Exynos5420.
>>>
>>> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
>>> Signed-off-by: Chander Kashyap <k.chander@samsung.com>
>>> ---
>>>  arch/arm/mach-exynos/regs-pmu.h |    9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
>>> index 4f6a256..217da2e 100644
>>> --- a/arch/arm/mach-exynos/regs-pmu.h
>>> +++ b/arch/arm/mach-exynos/regs-pmu.h
>>> @@ -313,4 +313,13 @@
>>>
>>>  #define EXYNOS5_OPTION_USE_RETENTION                           (1 << 4)
>>>
>>> +#include <asm/cputype.h>
>>> +#define MAX_CPUS_IN_CLUSTER    4
>>> +
>>> +static inline unsigned int exynos_pmu_cpunr(unsigned int mpidr)
>>> +{
>>> +       return ((MPIDR_AFFINITY_LEVEL(mpidr, 1) * MAX_CPUS_IN_CLUSTER)
>>> +                + MPIDR_AFFINITY_LEVEL(mpidr, 0));
>>> +}
>>> +
>>>  #endif /* __ASM_ARCH_REGS_PMU_H */
>>> --
>>> 1.7.9.5
>>>
>>
>> Kukjin, Can you please have a look.
>>
>>
>>
>> --
>> with warm regards,
>> Chander Kashyap
> Hi Kgene,
> Can you take this patch if no issues with it.

Is there any user for this function right now? Shouldn't this patch
rather be included as a part of some series that adds actual users of it?

Best regards,
Tomasz
