From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 3/3] ARM: EXYNOS: cleanup header files inclusion
Date: Tue, 23 Feb 2016 14:47:33 +0530
Message-ID: <56CC23AD.10103@samsung.com>
References: <1456135396-17767-1-git-send-email-pankaj.dubey@samsung.com>
 <1456135396-17767-4-git-send-email-pankaj.dubey@samsung.com>
 <56CBA32D.4020905@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57211 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751198AbcBWJQL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Feb 2016 04:16:11 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O2Z015BFTQX5AC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Feb 2016 18:16:09 +0900 (KST)
In-reply-to: <56CBA32D.4020905@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, b.zolnierkie@samsung.com, daniel.lezcano@linaro.org, thomas.ab@samsung.com, linux@arm.linux.org.uk

Hi Krzysztof,

On Tuesday 23 February 2016 05:39 AM, Krzysztof Kozlowski wrote:
> On 22.02.2016 19:03, Pankaj Dubey wrote:
>> This includes trivial cleanup in exynos files such as
>>     - remove unused header files inclusion from exynos.c, s5p-dev-mfc.c,
>>       firmware.c, pm.c.
>>     - move inclusion of of.h from common.h to pm.c where it is really
>>       required
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>  arch/arm/mach-exynos/common.h      | 1 -
>>  arch/arm/mach-exynos/exynos.c      | 5 -----
>>  arch/arm/mach-exynos/firmware.c    | 2 --
>>  arch/arm/mach-exynos/platsmp.c     | 1 -
>>  arch/arm/mach-exynos/pm.c          | 4 +---
>>  arch/arm/mach-exynos/s5p-dev-mfc.c | 1 -
>>  6 files changed, 1 insertion(+), 13 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
>> index e349a03..5365bf1 100644
>> --- a/arch/arm/mach-exynos/common.h
>> +++ b/arch/arm/mach-exynos/common.h
>> @@ -12,7 +12,6 @@
>>  #ifndef __ARCH_ARM_MACH_EXYNOS_COMMON_H
>>  #define __ARCH_ARM_MACH_EXYNOS_COMMON_H
>>  
>> -#include <linux/of.h>
>>  #include <linux/platform_data/cpuidle-exynos.h>
>>  
>>  #define EXYNOS3250_SOC_ID	0xE3472000
>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
>> index 99947ad..54262a1 100644
>> --- a/arch/arm/mach-exynos/exynos.c
>> +++ b/arch/arm/mach-exynos/exynos.c
>> @@ -11,14 +11,10 @@
>>  
>>  #include <linux/init.h>
>>  #include <linux/io.h>
>> -#include <linux/kernel.h>
>> -#include <linux/serial_s3c.h>
>>  #include <linux/of.h>
>>  #include <linux/of_address.h>
>>  #include <linux/of_fdt.h>
>>  #include <linux/of_platform.h>
>> -#include <linux/platform_device.h>
> 
> platform_device is actually used in that file. It looks unused because
> it is pulled by of_platform, but it makes sense to include it here.
>
Thanks for review.

Well I tried to grep for of_platform.h and platform_device.h in
arch/arm/ and out of 88 files including of_platform.h only 16 files are
including platform_device.h also. So majority do not include both of
them even do they need. So majority of files both are not included. So
If we got with majority it's not required. What's your opinion?

Thanks,
Pankaj Dubey

> Rest looks good.
> 

> BR,
> Krzysztof
> 
> 
