From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/9] phy: core: Change the way of_phy_get is called
Date: Fri, 6 Dec 2013 11:00:44 +0530
Message-ID: <52A16104.3080704@ti.com>
References: <1386246579-25141-1-git-send-email-k.debski@samsung.com> <1386246579-25141-2-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386246579-25141-2-git-send-email-k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Thursday 05 December 2013 05:59 PM, Kamil Debski wrote:
> Previously the of_phy_get function took a struct device * and
> was declared static. It was impossible to call it from
> another driver and thus it was impossible to get phy defined

It was never intended to be called from other drivers. What's up with the
wrapper of of_phy_get, phy_get()/devm_phy_get()? Why isn't that enough?

Thanks
Kishon
> for a given node.
> 
> Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/phy/phy-core.c  |   12 +++++-------
>  include/linux/phy/phy.h |    1 +
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 03cf8fb..7fb3474 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -250,20 +250,17 @@ EXPORT_SYMBOL_GPL(phy_power_off);
>   * not yet loaded. This function uses of_xlate call back function provided
>   * while registering the phy_provider to find the phy instance.
>   */
> -static struct phy *of_phy_get(struct device *dev, int index)
> +struct phy *of_phy_get(struct device_node *np, int index)
>  {
>  	int ret;
>  	struct phy_provider *phy_provider;
>  	struct phy *phy = NULL;
>  	struct of_phandle_args args;
>  
> -	ret = of_parse_phandle_with_args(dev->of_node, "phys", "#phy-cells",
> +	ret = of_parse_phandle_with_args(np, "phys", "#phy-cells",
>  		index, &args);
> -	if (ret) {
> -		dev_dbg(dev, "failed to get phy in %s node\n",
> -			dev->of_node->full_name);
> +	if (ret)
>  		return ERR_PTR(-ENODEV);
> -	}
>  
>  	mutex_lock(&phy_provider_mutex);
>  	phy_provider = of_phy_provider_lookup(args.np);
> @@ -281,6 +278,7 @@ err0:
>  
>  	return phy;
>  }
> +EXPORT_SYMBOL_GPL(of_phy_get);
>  
>  /**
>   * phy_put() - release the PHY
> @@ -370,7 +368,7 @@ struct phy *phy_get(struct device *dev, const char *string)
>  	if (dev->of_node) {
>  		index = of_property_match_string(dev->of_node, "phy-names",
>  			string);
> -		phy = of_phy_get(dev, index);
> +		phy = of_phy_get(dev->of_node, index);
>  		if (IS_ERR(phy)) {
>  			dev_err(dev, "unable to find phy\n");
>  			return phy;
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index 6d72269..169f572 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -131,6 +131,7 @@ struct phy *phy_get(struct device *dev, const char *string);
>  struct phy *devm_phy_get(struct device *dev, const char *string);
>  void phy_put(struct phy *phy);
>  void devm_phy_put(struct device *dev, struct phy *phy);
> +struct phy *of_phy_get(struct device_node *np, int index);
>  struct phy *of_phy_simple_xlate(struct device *dev,
>  	struct of_phandle_args *args);
>  struct phy *phy_create(struct device *dev, const struct phy_ops *ops,
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
