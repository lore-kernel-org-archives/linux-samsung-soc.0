From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC PATCH 5/9] soc: samsung: pm: Add support for
 suspend-to-ram of Exynos5433
Date: Thu, 11 Jan 2018 14:40:56 +0900
Message-ID: <5A56F8E8.7020006@samsung.com>
References: <CGME20180109075905epcas2p1fe6b554b646dbc80e04273ad6dd8489c@epcas2p1.samsung.com>
        <1515484746-10656-1-git-send-email-cw00.choi@samsung.com>
        <1515484746-10656-6-git-send-email-cw00.choi@samsung.com>
        <CAJKOXPdL7EbhaWkKCV7vMMnX2Z9vTr=r7UyDNx6E7ZLUikXy_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11620 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751042AbeAKFlA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 00:41:00 -0500
In-reply-to: <CAJKOXPdL7EbhaWkKCV7vMMnX2Z9vTr=r7UyDNx6E7ZLUikXy_Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, kgene@kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, chanwoo@kernel.org, Jaehoon Chung <jh80.chung@samsung.com>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jonghwa Lee <jonghwa3.lee@samsung.com>

On 2018년 01월 09일 21:45, Krzysztof Kozlowski wrote:
> On Tue, Jan 9, 2018 at 8:59 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>> This patch adds the specific exynos_pm_data instance for Exynos5433
>> in order to support the suspend-to-ram. Exynos5433 SoC need to write
>> the 'cpu_resume' poiter address and the specific magic number
>> for suspend mode.
>>
>> Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> ---
>>  drivers/soc/samsung/exynos-pm.c | 38 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/soc/samsung/exynos-pm.c b/drivers/soc/samsung/exynos-pm.c
>> index 45d84bbe5e61..70d949ba5cab 100644
>> --- a/drivers/soc/samsung/exynos-pm.c
>> +++ b/drivers/soc/samsung/exynos-pm.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/regulator/machine.h>
>>  #include <linux/syscore_ops.h>
>>  #include <linux/suspend.h>
>> +#include <linux/psci.h>
>>
>>  #include <asm/cpuidle.h>
>>  #include <asm/io.h>
>> @@ -123,7 +124,44 @@ static void exynos_pm_finish(void)
>>  #define exynos_pm_data_arm_ptr(data)   NULL
>>  #endif
>>
>> +static int exynos5433_pm_suspend(unsigned long unused)
>> +{
>> +       /*
>> +        * Exynos5433 uses PSCI v0.1 which provides the only one
>> +        * entry point (psci_ops.cpu_suspend) for both cpuidle and
>> +        * suspend-to-RAM. Also, PSCI v0.1 needs the specific 'power_state'
>> +        * parameter for the suspend mode. In order to enter suspend mode,
>> +        * Exynos5433 calls the 'psci_ops.cpu_suspend' with '0x3010000'
>> +        * power_state parameter.
>> +        *
>> +        * '0x3010000' means that both cluster and system are going to enter
>> +        * the power-down state as following:
>> +        * - [25:24] 0x3 : Indicate the cluster and system.
>> +        * - [16]    0x1 : Indicate power-down state.
> 
> Define them, it will be more readable (name of define given just as an example):
> 
> EXYNOS5433_PCSI_SUSPEND_SYSTEM (0x3 << 24)
> (or even split per system and cluser and use BIT() if this is real meaning)
> and probably reuse existing S5P_CENTRAL_LOWPWR_CFG

OK. I'll define it as the constant.

> 
>> +        */
>> +       return psci_ops.cpu_suspend(0x3010000, __pa_symbol(cpu_resume));
>> +}
>> +
>> +static int exynos5433_pm_suspend_enter(suspend_state_t state)
>> +{
>> +       if (!sysram_ns_base_addr)
>> +               return -EINVAL;
>> +
>> +       __raw_writel(virt_to_phys(cpu_resume), sysram_ns_base_addr + 0x8);
>> +       __raw_writel(EXYNOS_SLEEP_MAGIC, sysram_ns_base_addr + 0xc);
> 
> Document them in Documentation/arm/Samsung/Bootloader-interface.txt.

OK.

> 
> Best regards,
> Krzysztof
> 
>> +
>> +       return cpu_suspend(0, exynos5433_pm_suspend);
>> +}
>> +
>> +const struct exynos_pm_data exynos5433_pm_data = {
>> +       .enter          = exynos5433_pm_suspend_enter,
>> +};
>> +
>>  static const struct of_device_id exynos_pm_of_device_ids[] = {
>> +       {
>> +               .compatible = "samsung,exynos5433-pmu",
>> +               .data = exynos_pm_data_arm_ptr(exynos5433_pm_data),
>> +       },
>>         { /*sentinel*/ },
>>  };
>>
>> --
>> 1.9.1
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
