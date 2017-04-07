From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v9 10/12] ARM: EXYNOS: move power_{down,up} to per SoC
 struct exynos_cpu_info
Date: Fri, 7 Apr 2017 19:42:13 +0530
Message-ID: <2ec66bcd-da59-a0b2-d75a-936d21e39990@samsung.com>
References: <CGME20170330131440epcas1p4f27192272761aa593b6cf083453e8adc@epcas1p4.samsung.com>
        <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
        <1490879826-16754-11-git-send-email-pankaj.dubey@samsung.com>
        <CAJKOXPecpw79gAQFCKtjTGpsP+BJt38C05t+Vb6nid+PL+g-xQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41106 "EHLO
        epoutp02.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932178AbdDGOJA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Apr 2017 10:09:00 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by epoutp02.samsung.com (KnoxPortal) with ESMTP id 20170407140858epoutp028b696af614100507fd7e47efd3d803ae~zIsaxWYIC3203032030epoutp02v
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Apr 2017 14:08:58 +0000 (GMT)
In-Reply-To: <CAJKOXPecpw79gAQFCKtjTGpsP+BJt38C05t+Vb6nid+PL+g-xQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, Marek Szyprowski <m.szyprowski@samsung.com>, kgene@kernel.org, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>



On Friday 07 April 2017 05:34 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 30, 2017 at 3:17 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
>> Various Exynos SoC handles CPU power_up and power_down operation
>> differently. To handle this difference until now we were using
>> soc_is_exynosMMM helper functions, in an attempt to remove the dependency
>> of such helper functions specific to each SoC, let's move power_{down,up}
>> functionality as a SoC specific function pointer hooks in
>> struct exynos_cpu_info.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>  arch/arm/mach-exynos/platsmp.c | 61 +++++++++++++++++++++++++++++++-----------
>>  1 file changed, 46 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
>> index ff369b9..6f08b15 100644
>> --- a/arch/arm/mach-exynos/platsmp.c
>> +++ b/arch/arm/mach-exynos/platsmp.c
>> @@ -37,9 +37,13 @@ extern void exynos4_secondary_startup(void);
>>  /*
>>   * struct exynos_cpu_info - Exynos CPU related info/operations
>>   * @cpu_boot_reg: computes cpu boot address for requested cpu
>> + * @cpu_power_down: handles cpu power down routine for requested cpu
>> + * @cpu_power_up: handles cpu power up routine for requested cpu
>>   */
>>  struct exynos_cpu_info {
>>         void __iomem* (*cpu_boot_reg)(u32 cpu);
>> +       void (*cpu_power_down)(u32 cpu);
>> +       void (*cpu_power_up)(u32 cpu);
>>  };
>>
>>  static const struct exynos_cpu_info *cpu_info;
>> @@ -92,19 +96,29 @@ static inline void platform_do_lowpower(unsigned int cpu, int *spurious)
>>  }
>>  #endif /* CONFIG_HOTPLUG_CPU */
>>
>> -/**
>> - * exynos_core_power_down : power down the specified cpu
>> +/*
>> + * exynos_core_power_down - power down the specified cpu
>>   * @cpu : the cpu to power down
>> - *
>> - * Power down the specified cpu. The sequence must be finished by a
>> - * call to cpu_do_idle()
>> - *
>> + * The sequence must be finished by a call to cpu_do_idle()
>>   */
>>  void exynos_cpu_power_down(int cpu)
>>  {
>> +       if (cpu_info && cpu_info->cpu_power_down)
>> +               cpu_info->cpu_power_down(cpu);
>> +}
>> +
>> +static void exynos_common_cpu_power_down(u32 cpu)
>> +{
>>         u32 core_conf;
>>
>> -       if (cpu == 0 && (soc_is_exynos5420() || soc_is_exynos5800())) {
>> +       core_conf = pmu_raw_readl(EXYNOS_ARM_CORE_CONFIGURATION(cpu));
>> +       core_conf &= ~S5P_CORE_LOCAL_PWR_EN;
>> +       pmu_raw_writel(core_conf, EXYNOS_ARM_CORE_CONFIGURATION(cpu));
>> +}
>> +
>> +static void exynos5420_cpu_power_down(u32 cpu)
>> +{
>> +       if (cpu == 0) {
>>                 /*
>>                  * Bypass power down for CPU0 during suspend. Check for
>>                  * the SYS_PWR_REG value to decide if we are suspending
>> @@ -116,24 +130,31 @@ void exynos_cpu_power_down(int cpu)
>>                         return;
>>         }
>>
>> -       core_conf = pmu_raw_readl(EXYNOS_ARM_CORE_CONFIGURATION(cpu));
>> -       core_conf &= ~S5P_CORE_LOCAL_PWR_EN;
>> -       pmu_raw_writel(core_conf, EXYNOS_ARM_CORE_CONFIGURATION(cpu));
>> +       exynos_common_cpu_power_down(cpu);
>>  }
>>
>> -/**
>> +/*
>>   * exynos_cpu_power_up : power up the specified cpu
>>   * @cpu : the cpu to power up
>> - *
>> - * Power up the specified cpu
>>   */
>>  void exynos_cpu_power_up(int cpu)
>>  {
>> +       if (cpu_info && cpu_info->cpu_power_up)
>> +               cpu_info->cpu_power_up(cpu);
>> +}
>> +
>> +static void exynos_common_cpu_power_up(u32 cpu)
>> +{
>>         u32 core_conf = S5P_CORE_LOCAL_PWR_EN;
>> +       pmu_raw_writel(core_conf,
>> +                       EXYNOS_ARM_CORE_CONFIGURATION(cpu));
>> +}
>>
>> -       if (soc_is_exynos3250())
>> -               core_conf |= S5P_CORE_AUTOWAKEUP_EN;
>> +static void exynos3250_cpu_power_up(u32 cpu)
>> +{
>> +       u32 core_conf = S5P_CORE_LOCAL_PWR_EN;
>>
>> +       core_conf |= S5P_CORE_AUTOWAKEUP_EN;
> 
> Maybe just:
>         core_conf = S5P_CORE_LOCAL_PWR_EN \
>                            | S5P_CORE_AUTOWAKEUP_EN;
> ?

OK, it can be done.

Thanks,
Pankaj Dubey
> 
> Best regards,
> Krzysztof
> 
> 
> 
