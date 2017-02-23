From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] pinctrl: samsung: Fix memory mapping code
Date: Thu, 23 Feb 2017 13:37:03 +0200
Message-ID: <CAJKOXPdjGaA4yYBsby5pVENos2iQM_zaRxo_19sN2fHt9Jru2Q@mail.gmail.com>
References: <CGME20170223101244eucas1p2eddf13a013d66f9ccdbe45f410b5939c@eucas1p2.samsung.com>
 <20170222170202.heu35anyoziwv23n@kozik-lap> <1487844760-26272-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:54824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751032AbdBWMbN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Feb 2017 07:31:13 -0500
In-Reply-To: <1487844760-26272-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On Thu, Feb 23, 2017 at 12:12 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
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
>
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Thanks for update. Looks good:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
