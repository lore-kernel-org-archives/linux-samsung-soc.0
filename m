From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 5/5] ARM: exynos: select POWER_RESET_SYSCON and
 POWER_RESET_SYSCON_POWEROFF
Date: Wed, 02 Dec 2015 14:21:47 +0900
Message-ID: <565E7FEB.3040806@samsung.com>
References: <1447996629-18232-1-git-send-email-alim.akhtar@samsung.com>
 <1447996629-18232-6-git-send-email-alim.akhtar@samsung.com>
 <010401d12c17$1e883d10$5b98b730$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:64597 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751002AbbLBFVv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Dec 2015 00:21:51 -0500
In-reply-to: <010401d12c17$1e883d10$5b98b730$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, 'Alim Akhtar' <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m.reichl@fivetechno.de, tjakobi@math.uni-bielefeld.de, ulf.hansson@linaro.org

On 01.12.2015 18:03, Pavel Fedin wrote:
>  Hello!
> 
> Tested it on top of 4.4-rc3.
>  
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>> index 3a10f1a8317a..d279edf9b10d 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -27,6 +27,9 @@ menuconfig ARCH_EXYNOS
>>  	select SRAM
>>  	select THERMAL
>>  	select MFD_SYSCON
>> +	select POWER_RESET
>> +	select POWER_RESET_SYSCON
>> +	select POWER_RESET_SYSCON_POWEROFF
> 
> "select POWER_SUPPLY" is missing here. Without is we get:
> --- cut ---
> warning: (ARCH_HISI && ARCH_INTEGRATOR && ARCH_EXYNOS && ARCH_VEXPRESS && REALVIEW_DT) selects POWER_RESET which has unmet direct
> dependencies (POWER_SUPPLY)
> warning: (ARCH_EXYNOS) selects POWER_RESET_SYSCON which has unmet direct dependencies (POWER_SUPPLY && POWER_RESET && OF)
> warning: (ARCH_EXYNOS) selects POWER_RESET_SYSCON_POWEROFF which has unmet direct dependencies (POWER_SUPPLY && POWER_RESET && OF)
> --- cut ---
> 
>>  	help
>>  	  Support for SAMSUNG EXYNOS SoCs (EXYNOS4/5)
> 
>  Otherwise works fine.
> 
>  Tested-by: Pavel Fedin <p.fedin@samsung.com>

Testing was a little bit too late (late not only looking at date of v1
and v2 but even for v3)... I appreciate it but I applied it already and
in fact I sent a pull request with it.

Actually the proper fix I think is to remove the dependency between
POWER_RESET and POWER_SUPPLY.

Best regards,
Krzysztof
