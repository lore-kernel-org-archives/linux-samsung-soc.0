Return-Path: <SRS0=g11O=4W=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEFCC3F2D1
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 16:00:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7F192072D
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 16:00:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgCEQAN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Mar 2020 11:00:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:57072 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726915AbgCEQAN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Mar 2020 11:00:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C9813ABCF;
        Thu,  5 Mar 2020 16:00:10 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        abrodkin@synopsys.com, bbrezillon@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, jingoohan1@gmail.com, inki.dae@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
        stefan@agner.ch, alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
        xinliang.liu@linaro.org, zourongrong@gmail.com,
        john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
        puck.chen@hisilicon.com, linux@armlinux.org.uk,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
        matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
        heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
        thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
        tomi.valkeinen@ti.com, eric@anholt.net, kraxel@redhat.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        sebastian.reichel@collabora.com
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/22] drm/rockchip: Use simple encoder
Date:   Thu,  5 Mar 2020 16:59:40 +0100
Message-Id: <20200305155950.2705-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200305155950.2705-1-tzimmermann@suse.de>
References: <20200305155950.2705-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The rockchip driver uses empty implementations for its encoders. Replace
the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c |  9 +++------
 drivers/gpu/drm/rockchip/cdn-dp-core.c          |  9 +++------
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c |  8 ++------
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c     |  8 ++------
 drivers/gpu/drm/rockchip/inno_hdmi.c            |  8 ++------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c          |  8 ++------
 drivers/gpu/drm/rockchip/rockchip_lvds.c        | 10 +++-------
 drivers/gpu/drm/rockchip/rockchip_rgb.c         |  8 ++------
 8 files changed, 19 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index f38f5e113c6b..848522797314 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -26,6 +26,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"
@@ -258,10 +259,6 @@ static struct drm_encoder_helper_funcs rockchip_dp_encoder_helper_funcs = {
 	.atomic_check = rockchip_dp_drm_encoder_atomic_check,
 };
 
-static struct drm_encoder_funcs rockchip_dp_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 {
 	struct device *dev = dp->dev;
@@ -309,8 +306,8 @@ static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
 							     dev->of_node);
 	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
 
-	ret = drm_encoder_init(drm_dev, encoder, &rockchip_dp_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_simple_encoder_init(drm_dev, encoder,
+				      DRM_MODE_ENCODER_TMDS);
 	if (ret) {
 		DRM_ERROR("failed to initialize encoder with drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index eed594bd38d3..06f85138b51b 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -20,6 +20,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "cdn-dp-core.h"
 #include "cdn-dp-reg.h"
@@ -689,10 +690,6 @@ static const struct drm_encoder_helper_funcs cdn_dp_encoder_helper_funcs = {
 	.atomic_check = cdn_dp_encoder_atomic_check,
 };
 
-static const struct drm_encoder_funcs cdn_dp_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int cdn_dp_parse_dt(struct cdn_dp_device *dp)
 {
 	struct device *dev = dp->dev;
@@ -1030,8 +1027,8 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 							     dev->of_node);
 	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
 
-	ret = drm_encoder_init(drm_dev, encoder, &cdn_dp_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_simple_encoder_init(drm_dev, encoder,
+				      DRM_MODE_ENCODER_TMDS);
 	if (ret) {
 		DRM_ERROR("failed to initialize encoder with drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 6e1270e45f97..3feff0c45b3f 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -21,6 +21,7 @@
 #include <drm/bridge/dw_mipi_dsi.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"
@@ -789,10 +790,6 @@ dw_mipi_dsi_encoder_helper_funcs = {
 	.disable = dw_mipi_dsi_encoder_disable,
 };
 
-static const struct drm_encoder_funcs dw_mipi_dsi_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int rockchip_dsi_drm_create_encoder(struct dw_mipi_dsi_rockchip *dsi,
 					   struct drm_device *drm_dev)
 {
@@ -802,8 +799,7 @@ static int rockchip_dsi_drm_create_encoder(struct dw_mipi_dsi_rockchip *dsi,
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dsi->dev->of_node);
 
-	ret = drm_encoder_init(drm_dev, encoder, &dw_mipi_dsi_encoder_funcs,
-			       DRM_MODE_ENCODER_DSI, NULL);
+	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_DSI);
 	if (ret) {
 		DRM_ERROR("Failed to initialize encoder with drm\n");
 		return ret;
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 7f56d8c3491d..121aa8a63a76 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -14,6 +14,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"
@@ -237,10 +238,6 @@ dw_hdmi_rockchip_mode_valid(struct drm_connector *connector,
 	return (valid) ? MODE_OK : MODE_BAD;
 }
 
-static const struct drm_encoder_funcs dw_hdmi_rockchip_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static void dw_hdmi_rockchip_encoder_disable(struct drm_encoder *encoder)
 {
 }
@@ -546,8 +543,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	}
 
 	drm_encoder_helper_add(encoder, &dw_hdmi_rockchip_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &dw_hdmi_rockchip_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 
 	platform_set_drvdata(pdev, hdmi);
 
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index e5864e823020..7afdc54eb3ec 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -19,6 +19,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"
@@ -532,10 +533,6 @@ static struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
 	.atomic_check = inno_hdmi_encoder_atomic_check,
 };
 
-static struct drm_encoder_funcs inno_hdmi_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static enum drm_connector_status
 inno_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -617,8 +614,7 @@ static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
 		return -EPROBE_DEFER;
 
 	drm_encoder_helper_add(encoder, &inno_hdmi_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &inno_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 
 	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index fe203d38664e..1c546c3a8998 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
@@ -451,10 +452,6 @@ struct drm_encoder_helper_funcs rk3066_hdmi_encoder_helper_funcs = {
 	.atomic_check = rk3066_hdmi_encoder_atomic_check,
 };
 
-static const struct drm_encoder_funcs rk3066_hdmi_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static enum drm_connector_status
 rk3066_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -557,8 +554,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 		return -EPROBE_DEFER;
 
 	drm_encoder_helper_add(encoder, &rk3066_hdmi_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &rk3066_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 
 	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 449a62908d21..63f967902c2d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -16,13 +16,14 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"
@@ -435,10 +436,6 @@ struct drm_encoder_helper_funcs px30_lvds_encoder_helper_funcs = {
 	.atomic_check = rockchip_lvds_encoder_atomic_check,
 };
 
-static const struct drm_encoder_funcs rockchip_lvds_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int rk3288_lvds_probe(struct platform_device *pdev,
 			     struct rockchip_lvds *lvds)
 {
@@ -607,8 +604,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dev->of_node);
 
-	ret = drm_encoder_init(drm_dev, encoder, &rockchip_lvds_encoder_funcs,
-			       DRM_MODE_ENCODER_LVDS, NULL);
+	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_LVDS);
 	if (ret < 0) {
 		DRM_DEV_ERROR(drm_dev->dev,
 			      "failed to initialize encoder: %d\n", ret);
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 3e2484985955..6c10caecd0db 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -14,6 +14,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"
@@ -67,10 +68,6 @@ struct drm_encoder_helper_funcs rockchip_rgb_encoder_helper_funcs = {
 	.atomic_check = rockchip_rgb_encoder_atomic_check,
 };
 
-static const struct drm_encoder_funcs rockchip_rgb_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 				       struct drm_crtc *crtc,
 				       struct drm_device *drm_dev)
@@ -125,8 +122,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	encoder = &rgb->encoder;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	ret = drm_encoder_init(drm_dev, encoder, &rockchip_rgb_encoder_funcs,
-			       DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_NONE);
 	if (ret < 0) {
 		DRM_DEV_ERROR(drm_dev->dev,
 			      "failed to initialize encoder: %d\n", ret);
-- 
2.25.1

