From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH] thermal: exynos: use of_property_read_u8()
Date: Mon, 23 Nov 2015 15:29:38 -0800
Message-ID: <20151123232933.GB6815@localhost.localdomain>
References: <1448287841-4816-1-git-send-email-saurabh.truth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:35381 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753360AbbKWX3m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Nov 2015 18:29:42 -0500
Content-Disposition: inline
In-Reply-To: <1448287841-4816-1-git-send-email-saurabh.truth@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Saurabh Sengar <saurabh.truth@gmail.com>
Cc: l.majewski@samsung.com, rui.zhang@intel.com, kgene@kernel.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 23, 2015 at 07:40:41PM +0530, Saurabh Sengar wrote:
> use of_property_read_u8() for u8 variables,
> also changed the return type to void as this function return type
> is nowhere used.
> 

I would be good if you could split both changes into two patches.

Also, I still do not understand properly the proposal to use u8.

Why are they u8?

If they are so, please document them in their DT bindings. Today, the
bindings tell us they are s32 (as there is nothing really specifying the
type).


BR


> Signed-off-by: Saurabh Sengar <saurabh.truth@gmail.com>
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 30 +++++++++++++-----------------
>  1 file changed, 13 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index fa61eff..b692c95 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -1128,20 +1128,16 @@ static int exynos_of_get_soc_type(struct device_node *np)
>  	return -EINVAL;
>  }
>  
> -static int exynos_of_sensor_conf(struct device_node *np,
> +static void exynos_of_sensor_conf(struct device_node *np,
>  				 struct exynos_tmu_platform_data *pdata)
>  {
> -	u32 value;
> -	int ret;
> -
>  	of_node_get(np);
>  
> -	ret = of_property_read_u32(np, "samsung,tmu_gain", &value);
> -	pdata->gain = (u8)value;
> -	of_property_read_u32(np, "samsung,tmu_reference_voltage", &value);
> -	pdata->reference_voltage = (u8)value;
> -	of_property_read_u32(np, "samsung,tmu_noise_cancel_mode", &value);
> -	pdata->noise_cancel_mode = (u8)value;
> +	of_property_read_u8(np, "samsung,tmu_gain", &pdata->gain);
> +	of_property_read_u8(np, "samsung,tmu_reference_voltage",
> +				&pdata->reference_voltage);
> +	of_property_read_u8(np, "samsung,tmu_noise_cancel_mode",
> +				&pdata->noise_cancel_mode);
>  
>  	of_property_read_u32(np, "samsung,tmu_efuse_value",
>  			     &pdata->efuse_value);
> @@ -1150,18 +1146,18 @@ static int exynos_of_sensor_conf(struct device_node *np,
>  	of_property_read_u32(np, "samsung,tmu_max_efuse_value",
>  			     &pdata->max_efuse_value);
>  
> -	of_property_read_u32(np, "samsung,tmu_first_point_trim", &value);
> -	pdata->first_point_trim = (u8)value;
> -	of_property_read_u32(np, "samsung,tmu_second_point_trim", &value);
> -	pdata->second_point_trim = (u8)value;
> -	of_property_read_u32(np, "samsung,tmu_default_temp_offset", &value);
> -	pdata->default_temp_offset = (u8)value;
> +	of_property_read_u8(np, "samsung,tmu_first_point_trim",
> +				&pdata->first_point_trim);
> +	of_property_read_u8(np, "samsung,tmu_second_point_trim",
> +				&pdata->second_point_trim);
> +	of_property_read_u8(np, "samsung,tmu_default_temp_offset",
> +				&pdata->default_temp_offset);
>  
>  	of_property_read_u32(np, "samsung,tmu_cal_type", &pdata->cal_type);
>  	of_property_read_u32(np, "samsung,tmu_cal_mode", &pdata->cal_mode);
>  
>  	of_node_put(np);
> -	return 0;
> +	return;

The landing return; is not needed.

>  }
>  
>  static int exynos_map_dt_data(struct platform_device *pdev)
> -- 
> 1.9.1
> 
