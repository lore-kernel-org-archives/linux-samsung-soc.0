From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH] ARM: dts: exynos4412-odroid: add 'rtc_src' clock to rtc
 node
Date: Fri, 20 Mar 2015 09:56:33 +0100
Message-ID: <550BE0C1.4020500@collabora.co.uk>
References: <1426814952-13458-1-git-send-email-tjakobi@math.uni-bielefeld.de> <550B7A2C.4070403@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:57659 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751392AbbCTI4i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Mar 2015 04:56:38 -0400
In-Reply-To: <550B7A2C.4070403@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, m.reichl@fivetechno.de

Hello,

On 03/20/2015 02:38 AM, Chanwoo Choi wrote:
> On 03/20/2015 10:29 AM, Tobias Jakobi wrote:
>> From: Markus Reichl <m.reichl@fivetechno.de>
>> 
>> The Exynos4412 SoC has a s3c6410 RTC where the source clock
>> is now a mandatory property.
>> 
>> This patch fixes probe failure of s3c-rtc on Odroid-X2/U2/U3 boards.
>> 
>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>> Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> index 1ff4c88..0a8e6aa4 100644
>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> @@ -9,6 +9,7 @@
>>  
>>  #include <dt-bindings/sound/samsung-i2s.h>
>>  #include <dt-bindings/input/input.h>
>> +#include <dt-bindings/clock/maxim,max77686.h>
>>  #include "exynos4412.dtsi"
>>  
>>  / {
>> @@ -143,6 +144,8 @@
>>  
>>  	rtc@10070000 {
>>  		status = "okay";
>> +		clocks = <&clock CLK_RTC>, <&max77686 MAX77686_CLK_AP>;
>> +		clock-names = "rtc", "rtc_src";
>>  	};
>>  
>>  	g2d@10800000 {
>> 
> 
> Exynos's RTC need the XrtcXTI source clock (32.768kHz). Looks good to me.
> 
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>

Yes, I also think this is the correct fix for these boards.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
 
> Thanks,
> Chanwoo Choi
> 

Best regards,
Javier
