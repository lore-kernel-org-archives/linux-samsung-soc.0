From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: Add peach-pit board support
Date: Thu, 01 May 2014 19:30:52 +0200
Message-ID: <536284CC.80603@gmail.com>
References: <1398856138-18837-1-git-send-email-arun.kk@samsung.com>	<1398856138-18837-3-git-send-email-arun.kk@samsung.com> <CAD=FV=UmWZapMZgpwdonr-JOE7BB8ELn5DQCFWos_sC1v-eLzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f43.google.com ([209.85.216.43]:49021 "EHLO
	mail-qa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727AbaEARay (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 May 2014 13:30:54 -0400
In-Reply-To: <CAD=FV=UmWZapMZgpwdonr-JOE7BB8ELn5DQCFWos_sC1v-eLzw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olofj@google.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Arun Kumar <arunkk.samsung@gmail.com>

On 01.05.2014 17:40, Doug Anderson wrote:
> Arun,
>
> On Wed, Apr 30, 2014 at 4:08 AM, Arun Kumar K <arun.kk@samsung.com> wrote:
>> +       memory {
>> +               reg = <0x20000000 0x80000000>;
>
> As mentioned in the other thread, I think this should be 0 0

I guess it may depend on your boards, but DT might contain safe default 
configuration that would work on all variants, so if you have for 
example 1 GiB and 2 GiB variants, 1 GiB configuration here should be 
fine to get the board running even without a bootloader that could 
inject remaining data.

>
>> +&pinctrl_0 {
>> +       tpm_irq: tpm-irq {
>> +               samsung,pins = "gpx1-0";
>> +               samsung,pin-function = <0>;
>> +               samsung,pin-pud = <0>;
>
> Is there any way to use the #defines PIN_PULL_NONE here?

I wonder if we already have this kind of #define defined. Keep in mind 
that this value is specific for Exynos SoCs, so we would need to define 
it in Exynos-specific header, like include/dt-bindings/pinctrl/exynos.h.

>
>> +&pinctrl_3 {
>> +       backlight_pwm: backlight-pwm {
>> +               samsung,pins = "gpb2-0";
>> +               samsung,pin-function = <2>;
>> +               samsung,pin-pud = <0>;
>> +               samsung,pin-drv = <0>;
>> +       };
>
> The PWM probably belongs in exynos5420-pinctrl.dtsi (though you'd need
> to call it by a more generic name since it could be used for something
> other than a backlight).

Yes, please add generic pinctrl nodes for all PWM outputs on the SoC to 
exynos5420-pinctrl.dtsi, as done in exynos4x12-pinctrl.dtsi (see 
pwmX-out nodes).

Best regards,
Tomasz
