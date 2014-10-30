From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [RFT v3 05/14] regulator: max77802: Don't ignore return value
 of current opmode
Date: Thu, 30 Oct 2014 12:42:10 +0100
Message-ID: <54522412.1070808@collabora.co.uk>
References: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com> <1414668053-31370-6-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414668053-31370-6-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 10/30/2014 12:20 PM, Krzysztof Kozlowski wrote:
> The return value of regmap_read() of current opmode for regulator was
> silently ignored and whatever happened to be in 'val' variable was used
> as new opmode. This could lead to using bogus opmode.
> 
> Don't ignore what regmap_read() returns. If it fails just fall back to
> normal opmode.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/regulator/max77802.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/max77802.c b/drivers/regulator/max77802.c
> index b9958d927297..60daca2028e9 100644
> --- a/drivers/regulator/max77802.c
> +++ b/drivers/regulator/max77802.c
> @@ -606,7 +606,13 @@ static int max77802_pmic_probe(struct platform_device *pdev)
>  		config.of_node = pdata->regulators[i].of_node;
>  
>  		ret = regmap_read(iodev->regmap, regulators[i].enable_reg, &val);
> -		val = val >> shift & MAX77802_OPMODE_MASK;
> +		if (ret < 0) {
> +			dev_warn(&pdev->dev,
> +				"cannot read current mode for %d\n", i);
> +			val = MAX77802_OPMODE_NORMAL;
> +		} else {
> +			val = val >> shift & MAX77802_OPMODE_MASK;
> +		}
>  
>  		/*
>  		 * If the regulator is disabled and the system warm rebooted,
> 

Reviewed-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
