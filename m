From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: Add peach-pit board support
Date: Thu, 1 May 2014 10:45:31 -0700
Message-ID: <CAD=FV=Wj4tZ=rJX96Z67qvyj0kRgfgo++SUQc+MxoCuS_SM1Vg@mail.gmail.com>
References: <1398856138-18837-1-git-send-email-arun.kk@samsung.com>
	<1398856138-18837-3-git-send-email-arun.kk@samsung.com>
	<CAD=FV=UmWZapMZgpwdonr-JOE7BB8ELn5DQCFWos_sC1v-eLzw@mail.gmail.com>
	<536284CC.80603@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:43523 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbaEARpc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 May 2014 13:45:32 -0400
Received: by mail-vc0-f171.google.com with SMTP id ld13so4239042vcb.16
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 May 2014 10:45:31 -0700 (PDT)
In-Reply-To: <536284CC.80603@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olofj@google.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Arun Kumar <arunkk.samsung@gmail.com>, Tom Rini <trini@ti.com>

Tomasz,

On Thu, May 1, 2014 at 10:30 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On 01.05.2014 17:40, Doug Anderson wrote:
>>
>> Arun,
>>
>> On Wed, Apr 30, 2014 at 4:08 AM, Arun Kumar K <arun.kk@samsung.com> wrote:
>>>
>>> +       memory {
>>> +               reg = <0x20000000 0x80000000>;
>>
>>
>> As mentioned in the other thread, I think this should be 0 0
>
>
> I guess it may depend on your boards, but DT might contain safe default
> configuration that would work on all variants, so if you have for example 1
> GiB and 2 GiB variants, 1 GiB configuration here should be fine to get the
> board running even without a bootloader that could inject remaining data.

That was part of the debate yesterday, I thought.  Tom Rini (U-Boot
guy) said that right now U-Boot clobbers the memory node _always_ and
fills it in with whatever it detects.  He wasn't sure this was a good
idea.  Someone said they thought that it wasn't a good idea, but
someone could request U-Boot keep clobbering things by doing <0 0>

Tom: did I summarize that correctly?


>>> +&pinctrl_0 {
>>> +       tpm_irq: tpm-irq {
>>> +               samsung,pins = "gpx1-0";
>>> +               samsung,pin-function = <0>;
>>> +               samsung,pin-pud = <0>;
>>
>>
>> Is there any way to use the #defines PIN_PULL_NONE here?
>
>
> I wonder if we already have this kind of #define defined. Keep in mind that
> this value is specific for Exynos SoCs, so we would need to define it in
> Exynos-specific header, like include/dt-bindings/pinctrl/exynos.h.

I dunno.  I'd actually love to see function 0/1 defined (input /
output) too.  ...and drive strengths (since 0, 1, 2, 3 don't map
nicely to x1, x2, x3, x4).

I requested PIN_PULL_NONE though, since I saw it being used.

...oh, but it's a #define in a .dtsi.  Hrm.

arch/arm/boot/dts/s3c64xx-pinctrl.dtsi:#define PIN_PULL_NONE    0

I guess I'd say that it would be nice to do this properly for exynos,
but we could do it in a later patch.


-Doug
