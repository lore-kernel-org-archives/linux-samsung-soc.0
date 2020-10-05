Return-Path: <SRS0=ELwQ=DM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28186C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 13:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE51120774
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 13:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgJENnR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Oct 2020 09:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgJENnR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 09:43:17 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FE5C0613CE
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Oct 2020 06:43:17 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4C4hcy6pPvz1s7Gg;
        Mon,  5 Oct 2020 15:43:14 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4C4hcy5b5qz1sM8g;
        Mon,  5 Oct 2020 15:43:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id VuhbyYAEQA2Y; Mon,  5 Oct 2020 15:43:11 +0200 (CEST)
X-Auth-Info: JJobhcK0kQbcVw2hCYkgxWoc+v6fH6ZKHlZWlSRSWNE=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon,  5 Oct 2020 15:43:11 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     dri-devel@lists.freedesktop.org
Cc:     Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/3] [RFC] drm/exynos: Add basic i.MX8MM support code
Date:   Mon,  5 Oct 2020 15:42:50 +0200
Message-Id: <20201005134250.527153-3-marex@denx.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005134250.527153-1-marex@denx.de>
References: <20201005134250.527153-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This adds basic i.MX8MM glue code for the Samsung DSIM PHY.
There are still a couple of items which need to be sorted out
in drivers/gpu/drm/bridge/samsung-dsim.c before this can even
be merged, specifically:

- The dsi->out_bridge is not populated until samsung_dsim_host_attach()
  is called, however samsung_dsim_host_attach() is not called until the
  next bridge attaches and calls mipi_dsi_attach(), and that only happens
  after the DSIM calls drm_bridge_attach() on that next bridge.

- The samsung_dsim_bridge_mode_fixup() is needed for iMX8MM LCDIF to set
  the correct sync flags. This likely needs to be done in the glue code.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
--
NOTE: This depends on https://patchwork.kernel.org/project/dri-devel/list/?series=347439
---
 drivers/gpu/drm/bridge/Kconfig            |   6 +
 drivers/gpu/drm/bridge/Makefile           |   1 +
 drivers/gpu/drm/bridge/samsung-dsim-imx.c | 161 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/samsung-dsim.c     |  25 +++-
 4 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim-imx.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 2d4459f78cdc..f97a8ebfcef1 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -129,6 +129,12 @@ config DRM_SAMSUNG_DSIM
 	help
 	  Samsung MIPI DSI bridge driver.
 
+config DRM_SAMSUNG_DSIM_IMX
+	tristate "Samsung MIPI DSI bridge extras for NXP i.MX"
+	depends on DRM_SAMSUNG_DSIM
+	help
+	  Samsung MIPI DSI bridge driver extras for NXP i.MX.
+
 config DRM_SIL_SII8620
 	tristate "Silicon Image SII8620 HDMI/MHL bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index f7972d703c5d..61188a0cd052 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
 obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
 obj-$(CONFIG_DRM_SAMSUNG_DSIM) += samsung-dsim.o
+obj-$(CONFIG_DRM_SAMSUNG_DSIM_IMX) += samsung-dsim-imx.o
 obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
 obj-$(CONFIG_DRM_SII902X) += sii902x.o
 obj-$(CONFIG_DRM_SII9234) += sii9234.o
diff --git a/drivers/gpu/drm/bridge/samsung-dsim-imx.c b/drivers/gpu/drm/bridge/samsung-dsim-imx.c
new file mode 100644
index 000000000000..6c7307ce7eaf
--- /dev/null
+++ b/drivers/gpu/drm/bridge/samsung-dsim-imx.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * NXP i.MX8M SoC MIPI DSI driver
+ *
+ * Copyright (C) 2020 Marek Vasut <marex@denx.de>
+ */
+
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/bridge/samsung-dsim.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+enum {
+	DSI_PORT_IN,
+	DSI_PORT_OUT
+};
+
+struct imx_dsim_priv {
+	struct samsung_dsim *dsi;
+	struct drm_encoder encoder;
+};
+
+static const unsigned int imx8mm_dsim_reg_values[] = {
+	[RESET_TYPE] = DSIM_SWRST,
+	[PLL_TIMER] = 500,
+	[STOP_STATE_CNT] = 0xf,
+	[PHYCTRL_ULPS_EXIT] = 0xaf,
+	[PHYCTRL_VREG_LP] = 0,
+	[PHYCTRL_SLEW_UP] = 0,
+	[PHYTIMING_LPX] = 0x06,
+	[PHYTIMING_HS_EXIT] = 0x0b,
+	[PHYTIMING_CLK_PREPARE] = 0x07,
+	[PHYTIMING_CLK_ZERO] = 0x26,
+	[PHYTIMING_CLK_POST] = 0x0d,
+	[PHYTIMING_CLK_TRAIL] = 0x08,
+	[PHYTIMING_HS_PREPARE] = 0x08,
+	[PHYTIMING_HS_ZERO] = 0x0d,
+	[PHYTIMING_HS_TRAIL] = 0x0b,
+};
+
+static int imx_dsim_host_attach(struct device *dev,
+				  struct mipi_dsi_device *device)
+{
+	struct imx_dsim_priv *dsi = dev_get_drvdata(dev);
+	struct drm_device *drm = dsi->encoder.dev;
+
+	if (drm->mode_config.poll_enabled)
+		drm_kms_helper_hotplug_event(drm);
+
+	return 0;
+}
+
+static int imx_dsim_host_detach(struct device *dev,
+				  struct mipi_dsi_device *device)
+{
+	struct imx_dsim_priv *dsi = dev_get_drvdata(dev);
+	struct drm_device *drm = dsi->encoder.dev;
+
+	if (drm->mode_config.poll_enabled)
+		drm_kms_helper_hotplug_event(drm);
+
+	return 0;
+}
+
+static const struct samsung_dsim_host_ops imx_dsim_host_ops = {
+	.attach = imx_dsim_host_attach,
+	.detach = imx_dsim_host_detach,
+};
+
+static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
+	.reg_ofs = EXYNOS5433_REG_OFS,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 2100,
+	.wait_for_reset = 0,
+	.num_bits_resol = 12,
+	.reg_values = imx8mm_dsim_reg_values,
+	.host_ops = &imx_dsim_host_ops,
+};
+
+static const struct of_device_id imx_dsim_of_match[] = {
+	{ .compatible = "fsl,imx8mm-mipi-dsim",
+	  .data = &imx8mm_dsi_driver_data },
+	{ }
+};
+
+static int imx_dsim_probe(struct platform_device *pdev)
+{
+	struct imx_dsim_priv *dsi;
+	struct device *dev = &pdev->dev;
+
+	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
+	if (!dsi)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, dsi);
+
+	dsi->dsi = samsung_dsim_probe(pdev);
+	if (IS_ERR(dsi->dsi))
+		return PTR_ERR(dsi->dsi);
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static int imx_dsim_remove(struct platform_device *pdev)
+{
+	struct imx_dsim_priv *dsi = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+
+	samsung_dsim_remove(dsi->dsi);
+
+	return 0;
+}
+
+static int __maybe_unused imx_dsim_suspend(struct device *dev)
+{
+	struct imx_dsim_priv *dsi = dev_get_drvdata(dev);
+
+	return samsung_dsim_suspend(dsi->dsi);
+}
+
+static int __maybe_unused imx_dsim_resume(struct device *dev)
+{
+	struct imx_dsim_priv *dsi = dev_get_drvdata(dev);
+
+	return samsung_dsim_resume(dsi->dsi);
+}
+
+static const struct dev_pm_ops imx_dsim_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx_dsim_suspend, imx_dsim_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static struct platform_driver imx_dsim_driver = {
+	.probe = imx_dsim_probe,
+	.remove = imx_dsim_remove,
+	.driver = {
+		   .name = "imx-dsim-dsi",
+		   .owner = THIS_MODULE,
+		   .pm = &imx_dsim_pm_ops,
+		   .of_match_table = imx_dsim_of_match,
+	},
+};
+
+module_platform_driver(imx_dsim_driver);
+
+MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
+MODULE_DESCRIPTION("NXP i.MX8M SoC MIPI DSI");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 42b49546dd00..12aeceb40450 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -28,6 +28,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -1388,8 +1389,15 @@ static int samsung_dsim_bridge_attach(struct drm_bridge *bridge,
 {
 	struct samsung_dsim *dsi = bridge->driver_private;
 	struct drm_encoder *encoder = bridge->encoder;
+	struct device *dev = dsi->dev;
+	struct device_node *np = dev->of_node;
 	int ret;
 
+	ret = drm_of_find_panel_or_bridge(np, 1, 0,
+					  &dsi->panel, &dsi->out_bridge);
+	if (ret)
+		return ret;
+
 	if (!dsi->out_bridge && !dsi->panel)
 		return -EPROBE_DEFER;
 
@@ -1398,7 +1406,6 @@ static int samsung_dsim_bridge_attach(struct drm_bridge *bridge,
 					bridge, flags);
 		if (ret)
 			return ret;
-		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 	} else {
 		ret = samsung_dsim_create_connector(dsi);
 		if (ret)
@@ -1456,18 +1463,31 @@ static void samsung_dsim_bridge_mode_set(struct drm_bridge *bridge,
 	drm_mode_copy(&dsi->mode, adjusted_mode);
 }
 
+static bool samsung_dsim_bridge_mode_fixup(struct drm_bridge *bridge,
+					   const struct drm_display_mode *mode,
+					   struct drm_display_mode *adjusted_mode)
+{
+	/* At least LCDIF + DSIM needs active low sync */
+	adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+
+	return true;
+}
+
 static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.attach = samsung_dsim_bridge_attach,
 	.detach = samsung_dsim_bridge_detach,
 	.enable = samsung_dsim_bridge_enable,
 	.disable = samsung_dsim_bridge_disable,
 	.mode_set = samsung_dsim_bridge_mode_set,
+	.mode_fixup = samsung_dsim_bridge_mode_fixup,
 };
 
 static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 				    struct mipi_dsi_device *device)
 {
 	struct samsung_dsim *dsi = host_to_dsi(host);
+#if 0
 	const struct samsung_dsim_host_ops *ops = dsi->driver_data->host_ops;
 	struct drm_bridge *out_bridge;
 
@@ -1493,13 +1513,16 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 		if (ret)
 			return ret;
 	}
+#endif
 
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
+#if 0
 	if (ops && ops->attach)
 		ops->attach(dsi->dsi_host.dev, device);
+#endif
 
 	return 0;
 }
-- 
2.28.0

