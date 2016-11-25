From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: [PATCH] ARM: dts: exynos: Enable SPI on 4412 based odroid-X and
 -X2 boards.
Date: Fri, 25 Nov 2016 15:02:45 +0100
Message-ID: <57c36298-aebe-7a32-a783-0844d2c72726@fivetechno.de>
References: <CGME20161124141334epcas4p438d988d4762321a072ceb2d02a3450cd@epcas4p4.samsung.com>
 <5ffdcde0-547f-3da6-2371-c0b0cab69b6b@fivetechno.de>
 <8c29f896-9f9d-ebe6-e9ab-991137300502@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:53868 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753663AbcKYOCz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2016 09:02:55 -0500
In-Reply-To: <8c29f896-9f9d-ebe6-e9ab-991137300502@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hi Marek,

Am 25.11.2016 um 14:39 schrieb Marek Szyprowski:
> Hi Markus,
> 
> 
> On 2016-11-24 15:13, Markus Reichl wrote:
>> Odroid-X and -X2 have SPI_1 routed to an external connector.
>> Enable SPI_1 on X and -X2.
>>
>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> 
> Thanks for this patch. Maybe it would make sense also to enable I2C controller,
> which is also available on the external connector?

On -X and -X2 I2C-1 is routed to the connector. This bus has been already enabled,
because the onboard MAX98090 codec is connected to it, too.

On U3 there is no native I2C-Bus on the connector. One would have to emulate it 
with the provided GPIOs using i2c-gpio. I think that should not go into the generic
DTS.

> 
> Then I would also like to add some kind of comment in the DTS on which pins given
> bus/feature is available. This should help a lot people trying to connect external
> sensors to the Odroid boards.

Ok, will add comments about the pin layout in future patches.

> 
> For this patch:
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks Marek,
---
Markus

> 
>> ---
>> Tested on X, U3.
>> ---
>>   arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 8 ++++++++
>>   arch/arm/boot/dts/exynos4412-odroidu3.dts       | 7 -------
>>   2 files changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> index 7dc1009..c919405 100644
>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>> @@ -559,6 +559,14 @@
>>       status = "okay";
>>   };
>>   +&spi_1 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&spi1_bus>;
>> +    num-cs = <1>;
>> +    cs-gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
>> +    status = "okay";
>> +};
>> +
>>   &tmu {
>>       vtmu-supply = <&ldo10_reg>;
>>       status = "okay";
>> diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
>> index fc14da5..4bd215f 100644
>> --- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
>> +++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
>> @@ -124,10 +124,3 @@
>>           "Speakers", "SPKL",
>>           "Speakers", "SPKR";
>>   };
>> -
>> -&spi_1 {
>> -    pinctrl-names = "default";
>> -    pinctrl-0 = <&spi1_bus>;
>> -    cs-gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
>> -    status = "okay";
>> -};
> 
> Best regards
