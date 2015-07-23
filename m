From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 3/4] mfd: Add DT binding for Maxim MAX77802 IC
Date: Thu, 23 Jul 2015 18:09:20 +0200
Message-ID: <55B111B0.7000803@osg.samsung.com>
References: <1437114567-17629-1-git-send-email-javier@osg.samsung.com>
 <1437114567-17629-4-git-send-email-javier@osg.samsung.com>
 <20150723151652.GK3436@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:54050 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752915AbbGWQJ0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jul 2015 12:09:26 -0400
In-Reply-To: <20150723151652.GK3436@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org

Hello Lee,

Thanks for your feedback.

On 07/23/2015 05:16 PM, Lee Jones wrote:
> On Fri, 17 Jul 2015, Javier Martinez Canillas wrote:
> 
>> The MAX77802 is a chip that contains regulators, 2 32kHz clocks,
>> a RTC and an I2C interface to program the individual components.
>>
>> The are already DT bindings for the regulators and clocks and
>> these reference to a bindings/mfd/max77802.txt file, that didn't
>> exist, for the details about the PMIC.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>> ---
>>
>> Changes in v2:
>> - Use the correct "maxim,max77802" compatible string.
>>   Suggested by Krzysztof Kozlowski
>> - Use a pmic generic node name for the max77802 node example.
>>   Suggested by Sergei Shtylyov.
>>
>>  Documentation/devicetree/bindings/mfd/max77802.txt | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/max77802.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/max77802.txt b/Documentation/devicetree/bindings/mfd/max77802.txt
>> new file mode 100644
>> index 000000000000..c60cdec50d36
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/max77802.txt
>> @@ -0,0 +1,26 @@
>> +Maxim MAX77802 multi-function device
>> +
>> +The Maxim MAX77802 is a power management chip (PMIC) that contains 10 high
>> +efficiency Buck regulators, 32 Low-dropout (LDO) regulators used to power
> 
> Would be good to capitalise the works in the acronyms, so
> "Low-DropOut" and "Power Management IC".
>

Ok.
 
>> +up application processors and peripherals, a 2-channel 32kHz clock outputs,
>> +a Real-Time-Clock (RTC) and a I2C interface to program the individual
>> +regulators, clocks outputs and the RTC.
>> +
>> +Binding for the built-in 32k clock generator block is defined separately
>> +in the bindings/clk/maxim,max77802.txt file and binding for the regulators
> 
> s/bindings/../
>

Ok.
 
>> +is defined in the bindings/regulator/max77802.txt file.
>> +
>> +Required properties:
>> +- compatible : Must be "maxim,max77802";
>> +- reg : Specifies the i2c slave address of PMIC block.
> 
> s/i2c/I2C/
> 
>> +- interrupts : This i2c device has an IRQ line connected to the main SoC.
> 
> As above.
>

Ok. I'll change it.
 
>> +- interrupt-parent : The parent interrupt controller.
>> +
>> +Example:
>> +
>> +	max77802: pmic@09 {
>> +		compatible = "maxim,max77802";
>> +		interrupt-parent = <&intc>;
>> +		interrupts = <26 0>;
> 
> Is there a define in include/dt-bindings/interrupt-controller to
> replace 0?  IRQ_TYPE_NONE perhaps.
>

Yes, I'll change that as well.
 
>> +		reg = <0x09>;
>> +	};
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
