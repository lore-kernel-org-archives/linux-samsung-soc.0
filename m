From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [RFT v3 06/14] regulator: max77802: Remove support for board
 files
Date: Thu, 30 Oct 2014 12:50:45 +0100
Message-ID: <54522615.7040002@collabora.co.uk>
References: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com> <1414668053-31370-7-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414668053-31370-7-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 10/30/2014 12:20 PM, Krzysztof Kozlowski wrote:
>  static int max77802_pmic_probe(struct platform_device *pdev)
>  {
>  	struct max77686_dev *iodev = dev_get_drvdata(pdev->dev.parent);
> -	struct max77686_platform_data *pdata = dev_get_platdata(iodev->dev);
>  	struct max77802_regulator_prv *max77802;
> -	int i, ret = 0, val;
> +	int i, val;
>  	struct regulator_config config = { };
>  
> -	/* This is allocated by the MFD driver */
> -	if (!pdata) {
> -		dev_err(&pdev->dev, "no platform data found for regulator\n");
> -		return -ENODEV;
> -	}
> -
>  	max77802 = devm_kzalloc(&pdev->dev,
>  				sizeof(struct max77802_regulator_prv),
>  				GFP_KERNEL);
>  	if (!max77802)
>  		return -ENOMEM;
>  
> -	if (iodev->dev->of_node) {
> -		ret = max77802_pmic_dt_parse_pdata(pdev, pdata);
> -		if (ret)
> -			return ret;
> +	if (!pdev->dev.of_node) {
> +		/*
> +		 * Backward DTS compatiblity where regulator driver had not
> +		 * a compatible property for itself.
> +		 */
> +		if (!iodev->dev->of_node) {
> +			dev_err(&pdev->dev, "No OF node for driver and its parent\n");
> +			return -EINVAL;
> +		}
> +		pdev->dev.of_node = of_get_child_by_name(iodev->dev->of_node,
> +								"regulators");
> +		max77802->missing_of_node = true;
>  	}

I may be missing something but I don't understand why a compatible string
for the regulators sub-node is needed. Isn't enough to just fill the
.regulators_node field in the struct regulator_desc? e.g:

    .regulators_node = of_match_ptr("regulators") for max77802
    .regulators_node = of_match_ptr("voltage-regulators") for max77686

AFAIU this should be enough for the core to extract the init_data and will
make your change much more simpler and you can drop patches 1-3 and 13-14.

Or maybe I misread the regulator_of_get_init_data() function?

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
