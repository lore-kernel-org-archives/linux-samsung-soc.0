From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 03/10] drm/exynos/dsi: refactor panel detection logic
Date: Fri, 25 Aug 2017 10:46:07 +0900
Message-ID: <599F815F.4070509@samsung.com>
References: <1503581639-580-1-git-send-email-a.hajda@samsung.com>
        <CGME20170824133409eucas1p170d11c2037d1f20629751f04c6f77c49@eucas1p1.samsung.com>
        <1503581639-580-4-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47020 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753924AbdHYBqK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 21:46:10 -0400
In-reply-to: <1503581639-580-4-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>



2017년 08월 24일 22:33에 Andrzej Hajda 이(가) 쓴 글:
> Description of drm_helper_hpd_irq_event clearly states that drivers
> supporting hotplug events per connector should use different helper -
> drm_kms_helper_hotplug_event. To achieve it following changes have
> been performed:
> - moved down all DSI ops - they require exynos_dsi_disable function
> to be defined earlier,
> - simplified exynos_dsi_detect - there is no real detection, it just
> returns if panel is attached,
> - DSI attach/detach callbacks attaches/detaches DRM panel and sets
> connector status and other context fields accordingly, all this is
> performed under mutex, as these callbacks are asynchronous.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 203 ++++++++++++++++----------------
>  1 file changed, 102 insertions(+), 101 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 6b46df6..063bac3 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -254,7 +254,6 @@ struct exynos_dsi {
>  	struct drm_encoder encoder;
>  	struct mipi_dsi_host dsi_host;
>  	struct drm_connector connector;
> -	struct device_node *panel_node;
>  	struct drm_panel *panel;
>  	struct device *dev;
>  
> @@ -1329,12 +1328,13 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
>  	return 0;
>  }
>  
> -static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi)
> +static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
> +				      struct device *panel)
>  {
>  	int ret;
>  	int te_gpio_irq;
>  
> -	dsi->te_gpio = of_get_named_gpio(dsi->panel_node, "te-gpios", 0);
> +	dsi->te_gpio = of_get_named_gpio(panel->of_node, "te-gpios", 0);
>  	if (dsi->te_gpio == -ENOENT)
>  		return 0;
>  
> @@ -1374,85 +1374,6 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
>  	}
>  }
>  
> -static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> -				  struct mipi_dsi_device *device)
> -{
> -	struct exynos_dsi *dsi = host_to_dsi(host);
> -
> -	dsi->lanes = device->lanes;
> -	dsi->format = device->format;
> -	dsi->mode_flags = device->mode_flags;
> -	dsi->panel_node = device->dev.of_node;
> -
> -	/*
> -	 * This is a temporary solution and should be made by more generic way.
> -	 *
> -	 * If attached panel device is for command mode one, dsi should register
> -	 * TE interrupt handler.
> -	 */
> -	if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO)) {
> -		int ret = exynos_dsi_register_te_irq(dsi);
> -
> -		if (ret)
> -			return ret;
> -	}
> -
> -	if (dsi->connector.dev)
> -		drm_helper_hpd_irq_event(dsi->connector.dev);
> -
> -	return 0;
> -}
> -
> -static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
> -				  struct mipi_dsi_device *device)
> -{
> -	struct exynos_dsi *dsi = host_to_dsi(host);
> -
> -	exynos_dsi_unregister_te_irq(dsi);
> -
> -	dsi->panel_node = NULL;
> -
> -	if (dsi->connector.dev)
> -		drm_helper_hpd_irq_event(dsi->connector.dev);
> -
> -	return 0;
> -}
> -
> -static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
> -				        const struct mipi_dsi_msg *msg)

I fixed below error.

ERROR: code indent should use tabs where possible
#364: FILE: drivers/gpu/drm/exynos/exynos_drm_dsi.c:1581:
+^I^I^I^I        const struct mipi_dsi_msg *msg)$


Thanks,
Inki Dae
