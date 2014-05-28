From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: mipi-dsi: consider panel driver-deferred
 probe
Date: Wed, 28 May 2014 09:58:23 +0200
Message-ID: <5385971F.4040906@samsung.com>
References: <1401194563-803-1-git-send-email-inki.dae@samsung.com>
 <1401194563-803-3-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:61085 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751984AbaE1H62 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 May 2014 03:58:28 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N69008U4Y50M170@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 May 2014 08:58:12 +0100 (BST)
In-reply-to: <1401194563-803-3-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk

Hi Inki,

There is no problem with the DSI panels, so there is nothing to fix.
DSI receives notifications about panel presence via mipi dsi bus,
so it can attach/detach it to/from drm using connector's hotplug mechansim.

Deferring DSI in unnecessary.

Regards
Andrzej


On 05/27/2014 02:42 PM, Inki Dae wrote:
> This patch makes sure that mipi dsi driver makes it re-probe
> in case that panel driver isn't probed yet.
>
> For this, it checks if panel driver is probed or not before
> component_add() is called.
>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |   38 +++++++++++++++----------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 1421d9b..22503f3 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1166,11 +1166,8 @@ exynos_dsi_detect(struct drm_connector *connector, bool force)
>  {
>  	struct exynos_dsi *dsi = connector_to_dsi(connector);
>  
> -	if (!dsi->panel) {
> -		dsi->panel = of_drm_find_panel(dsi->panel_node);
> -		if (dsi->panel)
> -			drm_panel_attach(dsi->panel, &dsi->connector);
> -	} else if (!dsi->panel_node) {
> +	 /* Power off if panel driver is removed. */
> +	if (!dsi->panel_node) {
>  		struct exynos_drm_display *display;
>  
>  		display = platform_get_drvdata(to_platform_device(dsi->dev));
> @@ -1383,19 +1380,8 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>  				void *data)
>  {
>  	struct drm_device *drm_dev = data;
> -	struct exynos_dsi *dsi;
> -	int ret;
>  
> -	ret = exynos_drm_create_enc_conn(drm_dev, &exynos_dsi_display);
> -	if (ret) {
> -		DRM_ERROR("Encoder create [%d] failed with %d\n",
> -				exynos_dsi_display.type, ret);
> -		return ret;
> -	}
> -
> -	dsi = exynos_dsi_display.ctx;
> -
> -	return mipi_dsi_host_register(&dsi->dsi_host);
> +	return exynos_drm_create_enc_conn(drm_dev, &exynos_dsi_display);
>  }
>  
>  static void exynos_dsi_unbind(struct device *dev, struct device *master,
> @@ -1406,8 +1392,6 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
>  
>  	exynos_dsi_dpms(&exynos_dsi_display, DRM_MODE_DPMS_OFF);
>  
> -	mipi_dsi_host_unregister(&dsi->dsi_host);
> -
>  	encoder->funcs->destroy(encoder);
>  	drm_connector_cleanup(&dsi->connector);
>  }
> @@ -1502,6 +1486,18 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, &exynos_dsi_display);
>  
> +	ret = mipi_dsi_host_register(&dsi->dsi_host);
> +	if (ret)
> +		goto err_del_component;
> +
> +	dsi->panel = of_drm_find_panel(dsi->panel_node);
> +	if (!dsi->panel) {
> +		mipi_dsi_host_unregister(&dsi->dsi_host);
> +		return -EPROBE_DEFER;
> +	}
> +
> +	drm_panel_attach(dsi->panel, &dsi->connector);
> +
>  	ret = component_add(&pdev->dev, &exynos_dsi_component_ops);
>  	if (ret)
>  		goto err_del_component;
> @@ -1515,6 +1511,10 @@ err_del_component:
>  
>  static int exynos_dsi_remove(struct platform_device *pdev)
>  {
> +	struct exynos_dsi *dsi = exynos_dsi_display.ctx;
> +
> +	mipi_dsi_host_unregister(&dsi->dsi_host);
> +
>  	component_del(&pdev->dev, &exynos_dsi_component_ops);
>  	exynos_drm_component_del(&pdev->dev);
>  
