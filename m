Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D302DC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Feb 2021 19:56:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CE2764F93
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Feb 2021 19:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbhBCT4p (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 3 Feb 2021 14:56:45 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53213 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhBCT4o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Feb 2021 14:56:44 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l7ODd-0006rN-C1; Wed, 03 Feb 2021 20:53:41 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l7ODb-0006eu-K6; Wed, 03 Feb 2021 20:53:39 +0100
Date:   Wed, 3 Feb 2021 20:53:39 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Marek Vasut <marex@denx.de>
Cc:     dri-devel@lists.freedesktop.org,
        Fabio Estevam <festevam@gmail.com>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 3/3] [RFC] drm/exynos: Add basic i.MX8MM support code
Message-ID: <20210203195339.GA20219@pengutronix.de>
References: <20201005134250.527153-1-marex@denx.de>
 <20201005134250.527153-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201005134250.527153-3-marex@denx.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 20:40:51 up 63 days,  8:07, 89 users,  load average: 0.09, 0.08,
 0.08
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 05 Oct 2020 15:42:50 +0200, Marek Vasut wrote:
> This adds basic i.MX8MM glue code for the Samsung DSIM PHY.
> There are still a couple of items which need to be sorted out
> in drivers/gpu/drm/bridge/samsung-dsim.c before this can even
> be merged, specifically:
> 
> - The dsi->out_bridge is not populated until samsung_dsim_host_attach()
>   is called, however samsung_dsim_host_attach() is not called until the
>   next bridge attaches and calls mipi_dsi_attach(), and that only happens
>   after the DSIM calls drm_bridge_attach() on that next bridge.

IMO, the DSIM behaves correctly by calling drm_bridge_attach() only after
samsung_dsim_host_attach() was called. At this point some DSI device has
appeared and told the DSI host that it is the next bridge in the pipeline.

Other DRI host bridges that I looked at behave the same. Either deferring the
bridge_attach until a DSI device has attached or even adding the bridge only
after a DSI device has attached. If a DSI device behaves differently, the DSI
device should be fixed to attach during probe instead of during bridge_attach.

> 
> - The samsung_dsim_bridge_mode_fixup() is needed for iMX8MM LCDIF to set
>   the correct sync flags. This likely needs to be done in the glue code.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Guido Günther <agx@sigxcpu.org>
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Michael Tretter <m.tretter@pengutronix.de>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> --
> NOTE: This depends on https://patchwork.kernel.org/project/dri-devel/list/?series=347439
> ---
>  drivers/gpu/drm/bridge/Kconfig            |   6 +
>  drivers/gpu/drm/bridge/Makefile           |   1 +
>  drivers/gpu/drm/bridge/samsung-dsim-imx.c | 161 ++++++++++++++++++++++
>  drivers/gpu/drm/bridge/samsung-dsim.c     |  25 +++-
>  4 files changed, 192 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim-imx.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 2d4459f78cdc..f97a8ebfcef1 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -129,6 +129,12 @@ config DRM_SAMSUNG_DSIM
>  	help
>  	  Samsung MIPI DSI bridge driver.
>  
> +config DRM_SAMSUNG_DSIM_IMX
> +	tristate "Samsung MIPI DSI bridge extras for NXP i.MX"
> +	depends on DRM_SAMSUNG_DSIM
> +	help
> +	  Samsung MIPI DSI bridge driver extras for NXP i.MX.
> +
>  config DRM_SIL_SII8620
>  	tristate "Silicon Image SII8620 HDMI/MHL bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index f7972d703c5d..61188a0cd052 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
>  obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
>  obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
>  obj-$(CONFIG_DRM_SAMSUNG_DSIM) += samsung-dsim.o
> +obj-$(CONFIG_DRM_SAMSUNG_DSIM_IMX) += samsung-dsim-imx.o
>  obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
>  obj-$(CONFIG_DRM_SII902X) += sii902x.o
>  obj-$(CONFIG_DRM_SII9234) += sii9234.o
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim-imx.c b/drivers/gpu/drm/bridge/samsung-dsim-imx.c
> new file mode 100644
> index 000000000000..6c7307ce7eaf
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/samsung-dsim-imx.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * NXP i.MX8M SoC MIPI DSI driver
> + *
> + * Copyright (C) 2020 Marek Vasut <marex@denx.de>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/bridge/samsung-dsim.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +enum {
> +	DSI_PORT_IN,
> +	DSI_PORT_OUT
> +};
> +
> +struct imx_dsim_priv {
> +	struct samsung_dsim *dsi;
> +	struct drm_encoder encoder;
> +};
> +
> +static const unsigned int imx8mm_dsim_reg_values[] = {
> +	[RESET_TYPE] = DSIM_SWRST,
> +	[PLL_TIMER] = 500,
> +	[STOP_STATE_CNT] = 0xf,
> +	[PHYCTRL_ULPS_EXIT] = 0xaf,
> +	[PHYCTRL_VREG_LP] = 0,
> +	[PHYCTRL_SLEW_UP] = 0,
> +	[PHYTIMING_LPX] = 0x06,
> +	[PHYTIMING_HS_EXIT] = 0x0b,
> +	[PHYTIMING_CLK_PREPARE] = 0x07,
> +	[PHYTIMING_CLK_ZERO] = 0x26,
> +	[PHYTIMING_CLK_POST] = 0x0d,
> +	[PHYTIMING_CLK_TRAIL] = 0x08,
> +	[PHYTIMING_HS_PREPARE] = 0x08,
> +	[PHYTIMING_HS_ZERO] = 0x0d,
> +	[PHYTIMING_HS_TRAIL] = 0x0b,
> +};
> +
> +static int imx_dsim_host_attach(struct device *dev,
> +				  struct mipi_dsi_device *device)
> +{
> +	struct imx_dsim_priv *dsi = dev_get_drvdata(dev);
> +	struct drm_device *drm = dsi->encoder.dev;
> +
> +	if (drm->mode_config.poll_enabled)
> +		drm_kms_helper_hotplug_event(drm);
> +
> +	return 0;
> +}
> +
> +static int imx_dsim_host_detach(struct device *dev,
> +				  struct mipi_dsi_device *device)
> +{
> +	struct imx_dsim_priv *dsi = dev_get_drvdata(dev);
> +	struct drm_device *drm = dsi->encoder.dev;
> +
> +	if (drm->mode_config.poll_enabled)
> +		drm_kms_helper_hotplug_event(drm);
> +
> +	return 0;
> +}
> +
> +static const struct samsung_dsim_host_ops imx_dsim_host_ops = {
> +	.attach = imx_dsim_host_attach,
> +	.detach = imx_dsim_host_detach,
> +};
> +
> +static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
> +	.reg_ofs = EXYNOS5433_REG_OFS,
> +	.plltmr_reg = 0xa0,
> +	.has_clklane_stop = 1,
> +	.num_clks = 2,
> +	.max_freq = 2100,
> +	.wait_for_reset = 0,
> +	.num_bits_resol = 12,
> +	.reg_values = imx8mm_dsim_reg_values,
> +	.host_ops = &imx_dsim_host_ops,
> +};
> +
> +static const struct of_device_id imx_dsim_of_match[] = {
> +	{ .compatible = "fsl,imx8mm-mipi-dsim",
> +	  .data = &imx8mm_dsi_driver_data },
> +	{ }
> +};
> +
> +static int imx_dsim_probe(struct platform_device *pdev)
> +{
> +	struct imx_dsim_priv *dsi;
> +	struct device *dev = &pdev->dev;
> +
> +	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> +	if (!dsi)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, dsi);
> +
> +	dsi->dsi = samsung_dsim_probe(pdev);
> +	if (IS_ERR(dsi->dsi))
> +		return PTR_ERR(dsi->dsi);
> +
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +}
> +
> +static int imx_dsim_remove(struct platform_device *pdev)
> +{
> +	struct imx_dsim_priv *dsi = platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	samsung_dsim_remove(dsi->dsi);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused imx_dsim_suspend(struct device *dev)
> +{
> +	struct imx_dsim_priv *dsi = dev_get_drvdata(dev);
> +
> +	return samsung_dsim_suspend(dsi->dsi);
> +}
> +
> +static int __maybe_unused imx_dsim_resume(struct device *dev)
> +{
> +	struct imx_dsim_priv *dsi = dev_get_drvdata(dev);
> +
> +	return samsung_dsim_resume(dsi->dsi);
> +}
> +
> +static const struct dev_pm_ops imx_dsim_pm_ops = {
> +	SET_RUNTIME_PM_OPS(imx_dsim_suspend, imx_dsim_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +};
> +
> +static struct platform_driver imx_dsim_driver = {
> +	.probe = imx_dsim_probe,
> +	.remove = imx_dsim_remove,
> +	.driver = {
> +		   .name = "imx-dsim-dsi",
> +		   .owner = THIS_MODULE,
> +		   .pm = &imx_dsim_pm_ops,
> +		   .of_match_table = imx_dsim_of_match,
> +	},
> +};
> +
> +module_platform_driver(imx_dsim_driver);
> +
> +MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
> +MODULE_DESCRIPTION("NXP i.MX8M SoC MIPI DSI");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 42b49546dd00..12aeceb40450 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -28,6 +28,7 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> @@ -1388,8 +1389,15 @@ static int samsung_dsim_bridge_attach(struct drm_bridge *bridge,
>  {
>  	struct samsung_dsim *dsi = bridge->driver_private;
>  	struct drm_encoder *encoder = bridge->encoder;
> +	struct device *dev = dsi->dev;
> +	struct device_node *np = dev->of_node;
>  	int ret;
>  
> +	ret = drm_of_find_panel_or_bridge(np, 1, 0,
> +					  &dsi->panel, &dsi->out_bridge);
> +	if (ret)
> +		return ret;
> +
>  	if (!dsi->out_bridge && !dsi->panel)
>  		return -EPROBE_DEFER;
>  
> @@ -1398,7 +1406,6 @@ static int samsung_dsim_bridge_attach(struct drm_bridge *bridge,
>  					bridge, flags);
>  		if (ret)
>  			return ret;
> -		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
>  	} else {
>  		ret = samsung_dsim_create_connector(dsi);
>  		if (ret)
> @@ -1456,18 +1463,31 @@ static void samsung_dsim_bridge_mode_set(struct drm_bridge *bridge,
>  	drm_mode_copy(&dsi->mode, adjusted_mode);
>  }
>  
> +static bool samsung_dsim_bridge_mode_fixup(struct drm_bridge *bridge,
> +					   const struct drm_display_mode *mode,
> +					   struct drm_display_mode *adjusted_mode)
> +{
> +	/* At least LCDIF + DSIM needs active low sync */
> +	adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> +
> +	return true;
> +}
> +
>  static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
>  	.attach = samsung_dsim_bridge_attach,
>  	.detach = samsung_dsim_bridge_detach,
>  	.enable = samsung_dsim_bridge_enable,
>  	.disable = samsung_dsim_bridge_disable,
>  	.mode_set = samsung_dsim_bridge_mode_set,
> +	.mode_fixup = samsung_dsim_bridge_mode_fixup,
>  };
>  
>  static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  				    struct mipi_dsi_device *device)
>  {
>  	struct samsung_dsim *dsi = host_to_dsi(host);
> +#if 0
>  	const struct samsung_dsim_host_ops *ops = dsi->driver_data->host_ops;
>  	struct drm_bridge *out_bridge;
>  
> @@ -1493,13 +1513,16 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  		if (ret)
>  			return ret;
>  	}
> +#endif
>  
>  	dsi->lanes = device->lanes;
>  	dsi->format = device->format;
>  	dsi->mode_flags = device->mode_flags;
>  
> +#if 0
>  	if (ops && ops->attach)
>  		ops->attach(dsi->dsi_host.dev, device);
> +#endif
>  
>  	return 0;
>  }
> -- 
> 2.28.0
> 
> 
