From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Fix a config option
Date: Tue, 4 Mar 2014 17:53:36 +0530
Message-ID: <CAK9yfHyumQ8=6SPd2urZxa=jZngdn5HjrfJpJWmnADUSHVBaKw@mail.gmail.com>
References: <1388140690-30668-1-git-send-email-sachin.kamat@linaro.org>
	<530A907D.6080901@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:54245 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756976AbaCDMXh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Mar 2014 07:23:37 -0500
Received: by mail-oa0-f45.google.com with SMTP id o6so2855559oag.32
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2014 04:23:36 -0800 (PST)
In-Reply-To: <530A907D.6080901@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 24 February 2014 05:51, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 12/27/13 19:38, Sachin Kamat wrote:
>>
>> CONFIG_MACH_EXYNOS4_DT does not exist. Use ARCH_EXYNOS4 instead.
>>
>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>> ---
>>   arch/arm/configs/exynos_defconfig |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/configs/exynos_defconfig
>> b/arch/arm/configs/exynos_defconfig
>> index dbe1f1c47bb0..dff01ecf78cc 100644
>> --- a/arch/arm/configs/exynos_defconfig
>> +++ b/arch/arm/configs/exynos_defconfig
>> @@ -10,8 +10,8 @@ CONFIG_PARTITION_ADVANCED=y
>>   CONFIG_ARCH_EXYNOS=y
>>   CONFIG_S3C_LOWLEVEL_UART_PORT=3
>>   CONFIG_S3C24XX_PWM=y
>> +CONFIG_ARCH_EXYNOS4=y
>>   CONFIG_ARCH_EXYNOS5=y
>> -CONFIG_MACH_EXYNOS4_DT=y
>>   CONFIG_SMP=y
>>   CONFIG_NR_CPUS=8
>>   CONFIG_PREEMPT=y
>
>
> Well, this is not required because it should be fine without this change.
> ARCH_EXYNOS4 will be selected when ARCH_EXYNOS is enabled and non-exist
> CONFIG (MACH_EXYNOS4_DT) will be ignored.

Functionally this might not be needed as Exynos4 is selected by
default. However, I don't see
any point in retaining non-existent symbols.

-- 
With warm regards,
Sachin
