From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] pinctrl: exynos: Remove eint_gpio_init call-back for
 exynos7 alive pinctrl block
Date: Mon, 9 Mar 2015 19:24:29 +0900
Message-ID: <CA+Ln22HGH3r6UEYtCPU7Y4a0-b4FKnx8d0VcA3a1-m1VD5Jm=w@mail.gmail.com>
References: <1425226876-5122-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:37006 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754021AbbCIKY3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Mar 2015 06:24:29 -0400
Received: by oigi138 with SMTP id i138so28318226oig.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Mar 2015 03:24:29 -0700 (PDT)
In-Reply-To: <1425226876-5122-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Abhilash, Linus,

2015-03-02 1:21 GMT+09:00 Abhilash Kesavan <a.kesavan@samsung.com>:
> The alive pin controller on exynos7 does not support external gpio
> interrupts. Hence, remove the eint_gpio_init call-back for it. This
> fixes the following error message seen during exynos7 boot-up:
> "samsung-pinctrl 10580000.pinctrl: irq number not available"

As long as "external gpio interrupts" refer to non-wake-up-capable
GPIO interrupts I'm fine with this patch.

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Thanks Linus for pinging and sorry for delay.

Best regards,
Tomasz
