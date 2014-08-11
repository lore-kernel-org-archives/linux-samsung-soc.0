From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] pinctrl: exynos: Lock GPIOs as interrupts when used
 as EINTs
Date: Mon, 11 Aug 2014 10:35:57 +0200
Message-ID: <CACRpkdZLCzNbpmWFAT=OD5zqyq-7cuLXcUo3FvnH-pkf3zrYBA@mail.gmail.com>
References: <1407541685-20021-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:49563 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751584AbaHKIf5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Aug 2014 04:35:57 -0400
Received: by mail-oa0-f43.google.com with SMTP id i7so5888700oag.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Aug 2014 01:35:57 -0700 (PDT)
In-Reply-To: <1407541685-20021-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Tomasz Figa <t.figa@samsung.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nick Dyer <nick.dyer@itdev.co.uk>, Stephen Warren <swarren@nvidia.com>, Yufeng Shen <miletus@chromium.org>, Benson Leung <bleung@chromium.org>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Tomasz Figa <tomasz.figa@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Aug 9, 2014 at 1:48 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:

> From: Tomasz Figa <t.figa@samsung.com>
>
> Currently after configuring a GPIO pin as an interrupt related pinmux
> registers are changed, but there is no protection from calling
> gpio_direction_*() in a badly written driver, which would cause the same
> pinmux register to be reconfigured for regular input/output and this
> disabling interrupt capability of the pin.
>
> This patch addresses this issue by moving pinmux reconfiguration to
> .irq_{request,release}_resources() callback of irq_chip and calling
> gpio_lock_as_irq() helper to prevent reconfiguration of pin direction.
>
> Setting up a GPIO interrupt on Samsung SoCs is a two-step operation -
> in addition to trigger configuration in a dedicated register, the pinmux
> must be also reconfigured to GPIO interrupt, which is a different function
> than normal GPIO input, although I/O-wise they both behave in the same way
> and gpio_get_value() can be used on a pin configured as IRQ as well.
>
> Such design implies subtleties such as gpio_direction_input() not having
> to fail if a pin is already configured as an interrupt nor change the
> configuration to normal input. But the FLAG_USED_AS_IRQ set in gpiolib by
> gpio_lock_as_irq() is only used to check that gpio_direction_output() is
> not called, it's not used to prevent gpio_direction_input() to be called.
> So this is not a complete solution for Samsung SoCs but it's definitely a
> move in the right direction.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> [javier: use request resources instead of startup and expand commit message]
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>
> This patch solves the issue explained in https://lkml.org/lkml/2014/8/8/461

Hm, this looks much better atleast, it is not possible to use the
irqchip helpers from gpiolib then, because that grabs the request/release
resource callbacks.

If I get some ACKs on this we can go for this solution.

Yours,
Linus Walleij
