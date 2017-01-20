From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos: Fix i2s0 pins pull control for
 Exynos5433 SoCs
Date: Fri, 20 Jan 2017 07:51:43 +0100
Message-ID: <574663bb-0b6d-c6d0-fa03-28219eea3f1f@samsung.com>
References: <CGME20170119135856eucas1p149239f274848d61b9aa785e8497d957a@eucas1p1.samsung.com>
 <1484834310-21173-1-git-send-email-m.szyprowski@samsung.com>
 <20170119203509.4uoh45kwthi7o3wb@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:55574 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751260AbdATGwk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 01:52:40 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OK200DDRGEAJY40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jan 2017 06:51:46 +0000 (GMT)
In-reply-to: <20170119203509.4uoh45kwthi7o3wb@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Krzysztof,

On 2017-01-19 21:35, Krzysztof Kozlowski wrote:
> On Thu, Jan 19, 2017 at 02:58:30PM +0100, Marek Szyprowski wrote:
>> Common definition for I2S0 bus should not define any pull control for
>> the individual I2S pins. Correct this by changing samsung,pin-pud property
>> to EXYNOS_PIN_PULL_NONE like it is used for other Exynos SoCs.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
> Makes sense. Two questions here:
> 1. The same for pcm0_bus?

Right, and for I2S1, PMC1 and SPDIF. I will send a new patch.

> 2. This will affect the specific boards: TM2s. Do they need pull down or
>     in fact you wanted to fix them as well? Usage of words "common
>     definition" suggests the board might be different and in fact you are
>     changing the board now.

I've check, audio on TM2 works fine without this pull down. I wrote 'common'
because all other Exynos SoCs define audio pins without pull down. If pull
down would be really needed for some reasons on TM2, I would override pull
control in tm2.dts

>
> Best regards,
> Krzysztof
>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
>> index d49879bd34bb..2171ff965212 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi
>> @@ -135,7 +135,7 @@
>>   		samsung,pins = "gpz0-0", "gpz0-1", "gpz0-2", "gpz0-3",
>>   				"gpz0-4", "gpz0-5", "gpz0-6";
>>   		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
>> -		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
>> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>>   		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR1>;
>>   	};
>>   
>> -- 
>> 1.9.1
>>
>
>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
