From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/6] pinctrl: samsung: Include pinctrl-exynos driver data conditionally
Date: Mon, 18 Mar 2013 22:38:58 +0100
Message-ID: <1733680.zsxXgkCci5@flatron>
References: <1363642315-10331-1-git-send-email-tomasz.figa@gmail.com> <1363642315-10331-3-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:56864 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933690Ab3CRVi7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Mar 2013 17:38:59 -0400
Received: by mail-ee0-f46.google.com with SMTP id e49so2891964eek.33
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Mar 2013 14:38:57 -0700 (PDT)
In-Reply-To: <1363642315-10331-3-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org

On Monday 18 of March 2013 22:31:51 Tomasz Figa wrote:
> Since pinctrl-samsung is a common part of the pin control support for
> several Samsung SoCs, it can be compiled without Exynos support enabled.
> 
> This patch surrounds Exynos-specific driver data with ifdefs to include
> them only when support for Exynos is enabled.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-samsung.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-samsung.c
> b/drivers/pinctrl/pinctrl-samsung.c index b1d4ac8..f1fb562 100644
> --- a/drivers/pinctrl/pinctrl-samsung.c
> +++ b/drivers/pinctrl/pinctrl-samsung.c
> @@ -968,10 +968,12 @@ static int samsung_pinctrl_probe(struct
> platform_device *pdev) }
> 
>  static const struct of_device_id samsung_pinctrl_dt_match[] = {
> +#ifdef CONFIG_PINCTRL_EXYNOS4

Oops... This should be CONFIG_PINCTRL_EXYNOS. It used to be EXYNOS4 in 
Kgene's tree (on which I usually base my patches) for some time, but it no 
longer is, but I forgot to change this during rebae.

Linus, if remaining patches turned out to be OK, would you fix this when 
applying?

Best regards,
Tomasz
