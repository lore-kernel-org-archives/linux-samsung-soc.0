From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: always enable PM domains support for EXYNOS4x12
Date: Mon, 19 Aug 2013 05:03:43 +0900
Message-ID: <5211289F.7000804@samsung.com>
References: <2897494.fSQeGUd9YR@amdc1032> <1427702.Wy3A0eELLT@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:59917 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752495Ab3HRUDq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Aug 2013 16:03:46 -0400
Received: by mail-pa0-f45.google.com with SMTP id bg4so3815265pad.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Aug 2013 13:03:45 -0700 (PDT)
In-Reply-To: <1427702.Wy3A0eELLT@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 08/09/13 23:53, Tomasz Figa wrote:
> Hi Bart,
>
> On Friday 09 of August 2013 13:56:05 Bartlomiej Zolnierkiewicz wrote:
>> Currently PM domains support will be enabled for EXYNOS4x12 SoCs
>> only if EXYNOS4210 SoC or EXYNOS5250 SoC support is also enabled.
>>
>> Fix it by explicitly selecting PM domains support (if PM support
>> is enabled) by SOC_EXYNOS4212 and SOC_EXYNOS4412 config options.
>>
>> Signed-off-by: Bartlomiej Zolnierkiewicz<b.zolnierkie@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> ---
>>   arch/arm/mach-exynos/Kconfig |    2 ++
>>   1 file changed, 2 insertions(+)
>>
>> Index: b/arch/arm/mach-exynos/Kconfig
>> ===================================================================
>> --- a/arch/arm/mach-exynos/Kconfig	2013-08-08 14:36:02.000000000 +0200
>> +++ b/arch/arm/mach-exynos/Kconfig	2013-08-08 14:38:48.967486318 +0200
>> @@ -52,6 +52,7 @@ config SOC_EXYNOS4212
>>   	depends on ARCH_EXYNOS4
>>   	select ARCH_HAS_BANDGAP
>>   	select PINCTRL_EXYNOS
>> +	select PM_GENERIC_DOMAINS if PM
>>   	select S5P_PM if PM
>>   	select S5P_SLEEP if PM
>>   	select SAMSUNG_DMADEV
>> @@ -64,6 +65,7 @@ config SOC_EXYNOS4412
>>   	depends on ARCH_EXYNOS4
>>   	select ARCH_HAS_BANDGAP
>>   	select PINCTRL_EXYNOS
>> +	select PM_GENERIC_DOMAINS if PM
>>   	select SAMSUNG_DMADEV
>>   	help
>>   	  Enable EXYNOS4412 SoC support
>
> Acked-by: Tomasz Figa<t.figa@samsung.com>
>
Applied, thanks.

- Kukjin
