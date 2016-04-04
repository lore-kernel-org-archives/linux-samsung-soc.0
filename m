From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH] ARM: dts: exynos-5422-odroid: Add eMMC and SD regulator
 supplies
Date: Mon, 4 Apr 2016 10:35:18 +0200
Message-ID: <57022746.6050700@fivetechno.de>
References: <56FE7AC4.4090508@fivetechno.de> <5701B53B.8000703@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:54715 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753810AbcDDIfY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2016 04:35:24 -0400
In-Reply-To: <5701B53B.8000703@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Krzysztof,

Am 04.04.2016 um 02:28 schrieb Krzysztof Kozlowski:
> On 01.04.2016 22:42, Markus Reichl wrote:
>> Add vmmc and vqmmc supplies from MF circuit sheets for eMMC and SD on
>> odroid XU3 and XU4 to avoid warnings in dmesg output.
> 
> What warnings?

[    1.843689] dwmmc_exynos 12200000.mmc: Looking up vmmc-supply property in node /mmc@12200000 failed
[    1.843773] dwmmc_exynos 12200000.mmc: Looking up vqmmc-supply property in node /mmc@12200000 failed
[    1.912340] dwmmc_exynos 12220000.mmc: Looking up vmmc-supply property in node /mmc@12220000 failed
[    1.912410] dwmmc_exynos 12220000.mmc: Looking up vqmmc-supply property in node /mmc@12220000 failed

> 
>>
>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>> ---
>>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> index 1bd507b..eec425a 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
>> @@ -121,7 +121,7 @@
>>                         };
>>  
>>                         ldo3_reg: LDO3 {
>> -                               regulator-name = "vdd_ldo3";
>> +                               regulator-name = "vddq_mmc0";
>>                                 regulator-min-microvolt = <1800000>;
>>                                 regulator-max-microvolt = <1800000>;
>>                                 regulator-always-on;
>> @@ -184,7 +184,7 @@
>>                         };
>>  
>>                         ldo13_reg: LDO13 {
>> -                               regulator-name = "vdd_ldo13";
>> +                               regulator-name = "vddq_mmc2";
>>                                 regulator-min-microvolt = <2800000>;
>>                                 regulator-max-microvolt = <2800000>;
>>                                 regulator-always-on;
>> @@ -211,6 +211,13 @@
>>                                 regulator-always-on;
>>                         };
>>  
>> +                       ldo18_reg: LDO18 {
>> +                               regulator-name = "vdd_emmc_1V8";
>> +                               regulator-min-microvolt = <1800000>;
>> +                               regulator-max-microvolt = <1800000>;
>> +                               regulator-always-on;
> 
> In the same patchset you add always-on and remove. What is the point of
> this juggle?

I will squash the two patches together in one.

> 
> Best regards,
> Krzysztof
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Servus,
--
Markus Reichl
