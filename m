From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 2/3] mfd: Add DT binding for Maxim MAX77802 IC
Date: Mon, 13 Jul 2015 15:26:58 +0200
Message-ID: <55A3BCA2.7040505@osg.samsung.com>
References: <1436773348-15316-1-git-send-email-javier@osg.samsung.com>
 <1436773348-15316-3-git-send-email-javier@osg.samsung.com>
 <55A3B910.9040009@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55A3B910.9040009-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Sergei,

On 07/13/2015 03:11 PM, Sergei Shtylyov wrote:
> Hello.
> 
> On 7/13/2015 10:42 AM, Javier Martinez Canillas wrote:
> 
>> The MAX77802 is a chip that contains regulators, 2 32kHz clocks,
>> a RTC and an I2C interface to program the individual components.
> 
>> The are already DT bindings for the regulators and clocks and
>> these reference to a bindings/mfd/max77802.txt file, that didn't
>> exist, for the details about the PMIC.
> 
>> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>> ---
>>
>>   Documentation/devicetree/bindings/mfd/max77802.txt | 26 ++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/max77802.txt
> 
>> diff --git a/Documentation/devicetree/bindings/mfd/max77802.txt b/Documentation/devicetree/bindings/mfd/max77802.txt
>> new file mode 100644
>> index 000000000000..875ebebbc5b0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/max77802.txt
>> @@ -0,0 +1,26 @@
>> +Maxim MAX77802 multi-function device
>> +
>> +The Maxim MAX77802 is a power management chip (PMIC) that contains 10 high
>> +efficiency Buck regulators, 32 Low-dropout (LDO) regulators used to power
>> +up application processors and peripherals, a 2-channel 32kHz clock outputs,
>> +a Real-Time-Clock (RTC) and a I2C interface to program the individual
>> +regulators, clocks outputs and the RTC.
>> +
>> +Binding for the built-in 32k clock generator block is defined separately
>> +in the bindings/clk/maxim,max77802.txt file and binding for the regulators
>> +is defined in the bindings/regulator/max77802.txt file.
>> +
>> +Required properties:
>> +- compatible : Must be "maxim,max77686";
>> +- reg : Specifies the i2c slave address of PMIC block.
>> +- interrupts : This i2c device has an IRQ line connected to the main SoC.
>> +- interrupt-parent : The parent interrupt controller.
>> +
>> +Example:
>> +
>> +    max77802@09 {
> 
>    Sigh, I'm tired of saying this over and over again: please don't name the nodes with teh chip names. The ePAPR standard says: "The name of a node should be somewhat generic, reflecting the function of the device and not its 3 precise programming model."
> 

Ok, I'll change this to be pmic@ when re-spinning the patches.

> WBR, Sergei
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
