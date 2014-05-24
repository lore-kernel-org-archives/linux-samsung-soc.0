From: Tarek Dakhran <t.dakhran@samsung.com>
Subject: Re: [PATCH v10 1/3] ARM: EXYNOS: Add support for EXYNOS5410 SoC
Date: Sat, 24 May 2014 13:33:13 +0400
Message-ID: <53806759.40908@samsung.com>
References: <1400841343-6016-1-git-send-email-t.dakhran@samsung.com>
 <1400841343-6016-2-git-send-email-t.dakhran@samsung.com>
 <537FB995.5070604@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <537FB995.5070604@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Romain Naour <romain.naour@openwide.fr>, Chander Kashyap <chander.kashyap@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz

I faced another problem, while changing this patch.
See below.

On 05/24/2014 01:11 AM, Tomasz Figa wrote:
> Hi Tarek,
>
> With v2 of the series I mentioned in review of previous version [1],
> this patch can be skipped.
>
> [1] http://www.spinics.net/lists/linux-samsung-soc/msg31258.html
>
> Best regards,
> Tomasz
>
> On 23.05.2014 12:35, Tarek Dakhran wrote:
>> EXYNOS5410 is SoC in Samsung's Exynos5 SoC series.
>> Add initial support for this SoC.
>>
>> Signed-off-by: Tarek Dakhran <t.dakhran@samsung.com>
>> Signed-off-by: Vyacheslav Tyrtov <v.tyrtov@samsung.com>
>> ---
>>   arch/arm/mach-exynos/Kconfig    |    8 ++++++++
>>   arch/arm/mach-exynos/common.h   |   11 ++++++++++-
>>   arch/arm/mach-exynos/firmware.c |    2 +-
>>   3 files changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>> index 1602abc..79a3e85 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -84,6 +84,14 @@ config SOC_EXYNOS5250
>>   	help
>>   	  Enable EXYNOS5250 SoC support
>>   
>> +config SOC_EXYNOS5410
>> +	bool "SAMSUNG EXYNOS5410"
>> +	default y
>> +	depends on ARCH_EXYNOS5
>> +	select PM_GENERIC_DOMAINS if PM_RUNTIME
>> +	help
>> +	  Enable EXYNOS5410 SoC support
>> +
>>   config SOC_EXYNOS5420
>>   	bool "SAMSUNG EXYNOS5420"
>>   	default y
>> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
>> index e2d0954..d64c6de 100644
>> --- a/arch/arm/mach-exynos/common.h
>> +++ b/arch/arm/mach-exynos/common.h
>> @@ -21,6 +21,7 @@
>>   #define EXYNOS4_CPU_MASK	0xFFFE0000
>>   
>>   #define EXYNOS5250_SOC_ID	0x43520000
>> +#define EXYNOS5410_SOC_ID	0xE5410000
>>   #define EXYNOS5420_SOC_ID	0xE5420000
>>   #define EXYNOS5440_SOC_ID	0xE5440000
>>   #define EXYNOS5_SOC_MASK	0xFFFFF000
>> @@ -37,6 +38,7 @@ IS_SAMSUNG_CPU(exynos4210, EXYNOS4210_CPU_ID, EXYNOS4_CPU_MASK)
>>   IS_SAMSUNG_CPU(exynos4212, EXYNOS4212_CPU_ID, EXYNOS4_CPU_MASK)
>>   IS_SAMSUNG_CPU(exynos4412, EXYNOS4412_CPU_ID, EXYNOS4_CPU_MASK)
>>   IS_SAMSUNG_CPU(exynos5250, EXYNOS5250_SOC_ID, EXYNOS5_SOC_MASK)
>> +IS_SAMSUNG_CPU(exynos5410, EXYNOS5410_SOC_ID, EXYNOS5_SOC_MASK)
>>   IS_SAMSUNG_CPU(exynos5420, EXYNOS5420_SOC_ID, EXYNOS5_SOC_MASK)
>>   IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
>>   
>> @@ -68,6 +70,12 @@ IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
>>   # define soc_is_exynos5250()	0
>>   #endif
>>   
>> +#if defined(CONFIG_SOC_EXYNOS5410)
>> +# define soc_is_exynos5410()	is_samsung_exynos5410()
>> +#else
>> +# define soc_is_exynos5410()	0
>> +#endif
>> +
>>   #if defined(CONFIG_SOC_EXYNOS5420)
>>   # define soc_is_exynos5420()	is_samsung_exynos5420()
>>   #else
>> @@ -82,7 +90,8 @@ IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
>>   
>>   #define soc_is_exynos4() (soc_is_exynos4210() || soc_is_exynos4212() || \
>>   			  soc_is_exynos4412())
>> -#define soc_is_exynos5() (soc_is_exynos5250() || soc_is_exynos5420())
>> +#define soc_is_exynos5() (soc_is_exynos5250() || soc_is_exynos5410() || \
>> +			  soc_is_exynos5420())
>>   
This is the place where we need it.
Or this macro should be changed (maybe read compatible property from dt).

-- 
Best regards,
     Tarek Dakhran

