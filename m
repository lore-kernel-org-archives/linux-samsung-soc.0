From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/6] pinctrl: dt-bindings: samsung: Update documentation
 with new macros
Date: Thu, 01 Sep 2016 12:31:44 +0200
Message-ID: <880fac86-0a8b-2151-c926-89281fe69be1@samsung.com>
References: <1472721715-2833-1-git-send-email-k.kozlowski@samsung.com>
 <1472721715-2833-2-git-send-email-k.kozlowski@samsung.com>
 <8dda7bb7-fb99-3e13-be03-e21e3b18e501@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30932 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932588AbcIAKbu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 06:31:50 -0400
In-reply-to: <8dda7bb7-fb99-3e13-be03-e21e3b18e501@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 09/01/2016 12:29 PM, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 09/01/2016 11:21 AM, Krzysztof Kozlowski wrote:
>> Update examples in Samsung pinctrl dt-bindings with new macros coming
>> from header file.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> ---
>>  .../bindings/pinctrl/samsung-pinctrl.txt           | 42 +++++++++++-----------
>>  1 file changed, 21 insertions(+), 21 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>> index 6db16b90873a..828ef7fdd437 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
>> @@ -238,53 +238,53 @@ Example 1: A pin-controller node with pin groups.
>>  
>>  		uart0_data: uart0-data {
>>  			samsung,pins = "gpa0-0", "gpa0-1";
>> -			samsung,pin-function = <2>;
>> -			samsung,pin-pud = <0>;
>> -			samsung,pin-drv = <0>;
>> +			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
>> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>> +			samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
>>  		};
> 
> I wonder if besides updating the examples, the DT binding shouldn't also
> mention include/dt-bindings/pinctrl/samsung.h and list the macros for each
> possible pin configuration.

Yes, of course it should. I actually added it at beginning but then
checkout and I tested my sed scripts... I'll fix it in v2.

Best regards,
Krzysztof
