From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v3 1/3] drm/exynos: dp: add of_graph dt binding support
 for panel
Date: Thu, 3 Dec 2015 10:55:28 -0300
Message-ID: <566049D0.8070404@osg.samsung.com>
References: <1449135010-8111-1-git-send-email-inki.dae@samsung.com>
 <1449135010-8111-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:56124 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755720AbbLCNzd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Dec 2015 08:55:33 -0500
In-Reply-To: <1449135010-8111-2-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, k.kozlowski@samsung.com

Hello Inki,

I found that v2 of this patch is alredy in your exynos-drm for-next branch so
so I had to revert it in linux-next to apply this one to test. You shouldn't
push patches that were still not reviewed (specially the ones that weren't
tested like this one) to your branch that gets pulled by -next. The idea of
-next is to have some test coverage but it should be as stable as possible.

On 12/03/2015 06:30 AM, Inki Dae wrote:
> This patch adds of_graph dt binding support for panel device
> and also keeps the backward compatibility.
> 
> i.e.,
> The dts file for Exynos5800 based peach pi board
> has a panel property so we need to keep the backward compatibility.
> 
> Changelog v3:
> - bind only one of two nodes outbound - panel or bridge.
>

This patch fixes one of the comments I had for v2 but I've another
comment below.
 
> Changelog v2:
> - return -EINVAL if getting a port node failed.
> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
> index 94f02a0..60260a0 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -1392,7 +1392,7 @@ static const struct component_ops exynos_dp_ops = {
>  static int exynos_dp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *panel_node, *bridge_node, *endpoint;
> +	struct device_node *panel_node = NULL, *bridge_node, *endpoint = NULL;
>  	struct exynos_dp_device *dp;
>  	int ret;
>  
> @@ -1403,14 +1403,32 @@ static int exynos_dp_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, dp);
>  
> +	/* This is for the backward compatibility. */
>  	panel_node = of_parse_phandle(dev->of_node, "panel", 0);
>  	if (panel_node) {
>  		dp->panel = of_drm_find_panel(panel_node);
>  		of_node_put(panel_node);
>  		if (!dp->panel)
>  			return -EPROBE_DEFER;
> +	} else {
> +		endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> +		if (endpoint) {
> +			panel_node = of_graph_get_remote_port_parent(endpoint);

Here is asssumed that the endpoint will be a panel but it could be that there
is no "panel" phandle but the port is for a bridge chip (i.e: Peach Pit) so
this assumption seems fragile to me.

That's what I meant when I said "Assuming you can make a distinction if the
endpoint is a panel or a bridge" in the other thread.

> +			if (panel_node) {
> +				dp->panel = of_drm_find_panel(panel_node);
> +				of_node_put(panel_node);
> +				if (!dp->panel)
> +					return -EPROBE_DEFER;
> +			} else {
> +				DRM_ERROR("no port node for panel device.\n");
> +				return -EINVAL;
> +			}
> +		}
>  	}
>  
> +	if (endpoint)
> +		goto out;
> +

Ok, so IIUC what's done here is to test if the panel lookup failed, then the
endpoint is looked up again but this time a call to of_drm_find_bridge() is
made instead of a call to of_drm_find_panel(). I wonder if there is a better
way to do this...

In any case then I think you should test if (panel_node) instead of endpoint.

>  	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
>  	if (endpoint) {
>  		bridge_node = of_graph_get_remote_port_parent(endpoint);
> @@ -1423,6 +1441,7 @@ static int exynos_dp_probe(struct platform_device *pdev)
>  			return -EPROBE_DEFER;
>  	}
>  
> +out:
>  	pm_runtime_enable(dev);
>  
>  	ret = component_add(&pdev->dev, &exynos_dp_ops);
> 

I can't think of a better way to lookup either a panel or a bridge though
and I'm not that familiar with DRM so with the correct check, the patch
looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Also on an Exynos5800 Peach Pi with the DTS patch I shared, the display
is working correctly and also I tested without the DTS patch to make
sure that it does not cause a regression for older DTBs.

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
