From: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/3] mfd: sec-core: Disable buck voltage reset on watchdog
 falling edge
Date: Mon, 05 Oct 2015 15:35:54 +0200
Message-ID: <2375080.1KPJ21Fk4I@amdc1976>
References: <1443774351-28766-1-git-send-email-k.kozlowski@samsung.com>
 <1443774351-28766-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1443774351-28766-3-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


Hi,

On Friday, October 02, 2015 05:25:51 PM Krzysztof Kozlowski wrote:
> The WRSTBI bit (disabled by default but enabled by bootloader), when
> set, is responsible for resetting voltages to default values of
> certain bucks on falling edge of Warm Reset Input pin from AP.
> 
> However on some boards (with S2MPS13) the pin is pulled down so any
> suspend will effectively trigger the reset of bucks supplying the power
> to the little and big cores. In the same time when resuming, these bucks
> must provide voltage greater or equal to voltage before suspend to match
> the frequency chosen by cpufreq. If voltage (default value of voltage
> after reset) is lower than one set by cpufreq before suspend, then
> system will hang during resuming.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

I tested this (with some additional Exynos5433 patches) and it works
like expected (suspend/resume issue is fixed).

Tested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

You could also add:

Reported-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

(since the issue got narrowed down and reported to you by me :).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/mfd/sec-core.c              | 26 ++++++++++++++++++++++++++
>  include/linux/mfd/samsung/core.h    |  2 ++
>  include/linux/mfd/samsung/s2mps13.h |  1 +
>  3 files changed, 29 insertions(+)
> 
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 589e5efc2d7f..2626fc0b5b8c 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -262,6 +262,29 @@ static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)
>  		dev_dbg(sec_pmic->dev, "Revision: 0x%x\n", val);
>  }
>  
> +static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
> +{
> +	int err;
> +
> +	if (sec_pmic->device_type != S2MPS13X)
> +		return;
> +
> +	if (sec_pmic->pdata->disable_wrstbi) {
> +		/*
> +		 * If WRSTBI pin is pulled down this feature must be disabled
> +		 * because each Suspend to RAM will trigger buck voltage reset
> +		 * to default values.
> +		 */
> +		err = regmap_update_bits(sec_pmic->regmap_pmic,
> +					 S2MPS13_REG_WRSTBI,
> +					 S2MPS13_REG_WRSTBI_MASK, 0x0);
> +		if (err)
> +			dev_warn(sec_pmic->dev,
> +				 "Cannot initialize WRSTBI config: %d\n",
> +				 err);
> +	}
> +}
> +
>  #ifdef CONFIG_OF
>  /*
>   * Only the common platform data elements for s5m8767 are parsed here from the
> @@ -289,6 +312,8 @@ static struct sec_platform_data *sec_pmic_i2c_parse_dt_pdata(
>  
>  	pd->manual_poweroff = of_property_read_bool(dev->of_node,
>  						"samsung,s2mps11-acokb-ground");
> +	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
> +						"samsung,s2mps11-wrstbi-ground");
>  	return pd;
>  }
>  #else
> @@ -434,6 +459,7 @@ static int sec_pmic_probe(struct i2c_client *i2c,
>  		goto err_mfd;
>  
>  	device_init_wakeup(sec_pmic->dev, sec_pmic->wakeup);
> +	sec_pmic_configure(sec_pmic);
>  	sec_pmic_dump_rev(sec_pmic);
>  
>  	return ret;
> diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
> index aa78957e092f..a06098639399 100644
> --- a/include/linux/mfd/samsung/core.h
> +++ b/include/linux/mfd/samsung/core.h
> @@ -134,6 +134,8 @@ struct sec_platform_data {
>  	int				buck4_init;
>  	/* Whether or not manually set PWRHOLD to low during shutdown. */
>  	bool				manual_poweroff;
> +	/* Disable the WRSTBI (buck voltage warm reset) when probing? */
> +	bool				disable_wrstbi;
>  };
>  
>  /**
> diff --git a/include/linux/mfd/samsung/s2mps13.h b/include/linux/mfd/samsung/s2mps13.h
> index b1fd675fa36f..239e977ba45d 100644
> --- a/include/linux/mfd/samsung/s2mps13.h
> +++ b/include/linux/mfd/samsung/s2mps13.h
> @@ -184,5 +184,6 @@ enum s2mps13_regulators {
>   * Let's assume that default value will be set.
>   */
>  #define S2MPS13_BUCK_RAMP_DELAY		12500
> +#define S2MPS13_REG_WRSTBI_MASK		BIT(5)
>  
>  #endif /*  __LINUX_MFD_S2MPS13_H */

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
