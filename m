From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH] ARM: dts: enable pwm backlight on exynos5250-snow
Date: Thu, 8 May 2014 15:24:04 +0530
Message-ID: <CAEC9eQMxjCSwkvcSmbH7hWp9L+TmCbAZV8074zyAqQ__gLnSZw@mail.gmail.com>
References: <1399467371-12242-1-git-send-email-ajaykumar.rs@samsung.com>
	<536A98E7.9030007@gmail.com>
	<CAEC9eQPeGSw0xEdmq2GkVVhC7cTGSEvkM_CHRxTw__aFrvzvbw@mail.gmail.com>
	<536A9C82.6090704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f180.google.com ([209.85.220.180]:48367 "EHLO
	mail-vc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753897AbaEHJyF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 05:54:05 -0400
Received: by mail-vc0-f180.google.com with SMTP id hy4so2084255vcb.25
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 May 2014 02:54:04 -0700 (PDT)
In-Reply-To: <536A9C82.6090704@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Olof Johansson <olof@lixom.net>

Tomasz,

On Thu, May 8, 2014 at 2:20 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On 07.05.2014 22:47, Ajay kumar wrote:
>>
>> Tomasz,
>>
>> On Thu, May 8, 2014 at 2:04 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>>
>>> Hi Ajay,
>>>
>>>
>>> On 07.05.2014 14:56, Ajay Kumar wrote:
>>>>
>>>>
>>>> Add PWM backlight node for exynos5250 and enable the same on exynos5250
>>>> based snow board.
>>>>
>>>> Signed-off-by: Olof Johansson <olof@lixom.net>
>>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>>> ---
>>>>    arch/arm/boot/dts/exynos5250-pinctrl.dtsi |    7 +++++++
>>>>    arch/arm/boot/dts/exynos5250-snow.dts     |    5 +++++
>>>>    arch/arm/boot/dts/exynos5250.dtsi         |   10 ++++++++++
>>>>    3 files changed, 22 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>>> b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>>> index 9a49e68..2a4680c 100644
>>>> --- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>>> +++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>>> @@ -351,6 +351,13 @@
>>>>                          samsung,pin-drv = <0>;
>>>>                  };
>>>>
>>>> +               backlight_pwm: backlight-pwm {
>>>> +                       samsung,pins = "gpb2-0";
>>>> +                       samsung,pin-function = <2>;
>>>> +                       samsung,pin-pud = <0>;
>>>> +                       samsung,pin-drv = <0>;
>>>> +               };
>>>
>>>
>>>
>>> This looks like a generic PWM output function, not specific to backlight
>>> in
>>> any way.
>>>
>>> Please see patch [1] adding PWM output pin groups for Exynos5420 for
>>> reference.
>>>
>>> [1]
>>>
>>> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg29869.html
>>
>> Right! I just referred to the manual again, and it actually reads TOUT_0.
>> So, I should be probably renaming this as "pwm0_out" like in the other
>> patch?
>
>
> Yes, please. You should also add remaining ones, while at it. Basically same
> patch as [1] but for Exynos5250.

Sent "[PATCH 1/2] ARM: dts: Add pwmX_out pinctrl nodes to Exynos5250"


Ajay
