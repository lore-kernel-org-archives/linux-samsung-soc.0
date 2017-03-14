From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next v2] pinctrl: samsung: Fix return value check in samsung_pinctrl_get_soc_data()
Date: Tue, 14 Mar 2017 11:29:28 +0100
Message-ID: <CACRpkda1tALy3rmk7FebnR3Xg4WOuUc0Gv1xAmxkd+RLhJ_1VQ@mail.gmail.com>
References: <20170125140321.23911-1-weiyj.lk@gmail.com> <20170205155849.4362-1-weiyj.lk@gmail.com>
 <CGME20170213145008epcas3p119bdd6f76468a00fb8d796308ad37698@epcas3p1.samsung.com>
 <CACRpkda0BYLNpPFwpNaEMdeyx61KDUQz_6Y=FQj340pViFjVVQ@mail.gmail.com> <c4dd122b-0312-fcca-08e2-4d4586949a88@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:36207 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750785AbdCNK3b (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 06:29:31 -0400
Received: by mail-io0-f181.google.com with SMTP id l7so101224305ioe.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Mar 2017 03:29:30 -0700 (PDT)
In-Reply-To: <c4dd122b-0312-fcca-08e2-4d4586949a88@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Wei Yongjun <weiyongjun1@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, =?UTF-8?B?64yA7J246riw?= <inki.dae@samsung.com>, =?UTF-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>, =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>

On Tue, Feb 21, 2017 at 2:49 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:

> Sadly this patch breaks support for IMEM pinctrl block on Exynos5433/TM2
> and it took us some time to find the source of the problem.
>
> devm_ioremap_resource() is not functionally a full equivalent of
> devm_ioremap(). The problem here is that registers for IMEM and ALIVE
> pin controllers are shared and both devices have <0x11090000 0x1000>
> range in their reg property. devm_ioremap_resource() maps given
> resource exclusively for the device, while devm_ioremap() allows
> non-exclusive mappings.
>
> This patch has to be reverted asap.

Patch reverted for fixes, copying the above text as commit message.

Yours,
Linus Walleij
