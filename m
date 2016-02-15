From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] pinctrl: samsung: Fixes samsung_gpio_direction_in/output
 releated with spinlock
Date: Mon, 15 Feb 2016 20:48:08 +0100
Message-ID: <CACRpkdYQY4KTHwcVMJY+uYB=pV2b2JWKDnZADZ1Z+UU=GkbrRQ@mail.gmail.com>
References: <1454946568-23604-1-git-send-email-ym0914@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34857 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751227AbcBOTsI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 14:48:08 -0500
Received: by mail-ob0-f176.google.com with SMTP id xk3so225875460obc.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Feb 2016 11:48:08 -0800 (PST)
In-Reply-To: <1454946568-23604-1-git-send-email-ym0914@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Youngmin Nam <ym0914@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Mon, Feb 8, 2016 at 4:49 PM, Youngmin Nam <ym0914@gmail.com> wrote:

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
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

This v4 applied.

I renamed the commit "fix SMP race condition" which is what it's all
about AFAICT.

Yours,
Linus Walleij
