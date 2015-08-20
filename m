From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 2/5] ARM: EXYNOS: Remove SROM related register settings
 from mach-exynos
Date: Thu, 20 Aug 2015 17:06:49 +0530
Message-ID: <55D5BBD1.1030905@samsung.com>
References: <1430296712-10287-1-git-send-email-pankaj.dubey@samsung.com>
 <1430296712-10287-3-git-send-email-pankaj.dubey@samsung.com>
 <5565B0D1.80004@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45033 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751271AbbHTLg5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Aug 2015 07:36:57 -0400
In-reply-to: <5565B0D1.80004@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: thomas.ab@samsung.com, kgene@kernel.org, linux@arm.linux.org.uk, heiko@sntech.de

Hi Krzysztof,

On Wednesday 27 May 2015 05:26 PM, Krzysztof Kozlowski wrote:
> W dniu 29.04.2015 o 17:38, Pankaj Dubey pisze:
>> As now we have dedicated driver for SROM controller, it will take care
>> of saving register banks during S2R so we can safely remove these
>> settings from mach-exynos.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   arch/arm/mach-exynos/Kconfig                   |  2 +
>>   arch/arm/mach-exynos/exynos.c                  | 10 -----
>>   arch/arm/mach-exynos/include/mach/map.h        |  3 --
>>   arch/arm/mach-exynos/suspend.c                 | 20 +---------
>>   arch/arm/plat-samsung/include/plat/map-s5p.h   |  1 -
>>   arch/arm/plat-samsung/include/plat/regs-srom.h | 54 --------------------------
>>   6 files changed, 4 insertions(+), 86 deletions(-)
>>   delete mode 100644 arch/arm/plat-samsung/include/plat/regs-srom.h
>>
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>> index 603820e..e842b23 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -25,6 +25,8 @@ menuconfig ARCH_EXYNOS
>>   	select S5P_DEV_MFC
>>   	select SRAM
>>   	select MFD_SYSCON
>> +	select SOC_SAMSUNG
>> +	select EXYNOS_SROM
>
> What about the difference of execution time? The suspend/resume of
> device may not be called in the same time as previous syscore ops. Does
> this have any impact?
>


I had tested it for S2R at that time on SMDK5250 board and it was fine. 
I do not noticed any issue in S2R, so I feel timing should not have any 
impact.

Thanks,
Pankaj Dubey

> Best regards,
> Krzysztof
>
>
