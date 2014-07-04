From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v6] ARM: EXYNOS: Use MCPM call-backs to support S2R on Exynos5420
Date: Sat, 5 Jul 2014 01:19:25 +0530
Message-ID: <CAM4voa=K6s0FFmeuiqWZh6HSQZAfSpxL8A_kMTxCi+2t3tzydw@mail.gmail.com>
References: <alpine.LFD.2.11.1407041408120.22282@knanqh.ubzr>
	<CAM4voamqpCj=Zw69DGjzhouwu=6RE6e3Px5WL8akc-TUAts0Xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f52.google.com ([209.85.216.52]:52023 "EHLO
	mail-qa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752107AbaGDTt0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 15:49:26 -0400
Received: by mail-qa0-f52.google.com with SMTP id w8so1617047qac.39
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Jul 2014 12:49:25 -0700 (PDT)
In-Reply-To: <CAM4voamqpCj=Zw69DGjzhouwu=6RE6e3Px5WL8akc-TUAts0Xg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Andrew Bresticker <abrestic@chromium.org>, Douglas Anderson <dianders@chromium.org>

Hi Nicolas,

On Sat, Jul 5, 2014 at 12:32 AM, Abhilash Kesavan
<kesavan.abhilash@gmail.com> wrote:
> Hi Nicolas,
>
> On Sat, Jul 5, 2014 at 12:00 AM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
>> On Fri, 4 Jul 2014, Abhilash Kesavan wrote:
>>
>>> On Fri, Jul 4, 2014 at 9:43 AM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
>>> > Another suggestion which might possibly be better: why not looking for
>>> > the SYS_PWR_CFG bit in exynos_cpu_power_down() directly?  After all,
>>> > exynos_cpu_power_down() is semantically supposed to do what its name
>>> > suggest and could simply do nothing if the proper conditions are already
>>> > in place.
>>> I have implemented this and it works fine. Patch coming up.
>>
>> On Fri, 4 Jul 2014, Abhilash Kesavan wrote:
>>
>>> Use the MCPM layer to handle core suspend/resume on Exynos5420.
>>> Also, restore the entry address setup code post-resume.
>>>
>>> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
>>> ---
>>> Changes in v2:
>>>       - Made use of the MCPM suspend/powered_up call-backs
>>> Changes in v3:
>>>       - Used the residency value to indicate the entered state
>>> Changes in v4:
>>>       - Checked if MCPM has been enabled to prevent build error
>>> Changes in v5:
>>>       - Removed the MCPM flags and just used a local flag to
>>>       indicate that we are suspending.
>>> Changes in v6:
>>>       - Read the SYS_PWR_REG value to decide if we are suspending
>>>       the system.
>>>       - Restore the SYS_PWR_REG value post-resume.
>>>       - Modified the comments to reflect the first change.
>>
>> [...]
>>
>>> @@ -150,7 +153,15 @@ static void exynos_power_down(void)
>>>       BUG_ON(__mcpm_cluster_state(cluster) != CLUSTER_UP);
>>>       cpu_use_count[cpu][cluster]--;
>>>       if (cpu_use_count[cpu][cluster] == 0) {
>>> -             exynos_cpu_power_down(cpunr);
>>> +             /*
>>> +              * Bypass power down for CPU0 during suspend. Check for
>>> +              * the SYS_PWR_REG value to decide if we are suspending
>>> +              * the system.
>>> +              */
>>> +             temp = __raw_readl(pmu_base_addr +
>>> +                     EXYNOS5_ARM_CORE0_SYS_PWR_REG);
>>> +             if ((cpu != 0) || ((temp & S5P_CORE_LOCAL_PWR_EN) != 0))
>>> +                     exynos_cpu_power_down(cpunr);
>>
>> Nah...  We're going in circles, aren't we?
>>
>> What I suggested above is:
>>
>> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
>> index 67d383de61..0a48421860 100644
>> --- a/arch/arm/mach-exynos/pm.c
>> +++ b/arch/arm/mach-exynos/pm.c
>> @@ -110,6 +110,16 @@ static int exynos_irq_set_wake(struct irq_data *data, unsigned int state)
>>   */
>>  void exynos_cpu_power_down(int cpu)
>>  {
>> +       if (soc_is_exynos5250() && cpu == 0) {
>> +               /*
>> +                * Bypass power down for CPU0 during suspend. Check for
>> +                * the SYS_PWR_REG value to decide if we are suspending
>> +                * the system.
>> +                */
>> +               int val = __raw_readl(pmu_base_addr +EXYNOS5_ARM_CORE0_SYS_PWR_REG);
>> +               if (!(val & S5P_CORE_LOCAL_PWR_EN))
>> +                       return;
>> +       }
>>         __raw_writel(0, EXYNOS_ARM_CORE_CONFIGURATION(cpu));
>>  }
> Ah, I get it, much nicer indeed. Will change.
On a different note, I have been using the cpuidle patchset
(https://patchwork.kernel.org/patch/4357421/) as base for S2R support
and had a question. Rather than making the driver depend on
ARCH_EXYNOS should it depend on EXYNOS5420_MCPM which in turn depends
on MCPM (like TC2) or should we just be making the bL cpuidle driver
depend on MCPM ?

Regards,
Abhilash

>>
>>
>> Nicolas
