From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v4 1/1] ARM: EXYNOS: Update CONFIG_ARCH_NR_GPIO for Exynos
Date: Wed, 24 Jul 2013 16:19:49 +0530
Message-ID: <CAK9yfHyMcyWJh6Jv0ZK1t=+hMhD44qE3WccaLnwFM=tK8ab6GQ@mail.gmail.com>
References: <1374655405-22998-1-git-send-email-sachin.kamat@linaro.org>
	<51EFB023.6090804@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:57705 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751029Ab3GXKtt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 06:49:49 -0400
Received: by mail-ob0-f174.google.com with SMTP id wd20so12591464obb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2013 03:49:49 -0700 (PDT)
In-Reply-To: <51EFB023.6090804@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene@kernel.org, kgene.kim@samsung.com, patches@linaro.org, Tomasz Figa <t.figa@samsung.com>

Hi Sylwester,

On 24 July 2013 16:14, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> Hi Sachin,
>
> On 07/24/2013 10:43 AM, Sachin Kamat wrote:
>> With the recent cleanup in Exynos platform code notably commits
>> 17859bec ("ARM: EXYNOS: Do not select legacy Kconfig symbols any
>> more") and b9222210 ("ARM: EXYNOS: Remove mach/gpio.h"), the definition
>> of ARCH_NR_GPIOS got removed. This started causing problems on SoCs like
>> Exynos4412 which have more than the default number of GPIOs. Thus define
>> this number in KConfig file which takes care of current SoC requirements
>> and provides scope for GPIO expanders. Without this patch we get the
>> following errors during boot:
>>
>> gpiochip_add: gpios 251..258 (gpv0) failed to register
>> samsung-pinctrl 106e0000.pinctrl: failed to register gpio_chip gpv0,
>> error code: -22
>> samsung-pinctrl: probe of 106e0000.pinctrl failed with error -22
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> Cc: Tomasz Figa <t.figa@samsung.com>
>> ---
>> Changes since v3:
>> Rearranged different default values in single line.
>> ---
>>  arch/arm/Kconfig |    3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index f8fb910..ac9fa38 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -1590,8 +1590,7 @@ config ARM_PSCI
>>  config ARCH_NR_GPIO
>>       int
>>       default 1024 if ARCH_SHMOBILE || ARCH_TEGRA
>> -     default 512 if SOC_OMAP5
>> -     default 512 if ARCH_KEYSTONE
>> +     default 512 if ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5
>
> Sorry, 512 seems a bit too generous to me. Also I would rather
> leave each SOC/ARCH on a separate line.

Even I had left it that way earlier. However Kukjin suggested the
above (single line).
I feel it is more of individual preference.

>
> Almost half of those 512 entries would have been unused in most
> cases. How about, e.g. 352 ? If anyone finds this value too low
> they could always submit a patch like this one. IMHO with 352 or
> 392 there would be sufficient margin.

I agree. Again, I do not have any reservations here. I just went with
maintainer's choice which was a superset of your and Tomasz's
suggestions :)

-- 
With warm regards,
Sachin
