From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2 1/2] drm/exynos: dp: Remove support for unused dptx-phy
Date: Wed, 12 Nov 2014 13:08:53 +0900
Message-ID: <000001cffe2e$5f83fd30$1e8bf790$%han@samsung.com>
References: <1414675442-3471-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1414675442-3471-1-git-send-email-gautam.vivek@samsung.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, seanpaul@google.com, ajaykumar.rs@samsung.com, 'Inki Dae' <inki.dae@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday, October 30, 2014 10:24 PM, Vivek Gautam wrote:
> 
> Now that we have moved to generic phy based bindings,
> we don't need to have any code related to older dptx-phy.
> Nobody is using this dptx-phy anymore, so removing the
> same.

Right, older dptx-phy was replaced long time ago.
However, it was not removed for DT compatibility.
I think that now these old DT properties can be removed.

I added some comments below.

> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jingoo Han <jg1.han@samsung.com>
> ---
> 
> Changes from V1:
>  - Reworked error handling in exynos_dp_dt_parse_phydata() as commented
>    by Inki.
> 
>  drivers/gpu/drm/exynos/exynos_dp_core.c |   67 ++++++++-----------------------
>  drivers/gpu/drm/exynos/exynos_dp_core.h |    2 -
>  2 files changed, 17 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> index cd50ece..206163b 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -1052,28 +1052,14 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
> 
>  static void exynos_dp_phy_init(struct exynos_dp_device *dp)
>  {
> -	if (dp->phy) {
> +	if (dp->phy)
>  		phy_power_on(dp->phy);
> -	} else if (dp->phy_addr) {
> -		u32 reg;
> -
> -		reg = __raw_readl(dp->phy_addr);
> -		reg |= dp->enable_mask;
> -		__raw_writel(reg, dp->phy_addr);
> -	}
>  }
> 
>  static void exynos_dp_phy_exit(struct exynos_dp_device *dp)
>  {
> -	if (dp->phy) {
> +	if (dp->phy)
>  		phy_power_off(dp->phy);
> -	} else if (dp->phy_addr) {
> -		u32 reg;
> -
> -		reg = __raw_readl(dp->phy_addr);
> -		reg &= ~(dp->enable_mask);
> -		__raw_writel(reg, dp->phy_addr);
> -	}
>  }
> 
>  static void exynos_dp_poweron(struct exynos_drm_display *display)
> @@ -1212,40 +1198,13 @@ static struct video_info *exynos_dp_dt_parse_pdata(struct device *dev)
> 
>  static int exynos_dp_dt_parse_phydata(struct exynos_dp_device *dp)
>  {
> -	struct device_node *dp_phy_node = of_node_get(dp->dev->of_node);
> -	u32 phy_base;
> -	int ret = 0;
> -
> -	dp_phy_node = of_find_node_by_name(dp_phy_node, "dptx-phy");
> -	if (!dp_phy_node) {
> -		dp->phy = devm_phy_get(dp->dev, "dp");
> -		return PTR_ERR_OR_ZERO(dp->phy);
> -	}
> -
> -	if (of_property_read_u32(dp_phy_node, "reg", &phy_base)) {
> -		dev_err(dp->dev, "failed to get reg for dptx-phy\n");
> -		ret = -EINVAL;
> -		goto err;
> -	}
> -
> -	if (of_property_read_u32(dp_phy_node, "samsung,enable-mask",
> -				&dp->enable_mask)) {
> -		dev_err(dp->dev, "failed to get enable-mask for dptx-phy\n");
> -		ret = -EINVAL;
> -		goto err;
> -	}
> -
> -	dp->phy_addr = ioremap(phy_base, SZ_4);
> -	if (!dp->phy_addr) {
> -		dev_err(dp->dev, "failed to ioremap dp-phy\n");
> -		ret = -ENOMEM;
> -		goto err;
> +	dp->phy = devm_phy_get(dp->dev, "dp");
> +	if (IS_ERR(dp->phy)) {
> +		dev_err(dp->dev, "no DP phy configured\n");
> +		return PTR_ERR(dp->phy);
>  	}
> 
> -err:
> -	of_node_put(dp_phy_node);
> -
> -	return ret;
> +	return 0;
>  }
> 
>  static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
> @@ -1278,8 +1237,16 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>  		return PTR_ERR(dp->video_info);
> 
>  	ret = exynos_dp_dt_parse_phydata(dp);

In your patch, exynos_dp_dt_parse_phydata() calls only devm_phy_get().
Then, how about calling devm_phy_get() directly and removing
exynos_dp_dt_parse_phydata()? It looks simpler.

Best regards,
Jingoo Han

> -	if (ret)
> -		return ret;
> +	if (ret) {
> +		/*
> +		 * phy itself is not enabled, so we can move forward
> +		 * assigning NULL to phy pointer.
> +		 */
> +		if (ret == -ENOSYS || ret == -ENODEV)
> +			dp->phy = NULL;
> +		else
> +			return ret;
> +	}
> 
>  	if (!dp->panel) {
>  		ret = exynos_dp_dt_parse_panel(dp);
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/exynos/exynos_dp_core.h
> index a1aee69..6426201 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.h
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
> @@ -153,8 +153,6 @@ struct exynos_dp_device {
>  	struct clk		*clock;
>  	unsigned int		irq;
>  	void __iomem		*reg_base;
> -	void __iomem		*phy_addr;
> -	unsigned int		enable_mask;
> 
>  	struct video_info	*video_info;
>  	struct link_train	link_train;
> --
> 1.7.10.4
