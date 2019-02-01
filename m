From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mfd: sec-core: Cleanup formatting to a consistent
 style
Date: Fri, 1 Feb 2019 09:21:14 +0000
Message-ID: <20190201092114.GE783@dell>
References: <1548761153-28114-1-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548761153-28114-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 29 Jan 2019, Krzysztof Kozlowski wrote:

> Cleanup the formatting to have consistent style across the file (only
> white-space issues).  No expected difference in code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mfd/sec-core.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index e0835c9df7a1..c3bb53f79e63 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -70,9 +70,11 @@ static const struct mfd_cell s2mps11_devs[] = {
>  };
>  
>  static const struct mfd_cell s2mps13_devs[] = {
> -	{ .name = "s2mps13-regulator", },
> -	{ .name = "s2mps13-rtc", },

I prefer one liners to remain on one line.

>  	{
> +		.name = "s2mps13-regulator",
> +	}, {
> +		.name = "s2mps13-rtc",
> +	}, {
>  		.name = "s2mps13-clk",
>  		.of_compatible = "samsung,s2mps13-clk",
>  	},
> @@ -114,7 +116,8 @@ static const struct mfd_cell s2mpu02_devs[] = {
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id sec_dt_match[] = {
> -	{	.compatible = "samsung,s5m8767-pmic",
> +	{
> +		.compatible = "samsung,s5m8767-pmic",
>  		.data = (void *)S5M8767X,

All of the other changes are fine.

>  	}, {
>  		.compatible = "samsung,s2mps11-pmic",
> @@ -309,8 +312,8 @@ static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
>   * the sub-modules need not instantiate another instance while parsing their
>   * platform data.
>   */
> -static struct sec_platform_data *sec_pmic_i2c_parse_dt_pdata(
> -					struct device *dev)
> +static struct sec_platform_data *
> +sec_pmic_i2c_parse_dt_pdata(struct device *dev)
>  {
>  	struct sec_platform_data *pd;
>  
> @@ -331,8 +334,8 @@ static struct sec_platform_data *sec_pmic_i2c_parse_dt_pdata(
>  	return pd;
>  }
>  #else
> -static struct sec_platform_data *sec_pmic_i2c_parse_dt_pdata(
> -					struct device *dev)
> +static struct sec_platform_data *
> +sec_pmic_i2c_parse_dt_pdata(struct device *dev)
>  {
>  	return NULL;
>  }

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
