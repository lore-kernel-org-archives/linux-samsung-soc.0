From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: Add pwmX_out pinctrl nodes to Exynos5250
Date: Sat, 17 May 2014 09:05:19 +0900
Message-ID: <5376A7BF.9010702@samsung.com>
References: <1399542642-10001-1-git-send-email-ajaykumar.rs@samsung.com> <048c01cf7102$4c2266f0$e46734d0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:35692 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755110AbaEQAFX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 20:05:23 -0400
Received: by mail-pa0-f46.google.com with SMTP id kq14so3183359pab.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 May 2014 17:05:23 -0700 (PDT)
In-Reply-To: <048c01cf7102$4c2266f0$e46734d0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ajay Kumar' <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, ajaynumb@gmail.com, tomasz.figa@gmail.com, joshi@samsung.com, prashanth.g@samsung.com

On 05/16/14 21:28, Kukjin Kim wrote:
> Ajay Kumar wrote:
>>
>> Adds the PWM nodes to 5250 pinctrl dtsi file.
>>
>> Signed-off-by: Ajay Kumar<ajaykumar.rs@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos5250-pinctrl.dtsi |   28
>> ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>> b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>> index 9a49e68..886cfca 100644
>> --- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>> @@ -351,6 +351,34 @@
>>   			samsung,pin-drv =<0>;
>>   		};
>>
>> +		pwm0_out: pwm0-out {
>> +			samsung,pins = "gpb2-0";
>> +			samsung,pin-function =<2>;
>> +			samsung,pin-pud =<0>;
>> +			samsung,pin-drv =<0>;
>> +		};
>> +
>> +		pwm1_out: pwm1-out {
>> +			samsung,pins = "gpb2-1";
>> +			samsung,pin-function =<2>;
>> +			samsung,pin-pud =<0>;
>> +			samsung,pin-drv =<0>;
>> +		};
>> +
>> +		pwm2_out: pwm2-out {
>> +			samsung,pins = "gpb2-2";
>> +			samsung,pin-function =<2>;
>> +			samsung,pin-pud =<0>;
>> +			samsung,pin-drv =<0>;
>> +		};
>> +
>> +		pwm3_out: pwm3-out {
>> +			samsung,pins = "gpb2-3";
>> +			samsung,pin-function =<2>;
>> +			samsung,pin-pud =<0>;
>> +			samsung,pin-drv =<0>;
>> +		};
>> +
>>   		i2c7_bus: i2c7-bus {
>>   			samsung,pins = "gpb2-2", "gpb2-3";
>>   			samsung,pin-function =<3>;
>> --
>> 1.7.9.5
>
> Looks good to me, applied this and 2nd one.
>
Oops, I can't find the branch including this patches and your patches in 
my mailbox...can you please send this patches again including 
linux-arm-kernel ml?

- Kukjin
