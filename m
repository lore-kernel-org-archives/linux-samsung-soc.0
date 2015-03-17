From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: exynos: Remove eint_gpio_init call-back for
 exynos7 alive pinctrl block
Date: Tue, 17 Mar 2015 13:23:18 +0100
Message-ID: <CACRpkdbGzA0yUdyR8n+BFvxMg5PwqgnSUpbL-4kVAPNN-i_aNw@mail.gmail.com>
References: <1425226876-5122-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:36253 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752789AbbCQMXT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 08:23:19 -0400
Received: by oigv203 with SMTP id v203so6356549oig.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Mar 2015 05:23:19 -0700 (PDT)
In-Reply-To: <1425226876-5122-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Sun, Mar 1, 2015 at 5:21 PM, Abhilash Kesavan <a.kesavan@samsung.com> wrote:

> The alive pin controller on exynos7 does not support external gpio
> interrupts. Hence, remove the eint_gpio_init call-back for it. This
> fixes the following error message seen during exynos7 boot-up:
> "samsung-pinctrl 10580000.pinctrl: irq number not available"
>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>

Patch applied with Tomasz ACK.

Yours,
Linus Walleij
