From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] hwrng: exynos - Signedness bug in exynos_trng_do_read()
Date: Wed, 10 Jan 2018 11:06:56 +0100
Message-ID: <CAJKOXPd0EzE02OOC0zqsNOxO7p6zuhPCdGs_okF_-X0sWWxZOA@mail.gmail.com>
References: <20180110093658.kxnmhqkoow7o2xab@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933723AbeAJKG7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 10 Jan 2018 05:06:59 -0500
In-Reply-To: <20180110093658.kxnmhqkoow7o2xab@mwanda>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 10, 2018 at 10:36 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> "val" needs to be signed for the error handling to work.
>
> Fixes: 6cd225cc5d8a ("hwrng: exynos - add Samsung Exynos True RNG driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
> index 34d6f51ecbee..f4643e3ec346 100644
> --- a/drivers/char/hw_random/exynos-trng.c
> +++ b/drivers/char/hw_random/exynos-trng.c
> @@ -55,7 +55,7 @@ static int exynos_trng_do_read(struct hwrng *rng, void *data, size_t max,
>                                bool wait)
>  {
>         struct exynos_trng_dev *trng;
> -       u32 val;
> +       int val;

It seems that one forgot to run Smatch on the driver :).

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
