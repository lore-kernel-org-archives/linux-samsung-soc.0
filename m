From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: samsung: Fixes samsung_gpio_direction_in/output
 releated with spinlock
Date: Wed, 27 Jan 2016 13:36:04 +0100
Message-ID: <CACRpkdaTesQL+ginJdjg0LYD=re7-ot=VLnX_=th-0gSqcQx0Q@mail.gmail.com>
References: <1453615352-9748-1-git-send-email-ym0914@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:32939 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754197AbcA0MgF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jan 2016 07:36:05 -0500
Received: by mail-oi0-f41.google.com with SMTP id r14so4337775oie.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jan 2016 04:36:04 -0800 (PST)
In-Reply-To: <1453615352-9748-1-git-send-email-ym0914@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Youngmin Nam <ym0914@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Sun, Jan 24, 2016 at 7:02 AM, Youngmin Nam <ym0914@gmail.com> wrote:

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

This patch does not apply to v4.5-rc1. Please rebase this
and resend. (With Thomas ACK if it's valid.)

Yours,
Linus Walleij
