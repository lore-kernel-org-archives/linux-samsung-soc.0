From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 08/18] drm/exynos: add TE handler to support MIPI DSI command
 mode interface
Date: Wed, 14 May 2014 15:26:55 +0900
Message-ID: <1400048825-6052-9-git-send-email-yj44.cho@samsung.com>
References: <1400048825-6052-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:32063 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751175AbaENG1M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 02:27:12 -0400
In-reply-to: <1400048825-6052-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, s.trumtrar@pengutronix.de, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

To support MIPI DSI command mode interface, the panel should generates
Tearing Effect synchronization signal between MCU and FB to display
video images.
And the display controller should trigger to transfer video image at
this signal.
So the panel receives the TE IRQ, then calls this handler chains
to notify it to the display controller.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c |   11 +++++++++++
 drivers/gpu/drm/exynos/exynos_drm_crtc.h |    7 +++++++
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |    3 +++
 include/drm/drm_mipi_dsi.h               |    8 ++++++++
 4 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 485fa26..2567ae0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -509,3 +509,14 @@ int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
 
 	return -EPERM;
 }
+
+int exynos_drm_crtc_te_handler(struct drm_crtc *crtc)
+{
+	struct exynos_drm_manager *manager = to_exynos_crtc(crtc)->manager;
+	int ret = 0;
+
+	if (manager->ops->te_handler)
+		ret = manager->ops->te_handler(manager);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index 9f74b10..875d93d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -36,4 +36,11 @@ void exynos_drm_crtc_plane_disable(struct drm_crtc *crtc, int zpos);
 int exynos_drm_crtc_get_pipe_from_type(struct drm_device *drm_dev,
 					unsigned int out_type);
 
+/*
+ * This function calls the crtc device(manager)'s te_handler() callback
+ * to trigger to transfer video image at the tearing effect synchronization
+ * signal.
+ */
+int exynos_drm_crtc_te_handler(struct drm_crtc *crtc);
+
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index e82e620..54b08d7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -181,6 +181,8 @@ struct exynos_drm_display {
  * @win_commit: apply hardware specific overlay data to registers.
  * @win_enable: enable hardware specific overlay.
  * @win_disable: disable hardware specific overlay.
+ * @te_handler: trigger to transfer video image at the tearing effect
+ *	synchronization signal if there is a page flip request.
  */
 struct exynos_drm_manager;
 struct exynos_drm_manager_ops {
@@ -199,6 +201,7 @@ struct exynos_drm_manager_ops {
 	void (*win_commit)(struct exynos_drm_manager *mgr, int zpos);
 	void (*win_enable)(struct exynos_drm_manager *mgr, int zpos);
 	void (*win_disable)(struct exynos_drm_manager *mgr, int zpos);
+	int (*te_handler)(struct exynos_drm_manager *mgr);
 };
 
 /*
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 7209df1..f6d4c85 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -49,6 +49,13 @@ struct mipi_dsi_msg {
  * @detach: detach DSI device from DSI host
  * @transfer: send and/or receive DSI packet, return number of received bytes,
  * 	      or error
+ * @te_handler: call the crtc te_handler() callback from DSI host.
+ *		The panel generates tearing effect synchronization signal
+ *		between MCU and FB to display video images.
+ *		And the display controller should trigger to transfer video
+ *		image at this signal.
+ *		So the panel receives the TE IRQ, then calls this handler
+ *		to notify it to the display controller.
  */
 struct mipi_dsi_host_ops {
 	int (*attach)(struct mipi_dsi_host *host,
@@ -57,6 +64,7 @@ struct mipi_dsi_host_ops {
 		      struct mipi_dsi_device *dsi);
 	ssize_t (*transfer)(struct mipi_dsi_host *host,
 			    struct mipi_dsi_msg *msg);
+	int (*te_handler)(struct mipi_dsi_host *host);
 };
 
 /**
-- 
1.7.9.5
