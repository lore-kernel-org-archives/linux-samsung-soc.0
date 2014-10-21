From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] regulator: max77686: Implement suspend disable
 for some LDOs
Date: Tue, 21 Oct 2014 14:00:15 +0200
Message-ID: <54464ACF.7000805@collabora.co.uk>
References: <1413890597-31037-1-git-send-email-k.kozlowski@samsung.com> <1413890597-31037-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413890597-31037-3-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 10/21/2014 01:23 PM, Krzysztof Kozlowski wrote:
> Some LDOs of Maxim 77686 PMIC support disabling during system suspend
> (LDO{2,6,7,8,10,11,12,14,15,16}). This was already implemented as part
> of set_suspend_mode function. In that case the mode was one of:
>  - disable,
>  - normal mode,
>  - low power mode.
> However there are no bindings for setting the mode during suspend.
> 
> Add suspend disable for LDO regulators supporting this to the existing
> max77686_buck_set_suspend_disable() function. This helps reducing
> energy consumption during system sleep.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/regulator/max77686.c | 33 ++++++++++++++++++++++++++++-----
>  1 file changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max77686.c
> index cffe0c69d57d..05df72d584bf 100644
> --- a/drivers/regulator/max77686.c
> +++ b/drivers/regulator/max77686.c
> @@ -79,17 +79,33 @@ struct max77686_data {
>  };
>  
>  /* Some BUCKS supports Normal[ON/OFF] mode during suspend */
> -static int max77686_buck_set_suspend_disable(struct regulator_dev *rdev)
> +static int max77686_set_suspend_disable(struct regulator_dev *rdev)
>  {
>  	unsigned int val;
>  	struct max77686_data *max77686 = rdev_get_drvdata(rdev);
>  	int ret, id = rdev_get_id(rdev);
>  
> -	if (id == MAX77686_BUCK1)
> +	switch (id) {
> +	case MAX77686_BUCK1:
>  		val = MAX77686_OPMODE_OFF_PWRREQ;
> -	else
> +		break;
> +	case MAX77686_BUCK2:
> +	case MAX77686_BUCK3:
> +	case MAX77686_BUCK4:
>  		val = MAX77686_OPMODE_OFF_PWRREQ
>  			<< MAX77686_OPMODE_BUCK234_SHIFT;
> +		break;
> +	case MAX77686_LDO2:
> +	case MAX77686_LDO6 ... MAX77686_LDO8:
> +	case MAX77686_LDO10 ... MAX77686_LDO12:
> +	case MAX77686_LDO14 ... MAX77686_LDO16:
> +		val = MAX77686_OPMODE_OFF_PWRREQ << MAX77686_OPMODE_SHIFT;
> +		break;
> +	default:
> +		pr_warn("%s: regulator_suspend_disable not supported\n",
> +			rdev->desc->name);
> +		return -EINVAL;
> +	}
>  
>  	ret = regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
>  				 rdev->desc->enable_mask, val);
> @@ -171,6 +187,9 @@ static int max77686_enable(struct regulator_dev *rdev)
>  {
>  	struct max77686_data *max77686 = rdev_get_drvdata(rdev);
>  
> +	if (max77686->opmode[rdev_get_id(rdev)] == MAX77686_OPMODE_OFF_PWRREQ)
> +		max77686->opmode[rdev_get_id(rdev)] = MAX77686_OPMODE_NORMAL;
> +
>  	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
>  				  rdev->desc->enable_mask,
>  				  max77686->opmode[rdev_get_id(rdev)]);
> @@ -223,6 +242,8 @@ static struct regulator_ops max77686_ldo_ops = {
>  	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
>  	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
>  	.set_suspend_mode	= max77686_ldo_set_suspend_mode,
> +	.set_suspend_disable	= max77686_set_suspend_disable,
> +	.set_suspend_enable	= max77686_enable,
>  };
>  
>  static struct regulator_ops max77686_buck1_ops = {
> @@ -234,7 +255,8 @@ static struct regulator_ops max77686_buck1_ops = {
>  	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
>  	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
>  	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
> -	.set_suspend_disable	= max77686_buck_set_suspend_disable,
> +	.set_suspend_disable	= max77686_set_suspend_disable,
> +	.set_suspend_enable	= max77686_enable,
>  };
>  
>  static struct regulator_ops max77686_buck_dvs_ops = {
> @@ -247,7 +269,8 @@ static struct regulator_ops max77686_buck_dvs_ops = {
>  	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
>  	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
>  	.set_ramp_delay		= max77686_set_ramp_delay,
> -	.set_suspend_disable	= max77686_buck_set_suspend_disable,
> +	.set_suspend_disable	= max77686_set_suspend_disable,
> +	.set_suspend_enable	= max77686_enable,
>  };
>  
>  #define regulator_desc_ldo(num)		{				\
> 

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
