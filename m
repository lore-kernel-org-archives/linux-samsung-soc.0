From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 2/3] ARM: EXYNOS: Add initial support of PMU for
 Exynos5260
Date: Wed, 16 Apr 2014 13:54:52 +0200
Message-ID: <534E6F8C.3040801@samsung.com>
References: <1395061795-17777-1-git-send-email-vikas.sajjan@samsung.com>
 <1395061795-17777-3-git-send-email-vikas.sajjan@samsung.com>
 <534D7BAB.30503@gmail.com>
 <CAGm_ybhzQLbK8K5mj0WK8ww61PqurumkwkHqah2=5v-=VACJzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42490 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755182AbaDPLy4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 07:54:56 -0400
In-reply-to: <CAGm_ybhzQLbK8K5mj0WK8ww61PqurumkwkHqah2=5v-=VACJzA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <sajjan.linux@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>

Hi Vikas,

On 16.04.2014 07:34, Vikas Sajjan wrote:
> Hi Tomasz,
>
> On Wed, Apr 16, 2014 at 12:04 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> Hi Vikas,
>>
>>
>> On 17.03.2014 14:09, Vikas Sajjan wrote:
>>>
>>> Adds PMU support of PMU for Exynos5260. Suspend-to-RAM can be built on
>>> top this.
>>>
>>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>>> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
>>> ---
>>>    arch/arm/mach-exynos/common.h            |   26 ++++
>>>    arch/arm/mach-exynos/pm.c                |   34 +++--
>>>    arch/arm/mach-exynos/pmu.c               |  238
>>> ++++++++++++++++++++++++++++++
>>>    arch/arm/mach-exynos/regs-pmu.h          |  232
>>> +++++++++++++++++++++++++++++
>>>    arch/arm/plat-samsung/include/plat/cpu.h |    8 +
>>>    5 files changed, 529 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
>>> index aba6a2a..a17f701 100644
>>> --- a/arch/arm/mach-exynos/common.h
>>> +++ b/arch/arm/mach-exynos/common.h
>>> @@ -56,6 +56,32 @@ enum sys_powerdown {
>>>          NUM_SYS_POWERDOWN,
>>>    };
>>>
>>> +enum running_cpu {
>>> +       EXYNOS5_KFC,
>>> +       EXYNOS5_ARM,
>>> +};
>>> +
>>> +enum reg_op {
>>> +       REG_INIT,       /* write new value */
>>> +       REG_RESET,      /* clear with zero */
>>> +       REG_SET,        /* bit set */
>>> +       REG_CLEAR,      /* bit clear */
>>> +};
>>> +
>>> +/* reg/value set */
>>> +#define EXYNOS_PMU_REG(REG, VAL, OP)           \
>>> +{                                              \
>>> +       .reg    =       (void __iomem *)REG,    \
>>> +       .val    =       VAL,                    \
>>> +       .op     =       OP,                     \
>>> +}
>>> +
>>> +struct exynos_pmu_init_reg {
>>> +       void __iomem *reg;
>>> +       unsigned int val;
>>> +       enum reg_op op;
>>> +};
>>> +
>>>    extern unsigned long l2x0_regs_phys;
>>>    struct exynos_pmu_conf {
>>>          void __iomem *reg;
>>> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
>>> index 15af0ce..dbe9670 100644
>>> --- a/arch/arm/mach-exynos/pm.c
>>> +++ b/arch/arm/mach-exynos/pm.c
>>> @@ -109,7 +109,7 @@ static int exynos_cpu_suspend(unsigned long arg)
>>>          outer_flush_all();
>>>    #endif
>>>
>>> -       if (soc_is_exynos5250())
>>> +       if (soc_is_exynos5250() || soc_is_exynos5260())
>>>                  flush_cache_all();
>>
>>
>> I think it's the right time for this code to be restructured. Adding more
>> and more SoCs over this cruft is making this code worse and worse.
>>
>
>   I recently came across RFC [1] posted by pankaj on similar lines, did
> you get a chance to have look at this series.
>
> [1] https://lkml.org/lkml/2014/4/2/69
>

Right. I noticed it once, but didn't get to review it yet, as I'm a bit 
busy with other things right now. Will try to take a look in next days.

Best regards,
Tomasz
