From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V5 18/20] ARM: exynos: cpuidle: Pass the AFTR callback to
 the platform_data
Date: Fri, 09 May 2014 14:02:14 +0200
Message-ID: <536CC3C6.6070804@samsung.com>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
 <1397212815-16068-19-git-send-email-daniel.lezcano@linaro.org>
 <201405091256.54755.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60442 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751142AbaEIMCT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 08:02:19 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5B00AC82RHRZ60@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 May 2014 13:02:05 +0100 (BST)
In-reply-to: <201405091256.54755.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, rjw@rjwysocki.net, linaro-kernel@lists.linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Grant Likely <grant.likely@secretlab.ca>

Hi Arnd,

On 09.05.2014 12:56, Arnd Bergmann wrote:
> On Friday 11 April 2014, Daniel Lezcano wrote:
>> No more dependency on the arch code. The platform_data field is used to set the
>> PM callback as the other cpuidle drivers.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 
> This has just shown up in linux-next and broken randconfig builds.
> 
>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
>> index fe8dac8..d22f0e4 100644
>> --- a/arch/arm/mach-exynos/exynos.c
>> +++ b/arch/arm/mach-exynos/exynos.c
>> @@ -221,8 +221,9 @@ void exynos_restart(enum reboot_mode mode, const char *cmd)
>>  }
>>  
>>  static struct platform_device exynos_cpuidle = {
>> -       .name           = "exynos_cpuidle",
>> -       .id             = -1,
>> +       .name              = "exynos_cpuidle",
>> +       .dev.platform_data = exynos_enter_aftr,
>> +       .id                = -1,
>>  };
>>  
> 
> This is wrong on many levels, can we please do this properly?
> 
> * The exynos_enter_aftr function is compiled conditionally, so you can't just
>   reference it from generic code, or you get a link error.

+1

> * 'static struct platform_device ...' has been deprecated for at least a decade,
>   stop doing that. For any platform devices that get registered, there is
>   platform_device_register_simple().

+0.5

The missing 0.5 is because you can't pass platform data using
platform_device_register_simple(). There is
platform_device_register_resndata(), though.

> * There shouldn't need to be a platform_device to start with, this should all
>   come from DT. We can't do this on arm64 anyway, so any code that may be
>   shared between arm32 and arm64 should have proper abstractions.

-1

Exynos cpuidle is not a device on the SoC, so I don't think there is any
way to represent it in DT. The only thing I could see this is matching
root node with a central SoC driver that instantiates specific
subdevices, such as cpufreq and cpuidle, but I don't see any available
infrastructure for this.

Best regards,
Tomasz
