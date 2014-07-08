From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] pinctrl: samsung: Decouple direction setting from pinctrl
Date: Tue, 8 Jul 2014 10:54:19 +0200
Message-ID: <CACRpkdZ_Ec-1BNOema4Y4GfQnpQ931b9DKg4ngndQD_8GSuW7Q@mail.gmail.com>
References: <1404315664-3174-1-git-send-email-t.figa@samsung.com>
	<1404315664-3174-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:53968 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753013AbaGHIyT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 04:54:19 -0400
Received: by mail-oa0-f47.google.com with SMTP id n16so6022124oag.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Jul 2014 01:54:19 -0700 (PDT)
In-Reply-To: <1404315664-3174-2-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>

On Wed, Jul 2, 2014 at 5:40 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch makes the pinctrl-samsung driver configure GPIO direction on
> its own, without using the pinctrl_gpio_direction_*() "helpers". The
> rationale behind this change is as follows:
>  - pinctrl-samsung does not need translation from GPIO namespace to
>    pinctrl namespace to handle GPIO operations - GPIO chip and offset
>    therein are enough to calculate necessary offsets and bit masks in
>    constant time,
>  - the pinctrl_gpio_direction_*() functions do not do anything useful
>    other than translating the pin into pinctrl namespace and calling the
>    .gpio_set_direction() from pinmux_ops of the controller,
>  - the undesirable side effect of using those helpers is losing the
>    ability to change GPIO direction in atomic context, because they
>    explicitly use a mutex for synchronization,
>
> Results of this patch are:
>  - fixed warnings about scheduling while atomic in code that needs to
>    set GPIO direction in atomic context (e.g. interrupt handler),
>  - reduced overhead of bitbanging drivers that use gpio_direction_*(),
>    e.g. i2c-gpio.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>

Well the cross-call function is actually mostly for the case when
the pinctrl and GPIO drivers are in different files, or you combine
two IP blocks arbitrarily. It's a bit messy anyway.

Patch applied.

Yours,
Linus Walleij
