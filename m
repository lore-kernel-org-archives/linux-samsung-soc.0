From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] FIX:cache:exynos: Execute the cache reconfiguration unconditionally
 for Exynos4
Date: Thu, 15 May 2014 23:02:42 +0200
Message-ID: <53752B72.40308@gmail.com>
References: <1400153646-827-1-git-send-email-l.majewski@samsung.com> <537529CE.5030803@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:64750 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751249AbaEOVCz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 17:02:55 -0400
Received: by mail-ee0-f44.google.com with SMTP id c41so986198eek.31
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2014 14:02:53 -0700 (PDT)
In-Reply-To: <537529CE.5030803@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lukasz Majewski <l.majewski@majess.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>, Kevin Hilman <khilman@linaro.org>, 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 15.05.2014 22:55, Kukjin Kim wrote:
> On 05/15/14 20:34, Lukasz Majewski wrote:
>> The commit 2bf73dd61a84cdf27e49f48e08739af6ba70ace1 has made the cache
>> configuration depending on definition of CONFIG_S5P_SLEEP Kconfig flag.
>> It is enabled on various S5PV210 incarnations and not available at
>> Exynos4
>> family of SoCs.
>>
>> The problem emerges when one wants to disable/enable core via hotplug
>> - e.g:
>> echo 0>  /sys/devices/system/cpu/cpu1/online.
>> When CONFIG_CPU_IDLE is enabled (it is not enabled at default
>> exynos_defconfig).
>>
>> On Exynos4 based targets (Exynos4412 and Exynos4210, namely trats2 and
>> trats) board locks up and consumes considerable power.
>>
>> This patch does nothing more than restoration of the state before the
>> offending commit.
>>
>> Tested on top of next-20140514 at Trats board.
>>
>> Signed-off-by: Lukasz Majewski<l.majewski@samsung.com>
>> ---
>>   arch/arm/mach-exynos/exynos.c |    7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/exynos.c
>> b/arch/arm/mach-exynos/exynos.c
>> index 1b97b93..5c8b334 100644
>> --- a/arch/arm/mach-exynos/exynos.c
>> +++ b/arch/arm/mach-exynos/exynos.c
>> @@ -254,10 +254,9 @@ static int __init exynos4_l2x0_cache_init(void)
>>       if (ret)
>>           return ret;
>>
>> -    if (IS_ENABLED(CONFIG_S5P_SLEEP)) {
>> -        l2x0_regs_phys = virt_to_phys(&l2x0_saved_regs);
>> -        clean_dcache_area(&l2x0_regs_phys, sizeof(unsigned long));
>> -    }
> 
> Hmm...should be PM_SLEEP instead of removing check the S5P_SLEEP. This
> is missed when we stopped to use legacy Samsung PM(commit ID d710aa31)

Yes, should be. I have already discussed this with Lukasz and he was
supposed to send next version.

Best regards,
Tomasz
