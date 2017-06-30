From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch 1/5] pinctrl: samsung: Remove bogus irq_[un]mask from
 resource management
Date: Fri, 30 Jun 2017 15:53:18 +0200
Message-ID: <CACRpkdazKNDdcoJxvJ9injibZmOTsdmN-Y0sTS5eyanwz=iFEA@mail.gmail.com>
References: <20170629213334.375848050@linutronix.de> <20170629214343.882576048@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:36421 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751560AbdF3NxU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Jun 2017 09:53:20 -0400
Received: by mail-io0-f176.google.com with SMTP id z62so24312445ioi.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jun 2017 06:53:20 -0700 (PDT)
In-Reply-To: <20170629214343.882576048@linutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Julia Cartwright <julia@ni.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Keeping <john@metanate.com>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Thu, Jun 29, 2017 at 11:33 PM, Thomas Gleixner <tglx@linutronix.de> wrote:

> The irq chip callbacks irq_request/release_resources() have absolutely no
> business with masking and unmasking the irq.
>
> The core code unmasks the interrupt after complete setup and masks it
> before invoking irq_release_resources().
>
> The unmask is actually harmful as it happens before the interrupt is
> completely initialized in __setup_irq().
>
> Remove it.
>
> Fixes: f6a8249f9e55 ("pinctrl: exynos: Lock GPIOs as interrupts when used as EINTs")
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org

Patch applied directly since it has no deps and fixes queued stuff for v4.13.
I guess Krysztof will make sure it doesn't break anything.

Yours,
Linus Walleij
