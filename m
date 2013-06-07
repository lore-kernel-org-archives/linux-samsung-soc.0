From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: exynos5440: fix issues reported by prevent tool
Date: Fri, 7 Jun 2013 13:21:56 +0200
Message-ID: <CACRpkdY=6YQK9BY=T_OoA3H6awyNUaqEMd0kx6paSJ-dr6WKzw@mail.gmail.com>
References: <09d101ce6254$40813eb0$c183bc10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:42623 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755924Ab3FGLV7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Jun 2013 07:21:59 -0400
Received: by mail-ob0-f176.google.com with SMTP id v19so6343595obq.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Jun 2013 04:21:56 -0700 (PDT)
In-Reply-To: <09d101ce6254$40813eb0$c183bc10$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.ab@samsung.com>, Wei Yongjun <weiyj.lk@gmail.com>

On Thu, Jun 6, 2013 at 3:22 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> From: Thomas Abraham <thomas.ab@samsung.com>
>
> This patch fixes issues reported by prevent tool.
>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Patch applied except for this hunk:

> -       priv = devm_kzalloc(dev, sizeof(priv), GFP_KERNEL);
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);

That was already fixed by the patch
"pinctrl: exynos5440: fix invalid use of sizeof in exynos5440_pinctrl_probe()"
by Wei Yongjun.

Yours,
Linus Walleij
