From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: samsung: Fix memory mapping code
Date: Tue, 14 Mar 2017 14:35:31 +0100
Message-ID: <CACRpkdbWxRVf5aVJYFMzYEzY+UvK3-vk59U=dNdK113wYOpkOw@mail.gmail.com>
References: <CGME20170223101244eucas1p2eddf13a013d66f9ccdbe45f410b5939c@eucas1p2.samsung.com>
 <20170222170202.heu35anyoziwv23n@kozik-lap> <1487844760-26272-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:34793 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751774AbdCNNfd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 09:35:33 -0400
Received: by mail-io0-f182.google.com with SMTP id b140so10323889iof.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Mar 2017 06:35:33 -0700 (PDT)
In-Reply-To: <1487844760-26272-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Thu, Feb 23, 2017 at 11:12 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:

> Some pinctrls share memory regions, and devm_ioremap_resource does not
> allow to share resources, in opposition to devm_ioremap.
> This patch restores back usage of devm_ioremap function, but with proper
> error handling and logging.
>
> Fixes: baafaca ("pinctrl: samsung: Fix return value check in samsung_pinctrl_get_soc_data()")
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
> v2:
> - added platform_get_resource error check (thanks to Krzysztof)

This conflicts with the revert that Marek urged me to do for the
fixes branch.

Please check the resulting tree on my fixes branch and rebase on
that.

Yours,
Linus Walleij
