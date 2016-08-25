From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 3/5] gpu: drm: exynos_hdmi: Move DDC logic into single
 function
Date: Thu, 25 Aug 2016 09:03:40 +0200
Message-ID: <f343128f-9794-fcb8-78b4-61fcdd7fb935@samsung.com>
References: <1472044039-16536-1-git-send-email-woogyom.kim@gmail.com>
 <1472044039-16536-4-git-send-email-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1472044039-16536-4-git-send-email-woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/24/2016 03:07 PM, Milo Kim wrote:
> Paring DT properties and getting the I2C adapter in one function.
>
> Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
> Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Signed-off-by: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 46 ++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 2275efe..8d99b5d 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1760,16 +1760,34 @@ static const struct component_ops hdmi_component_ops = {
>  	.unbind = hdmi_unbind,
>  };
>  
> -static struct device_node *hdmi_legacy_ddc_dt_binding(struct device *dev)
> +static int hdmi_get_ddc_adapter(struct hdmi_context *hdata)
>  {
>  	const char *compatible_str = "samsung,exynos4210-hdmiddc";
>  	struct device_node *np;
> +	struct i2c_adapter *adpt;
>  
>  	np = of_find_compatible_node(NULL, NULL, compatible_str);
>  	if (np)
> -		return of_get_next_parent(np);
> +		np = of_get_next_parent(np);
> +	else
> +		np = of_parse_phandle(hdata->dev->of_node, "ddc", 0);
> +
> +	if (!np) {
> +		DRM_ERROR("Failed to find ddc node in device tree\n");
> +		return -ENODEV;
> +	}
>  
> -	return NULL;
> +	adpt = of_find_i2c_adapter_by_node(np);
You can put of_node_put here, instead of duplicating it on both
execution paths.
> +	if (!adpt) {
> +		DRM_ERROR("Failed to get ddc i2c adapter by node\n");
In case of probe deferring DRM_INFO should be enough, or even DRM_DEBUG.
> +		of_node_put(np);
> +		return -EPROBE_DEFER;
> +	}
> +
> +	hdata->ddc_adpt = adpt;
> +	of_node_put(np);
> +
> +	return 0;
>  }
>  
>  static struct device_node *hdmi_legacy_phy_dt_binding(struct device *dev)
> @@ -1781,7 +1799,7 @@ static struct device_node *hdmi_legacy_phy_dt_binding(struct device *dev)
>  
>  static int hdmi_probe(struct platform_device *pdev)
>  {
> -	struct device_node *ddc_node, *phy_node;
> +	struct device_node *phy_node;
>  	struct device *dev = &pdev->dev;
>  	struct hdmi_context *hdata;
>  	struct resource *res;
> @@ -1811,23 +1829,9 @@ static int hdmi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ddc_node = hdmi_legacy_ddc_dt_binding(dev);
> -	if (ddc_node)
> -		goto out_get_ddc_adpt;
> -
> -	ddc_node = of_parse_phandle(dev->of_node, "ddc", 0);
> -	if (!ddc_node) {
> -		DRM_ERROR("Failed to find ddc node in device tree\n");
> -		return -ENODEV;
> -	}
> -	of_node_put(dev->of_node);
> -
> -out_get_ddc_adpt:
> -	hdata->ddc_adpt = of_find_i2c_adapter_by_node(ddc_node);
> -	if (!hdata->ddc_adpt) {
> -		DRM_ERROR("Failed to get ddc i2c adapter by node\n");
> -		return -EPROBE_DEFER;
> -	}
> +	ret = hdmi_get_ddc_adapter(hdata);
> +	if (ret)
> +		return ret;
>  
>  	phy_node = hdmi_legacy_phy_dt_binding(dev);
>  	if (phy_node)


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
