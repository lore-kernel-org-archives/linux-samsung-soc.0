From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: dts: Add missing GPIO entries for sd_bus in
Date: Wed, 18 Dec 2013 23:48:47 +0530
Message-ID: <CAK9yfHyi4dWC8eCUjmEenhY8dN0H8bW+drdOPD7azntsLexx2w@mail.gmail.com>
References: <1382700168-12527-1-git-send-email-sachin.kamat@linaro.org>
	<085901cedf91$4b24d4c0$e16e7e40$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:64928 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752203Ab3LRSSr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 13:18:47 -0500
Received: by mail-ob0-f169.google.com with SMTP id wm4so18521obc.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 10:18:47 -0800 (PST)
In-Reply-To: <085901cedf91$4b24d4c0$e16e7e40$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Kukjin,

On 12 November 2013 15:53, Kukjin Kim <kgene@kernel.org> wrote:
> Sachin Kamat wrote:
>>
>
> Following is more clear?
>
> "ARM: dts: Add missing GPIO entries for sd_bus_width4 in exynos5420-pinctrl"
>
>> Adds missing GPIO entries for sd_bus nodes in exynos5420-pinctrl.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>> ---
>>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>> b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>> index e695aba..fcb8206 100644
>> --- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
>> @@ -181,7 +181,7 @@
>>               };
>>
>>               sd0_bus4: sd0-bus-width4 {
>> -                     samsung,pins = "gpc0-4", "gpc0-5", "gpc0-6";
>> +                     samsung,pins = "gpc0-3", "gpc0-4", "gpc0-5",
> "gpc0-6";
>>                       samsung,pin-function = <2>;
>>                       samsung,pin-pud = <3>;
>>                       samsung,pin-drv = <3>;
>> @@ -230,7 +230,7 @@
>>               };
>>
>>               sd1_bus4: sd1-bus-width4 {
>> -                     samsung,pins = "gpc1-4", "gpc1-5", "gpc1-6";
>> +                     samsung,pins = "gpc1-3", "gpc1-4", "gpc1-5",
> "gpc1-6";
>>                       samsung,pin-function = <2>;
>>                       samsung,pin-pud = <3>;
>>                       samsung,pin-drv = <3>;
>> @@ -272,7 +272,7 @@
>>               };
>>
>>               sd2_bus4: sd2-bus-width4 {
>> -                     samsung,pins = "gpc2-4", "gpc2-5", "gpc2-6";
>> +                     samsung,pins = "gpc2-3", "gpc2-4", "gpc2-5",
> "gpc2-6";
>>                       samsung,pin-function = <2>;
>>                       samsung,pin-pud = <3>;
>>                       samsung,pin-drv = <3>;
>> --
>> 1.7.9.5
>
> Looks ok to me, applied with updating title.

Didn't find this in your tree.

-- 
With warm regards,
Sachin
