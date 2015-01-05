From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: do not try to map PMU for exynos5440
Date: Mon, 05 Jan 2015 15:36:44 +0530
Message-ID: <54AA6234.400@samsung.com>
References: <1420449268-24707-1-git-send-email-pankaj.dubey@samsung.com>
 <1420451533.15910.19.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64262 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751227AbbAEKG0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jan 2015 05:06:26 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NHP006UK82PQS20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Jan 2015 19:06:25 +0900 (KST)
In-reply-to: <1420451533.15910.19.camel@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene@kernel.org, thomas.ab@samsung.com

Hi,

On Monday 05 January 2015 03:22 PM, Sjoerd Simons wrote:
> On Mon, 2015-01-05 at 14:44 +0530, Pankaj Dubey wrote:
>> Commit id: 2e94ac42898f84d76e3c21dd91bc is not taking care
>> of mapping of exynos5440 PMU register which will result in kernel panic
>> on exynos5440.
>>
>> As exynos5440 DTS does not have PMU node, and also we are skipping
>> exynos_pm_init in case of exynos5440, let's avoid mapping of exynos5440 PMU.
>
>
>> Reported-by: Ming Lei <tom.leiming@gmail.com>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   arch/arm/mach-exynos/exynos.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
>> index c13d083..1891b8c 100644
>> --- a/arch/arm/mach-exynos/exynos.c
>> +++ b/arch/arm/mach-exynos/exynos.c
>> @@ -208,7 +208,8 @@ static void __init exynos_init_irq(void)
>>   	 * DT is not unflatten so we can't use DT APIs before
>>   	 * init_irq
>>   	 */
>> -	exynos_map_pmu();
>> +	if (!of_machine_is_compatible("samsung,exynos5440"))
>> +		exynos_map_pmu();
>>   }
>>
>>   static void __init exynos_dt_machine_init(void)
>
> Why the blacklist approach rather then simply making exynos_map_pmu exit
> rather then panicing if it couldn't find a pmu node in the dts?
>

exynos_map_pmu is panicking if it fails to iomap PMU, as for most of 
exynos SoCs PMU based address is MUST for secondary core bootup in 
platsmp.c, but with exynos5440 it is not the same case. In-fact 
exynos_pm_init is also bypassed for exynos5440. For the same reason I 
adopted this approach rather removing panic from exynos_map_pmu.

Thanks,
Pankaj Dubey
>
