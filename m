From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH] ARM: dts: exynos5422-odroidxu3: add INA2xx sensors
Date: Wed, 14 Jan 2015 15:44:39 -0800
Message-ID: <7hy4p5orko.fsf@linaro.org>
References: <1421193801-24637-1-git-send-email-khilman@kernel.org>
	<1421270704.2450.138.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:44179 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751217AbbANXol (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 18:44:41 -0500
Received: by mail-pa0-f52.google.com with SMTP id eu11so13563264pac.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2015 15:44:41 -0800 (PST)
In-Reply-To: <1421270704.2450.138.camel@collabora.co.uk> (Sjoerd Simons's
	message of "Wed, 14 Jan 2015 22:25:04 +0100")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Sjoerd Simons <sjoerd.simons@collabora.co.uk> writes:

> Hey kevin,
>
> On Tue, 2015-01-13 at 16:03 -0800, Kevin Hilman wrote:
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
>> @@ -257,6 +264,38 @@
>>  		};
>>  	};
>>  
>> +	i2c_0: i2c@12C60000 {
>> +		status = "okay";
>> +
>> +		/* A15 cluster: VDD_ARM */
>> +		ina220@40 {
>                    ^ ina231@40 ?
>> +			compatible = "ti,ina230";
>
> This feels incredibly nitpicky, but would it not better to use ti,ina231
> as it's an INA231 chip not a INA230? (And add the compatibility string
> to the driver)

Hmm, you're right.  Until recently, I thought these were INA230s, but
squinted enough at the schematic yesterday to notice they were marked as
INA231, so updated the changelog, but not the DTS.

Will re-spin with a compatible string update to the driver.

Kevin
