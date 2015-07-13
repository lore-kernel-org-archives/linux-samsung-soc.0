From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/3] mfd: Add DT binding for Maxim MAX77802 IC
Date: Mon, 13 Jul 2015 10:11:15 +0200
Message-ID: <55A372A3.3030101@osg.samsung.com>
References: <1436773348-15316-1-git-send-email-javier@osg.samsung.com>
 <1436773348-15316-3-git-send-email-javier@osg.samsung.com>
 <55A36E95.8030509@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:52648 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751743AbbGMILU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jul 2015 04:11:20 -0400
In-Reply-To: <55A36E95.8030509@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello Krzysztof,

Thanks a lot for the feedback.

On 07/13/2015 09:53 AM, Krzysztof Kozlowski wrote:
> On 13.07.2015 16:42, Javier Martinez Canillas wrote:
>> The MAX77802 is a chip that contains regulators, 2 32kHz clocks,
>> a RTC and an I2C interface to program the individual components.
>>
>> The are already DT bindings for the regulators and clocks and
>> these reference to a bindings/mfd/max77802.txt file, that didn't
>> exist, for the details about the PMIC.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>>
>>  Documentation/devicetree/bindings/mfd/max77802.txt | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/max77802.txt
> 
> I wonder what happened with previous email...
> http://www.spinics.net/lists/kernel/msg1784726.html
>

The story is that in v9 I split the series to add the max77802 clock and
regulators support as different series to avoid the cross subsystem churn:

[PATCH v9 0/6] Add Maxim 77802 clocks support
https://lwn.net/Articles/608834/

[PATCH v9 0/2] Add Maxim 77802 regulator support
https://lkml.org/lkml/2014/8/18/71

But then forgot to add the common DT binding for the PMIC in bindings/mfd...

>>
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
> 
> Shouldn't this be 77802?
>

right, thanks for pointing out this. It is a copy & paste error. I'll wait a
couple of days for more feedback and re-post.

> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
