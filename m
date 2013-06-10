From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/3] ARM: dts: exynos4210: Add LCD related pinctrl entries
Date: Mon, 10 Jun 2013 09:40:43 +0530
Message-ID: <51B551C3.8000003@linaro.org>
References: <1370603235-11193-1-git-send-email-tushar.behera@linaro.org> <1370603235-11193-2-git-send-email-tushar.behera@linaro.org> <4895761.sVtM2qZnU3@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:65213 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707Ab3FJEKt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Jun 2013 00:10:49 -0400
Received: by mail-pb0-f44.google.com with SMTP id uo1so2049332pbc.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Jun 2013 21:10:48 -0700 (PDT)
In-Reply-To: <4895761.sVtM2qZnU3@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, Sachin Kamat <sachin.kamat@linaro.org>

On 06/08/2013 04:16 PM, Tomasz Figa wrote:
> Hi Tushar, Sachin,
> 
> On Friday 07 of June 2013 16:37:13 Tushar Behera wrote:
>> From: Sachin Kamat <sachin.kamat@linaro.org>
>>
>> Adds pinctrl entries required by FIMD.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos4210-pinctrl.dtsi |   75
>> +++++++++++++++++++++++++++++ 1 file changed, 75 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
>> b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi index 55a2efb..d241726
>> 100644
>> --- a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
>> +++ b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
>> @@ -330,6 +330,81 @@
>>  			samsung,pin-pud = <3>;
>>  			samsung,pin-drv = <0>;
>>  		};
>> +
>> +		pwm0_out: pwm0-out {
>> +			samsung,pins = "gpd0-0";
>> +			samsung,pin-function = <2>;
>> +			samsung,pin-pud = <0>;
>> +			samsung,pin-drv = <0>;
>> +		};
>> +
>> +		pwm1_out: pwm1-out {
>> +			samsung,pins = "gpd0-1";
>> +			samsung,pin-function = <2>;
>> +			samsung,pin-pud = <0>;
>> +			samsung,pin-drv = <0>;
>> +		};
> 
> Hmm, these two seem to be unrelated. Rebase error? :)
> 

Not a rebase error. pwm0_out needs to configured to get display on LCD.

-- 
Tushar Behera
