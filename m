From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: exynos: add PMU registers addresses and
 mask bit to watchdog node
Date: Wed, 24 Jul 2013 16:24:42 +0530
Message-ID: <CAL1wa8eHOyCV8w=HodaWZvPCjDPf_4YOHRrnF9O2t0k2y_6Tkw@mail.gmail.com>
References: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
 <1374658699-3961-4-git-send-email-l.krishna@samsung.com> <CAK9yfHyUjWvAt0Ron+shk0b5DuTkKO5dyPcBxF6zJn93b+OTHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f175.google.com ([209.85.128.175]:38392 "EHLO
	mail-ve0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751150Ab3GXKzE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 06:55:04 -0400
Received: by mail-ve0-f175.google.com with SMTP id da11so6873636veb.34
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2013 03:55:02 -0700 (PDT)
In-Reply-To: <CAK9yfHyUjWvAt0Ron+shk0b5DuTkKO5dyPcBxF6zJn93b+OTHQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Jingoo Han <jg1.han@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Hi Sachin,

On Wed, Jul 24, 2013 at 3:16 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Leela,
>
> On 24 July 2013 15:08, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
>> This patch adds support for specifying the pmu registers and masking bit
>> for watchdog to enable/disable and mask/unmask the watchdog reset request.
>>
>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5.dtsi    |    2 +-
>>  arch/arm/boot/dts/exynos5420.dtsi |    1 +
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
>> index f65e124..4d63b74 100644
>> --- a/arch/arm/boot/dts/exynos5.dtsi
>> +++ b/arch/arm/boot/dts/exynos5.dtsi
>> @@ -104,7 +104,7 @@
>>
>>         watchdog {
>>                 compatible = "samsung,s3c2410-wdt";
>> -               reg = <0x101D0000 0x100>;
>> +               reg = <0x101D0000 0x100>, <0x10040408 0x4>, <0x1004040c 0x4>;
>>                 interrupts = <0 42 0>;
>>                 status = "disabled";
>>         };
>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
>> index e1d2d20..ea5b49f 100644
>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> @@ -150,5 +150,6 @@
>>                 clocks = <&clock 316>;
>>                 clock-names = "watchdog";
>>                 status = "okay";
>> +               reset-mask-bit = <0>;
>
> Why not add this hunk to the previous patch itself?
>

This particular property holds a bit number that has to be programmed
in the PMU registers (mentioned in exynos5.dtsi).
So I added this property along with those registers.

Best Wishes,
Leela krishna.

> --
> With warm regards,
> Sachin
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
