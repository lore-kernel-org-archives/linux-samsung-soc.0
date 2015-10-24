From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v7 12/17] drm: rockchip: vop: add bpc and color mode setting
Date: Sat, 24 Oct 2015 11:06:38 +0800
Message-ID: <1445656003-15300-2-git-send-email-ykk@rock-chips.com>
References: <1445599415-30856-1-git-send-email-ykk@rock-chips.com>
 <1445656003-15300-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.133]:39315 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751824AbbJXDI5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Oct 2015 23:08:57 -0400
In-Reply-To: <1445656003-15300-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, joe@perches.com, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>
Cc: Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, dianders@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, Yakir Yang <ykk@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Mark Yao <yzq@rock-chips.com>

From: Mark Yao <yzq@rock-chips.com>

Add bpc and color mode setting in rockchip_drm_vop driver, so
connector could try to use the edid drm_display_info to config
vop output mode.

Signed-off-by: Mark Yao <yzq@rock-chips.com>
Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v7: None
Changes in v6: None
Changes in v5:
- Fix compiled error (Heiko)
- Using the connector display info message to configure eDP driver input
  video mode, but hard code CRTC video output mode to RGBaaa.

Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 25 +++++++++++++++----
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c     |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h     |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c     | 32 ++++++++++++++++++++++---
 4 files changed, 51 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 2c82a9a..3990951 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -180,14 +180,29 @@ static void rockchip_dp_drm_encoder_mode_set(struct drm_encoder *encoder,
 static void rockchip_dp_drm_encoder_prepare(struct drm_encoder *encoder)
 {
 	struct rockchip_dp_device *dp = to_dp(encoder);
+	struct drm_connector *cn = &dp->connector;
+	int ret = -1;
 	u32 val;
-	int ret;
 
-	ret = rockchip_drm_crtc_mode_config(encoder->crtc,
-					    DRM_MODE_CONNECTOR_eDP,
-					    ROCKCHIP_OUT_MODE_AAAA);
+	/*
+	 * FIXME(Yakir): driver should configure the CRTC output video
+	 * mode with the display information which indicated the monitor
+	 * support colorimetry.
+	 *
+	 * But don't know why the CRTC driver seems could only output the
+	 * RGBaaa rightly. For example, if connect the "innolux,n116bge"
+	 * eDP screen, EDID would indicated that screen only accepted the
+	 * 6bpc mode. But if I configure CRTC to RGB666 output, then eDP
+	 * screen would show a blue picture (RGB888 show a green picture).
+	 * But if I configure CTRC to RGBaaa, and eDP driver still keep
+	 * RGB666 input video mode, then screen would works prefect.
+	 */
+	if (cn->display_info.color_formats & DRM_COLOR_FORMAT_RGB444)
+		ret = rockchip_drm_crtc_mode_config(encoder->crtc,
+					DRM_MODE_CONNECTOR_eDP,
+					10, DRM_COLOR_FORMAT_RGB444);
 	if (ret < 0) {
-		dev_err(dp->dev, "Could not set crtc mode config: %d.\n", ret);
+		dev_err(dp->dev, "Could not set crtc mode config (%d)\n", ret);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 80d6fc8..428a3c1 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -215,7 +215,7 @@ static void dw_hdmi_rockchip_encoder_commit(struct drm_encoder *encoder)
 static void dw_hdmi_rockchip_encoder_prepare(struct drm_encoder *encoder)
 {
 	rockchip_drm_crtc_mode_config(encoder->crtc, DRM_MODE_CONNECTOR_HDMIA,
-				      ROCKCHIP_OUT_MODE_AAAA);
+				      10, DRM_COLOR_FORMAT_RGB444);
 }
 
 static struct drm_encoder_helper_funcs dw_hdmi_rockchip_encoder_helper_funcs = {
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index dc4e5f0..ef1d7fb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -59,7 +59,7 @@ void rockchip_unregister_crtc_funcs(struct drm_device *dev, int pipe);
 int rockchip_drm_encoder_get_mux_id(struct device_node *node,
 				    struct drm_encoder *encoder);
 int rockchip_drm_crtc_mode_config(struct drm_crtc *crtc, int connector_type,
-				  int out_mode);
+				  int bpc, int color);
 int rockchip_drm_dma_attach_device(struct drm_device *drm_dev,
 				   struct device *dev);
 void rockchip_drm_dma_detach_device(struct drm_device *drm_dev,
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 5d8ae5e..9ef4a1f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1062,14 +1062,40 @@ static const struct drm_plane_funcs vop_plane_funcs = {
 
 int rockchip_drm_crtc_mode_config(struct drm_crtc *crtc,
 				  int connector_type,
-				  int out_mode)
+				  int bpc, int color)
 {
 	struct vop *vop = to_vop(crtc);
 
+	/*
+	 * RK3288 vop only support RGB Color output.
+	 */
+	if (color != DRM_COLOR_FORMAT_RGB444) {
+		DRM_ERROR("Only support output RGB444, not support%d\n",
+			  color);
+		return -EINVAL;
+	}
+
 	vop->connector_type = connector_type;
-	vop->connector_out_mode = out_mode;
 
-	return 0;
+	/*
+	 * Fixme: I don't know how to describe the ROCKCHIP_OUT_MODE_P565's
+	 * bpc, 5 or 6?
+	 */
+	if (bpc >= 10) {
+		bpc = 10;
+		vop->connector_out_mode = ROCKCHIP_OUT_MODE_AAAA;
+	} else if (bpc >= 8) {
+		bpc = 8;
+		vop->connector_out_mode = ROCKCHIP_OUT_MODE_P888;
+	} else if (bpc >= 6) {
+		bpc = 6;
+		vop->connector_out_mode = ROCKCHIP_OUT_MODE_P666;
+	} else {
+		DRM_ERROR("unsupport bpc %d\n", bpc);
+		return -EINVAL;
+	}
+
+	return bpc;
 }
 EXPORT_SYMBOL_GPL(rockchip_drm_crtc_mode_config);
 
-- 
2.1.2
