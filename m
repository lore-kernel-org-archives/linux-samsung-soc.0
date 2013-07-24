From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/3] ARM: dts: exynos: add PMU registers addresses and
 mask bit to watchdog node
Date: Wed, 24 Jul 2013 16:30:07 +0530
Message-ID: <CAK9yfHyEieTZeh+HCiH9hghiag1djNCHnehFjdeDsm+naQnUKg@mail.gmail.com>
References: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
	<1374658699-3961-4-git-send-email-l.krishna@samsung.com>
	<CAK9yfHyUjWvAt0Ron+shk0b5DuTkKO5dyPcBxF6zJn93b+OTHQ@mail.gmail.com>
	<CAL1wa8eHOyCV8w=HodaWZvPCjDPf_4YOHRrnF9O2t0k2y_6Tkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:37832 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751215Ab3GXLAI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 07:00:08 -0400
Received: by mail-oa0-f44.google.com with SMTP id l10so570401oag.31
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2013 04:00:08 -0700 (PDT)
In-Reply-To: <CAL1wa8eHOyCV8w=HodaWZvPCjDPf_4YOHRrnF9O2t0k2y_6Tkw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Jingoo Han <jg1.han@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Hi Leela,

On 24 July 2013 16:24, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
> Hi Sachin,
>
> On Wed, Jul 24, 2013 at 3:16 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> Hi Leela,
>>
>> On 24 July 2013 15:08, Leela Krishna Amudala <l.krishna@samsung.com> wrote:
>>> This patch adds support for specifying the pmu registers and masking bit
>>> for watchdog to enable/disable and mask/unmask the watchdog reset request.
>>>
>>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>>> ---
>>>  arch/arm/boot/dts/exynos5.dtsi    |    2 +-
>>>  arch/arm/boot/dts/exynos5420.dtsi |    1 +
>>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
>>> index f65e124..4d63b74 100644
>>> --- a/arch/arm/boot/dts/exynos5.dtsi
>>> +++ b/arch/arm/boot/dts/exynos5.dtsi
>>> @@ -104,7 +104,7 @@
>>>
>>>         watchdog {
>>>                 compatible = "samsung,s3c2410-wdt";
>>> -               reg = <0x101D0000 0x100>;
>>> +               reg = <0x101D0000 0x100>, <0x10040408 0x4>, <0x1004040c 0x4>;
>>>                 interrupts = <0 42 0>;
>>>                 status = "disabled";
>>>         };
>>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
>>> index e1d2d20..ea5b49f 100644
>>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>>> @@ -150,5 +150,6 @@
>>>                 clocks = <&clock 316>;
>>>                 clock-names = "watchdog";
>>>                 status = "okay";
>>> +               reset-mask-bit = <0>;
>>
>> Why not add this hunk to the previous patch itself?
>>
>
> This particular property holds a bit number that has to be programmed
> in the PMU registers (mentioned in exynos5.dtsi).
> So I added this property along with those registers.

In this case you can swap patches 2 and 3 i.e., add the PMU registers
to exynos5.dtsi in patch 2 and then add the watchdog node along with
reset-mask-bit in patch3.

-- 
With warm regards,
Sachin
