From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V5 18/20] ARM: exynos: cpuidle: Pass the AFTR callback to
 the platform_data
Date: Thu, 15 May 2014 16:07:48 +0200
Message-ID: <5374CA34.1030405@samsung.com>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org>
 <1397212815-16068-19-git-send-email-daniel.lezcano@linaro.org>
 <201405091256.54755.arnd@arndb.de> <536CC3C6.6070804@samsung.com>
 <5370E648.10006@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:52774 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753002AbaEOOH4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 10:07:56 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5M00HEGCL59GA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 May 2014 15:07:53 +0100 (BST)
In-reply-to: <5370E648.10006@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, rjw@rjwysocki.net, linaro-kernel@lists.linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Grant Likely <grant.likely@secretlab.ca>

Arnd, Kukjin, Daniel,

On 12.05.2014 17:18, Daniel Lezcano wrote:
> On 05/09/2014 02:02 PM, Tomasz Figa wrote:
>> Hi Arnd,
>>
>> On 09.05.2014 12:56, Arnd Bergmann wrote:
>>> On Friday 11 April 2014, Daniel Lezcano wrote:
>>>> No more dependency on the arch code. The platform_data field is used to set the
>>>> PM callback as the other cpuidle drivers.
>>>>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
>>>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>>>
>>> This has just shown up in linux-next and broken randconfig builds.
>>>
>>>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
>>>> index fe8dac8..d22f0e4 100644
>>>> --- a/arch/arm/mach-exynos/exynos.c
>>>> +++ b/arch/arm/mach-exynos/exynos.c
>>>> @@ -221,8 +221,9 @@ void exynos_restart(enum reboot_mode mode, const char *cmd)
>>>>   }
>>>>
>>>>   static struct platform_device exynos_cpuidle = {
>>>> -       .name           = "exynos_cpuidle",
>>>> -       .id             = -1,
>>>> +       .name              = "exynos_cpuidle",
>>>> +       .dev.platform_data = exynos_enter_aftr,
>>>> +       .id                = -1,
>>>>   };
>>>>
>>>
>>> This is wrong on many levels, can we please do this properly?
>>>
>>> * The exynos_enter_aftr function is compiled conditionally, so you can't just
>>>    reference it from generic code, or you get a link error.
>>
>> +1
> 
> That is true but still we have a link error without this patch. We 
> shouldn't register and declare this structure if CONFIG_PM / 
> CONFIG_CPU_IDLE are not set.
> 
>>> * 'static struct platform_device ...' has been deprecated for at least a decade,
>>>    stop doing that. For any platform devices that get registered, there is
>>>    platform_device_register_simple().
>>
>> +0.5
>>
>> The missing 0.5 is because you can't pass platform data using
>> platform_device_register_simple(). There is
>> platform_device_register_resndata(), though.
>>
>>> * There shouldn't need to be a platform_device to start with, this should all
>>>    come from DT. We can't do this on arm64 anyway, so any code that may be
>>>    shared between arm32 and arm64 should have proper abstractions.
>>
>> -1
>>
>> Exynos cpuidle is not a device on the SoC, so I don't think there is any
>> way to represent it in DT. The only thing I could see this is matching
>> root node with a central SoC driver that instantiates specific
>> subdevices, such as cpufreq and cpuidle, but I don't see any available
>> infrastructure for this.
> 
> There is a RFC for defining generic idle states [1].
> 
> The idea behind using the platform driver framework is to unify the code 
> across the different drivers and separate the PM / cpuidle code.
> 
> By this way, we can move the different drivers to drivers/cpuidle and 
> store them in a single place. That make easier the tracking, the review 
> and the maintenance.
> 
> I am ok to by using platform_device_register_resndata() but I would 
> prefer to do that a bit later by converting the other drivers too. That 
> will be easier if we have them grouped in a single directory (this is 
> what does this patchset at the end).
> 
> As there are some more work based on this patchset and the link error 
> could be fixed as an independent patch, I would recommend to 
> re-integrate it in the tree as asked by Bartlomiej.

In general, it would be nice to have everything done properly, but I'd
consider Daniel's series as a huge improvement already and a nice
intermediate step towards further clean-up.

So based on the comments quoted above, instead of stalling the
development, I'd suggest to accept this series and then move forward.

Best regards,
Tomasz
