From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [RESEND] [PATCH] ARM: dts: exynos5: add pwm DT nodes to
 Exynos5250 and Exynos5420
Date: Thu, 10 Oct 2013 14:11:14 +0530
Message-ID: <CAL1wa8e0e1NwrntEPTnm8=_bSXj3k=Gk+jenphYPEAh8tXKwiA@mail.gmail.com>
References: <1381383731-4359-1-git-send-email-l.krishna@samsung.com> <CAK9yfHyB=Uqjg1HhMx6BXSihDmwRpmpkeLrm2YgDj2Yyo4ySuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:48988 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751657Ab3JJIlf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 04:41:35 -0400
In-Reply-To: <CAK9yfHyB=Uqjg1HhMx6BXSihDmwRpmpkeLrm2YgDj2Yyo4ySuA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, abrestic@chromium.org, olofj@chromium.org

Hi Sachin,

On Thu, Oct 10, 2013 at 11:18 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Leela,
>
> On 10 October 2013 11:12, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
>> Add the device-tree binding for the PWM controller to Exynos5250 and Exynos5420
>>
>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>> Signed-off-by: Olof Johansson <olofj@chromium.org>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5250.dtsi |    9 +++++++++
>>  arch/arm/boot/dts/exynos5420.dtsi |    9 +++++++++
>>  2 files changed, 18 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
>> index 864ae90..99abc72 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -521,6 +521,15 @@
>>                 };
>>         };
>>
>> +       pwm: pwm@12dd0000 {
>> +               compatible = "samsung,exynos4210-pwm";
>> +               reg = <0x12dd0000 0x100>;
>> +               samsung,pwm-outputs = <0>, <1>, <2>, <3>;
>> +               #pwm-cells = <3>;
>> +               clocks = <&clock 311>;
>> +               clock-names = "timers";
>> +       };
>> +
>>         amba {
>>                 #address-cells = <1>;
>>                 #size-cells = <1>;
>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
>> index d537cd7..80afc8b 100644
>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> @@ -206,6 +206,15 @@
>>                 clock-names = "uart", "clk_uart_baud0";
>>         };
>>
>> +       pwm: pwm@12dd0000 {
>> +               compatible = "samsung,exynos4210-pwm";
>> +               reg = <0x12dd0000 0x100>;
>> +               samsung,pwm-outputs = <0>, <1>, <2>, <3>;
>> +               #pwm-cells = <3>;
>> +               clocks = <&clock 279>;
>> +               clock-names = "timers";
>> +       };
>> +
>
> Looking at the properties in the above 2 nodes, can't we have the
> common ones defined in exynos5.dtsi?
>

Yes, we can do it, will change and post the next version

> --
> With warm regards,
> Sachin
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
