From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH] ARM: dts: exynos5422-odroidxu3: add INA2xx sensors
Date: Wed, 14 Jan 2015 15:42:03 -0800
Message-ID: <7h4mrtq69g.fsf@linaro.org>
References: <1421193801-24637-1-git-send-email-khilman@kernel.org>
	<54B69180.2010403@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:45201 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751999AbbANXmG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 18:42:06 -0500
Received: by mail-pa0-f51.google.com with SMTP id ey11so13603088pad.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2015 15:42:05 -0800 (PST)
In-Reply-To: <54B69180.2010403@kernel.org> (Kukjin Kim's message of "Thu, 15
	Jan 2015 00:55:44 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Kukjin Kim <kgene@kernel.org> writes:

> On 01/14/15 09:03, Kevin Hilman wrote:
>> From: Kevin Hilman <khilman@linaro.org>
>> 
>> The odroid-xu3 has 4 INA231 current sensors on board which can be
>> accessed from the Linux via the hwmon interface.
>> 
>> There is one sensor for each of these power rails:
>> 
>> - A15 cluster: VDD_ARM
>> - A7 cluster: VDD_KFC
>> - GPU: VDD_G3D
>> - memory: VDD_MEM
>> 
>> In addition to adding the sensors, LDO26 from the PMIC needs to be
>> enabled because it's powering these sensor.
>> 
>> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> Cc: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
>> Signed-off-by: Kevin Hilman <khilman@linaro.org>
>> ---
>> Applies on top of "ARM: dts: Add dts file for odroid XU3 board" from Sjoerd Simons.
>> 
>>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 39 ++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>> 
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> index c29123c0734d..7874da20939f 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> @@ -174,6 +174,13 @@
>>  					regulator-always-on;
>>  				};
>>  
>> +				ldo26_reg: LDO26 {
>> +					regulator-name = "vdd_ldo26";
>> +					regulator-min-microvolt = <3000000>;
>> +					regulator-max-microvolt = <3000000>;
>> +					regulator-always-on;
>> +				};
>> +
>>  				buck1_reg: BUCK1 {
>>  					regulator-name = "vdd_mif";
>>  					regulator-min-microvolt = <800000>;
>> @@ -257,6 +264,38 @@
>>  		};
>>  	};
>>  
>> +	i2c_0: i2c@12C60000 {
>> +		status = "okay";
>> +
>> +		/* A15 cluster: VDD_ARM */
>> +		ina220@40 {
>> +			compatible = "ti,ina230";
>> +			reg = <0x40>;
>> +			shunt-resistor = <10000>;
>> +		};
>> +
>> +		/* memory: VDD_MEM */
>> +		ina220@41 {
>> +			compatible = "ti,ina230";
>> +			reg = <0x41>;
>> +			shunt-resistor = <10000>;
>> +		};
>> +
>> +		/* GPU: VDD_G3D */
>> +		ina220@44 {
>> +			compatible = "ti,ina230";
>> +			reg = <0x44>;
>> +			shunt-resistor = <10000>;
>> +		};
>> +
>> +		/* A7 cluster: VDD_KFC */
>> +		ina220@45 {
>> +			compatible = "ti,ina230";
>> +			reg = <0x45>;
>> +			shunt-resistor = <10000>;
>> +		};
>> +	};
>> +
>>  	i2c_2: i2c@12C80000 {
>>  		samsung,i2c-sda-delay = <100>;
>>  		samsung,i2c-max-bus-freq = <66000>;
>
> Looks good to me and applied. To be honest, I'm not sure about the
> values in the node of shunt-resistor though ;)

I didn't measure the values, but used the values from the DTS that's
part of the hardkernel tree.

Kevin
