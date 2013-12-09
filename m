From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Fix a typo in exynos5420-pinctrl.dtsi
Date: Tue, 10 Dec 2013 06:31:30 +0900
Message-ID: <52A636B2.7000403@samsung.com>
References: <1383797386-29458-1-git-send-email-sachin.kamat@linaro.org>	<11439635.3nLj0DE42O@flatron> <CAK9yfHx7YZk1bW5YY_mFw2XnikA5fEDRXQrfSsogP2atKCg=oQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:33534 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758864Ab3LIVbf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 16:31:35 -0500
Received: by mail-pd0-f177.google.com with SMTP id q10so5891032pdj.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2013 13:31:35 -0800 (PST)
In-Reply-To: <CAK9yfHx7YZk1bW5YY_mFw2XnikA5fEDRXQrfSsogP2atKCg=oQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On 12/02/13 19:27, Sachin Kamat wrote:
> On 10 November 2013 23:50, Tomasz Figa<tomasz.figa@gmail.com>  wrote:
>> On Thursday 07 of November 2013 09:39:46 Sachin Kamat wrote:
>>> Fixed samaung ->  samsung in property name.
>>>
>>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>>> ---
>>>   arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>>> index e695aba5f73c..e62c8eb57438 100644
>>> --- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>>> +++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>>> @@ -64,7 +64,7 @@
>>>                        samsung,pins = "gpx0-7";
>>>                        samsung,pin-function =<3>;
>>>                        samsung,pin-pud =<0>;
>>> -                     samaung,pin-drv =<0>;
>>> +                     samsung,pin-drv =<0>;
>>>                };
>>>        };
>>>
>>>
>>
>> Good catch.
>>
>> Reviewed-by: Tomasz Figa<t.figa@samsung.com>
>>
>> Best regards,
>> Tomasz
>>
>
>
> Ping Kukjin.
>
Oh, OK, applied ;-)

Thanks,
Kukjin
