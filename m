From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: add pinctrl_force_sleep() for "sleep"
 pinctrl state
Date: Fri, 22 Sep 2017 15:14:19 +0200
Message-ID: <CACRpkdY2UM0nEbqHgc9V=a-JvojPpaDdUt0WAFE=Foc+7Y=YFg@mail.gmail.com>
References: <CGME20170921123230epcas1p4d3c1de108af7d34053d2c4f40dd42119@epcas1p4.samsung.com>
 <006801d332d5$b0ca09d0$125e1d70$@samsung.com> <CA+Ln22GXr4TRDvgSm1HWQbucBjJ8c=dfnTOARXyM4EZU64QQww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:44436 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751876AbdIVNOU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Sep 2017 09:14:20 -0400
Received: by mail-it0-f50.google.com with SMTP id d192so1134881itd.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Sep 2017 06:14:20 -0700 (PDT)
In-Reply-To: <CA+Ln22GXr4TRDvgSm1HWQbucBjJ8c=dfnTOARXyM4EZU64QQww@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>
Cc: =?UTF-8?B?64Ko7JiB66+8?= <youngmin.nam@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Sep 21, 2017 at 6:14 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> This isn't a very good example, because pin-con-pdn and pin-pud-pdn
> are used to program dedicated sleep state registers in the pin
> controller and they can be programmed at any time. Typically one would
> include them in "default" state.

Yeah. Baolin added a special flag "sleep-hardware-state" to
indicate these special states, so the pin control driver can set them
up at first state instantiation.

> As for pins which don't have dedicated sleep state registers, i.e. the
> alive banks, which retain their value, the DT node of device
> associated with the pins would have "sleep" pinctrl state and its
> driver would activate it on suspend.

Correct.

> The only remaining use case would be pins in alive banks not
> associated with any device, but I can't imagine any practical case
> that would need to change the value on suspend in such case.

I think those could be made to work with hogs.

What also came up recently was pin controllers that
per se loose their state when the system suspends, so
the whole pin controller is kind of power-cycled and comes
up in some default state.

Florian is looking into a generic solution to that problem.

Yours,
Linus Walleij
