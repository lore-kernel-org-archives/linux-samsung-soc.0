From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: ARM: dts: exynos: Properly select eMMC HighSpeed mode
Date: Fri, 15 Jul 2016 09:36:30 +0200
Message-ID: <5788927E.2050803@samsung.com>
References: <1468500458-7142-1-git-send-email-k.kozlowski@samsung.com>
 <578857FD.7030601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:8726 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751229AbcGOHge (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2016 03:36:34 -0400
In-reply-to: <578857FD.7030601@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 07/15/2016 05:26 AM, Alim Akhtar wrote:
> Hi Krzysztof,
> 
> On 07/14/2016 06:17 PM, Krzysztof Kozlowski wrote:
>> Exynos5410 supports eMMC version 4.41 so HS200 is the top mode which
>> should be configured.  This is reflected in usage of
>> "samsung,exynos5250-dw-mshc" compatible.  However DTS contained also
>> property "mmc-hs400-1_8v" which is parsed by MMC core therefore
>> resulting in mixed configuration.  MMC core set HS400 but dwmmc_exynos
>> driver did not configure the data strobe for HS400 DDR mode.
>>
>> Removal of HS400 properties fixes semi-random mmc errors during boot:
>>    mmc_host mmc0: Bus speed (slot 0) = 400000000Hz (slot req
>> 200000000Hz, actual 200000000HZ div = 1)
>>    mmc0: mmc_select_hs400 failed, error -84
>>    mmc0: error -84 whilst initialising MMC card
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos5410-odroidxu.dts | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts
>> b/arch/arm/boot/dts/exynos5410-odroidxu.dts
>> index d9499310a301..7536164438ca 100644
>> --- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
>> +++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
>> @@ -447,14 +447,12 @@
>>       samsung,dw-mshc-ciu-div = <3>;
>>       samsung,dw-mshc-sdr-timing = <0 4>;
>>       samsung,dw-mshc-ddr-timing = <0 2>;
>> -    samsung,dw-mshc-hs400-timing = <0 2>;
> not sure but can we use /delete-property/ option for this removable?

No need for this. This property is set only here - in Odroid XU DTS.

>>       samsung,read-strobe-delay = <90>;
> this also need to be removed.

Ah, right, thanks!

>>       pinctrl-names = "default";
>>       pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8
>> &sd0_cd>;
>>       bus-width = <8>;
>>       cap-mmc-highspeed;
>>       mmc-hs200-1_8v;
>> -    mmc-hs400-1_8v;
> same as above if possible use /delete-property/

Same, no need because this does not come from other DTS/DTSI.

>>       vmmc-supply = <&ldo20_reg>;
>>       vqmmc-supply = <&ldo11_reg>;
>>   };
>>
> 

Best regards,
Krzysztof
