From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: Add peach-pit board support
Date: Thu, 1 May 2014 08:40:03 -0700
Message-ID: <CAD=FV=UmWZapMZgpwdonr-JOE7BB8ELn5DQCFWos_sC1v-eLzw@mail.gmail.com>
References: <1398856138-18837-1-git-send-email-arun.kk@samsung.com>
	<1398856138-18837-3-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f178.google.com ([209.85.128.178]:50130 "EHLO
	mail-ve0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752790AbaEAPkE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 May 2014 11:40:04 -0400
Received: by mail-ve0-f178.google.com with SMTP id jw12so4009400veb.37
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 May 2014 08:40:03 -0700 (PDT)
In-Reply-To: <1398856138-18837-3-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olofj@google.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Arun Kumar <arunkk.samsung@gmail.com>

Arun,

On Wed, Apr 30, 2014 at 4:08 AM, Arun Kumar K <arun.kk@samsung.com> wrote:
> +       memory {
> +               reg = <0x20000000 0x80000000>;

As mentioned in the other thread, I think this should be 0 0

> +&pinctrl_0 {
> +       tpm_irq: tpm-irq {
> +               samsung,pins = "gpx1-0";
> +               samsung,pin-function = <0>;
> +               samsung,pin-pud = <0>;

Is there any way to use the #defines PIN_PULL_NONE here?

> +&pinctrl_3 {
> +       backlight_pwm: backlight-pwm {
> +               samsung,pins = "gpb2-0";
> +               samsung,pin-function = <2>;
> +               samsung,pin-pud = <0>;
> +               samsung,pin-drv = <0>;
> +       };

The PWM probably belongs in exynos5420-pinctrl.dtsi (though you'd need
to call it by a more generic name since it could be used for something
other than a backlight).
