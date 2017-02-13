From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next v2] pinctrl: samsung: Fix return value check in samsung_pinctrl_get_soc_data()
Date: Mon, 13 Feb 2017 15:49:15 +0100
Message-ID: <CACRpkda0BYLNpPFwpNaEMdeyx61KDUQz_6Y=FQj340pViFjVVQ@mail.gmail.com>
References: <20170125140321.23911-1-weiyj.lk@gmail.com> <20170205155849.4362-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:35537 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751693AbdBMOtR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 09:49:17 -0500
Received: by mail-it0-f45.google.com with SMTP id 203so189511835ith.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Feb 2017 06:49:17 -0800 (PST)
In-Reply-To: <20170205155849.4362-1-weiyj.lk@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Feb 5, 2017 at 4:58 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> In case of error, the function devm_ioremap() returns NULL pointer not
> ERR_PTR(). Fix by using devm_ioremap_resource instead of devm_ioremap.
>
> Fixes: 8b1bd11c1f8f ("pinctrl: samsung: Add the support the multiple
> IORESOURCE_MEM for one pin-bank")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 -> v2: use devm_ioremap_resource instead of devm_ioremap

Patch applied with Krzysztof's ACK.

Yours,
Linus Walleij
