From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH 1/4] cpuidle: config: Add SOC_EXYNOS5420 entry to select
 cpuidle-big-little driver
Date: Wed, 23 Apr 2014 11:50:01 +0530
Message-ID: <CANuQgHHx+EyPXK0joYU-Af4dj+=ikW0SWE6g2-N0=K-dK3nMRw@mail.gmail.com>
References: <1398080958-21677-1-git-send-email-chander.kashyap@linaro.org>
	<1398080958-21677-2-git-send-email-chander.kashyap@linaro.org>
	<5356477C.1070403@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:40300 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751436AbaDWGUC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Apr 2014 02:20:02 -0400
Received: by mail-ob0-f172.google.com with SMTP id wo20so550877obc.31
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 23:20:01 -0700 (PDT)
In-Reply-To: <5356477C.1070403@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kukjin Kim <kgene.kim@samsung.com>, Chander Kashyap <k.chander@samsung.com>

Hi Daniel,

On 22 April 2014 16:12, Daniel Lezcano <daniel.lezcano@linaro.org> wrot=
e:
> On 04/21/2014 01:49 PM, Chander Kashyap wrote:
>>
>> Exynos5420 is a big-little SoC from Samsung. It has 4 A15 and 4 A7 c=
ores.
>> In order to use generic cpuidle-big-little driver, this patch adds
>> Exynos5420
>> specific check to initialize generic cpuidle driver.
>>
>> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
>> Signed-off-by: Chander Kashyap <k.chander@samsung.com>
>> ---
>>   drivers/cpuidle/Kconfig.arm |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.a=
rm
>> index 97ccc31..5244d87 100644
>> --- a/drivers/cpuidle/Kconfig.arm
>> +++ b/drivers/cpuidle/Kconfig.arm
>> @@ -4,7 +4,7 @@
>>
>>   config ARM_BIG_LITTLE_CPUIDLE
>>         bool "Support for ARM big.LITTLE processors"
>> -       depends on ARCH_VEXPRESS_TC2_PM
>> +       depends on ARCH_VEXPRESS_TC2_PM || SOC_EXYNOS5420
>
>
> For the sake of consistency, I would prefer:
>
> depends on ARCH_VEXPRESS_TC2_PM || ARCH_EXYNOS

Yes i will change it.

Thanks
>
> and let the current code (and future platform driver) to handle the l=
oading
> of the driver.
>
>
>>         select ARM_CPU_SUSPEND
>>         select CPU_IDLE_MULTIPLE_DRIVERS
>>         help
>>
>
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software f=
or ARM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>



--=20
with warm regards,
Chander Kashyap
