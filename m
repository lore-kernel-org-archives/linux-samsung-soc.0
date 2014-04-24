From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] thermal: samsung: Only update available threshold limits
Date: Thu, 24 Apr 2014 08:47:54 +0530
Message-ID: <53588262.5020104@linaro.org>
References: <1397453895-6688-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:40929 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752102AbaDXDR7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Apr 2014 23:17:59 -0400
Received: by mail-pb0-f43.google.com with SMTP id um1so1464114pbc.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2014 20:17:58 -0700 (PDT)
In-Reply-To: <1397453895-6688-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Cc: rui.zhang@intel.com, eduardo.valentin@ti.com, Amit Daniel Kachhap <amit.daniel@samsung.com>

On 04/14/2014 11:08 AM, Tushar Behera wrote:
> Currently the threshold limits are updated in 2 stages, once for all
> software trigger levels and again for hardware trip point.
> 
> While updating the software trigger levels, it overwrites the threshold
> limit for hardware trip point thereby forcing the Exynos core to issue
> an emergency shutdown.
> 
> Updating only the required fields in threshold register fixes this issue.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> Based on v3.15-rc1.
> 
>  drivers/thermal/samsung/exynos_tmu.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index 0d96a51..ffccc89 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -225,6 +225,8 @@ skip_calib_data:
>  			trigger_levs++;
>  	}
>  
> +	rising_threshold = readl(data->base + reg->threshold_th0);
> +
>  	if (data->soc == SOC_ARCH_EXYNOS4210) {
>  		/* Write temperature code for threshold */
>  		threshold_code = temp_to_code(data, pdata->threshold);
> @@ -249,6 +251,7 @@ skip_calib_data:
>  				ret = threshold_code;
>  				goto out;
>  			}
> +			rising_threshold &= ~(0xff << 8 * i);
>  			rising_threshold |= threshold_code << 8 * i;
>  			if (pdata->threshold_falling) {
>  				threshold_code = temp_to_code(data,
> @@ -281,6 +284,7 @@ skip_calib_data:
>  			}
>  			if (i == EXYNOS_MAX_TRIGGER_PER_REG - 1) {
>  				/* 1-4 level to be assigned in th0 reg */
> +				rising_threshold &= ~(0xff << 8 * i);
>  				rising_threshold |= threshold_code << 8 * i;
>  				writel(rising_threshold,
>  					data->base + reg->threshold_th0);
> 

Adding Amit to get Samsung specific review.

-- 
Tushar Behera
