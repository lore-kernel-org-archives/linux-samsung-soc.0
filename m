From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH V3 2/2] ARM: dts: exynos5422-odroidxu3: add 'rtc_src'
 clock to rtc node
Date: Tue, 31 Mar 2015 08:40:10 +0200
Message-ID: <CABxcv==paJHnLgqcEF-MCmWvJVdV6bYFOpKbmX9P31vyHpD9ig@mail.gmail.com>
References: <55196DE2.4030109@fivetechno.de>
	<551A1CF7.9090400@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:33011 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769AbbCaGkM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Mar 2015 02:40:12 -0400
Received: by wixm2 with SMTP id m2so7197443wix.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2015 23:40:11 -0700 (PDT)
In-Reply-To: <551A1CF7.9090400@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Markus Reichl <m.reichl@fivetechno.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>

On Tue, Mar 31, 2015 at 6:05 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> Hi,
>
> On 03/31/2015 12:38 AM, Markus Reichl wrote:
>> The Exynos5422 SoC has a s3c6410 RTC where the source clock
>> is now a mandatory property.
>>
>> This patch fixes probe failure of s3c-rtc on Odroid-XU3 boards.
>> It is based in v4.0-rc2.
>>
>> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
>> ---
>> Changes since v2:
>> 1. Dropped unused phandle.
>> Changes since v1:
>> 1. Dropped Documentation.
>> 2. Split into 2 parts.
>> ---
>>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> index 0408ec0..4a7ca15 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> @@ -274,10 +274,6 @@
>>                       reg = <0x50>;
>>               };
>>       };
>> -
>> -     rtc@101E0000 {
>> -             status = "okay";
>> -     };
>>  };
>>
>>  &hdmi {
>> @@ -374,3 +370,9 @@
>>               shunt-resistor = <10000>;
>>       };
>>  };
>> +
>> +&rtc {
>> +     status = "okay";
>> +     clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
>> +     clock-names = "rtc", "rtc_src";
>> +};
>>
>
> Exynos's RTC must need the XrtcXTI source clock (32.768kHz). Looks good to me.
>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>
> Thanks,
> Chanwoo Choi
>

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
