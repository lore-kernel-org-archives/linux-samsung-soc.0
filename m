From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v3 4/7] drm/exynos/hdmi: add bridge support
Date: Fri, 03 Feb 2017 15:38:42 +0900
Message-ID: <58942572.604@samsung.com>
References: <58919994.3060100@samsung.com>
 <CGME20170201082940eucas1p1f19e15328a787d6b77cba97bad92afce@eucas1p1.samsung.com>
 <1485937754-21440-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47523 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751512AbdBCGir (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Feb 2017 01:38:47 -0500
In-reply-to: <1485937754-21440-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org



2017년 02월 01일 17:29에 Andrzej Hajda 이(가) 쓴 글:
> On TM2/TM2e platforms HDMI output is connected to MHL bridge
> SiI8620. To allow configure UltraHD modes on the bridge
> and to eliminate unsupported modes this bridge should be
> attached to drm_encoder implemented in exynos_hdmi.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 56 +++++++++++++++++++++++++++++-------
>  1 file changed, 46 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index a73b192..41fb894 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -35,6 +35,7 @@
>  #include <linux/io.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> +#include <linux/of_graph.h>
>  #include <linux/hdmi.h>
>  #include <linux/component.h>
>  #include <linux/mfd/syscon.h>
> @@ -133,6 +134,7 @@ struct hdmi_context {
>  	struct regulator_bulk_data	regul_bulk[ARRAY_SIZE(supply)];
>  	struct regulator		*reg_hdmi_en;
>  	struct exynos_drm_clk		phy_clk;
> +	struct drm_bridge		*bridge;
>  };
>  
>  static inline struct hdmi_context *encoder_to_hdmi(struct drm_encoder *e)
> @@ -922,7 +924,15 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
>  	drm_connector_register(connector);
>  	drm_mode_connector_attach_encoder(connector, encoder);
>  
> -	return 0;
> +	if (hdata->bridge) {
> +		encoder->bridge = hdata->bridge;
> +		hdata->bridge->encoder = encoder;
> +		ret = drm_bridge_attach(encoder->dev, hdata->bridge);

arguments of drm_bridge_attach function has been changed so fixed it - trivial thing.
Applied it including other patches.

Thanks,
Inki Dae

> +		if (ret)
> +			DRM_ERROR("Failed to attach bridge\n");
> +	}
> +
> +	return ret;
>  }
>  
>  static bool hdmi_mode_fixup(struct drm_encoder *encoder,
> @@ -1591,6 +1601,31 @@ static void hdmiphy_clk_enable(struct exynos_drm_clk *clk, bool enable)
>  		hdmiphy_disable(hdata);
>  }
>  
> +static int hdmi_bridge_init(struct hdmi_context *hdata)
> +{
> +	struct device *dev = hdata->dev;
> +	struct device_node *ep, *np;
> +
> +	ep = of_graph_get_endpoint_by_regs(dev->of_node, 1, -1);
> +	if (!ep)
> +		return 0;
> +
> +	np = of_graph_get_remote_port_parent(ep);
> +	of_node_put(ep);
> +	if (!np) {
> +		DRM_ERROR("failed to get remote port parent");
> +		return -EINVAL;
> +	}
> +
> +	hdata->bridge = of_drm_find_bridge(np);
> +	of_node_put(np);
> +
> +	if (!hdata->bridge)
> +		return -EPROBE_DEFER;
> +
> +	return 0;
> +}
> +
>  static int hdmi_resources_init(struct hdmi_context *hdata)
>  {
>  	struct device *dev = hdata->dev;
> @@ -1630,17 +1665,18 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
>  
>  	hdata->reg_hdmi_en = devm_regulator_get_optional(dev, "hdmi-en");
>  
> -	if (PTR_ERR(hdata->reg_hdmi_en) == -ENODEV)
> -		return 0;
> +	if (PTR_ERR(hdata->reg_hdmi_en) != -ENODEV) {
> +		if (IS_ERR(hdata->reg_hdmi_en))
> +			return PTR_ERR(hdata->reg_hdmi_en);
>  
> -	if (IS_ERR(hdata->reg_hdmi_en))
> -		return PTR_ERR(hdata->reg_hdmi_en);
> -
> -	ret = regulator_enable(hdata->reg_hdmi_en);
> -	if (ret)
> -		DRM_ERROR("failed to enable hdmi-en regulator\n");
> +		ret = regulator_enable(hdata->reg_hdmi_en);
> +		if (ret) {
> +			DRM_ERROR("failed to enable hdmi-en regulator\n");
> +			return ret;
> +		}
> +	}
>  
> -	return ret;
> +	return hdmi_bridge_init(hdata);
>  }
>  
>  static struct of_device_id hdmi_match_types[] = {
> 
