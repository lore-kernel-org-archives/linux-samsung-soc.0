From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2] pinctrl: samsung: Fixes samsung_gpio_direction_in/output
 releated with spinlock
Date: Wed, 27 Jan 2016 22:51:51 +0900
Message-ID: <CA+Ln22GZ9SRD7qo-mcmh68ssmJDh6OxoYM831ATMPgJ3hNj7Ww@mail.gmail.com>
References: <1453615352-9748-1-git-send-email-ym0914@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:33360 "EHLO
	mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932385AbcA0Nvw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jan 2016 08:51:52 -0500
Received: by mail-qk0-f196.google.com with SMTP id q184so294751qkb.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jan 2016 05:51:52 -0800 (PST)
In-Reply-To: <1453615352-9748-1-git-send-email-ym0914@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Youngmin Nam <ym0914@gmail.com>
Cc: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Youngmin,

2016-01-24 15:02 GMT+09:00 Youngmin Nam <ym0914@gmail.com>:
> Previously, samsung_gpio_drection_in/output function were not covered with
> one spinlock.
>
> For example, samsung_gpio_direction_output function consists of two functions.
> 1. samsung_gpio_set
> 2. samsung_gpio_set_direction
>
> When 2 CPUs try to control the same gpio pin heavily,
> (situation like i2c control with gpio emulation)
> This situation can cause below problem.
>
> CPU 0                                   | CPU1
>                                         |
> samsung_gpio_direction_output           |
>    samsung_gpio_set(pin A as 1)         | samsung_gpio_direction_output
>                                         |    samsung_gpio_set(pin A as 0)
>    samsung_gpio_set_direction           |
>                                         |    samsung_gpio_set_direction
>
> The initial value of pin A will be set as 0 while we wanted to set pin A as 1.
>
> This patch modifies samsung_gpio_direction_in/output function
> to be done in one spinlock to fix race condition.
>
> Additionally, the new samsung_gpio_set_value was added to implement
> gpio set callback(samsung_gpio_set) with spinlock using this function.
>
> Signed-off-by: Youngmin Nam <ym0914@gmail.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 48 ++++++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 13 deletions(-)
>

Thanks for addressing my comments.

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

However please rebase as Linus suggested.

Best regards,
Tomasz
