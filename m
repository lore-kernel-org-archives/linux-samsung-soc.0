From: Leela Krishna Amudala <leelakrishna.a@gmail.com>
Subject: Re: [PATCH] ARM: dts: Add missing GPIO entries for sd_bus in
Date: Tue, 12 Nov 2013 17:20:43 +0530
Message-ID: <CAL1wa8fnu-xUu3SZ+e1SMB0ci5n8wenDgbr4L9TGS+NH8qpS2w@mail.gmail.com>
References: <1382700168-12527-1-git-send-email-sachin.kamat@linaro.org> <085901cedf91$4b24d4c0$e16e7e40$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:40208 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750961Ab3KLLvF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 06:51:05 -0500
In-Reply-To: <085901cedf91$4b24d4c0$e16e7e40$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, tushar.behera@linaro.org, devicetree@vger.kernel.org

Hi Sachin,

On Tue, Nov 12, 2013 at 3:53 PM, Kukjin Kim <kgene@kernel.org> wrote:
> Sachin Kamat wrote:
>>
>
> Following is more clear?
>
> "ARM: dts: Add missing GPIO entries for sd_bus_width4 in exynos5420-pinctrl"
>
>> Adds missing GPIO entries for sd_bus nodes in exynos5420-pinctrl.
>>

This is not a missing stuff, I did this purposefully.
Myself and Doug anderson discussed on this and the objective of doing this is to
eliminate the gpio pin configuration multiple times.

Please see the below explanation

The current code in main line kernel shows like
               sd0_bus1: sd0-bus-width1 {
                       samsung,pins = "gpc0-3";
                 };

               sd0_bus4: sd0-bus-width4 {
                       samsung,pins = "gpc0-4", "gpc0-5", "gpc0-6";
               };

               sd0_bus8: sd0-bus-width8 {
                       samsung,pins = "gpc3-0", "gpc3-1", "gpc3-2", "gpc3-3";
               };

and lets mmc wants to use 8 bit width then node should be like below

dwmmc0@12200000 {
                [snip]
                pinctrl-names = "default";
                pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;

Here it will configure all the 8 pins ("gpc0-3", "gpc0-4", "gpc0-5",
"gpc0-6", "gpc3-0", "gpc3-1", "gpc3-2", "gpc3-3")

                slot@0 {
                        reg = <0>;
                        bus-width = <8>;
                };
        };

Similarly for using 1 bit width the property value should be like below
               pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1>;

and if other mmc wants to use 4 bit width the property value should be
like below
               pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4>;

But with the changes you made and if one mmc wants to use 1 bit width
and other wants to use 4 bit width
the pin "gpc0-3" will be configured twice which is wrong.

So, I strongly feel it is better to change the existing mmc node
instead of changing the "sd0_bus" entries

Best Wishes,
Leela Krishna.

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
>
> Thanks,
> Kukjin
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
