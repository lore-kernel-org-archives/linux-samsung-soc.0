From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] i2c: exynos5: simplify timings calculation
Date: Mon, 03 Apr 2017 12:06:22 +0200
Message-ID: <6338efba-9100-eb1f-779a-8cb8630926b6@samsung.com>
References: <CGME20170223164733eucas1p11ad37a2334fe709a062ecc82b5224e1a@eucas1p1.samsung.com>
 <1487868446-5339-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:55502 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751978AbdDCKG2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 06:06:28 -0400
In-reply-to: <1487868446-5339-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Wolfram,

Gently ping.

Regards
Andrzej

On 23.02.2017 17:47, Andrzej Hajda wrote:
> Instead of using cryptic loop direct calculation of timings
> can be used.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/i2c/busses/i2c-exynos5.c | 40 ++++++++++++++--------------------------
>  1 file changed, 14 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index cbd93ce..04127b8 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -292,9 +292,9 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, int mode)
>  	unsigned int t_sr_release;
>  	unsigned int t_ftl_cycle;
>  	unsigned int clkin = clk_get_rate(i2c->clk);
> -	unsigned int div, utemp0 = 0, utemp1 = 0, clk_cycle;
>  	unsigned int op_clk = (mode == HSI2C_HIGH_SPD) ?
>  				i2c->hs_clock : i2c->fs_clock;
> +	int div, clk_cycle, temp;
>  
>  	/*
>  	 * In case of HSI2C controller in Exynos5 series
> @@ -305,33 +305,21 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, int mode)
>  	 * FPCLK / FI2C =
>  	 * (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) + 8 + FLT_CYCLE
>  	 *
> -	 * utemp0 = (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2)
> -	 * utemp1 = (TSCLK_L + TSCLK_H + 2)
> +	 * clk_cycle := TSCLK_L + TSCLK_H
> +	 * temp := (CLK_DIV + 1) * (clk_cycle + 2)
> +	 *
> +	 * Constraints: 4 <= temp, 0 <= CLK_DIV < 256, 2 <= clk_cycle <= 510
> +	 *
>  	 */
>  	t_ftl_cycle = (readl(i2c->regs + HSI2C_CONF) >> 16) & 0x7;
> -	utemp0 = (clkin / op_clk) - 8;
> -
> -	if (i2c->variant->hw == HSI2C_EXYNOS7)
> -		utemp0 -= t_ftl_cycle;
> -	else
> -		utemp0 -= 2 * t_ftl_cycle;
> -
> -	/* CLK_DIV max is 256 */
> -	for (div = 0; div < 256; div++) {
> -		utemp1 = utemp0 / (div + 1);
> -
> -		/*
> -		 * SCL_L and SCL_H each has max value of 255
> -		 * Hence, For the clk_cycle to the have right value
> -		 * utemp1 has to be less then 512 and more than 4.
> -		 */
> -		if ((utemp1 < 512) && (utemp1 > 4)) {
> -			clk_cycle = utemp1 - 2;
> -			break;
> -		} else if (div == 255) {
> -			dev_warn(i2c->dev, "Failed to calculate divisor");
> -			return -EINVAL;
> -		}
> +	temp = clkin / op_clk - 8 - t_ftl_cycle;
> +	if (i2c->variant->hw != HSI2C_EXYNOS7)
> +		temp -= t_ftl_cycle;
> +	div = temp / 512;
> +	clk_cycle = temp / (div + 1) - 2;
> +	if (temp < 4 || div >= 256 || clk_cycle < 2) {
> +		dev_warn(i2c->dev, "Failed to calculate divisor");
> +		return -EINVAL;
>  	}
>  
>  	t_scl_l = clk_cycle / 2;
