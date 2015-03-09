From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: exynos: Remove eint_gpio_init call-back for
 exynos7 alive pinctrl block
Date: Mon, 9 Mar 2015 11:08:49 +0100
Message-ID: <CACRpkdY+Cuqi9_ysUc50aoUny8TAtLc91yfFKdA3VRt-5VyAjw@mail.gmail.com>
References: <1425226876-5122-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35703 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932108AbbCIKIt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Mar 2015 06:08:49 -0400
Received: by oifz81 with SMTP id z81so28243002oif.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Mar 2015 03:08:49 -0700 (PDT)
In-Reply-To: <1425226876-5122-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Sun, Mar 1, 2015 at 5:21 PM, Abhilash Kesavan <a.kesavan@samsung.com> wrote:

> The alive pin controller on exynos7 does not support external gpio
> interrupts. Hence, remove the eint_gpio_init call-back for it. This
> fixes the following error message seen during exynos7 boot-up:
> "samsung-pinctrl 10580000.pinctrl: irq number not available"
>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>

Tomasz, can you look at this patch?

Yours,
Linus Walleij
