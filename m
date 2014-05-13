From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH V3 1/3] ARM: EXYNOS5: PMU support for 5420
Date: Tue, 13 May 2014 15:43:24 +0530
Message-ID: <CAM4voanRvELU8CanyBJZCXxSRaUB_Apo3E3SOyrTowNXX=aNmw@mail.gmail.com>
References: <1399546342-30494-1-git-send-email-vikas.sajjan@samsung.com>
	<536DAF1A.8080809@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:33808 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760606AbaEMKNY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 06:13:24 -0400
Received: by mail-qg0-f45.google.com with SMTP id z60so114265qgd.18
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2014 03:13:24 -0700 (PDT)
In-Reply-To: <536DAF1A.8080809@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Vikas Sajjan <vikas.sajjan@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, joshi@samsung.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Pankaj,

[...]
>>   #include "exynos-pmu.h"
>>   #include "regs-pmu.h"
>> +#include "common.h"
>>
>
>
> I think it will be better if we move "EXYNOS5420_USE_STANDBY_WFI_ALL"
> macro into regs-pmu.h itself. It will help us removing dependency of
> common.h
> from "pmu.c", so that in future we can easily move this file out of machine
> directory.
Will move to regs-pmu.h

[...]
>> + * exynos_set_core_flag - set the cluster id to IROM register
>> + *                       to ensure that we wake up with the
>> + *                       current cluster.
>> + */
>> +static void exynos5420_set_core_flag(void)
>> +{
>> +       unsigned int this_cluster;
>> +       this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
>> +
>> +       regmap_write(pmu_context->pmu_regmap, EXYNOS_IROM_DATA2,
>> this_cluster);
>> +}
>> +
>> +void exynos5420_powerdown_conf(enum sys_powerdown mode)
>> +{
>> +       exynos5420_set_core_flag();
>
>
> I think we can avoid extra function call of exynos5420_set_core_flag by
> moving
> all of it's code in powerdown_conf itself.
Will move to powerdown_conf.
>
>
>> +}
>>   void exynos5_powerdown_conf(enum sys_powerdown mode)
>>   {
>>         unsigned int i;
>> @@ -429,6 +670,80 @@ static void exynos5250_pmu_init(void)
>>         regmap_write(pmu_regmap, EXYNOS5_MASK_WDTRESET_REQUEST, tmp);
>>   }
>>   +static void exynos5420_pmu_init(void)
>> +{
>> +       unsigned int value;
>> +       int i;
>> +
>> +       /*
>> +        * Set the CMU_RESET, CMU_SYSCLK and CMU_CLKSTOP registers
>> +        * for local power blocks to Low initially as per Table 8-4:
>> +        * "System-Level Power-Down Configuration Registers".
>> +        */
>> +       for (i = 0; i < ARRAY_SIZE(exynos5420_list_disable_pmu_reg); i++)
>> +               regmap_write(pmu_context->pmu_regmap,
>> +                       exynos5420_list_disable_pmu_reg[i], 0);
>> +
>> +       /* Time taken to stabilized XXTI clock */
>> +       regmap_write(pmu_context->pmu_regmap, EXYNOS5_XXTI_DURATION3,
>> 0x005dc);
>
>
> Isn't it will be good if you use some macro of 0x005dc?
Will remove this as per Alim's comment.

Regards,
Abhilash
