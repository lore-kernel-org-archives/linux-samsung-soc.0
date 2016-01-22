From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Fixes samsung_gpio_direction_in/output
 releated with spinlock
Date: Fri, 22 Jan 2016 13:27:57 +0900
Message-ID: <CA+Ln22FA4iBQs=uh4=q1qEcyy5hN-ujex=T+LQrg_hRFcfhsHg@mail.gmail.com>
References: <1453130462-3621-1-git-send-email-ym0914@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:33247 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675AbcAVE16 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jan 2016 23:27:58 -0500
Received: by mail-qg0-f45.google.com with SMTP id b35so49248868qge.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jan 2016 20:27:58 -0800 (PST)
In-Reply-To: <1453130462-3621-1-git-send-email-ym0914@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Youngmin Nam <ym0914@gmail.com>
Cc: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Youngmin,

2016-01-19 0:21 GMT+09:00 Youngmin Nam <ym0914@gmail.com>:
> Previously, samsung_gpio_drection_in/output function were not covered with
> one spinlock.
>

Thanks for the patch, nice catch. One nitpick inline, though.

> For example, samsung_gpio_direction_output function consists of two functions.
> 1. samsung_gpio_set
> 2. samsung_gpio_set_direction
[snip]
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -524,20 +524,26 @@ static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)

Can we, for consistency purposes, rename this function to
samsung_gpio_set_value() and keep the one that does locking as
samsung_gpio_set()?

This way we would match the gpio_chip op name (.set) and also have
both functions with the same name template (set_value and
set_direction) follow the same semantics of not doing any locking.

Also adding a comment above the new samsung_gpio_set_value() and
existing samsung_gpio_set_direction() that they have to be called with
bank->slock held would be helpful to avoid similar bugs in the future.

Best regards,
Tomasz
