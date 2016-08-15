From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] pinctrl: exynos: remove duplicate calls in irq handler
Date: Mon, 15 Aug 2016 20:34:51 +0900
Message-ID: <CA+Ln22HWHRROhzVQo4ptsKr5xNyMh=dnuCO7FEG1BsinpPg8MQ@mail.gmail.com>
References: <1471256227-6282-1-git-send-email-strongbox8@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yb0-f193.google.com ([209.85.213.193]:33009 "EHLO
	mail-yb0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752684AbcHOLew (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Aug 2016 07:34:52 -0400
In-Reply-To: <1471256227-6282-1-git-send-email-strongbox8@zoho.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: perr <strongbox8@zoho.com>
Cc: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi,

2016-08-15 19:17 GMT+09:00 perr <strongbox8@zoho.com>:
> Because chained_irq_enter() has already called chip->irq_mask() and
> chip->irq_ack(), also chained_irq_exit() will call chip->irq_unmask(),
> so it's not necessary to call chip->irq_*() here.
>
> Signed-off-by: perr <strongbox8@zoho.com>
>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>

Indeed, nice finding. Thanks!

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz
