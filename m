From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH] arm: exynos: add generic function to calculate cpu number
Date: Fri, 9 May 2014 14:04:43 +0530
Message-ID: <CANuQgHFYQH6dGDnG_6DkdeL63nhMg8dMjELr2AyecxEP2MM1mQ@mail.gmail.com>
References: <1398404653-14407-1-git-send-email-chander.kashyap@linaro.org>
	<CANuQgHGtTFcP1baipTwTTPw_t3JV42nn-Kh4n72_9VRZ8ZwaPA@mail.gmail.com>
	<CANuQgHGJ98s6c7Y-wJ+xFuiwqZXVziyXZzp7oYDpwU7CGzRTyg@mail.gmail.com>
	<536C8F0C.9060104@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:48825 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752161AbaEIIen (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 04:34:43 -0400
Received: by mail-oa0-f53.google.com with SMTP id m1so4556869oag.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 May 2014 01:34:43 -0700 (PDT)
In-Reply-To: <536C8F0C.9060104@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chander Kashyap <k.chander@samsung.com>

On 9 May 2014 13:47, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Chander,
>
> On 09.05.2014 09:50, Chander Kashyap wrote:
>> On 5 May 2014 09:37, Chander Kashyap <chander.kashyap@linaro.org> wrote:
>>> On 25 April 2014 11:14, Chander Kashyap <chander.kashyap@linaro.org> wrote:
>>>> The address of cpu power registers in pmu is based on cpu number
>>>> offsets. This function calculate the same. This is essentially
>>>> required in case of multicluster SoC's e.g Exynos5420.
>>>>
>>>> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
>>>> Signed-off-by: Chander Kashyap <k.chander@samsung.com>
>>>> ---
>>>>  arch/arm/mach-exynos/regs-pmu.h |    9 +++++++++
>>>>  1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
>>>> index 4f6a256..217da2e 100644
>>>> --- a/arch/arm/mach-exynos/regs-pmu.h
>>>> +++ b/arch/arm/mach-exynos/regs-pmu.h
>>>> @@ -313,4 +313,13 @@
>>>>
>>>>  #define EXYNOS5_OPTION_USE_RETENTION                           (1 << 4)
>>>>
>>>> +#include <asm/cputype.h>
>>>> +#define MAX_CPUS_IN_CLUSTER    4
>>>> +
>>>> +static inline unsigned int exynos_pmu_cpunr(unsigned int mpidr)
>>>> +{
>>>> +       return ((MPIDR_AFFINITY_LEVEL(mpidr, 1) * MAX_CPUS_IN_CLUSTER)
>>>> +                + MPIDR_AFFINITY_LEVEL(mpidr, 0));
>>>> +}
>>>> +
>>>>  #endif /* __ASM_ARCH_REGS_PMU_H */
>>>> --
>>>> 1.7.9.5
>>>>
>>>
>>> Kukjin, Can you please have a look.
>>>
>>>
>>>
>>> --
>>> with warm regards,
>>> Chander Kashyap
>> Hi Kgene,
>> Can you take this patch if no issues with it.
>
> Is there any user for this function right now? Shouldn't this patch
> rather be included as a part of some series that adds actual users of it?

Hi Tomasz,
Exynos5420 patches have dependency on this.
Those patches already posted.


>
> Best regards,
> Tomasz
>



-- 
with warm regards,
Chander Kashyap
