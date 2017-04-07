From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v9 07/12] ARM: EXYNOS: introduce soc specific pm ops
Date: Fri, 07 Apr 2017 19:41:19 +0530
Message-ID: <fc69a6fa-7cb2-478b-b346-c59039c2b8da@samsung.com>
References: <CGME20170330131434epcas1p4e42fe06bae3456c39e0f93a2f8ae4bc0@epcas1p4.samsung.com>
 <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
 <1490879826-16754-8-git-send-email-pankaj.dubey@samsung.com>
 <CAJKOXPckh9C-mSq5NsJJfSW-brs6=wTDuctkD2EbtQOjKOQgbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42223 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932178AbdDGOIb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 10:08:31 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OO1019A3LY5NPA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Apr 2017 23:08:29 +0900 (KST)
In-reply-to: <CAJKOXPckh9C-mSq5NsJJfSW-brs6=wTDuctkD2EbtQOjKOQgbg@mail.gmail.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, Marek Szyprowski <m.szyprowski@samsung.com>, kgene@kernel.org, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>



On Friday 07 April 2017 02:54 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 30, 2017 at 3:17 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
>> For s2r various Exynos SoC needs different programming sequence and data.
> 
> This is not S2R so:
> "Sleep modes on various Exynos SoCs need..."

OK.
> 
>> Currently this is handled by adding lots of soc_is_exynosMMM checks in the
>> code, in an attempt to remove the dependency of such helper functions
> "code." full stop.
> 
>> specific to each SoC, let's separate these programming sequence by
>> introducing a new struct exynos_s2r_data. This struct will contain
> 
> If you plan to extend it to all sleep modes, then:
> "exynos_sleep_data"? But if not, then just "exynos_aftr_data" or
> "exynos_cpuidle_data" as this is real use for now.

As you suggested in patch 08/12, I will use exynos_pm_data.

> 
>> different function hooks and data for differentiating these programming
>> sequences based on SoC's soc_id and revision parameters which can be
>> matched by using generic API "soc_device_match".
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>  arch/arm/mach-exynos/pm.c | 122 +++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 116 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
>> index 4a73b02..fa24098 100644
>> --- a/arch/arm/mach-exynos/pm.c
>> +++ b/arch/arm/mach-exynos/pm.c
>> @@ -20,6 +20,7 @@
>>  #include <linux/of.h>
>>  #include <linux/soc/samsung/exynos-regs-pmu.h>
>>  #include <linux/soc/samsung/exynos-pmu.h>
>> +#include <linux/sys_soc.h>
>>
>>  #include <asm/firmware.h>
>>  #include <asm/smp_scu.h>
>> @@ -30,6 +31,12 @@
>>
>>  #include "common.h"
>>
>> +struct exynos_s2r_data {
> 
> Rename all "s2r" occurrences to appropriate name.

OK.

> 
>> +       void (*enter_aftr)(void);
>> +};
>> +
>> +static const struct exynos_s2r_data *s2r_data;
>> +
>>  static inline void __iomem *exynos_boot_vector_addr(void)
>>  {
>>         if (samsung_rev() == EXYNOS4210_REV_1_1)
>> @@ -160,13 +167,26 @@ static int exynos_aftr_finisher(unsigned long flags)
>>
>>  void exynos_enter_aftr(void)
>>  {
>> +       if (s2r_data && s2r_data->enter_aftr)
>> +               s2r_data->enter_aftr();
>> +}
>> +
>> +static void exynos3_enter_aftr(void)
>> +{
>>         unsigned int cpuid = smp_processor_id();
>>
>>         cpu_pm_enter();
>> +       exynos_set_boot_flag(cpuid, C2_STATE);
>> +       exynos_pm_central_suspend();
>> +       cpu_suspend(0, exynos_aftr_finisher);
>> +       exynos_pm_central_resume();
>> +       exynos_clear_boot_flag(cpuid, C2_STATE);
>> +       cpu_pm_exit();
>> +}
>>
>> -       if (of_machine_is_compatible("samsung,exynos3250"))
>> -               exynos_set_boot_flag(cpuid, C2_STATE);
>> -
>> +static void exynos4_enter_aftr(void)
>> +{
>> +       cpu_pm_enter();
>>         exynos_pm_central_suspend();
>>
>>         if (of_machine_is_compatible("samsung,exynos4212") ||
>> @@ -185,13 +205,103 @@ void exynos_enter_aftr(void)
>>         }
>>
>>         exynos_pm_central_resume();
>> +       cpu_pm_exit();
>> +}
>>
>> -       if (of_machine_is_compatible("samsung,exynos3250"))
>> -               exynos_clear_boot_flag(cpuid, C2_STATE);
>> -
>> +static void exynos5_enter_aftr(void)
>> +{
>> +       cpu_pm_enter();
>> +       exynos_pm_central_suspend();
>> +       cpu_suspend(0, exynos_aftr_finisher);
>> +       exynos_pm_central_resume();
>>         cpu_pm_exit();
>>  }
>>
>> +static const struct exynos_s2r_data exynos_common_s2r_data = {
>> +       .enter_aftr             = exynos5_enter_aftr,
>> +};
>> +
>> +static const struct exynos_s2r_data exynos3250_s2r_data = {
>> +       .enter_aftr             = exynos3_enter_aftr,
>> +};
>> +
>> +static const struct exynos_s2r_data exynos4210_rev11_s2r_data = {
>> +       .enter_aftr             = exynos4_enter_aftr,
>> +};
>> +
>> +static const struct exynos_s2r_data exynos4210_rev10_s2r_data = {
>> +       .enter_aftr             = exynos4_enter_aftr,
>> +};
>> +
>> +static const struct exynos_s2r_data exynos4x12_s2r_data = {
>> +       .enter_aftr             = exynos4_enter_aftr,
>> +};
>> +
>> +static const struct soc_device_attribute exynos_soc_revision[] __initconst = {
>> +       {
>> +               .soc_id = "EXYNOS3250",
>> +               .data = &exynos3250_s2r_data
>> +       },
>> +       {
>> +               .soc_id = "EXYNOS4210",
>> +               .revision = "11",
>> +               .data = &exynos4210_rev11_s2r_data
>> +       },
>> +       {
>> +               .soc_id = "EXYNOS4210",
>> +               .revision = "10",
>> +               .data = &exynos4210_rev10_s2r_data
>> +       },
>> +       {
>> +               .soc_id = "EXYNOS4212",
>> +               .data = &exynos4x12_s2r_data
>> +       },
>> +       {
>> +               .soc_id = "EXYNOS4412",
>> +               .data = &exynos4x12_s2r_data
>> +       },
>> +       {
>> +               .soc_id = "EXYNOS5250",
>> +               .data = &exynos_common_s2r_data
>> +       },
>> +       {
>> +               .soc_id = "EXYNOS5260",
>> +               .data = &exynos_common_s2r_data
>> +       },
>> +       {
>> +               .soc_id = "EXYNOS5440",
>> +               .data = &exynos_common_s2r_data
>> +       },
>> +       {
>> +               .soc_id = "EXYNOS5410",
>> +               .data = &exynos_common_s2r_data
>> +       },
>> +       {
>> +               .soc_id = "EXYNOS5420",
>> +               .data = &exynos_common_s2r_data
>> +       },
>> +       {
>> +               .soc_id = "EXYNOS5800",
>> +               .data = &exynos_common_s2r_data
>> +       },
>> +};
>> +
>> +int __init exynos_s2r_init(void)
>> +{
>> +       const struct soc_device_attribute *match;
>> +
>> +       match = soc_device_match(exynos_soc_revision);
>> +
>> +       if (match)
>> +               s2r_data = (const struct exynos_s2r_data *) match->data;
>> +
>> +       if (!s2r_data)
>> +               return -ENODEV;
>> +
>> +       return 0;
>> +}
>> +arch_initcall(exynos_s2r_init);
>> +
> 
> I guess you already found possible probe-order issue. You should
> register all of this after having the soc chipid driver. However it is
> required by cpuidle driver which is being registered in machine_init()
> call....  You cannot use deferred probe here, so maybe the only way is
> to manually order the calls in machine_init():
> 1. exynos_chipid_early_init()
> 2. this one.
> 3. cpuidle driver register.
> 

exynos_s2r_init is not required during early stage of boot, so as Arnd
suggested I can drop arch_initcall here and probably go for

1: late_init
2: Call this directly from machine_init

I prefer first option, as I mentioned my long term plan to move these
files out of arch/arm/mach-exynos/ and if I call it from mach-exynos,
then while moving I have to make this function as export symbol or make
it extern so that mach-exynos/exynos.c should be able to access it. Both
of these approaches have been rejected in past. What do you say?


Thanks,
Pankaj Dubey
> Best regards,
> Krzysztof
> 
> 
> 
