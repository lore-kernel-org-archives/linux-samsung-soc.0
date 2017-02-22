From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix memory mapping code
Date: Wed, 22 Feb 2017 19:02:02 +0200
Message-ID: <20170222170202.heu35anyoziwv23n@kozik-lap>
References: <CGME20170222074421eucas1p17bbab9c297450bca1c5908ada16d2fa6@eucas1p1.samsung.com>
 <1487749442-23806-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1487749442-23806-1-git-send-email-a.hajda@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Feb 22, 2017 at 08:44:02AM +0100, Andrzej Hajda wrote:
> Some pinctrls share memory regions, and devm_ioremap_resource does not
> allow to share resources, in opposition to devm_ioremap.
> This patch restores back usage of devm_ioremap function, but with proper
> error handling and logging.
> 
> Fixes: baafaca ("pinctrl: samsung: Fix return value check in samsung_pinctrl_get_soc_data()")
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index f9ddba7..ebecff8 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -988,9 +988,12 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
>  
>  	for (i = 0; i < ctrl->nr_ext_resources + 1; i++) {
>  		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> -		virt_base[i] = devm_ioremap_resource(&pdev->dev, res);
> -		if (IS_ERR(virt_base[i]))
> -			return ERR_CAST(virt_base[i]);
> +		virt_base[i] = devm_ioremap(&pdev->dev, res->start,
> +						resource_size(res));

A little bit out of scope of this patch: don't we need here a check
for if (!res)? With devm_ioremap_resource it wasn't needed but
platform_get_resource might return NULL and here you are dereferencing
it.

This might be though a separate patch as you try to revert broken
behavior to previous code.


Best regards,
Krzysztof


> +		if (!virt_base[i]) {
> +			dev_err(&pdev->dev, "failed to ioremap %pR\n", res);
> +			return ERR_PTR(-EIO);
> +		}
>  	}
>  
>  	bank = d->pin_banks;
> -- 
> 2.7.4
> 
