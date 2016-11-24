From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] ARM: dts: exynos: Enable SPI on 4412 based odroid-X and
 -X2 boards.
Date: Thu, 24 Nov 2016 15:38:04 +0100
Message-ID: <5836FB4C.4000306@math.uni-bielefeld.de>
References: <5ffdcde0-547f-3da6-2371-c0b0cab69b6b@fivetechno.de>
 <5836F958.1090901@math.uni-bielefeld.de>
 <a9d86208-03c1-fc6c-3fa3-b701e7269fd8@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:60929 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S935450AbcKXOiI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Nov 2016 09:38:08 -0500
In-Reply-To: <a9d86208-03c1-fc6c-3fa3-b701e7269fd8@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

Ah sorry, I didn't look carefully and thought you moved the node from
the U3 to the X DTS. Mea culpa! :(

- Tobias


Markus Reichl wrote:
> Hi Tobias,
> 
> Am 24.11.2016 um 15:29 schrieb Tobias Jakobi:
>> Hey Markus,
>>
>> you should probably mention why the node was removed from the U3 dts. I
>> guess this is due to the SPI not being routed anywhere there?
> 
> I put the node into exynos4412-odroid-common, so it will be there
> on X, X2 and U3.
> We need it on U3, too, because on U3+ SPI is routed to an external connector.
> (Presently we do not separate between U3 and U3+. They are different only with
> SPI and USB-OTG).
> 
> Thanks for looking at,
> --
> Markus
> 
>>
>> - Tobias
>>
>> Markus Reichl wrote:
>>> Odroid-X and -X2 have SPI_1 routed to an external connector.
>>> Enable SPI_1 on X and -X2.
>>>
>>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>>> ---
>>> Tested on X, U3.
>>> ---
>>>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 8 ++++++++
>>>  arch/arm/boot/dts/exynos4412-odroidu3.dts       | 7 -------
>>>  2 files changed, 8 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>> index 7dc1009..c919405 100644
>>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>> @@ -559,6 +559,14 @@
>>>  	status = "okay";
>>>  };
>>>  
>>> +&spi_1 {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&spi1_bus>;
>>> +	num-cs = <1>;
>>> +	cs-gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
>>> +	status = "okay";
>>> +};
>>> +
>>>  &tmu {
>>>  	vtmu-supply = <&ldo10_reg>;
>>>  	status = "okay";
>>> diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
>>> index fc14da5..4bd215f 100644
>>> --- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
>>> +++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
>>> @@ -124,10 +124,3 @@
>>>  		"Speakers", "SPKL",
>>>  		"Speakers", "SPKR";
>>>  };
>>> -
>>> -&spi_1 {
>>> -	pinctrl-names = "default";
>>> -	pinctrl-0 = <&spi1_bus>;
>>> -	cs-gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
>>> -	status = "okay";
>>> -};
>>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
