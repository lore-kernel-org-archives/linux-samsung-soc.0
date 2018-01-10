From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH -next] hwrng: exynos - remove redundant dev_err call in exynos_trng_probe()
Date: Wed, 10 Jan 2018 15:24:19 +0100
Message-ID: <CAJKOXPfQKHNxNe-3kOTpp9rUSoh3nLVhBxtZiyDJSoBgKLR4vg@mail.gmail.com>
References: <1515591059-73230-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965159AbeAJOYW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 10 Jan 2018 09:24:22 -0500
In-Reply-To: <1515591059-73230-1-git-send-email-weiyongjun1@huawei.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: l.stelmach@samsung.com, mpm@selenic.com, herbert@gondor.apana.org.au, arnd@arndb.de, gregkh@linuxfoundation.org, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 10, 2018 at 2:30 PM, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/char/hw_random/exynos-trng.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
