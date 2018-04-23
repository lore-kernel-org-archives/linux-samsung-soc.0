From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH] phy: exynos-mipi-video: Simplify code by using
 regmap_update_bits()
Date: Mon, 23 Apr 2018 12:13:26 +0530
Message-ID: <b4eb154e-8acf-1eae-de27-ce3f6a93a47f@ti.com>
References: <CGME20180416161949epcas1p11b738f30a12bd2f62ad9422f7c4e7ed6@epcas1p1.samsung.com>
 <20180416161938.26958-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180416161938.26958-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: krzk@kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org



On Monday 16 April 2018 09:49 PM, Sylwester Nawrocki wrote:
> There is no functional change, just replacing regmap_read()/modify/
> regmap_write() with regmap_update_bits() function calls.

merged, thanks!

-Kishon

> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos-mipi-video.c | 34 ++++++++++++-----------------
>  1 file changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
> index c198886f80a3..00d89599c67d 100644
> --- a/drivers/phy/samsung/phy-exynos-mipi-video.c
> +++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
> @@ -231,33 +231,27 @@ struct exynos_mipi_video_phy {
>  static int __set_phy_state(const struct exynos_mipi_phy_desc *data,
>  			   struct exynos_mipi_video_phy *state, unsigned int on)
>  {
> -	u32 val;
> +	struct regmap *enable_map = state->regmaps[data->enable_map];
> +	struct regmap *resetn_map = state->regmaps[data->resetn_map];
>  
>  	spin_lock(&state->slock);
>  
>  	/* disable in PMU sysreg */
>  	if (!on && data->coupled_phy_id >= 0 &&
> -	    state->phys[data->coupled_phy_id].phy->power_count == 0) {
> -		regmap_read(state->regmaps[data->enable_map], data->enable_reg,
> -			    &val);
> -		val &= ~data->enable_val;
> -		regmap_write(state->regmaps[data->enable_map], data->enable_reg,
> -			     val);
> -	}
> -
> +	    state->phys[data->coupled_phy_id].phy->power_count == 0)
> +		regmap_update_bits(enable_map, data->enable_reg,
> +				   data->enable_val, 0);
>  	/* PHY reset */
> -	regmap_read(state->regmaps[data->resetn_map], data->resetn_reg, &val);
> -	val = on ? (val | data->resetn_val) : (val & ~data->resetn_val);
> -	regmap_write(state->regmaps[data->resetn_map], data->resetn_reg, val);
> -
> +	if (on)
> +		regmap_update_bits(resetn_map, data->resetn_reg,
> +				   data->resetn_val, data->resetn_val);
> +	else
> +		regmap_update_bits(resetn_map, data->resetn_reg,
> +				   data->resetn_val, 0);
>  	/* enable in PMU sysreg */
> -	if (on) {
> -		regmap_read(state->regmaps[data->enable_map], data->enable_reg,
> -			    &val);
> -		val |= data->enable_val;
> -		regmap_write(state->regmaps[data->enable_map], data->enable_reg,
> -			     val);
> -	}
> +	if (on)
> +		regmap_update_bits(enable_map, data->enable_reg,
> +				   data->enable_val, data->enable_val);
>  
>  	spin_unlock(&state->slock);
>  
> 
