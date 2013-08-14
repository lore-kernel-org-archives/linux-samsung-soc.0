From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH V2] ARM: dts: Add RTC DT node to Exynos5420 SoC
Date: Wed, 14 Aug 2013 11:33:06 +0530
Message-ID: <CAGm_ybgO5MNtjcygC5oCbPh31SfvYin7Gik1OpAGQJwwtOSODg@mail.gmail.com>
References: <1376308293-7766-1-git-send-email-vikas.sajjan@linaro.org>
	<105b01ce98b1$5a716fa0$0f544ee0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:44834 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751861Ab3HNGDI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 02:03:08 -0400
Received: by mail-wg0-f43.google.com with SMTP id z12so7352130wgg.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Aug 2013 23:03:06 -0700 (PDT)
In-Reply-To: <105b01ce98b1$5a716fa0$0f544ee0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, patches@linaro.org, linaro-kernel@lists.linaro.org

Hi Kukjin,

On Wed, Aug 14, 2013 at 11:14 AM, Kukjin Kim <kgene@kernel.org> wrote:
> Vikas Sajjan wrote:
>>
>> Adds RTC DT node to Exynos5420 SoC.
>>
>> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
>> ---
>> changes since v1:
>>       - made DT node status as "okay" in the dtsi file itself.
>> ---
>>  arch/arm/boot/dts/exynos5.dtsi    |    2 +-
>>  arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
>>  arch/arm/boot/dts/exynos5420.dtsi |    7 +++++++
>>  3 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5.dtsi
>> b/arch/arm/boot/dts/exynos5.dtsi
>> index f65e124..4a8e223 100644
>> --- a/arch/arm/boot/dts/exynos5.dtsi
>> +++ b/arch/arm/boot/dts/exynos5.dtsi
>> @@ -95,7 +95,7 @@
>>               interrupts = <0 54 0>;
>>       };
>>
>> -     rtc {
>> +     rtc@101E0000 {
>>               compatible = "samsung,s3c6410-rtc";
>>               reg = <0x101E0000 0x100>;
>>               interrupts = <0 43 0>, <0 44 0>;
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
>> b/arch/arm/boot/dts/exynos5250.dtsi
>> index 88589b7..c82137b 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -178,9 +178,10 @@
>>               samsung,power-domain = <&pd_mfc>;
>>       };
>>
>> -     rtc {
>> +     rtc@101E0000 {
>>               clocks = <&clock 337>;
>>               clock-names = "rtc";
>> +             status = "okay";
>
> Well, according to the subject, 'add rtc dt node to exynos5420', this should
> be handled separately if required.
>

So, you want me to spit this 5250 modification to a separate patch
OR
Modify the subject line to match the changes.

>>       };
>>
>>       tmu@10060000 {
>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
>> b/arch/arm/boot/dts/exynos5420.dtsi
>> index 9e90d1e..8f1bb08 100644
>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> @@ -145,4 +145,11 @@
>>               clocks = <&clock 260>, <&clock 131>;
>>               clock-names = "uart", "clk_uart_baud0";
>>       };
>> +
>> +     rtc@101E0000 {
>
> Please put in the address order or alphabetical.
>

Sure will do.


>> +             clocks = <&clock 317>;
>> +             clock-names = "rtc";
>> +             status = "okay";
>> +       };
>> +
>
> No need last empty line.

OK.

>
> - Kukjin
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
