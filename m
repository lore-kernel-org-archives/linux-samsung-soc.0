From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] ARM: dts: Use define for s3c-rtc clock id
Date: Tue, 31 Mar 2015 08:37:55 +0200
Message-ID: <CABxcv=moU4xO=BNj6r4_O-VeL_OuAjCuoWiB9xsKWw9NjFTr9g@mail.gmail.com>
References: <1427728889-29158-1-git-send-email-k.kozlowski@samsung.com>
	<551A1D27.6000301@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:38651 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751233AbbCaGh5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Mar 2015 02:37:57 -0400
Received: by wibgn9 with SMTP id gn9so13080658wib.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2015 23:37:56 -0700 (PDT)
In-Reply-To: <551A1D27.6000301@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>

On Tue, Mar 31, 2015 at 6:05 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> Hi,
>
> On 03/31/2015 12:21 AM, Krzysztof Kozlowski wrote:
>> Use a define instead of raw number as a ID for "rtc_src" clock.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
>> ---
>>
>> Patch depends on new file "dt-bindings/clock/samsung,s2mps11.h" from:
>> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg43136.html
>> ---
>>  arch/arm/boot/dts/exynos3250-rinato.dts | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
>> index 3905824cac58..d2cbc95364de 100644
>> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
>> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
>> @@ -16,6 +16,7 @@
>>  #include "exynos3250.dtsi"
>>  #include <dt-bindings/input/input.h>
>>  #include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/clock/samsung,s2mps11.h>
>>
>>  / {
>>       model = "Samsung Rinato board";
>> @@ -605,7 +606,7 @@
>>  };
>>
>>  &rtc {
>> -     clocks = <&cmu CLK_RTC>, <&s2mps14_osc 0>;
>> +     clocks = <&cmu CLK_RTC>, <&s2mps14_osc S2MPS11_CLK_AP>;
>>       clock-names = "rtc", "rtc_src";
>>       status = "okay";
>>  };
>>
>
> Looks good to me.
>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
