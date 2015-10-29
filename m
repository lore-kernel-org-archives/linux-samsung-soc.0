From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: mfd: s2mps11: add documentation for
 s2mps15 PMIC
Date: Thu, 29 Oct 2015 13:18:51 +0530
Message-ID: <5631CF63.3070204@samsung.com>
References: <1446094723-6212-1-git-send-email-alim.akhtar@samsung.com>
 <1446094723-6212-2-git-send-email-alim.akhtar@samsung.com>
 <5631B537.1090404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44340 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751218AbbJ2HsQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Oct 2015 03:48:16 -0400
In-reply-to: <5631B537.1090404@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, lee.jones@linaro.org, broonie@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>, devicetree@vger.kernel.org



On 10/29/2015 11:27 AM, Krzysztof Kozlowski wrote:
> On 29.10.2015 13:58, Alim Akhtar wrote:
>> From: Thomas Abraham <thomas.ab@samsung.com>
>>
>> Add dt-binding documentation for s2mps15 PMIC device. The s2mps15 device
>> is similar to s2mps11/14 PMIC device and has 27 LDO and 10 buck regulators.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Acked-by: Lee Jones <lee.jones@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/mfd/s2mps11.txt |   23 ++++++++++++++-------
>>   1 file changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
>> index 890f0b0e1643..c0427c9d0886 100644
>> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
>> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
>> @@ -1,5 +1,5 @@
>>
>> -* Samsung S2MPS11, S2MPS13, S2MPS14 and S2MPU02 Voltage and Current Regulator
>> +* Samsung S2MPS11/13/14/15 and S2MPU02 Voltage and Current Regulator
>>
>>   The Samsung S2MPS11 is a multi-function device which includes voltage and
>>   current regulators, RTC, charger controller and other sub-blocks. It is
>> @@ -7,8 +7,12 @@ interfaced to the host controller using an I2C interface. Each sub-block is
>>   addressed by the host system using different I2C slave addresses.
>>
>>   Required properties:
>> -- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps13-pmic"
>> -	      or "samsung,s2mps14-pmic" or "samsung,s2mpu02-pmic".
>> +- compatible: Should be one of the following
>> +	- "samsung,s2mps11-pmic"
>> +	- "samsung,s2mps13-pmic"
>> +	- "samsung,s2mps14-pmic"
>> +	- "samsung,s2mps15-pmic"
>> +	- "samsung,s2mpu02-pmic".
>>   - reg: Specifies the I2C slave address of the pmic block. It should be 0x66.
>>
>>   Optional properties:
>> @@ -24,7 +28,7 @@ Optional properties:
>>     unwanted buck warm reset (setting buck voltages to default values).
>>
>>   Optional nodes:
>> -- clocks: s2mps11, s2mps13 and s5m8767 provide three(AP/CP/BT) buffered 32.768
>> +- clocks: s2mps11, s2mps13, s2mps15 and s5m8767 provide three(AP/CP/BT) buffered 32.768
>>     KHz outputs, so to register these as clocks with common clock framework
>>     instantiate a sub-node named "clocks". It uses the common clock binding
>>     documented in :
>> @@ -37,12 +41,13 @@ Optional nodes:
>>       the clock which they consume.
>>       Clock               ID           Devices
>>       ----------------------------------------------------------
>> -    32KhzAP		0            S2MPS11, S2MPS13, S2MPS14, S5M8767
>> -    32KhzCP		1            S2MPS11, S2MPS13, S5M8767
>> -    32KhzBT		2            S2MPS11, S2MPS13, S2MPS14, S5M8767
>> +    32KhzAP		0            S2MPS11, S2MPS13, S2MPS14, S2MPS15, S5M8767
>> +    32KhzCP		1            S2MPS11, S2MPS13, S2MPS15, S5M8767
>> +    32KhzBT		2            S2MPS11, S2MPS13, S2MPS14, S2MPS15, S5M8767
>>
>>     - compatible: Should be one of: "samsung,s2mps11-clk", "samsung,s2mps13-clk",
>> -		"samsung,s2mps14-clk", "samsung,s5m8767-clk"
>> +		"samsung,s2mps14-clk", "samsung,s2mps15-clk",
>> +		"samsung,s5m8767-clk"
>
> Noooo. Why "samsung,s2mps15-clk"?
>
> Adding a new compatible to bindings is a major change so my review tag
> (from v1 where there was no such compatible) should be dropped. Please
> drop it.
>
My bad, will drop it.
> Best regards,
> Krzysztof
>
>
