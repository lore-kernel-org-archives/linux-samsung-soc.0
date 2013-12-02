From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: dts: Fix a typo in exynos5420-pinctrl.dtsi
Date: Mon, 2 Dec 2013 15:57:12 +0530
Message-ID: <CAK9yfHx7YZk1bW5YY_mFw2XnikA5fEDRXQrfSsogP2atKCg=oQ@mail.gmail.com>
References: <1383797386-29458-1-git-send-email-sachin.kamat@linaro.org>
	<11439635.3nLj0DE42O@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:49593 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753099Ab3LBK1N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Dec 2013 05:27:13 -0500
Received: by mail-ob0-f179.google.com with SMTP id wm4so12323967obc.24
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Dec 2013 02:27:12 -0800 (PST)
In-Reply-To: <11439635.3nLj0DE42O@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On 10 November 2013 23:50, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On Thursday 07 of November 2013 09:39:46 Sachin Kamat wrote:
>> Fixed samaung -> samsung in property name.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>> index e695aba5f73c..e62c8eb57438 100644
>> --- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>> @@ -64,7 +64,7 @@
>>                       samsung,pins = "gpx0-7";
>>                       samsung,pin-function = <3>;
>>                       samsung,pin-pud = <0>;
>> -                     samaung,pin-drv = <0>;
>> +                     samsung,pin-drv = <0>;
>>               };
>>       };
>>
>>
>
> Good catch.
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>
> Best regards,
> Tomasz
>


Ping Kukjin.

-- 
With warm regards,
Sachin
