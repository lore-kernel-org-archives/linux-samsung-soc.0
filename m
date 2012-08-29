From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 1/3] ARM: EXYNOS: Use EXYNOS4210_GPEx instead of EXYNOS4_GPEx
Date: Wed, 29 Aug 2012 09:03:12 +0900
Message-ID: <CAH9JG2UF6cqPcX4idYLRBHwLvs27ErtbwsjEFvMZbyfz_KNsZw@mail.gmail.com>
References: <4648723.rWnut7F0uJ@amdc1227>
	<14029212.D3MKvQZpbq@amdc1227>
	<503D57EF.2090402@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:51080 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750973Ab2H2ADN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 20:03:13 -0400
Received: by qcro28 with SMTP id o28so3850841qcr.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Aug 2012 17:03:12 -0700 (PDT)
In-Reply-To: <503D57EF.2090402@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>

On 8/29/12, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 08/28/12 03:06, Tomasz Figa wrote:
>> The GPEx gpios are specific to Exynos4210 and do not exist on Exynos4x12.
>> Redefine them to use the exact SoC name.
>>
>> Based on "ARM: EXYYNOS: Use EXYNOS4210_GPEx instead of EXYNOS4_GPEx" by
>> Joonyoung Shim, see:
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2012-May/100738.html
>>
>> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
>> ---
>>   arch/arm/mach-exynos/include/mach/gpio.h   | 32
>> +++++++++++++++---------------
>>   arch/arm/mach-exynos/mach-nuri.c           | 16 +++++++--------
>>   arch/arm/mach-exynos/mach-origen.c         |  6 +++---
>>   arch/arm/mach-exynos/mach-trats.c          |  4 ++--
>>   arch/arm/mach-exynos/mach-universal_c210.c | 32
>> +++++++++++++++---------------
>>   arch/arm/mach-exynos/setup-fimc.c          |  4 ++--
>>   drivers/gpio/gpio-samsung.c                | 20 +++++++++----------
>>   7 files changed, 57 insertions(+), 57 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/include/mach/gpio.h
>> b/arch/arm/mach-exynos/include/mach/gpio.h
>> index eb24f1e..21c9bf1 100644
>> --- a/arch/arm/mach-exynos/include/mach/gpio.h
>> +++ b/arch/arm/mach-exynos/include/mach/gpio.h
>> @@ -26,11 +26,11 @@
>>   #define EXYNOS4_GPIO_C1_NR	(5)
>>   #define EXYNOS4_GPIO_D0_NR	(4)
>>   #define EXYNOS4_GPIO_D1_NR	(4)
>> -#define EXYNOS4_GPIO_E0_NR	(5)
>> -#define EXYNOS4_GPIO_E1_NR	(8)
>> -#define EXYNOS4_GPIO_E2_NR	(6)
>> -#define EXYNOS4_GPIO_E3_NR	(8)
>> -#define EXYNOS4_GPIO_E4_NR	(8)
>> +#define EXYNOS4210_GPIO_E0_NR	(5)
>> +#define EXYNOS4210_GPIO_E1_NR	(8)
>> +#define EXYNOS4210_GPIO_E2_NR	(6)
>> +#define EXYNOS4210_GPIO_E3_NR	(8)
>> +#define EXYNOS4210_GPIO_E4_NR	(8)
>
> Please see my comments on Joonyoung Shim's previous patch...
> http://lists.infradead.org/pipermail/linux-arm-kernel/2012-May/101522.html

It's perference issue. some person like this style. others doesn't.
Moreever vender, System LSI, provided codes have whole different style.
It lists up whole gpios for each SoCs.

EXYNOS4210_{A0, .... Z}
EXYNOS4412_{A0, .... V4}
EXYNOS5250_{A0, .... Z}

anyway, just remain it as broken, and try to use pinctl as Thomas mentioned.

Thank you,
Kyungmin Park

>
> [...]
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
