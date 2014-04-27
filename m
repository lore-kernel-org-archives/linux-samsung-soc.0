From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC v3 PATCH 06/16] drm/exynos: add TE handler to support MIPI DSI
 command mode interface
Date: Sun, 27 Apr 2014 10:50:02 +0900
Message-ID: <1398563412-21781-7-git-send-email-yj44.cho@samsung.com>
References: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

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
index 1419d11..d902d64 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -491,3 +491,14 @@ void exynos_drm_crtc_complete_scanout(struct drm_framebuffer *fb)
 			manager->ops->wait_for_vblank(manager);
 	}
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
index c27b66c..eb78c16 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -32,4 +32,11 @@ void exynos_drm_crtc_plane_commit(struct drm_crtc *crtc, int zpos);
 void exynos_drm_crtc_plane_enable(struct drm_crtc *crtc, int zpos);
 void exynos_drm_crtc_plane_disable(struct drm_crtc *crtc, int zpos);
 
+/*
+ * This function calls the crtc device(manager)'s te_handler() callback
+ * to trigger to transfer video image at the tearing effect synchronization
+ * signal.
+ */
+int exynos_drm_crtc_te_handler(struct drm_crtc *crtc);
+
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 4c5cf68..4d8865d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -186,6 +186,8 @@ struct exynos_drm_display {
  * @win_commit: apply hardware specific overlay data to registers.
  * @win_enable: enable hardware specific overlay.
  * @win_disable: disable hardware specific overlay.
+ * @te_handler: trigger to transfer video image at the tearing effect
+ *	synchronization signal if there is a page flip request.
  */
 struct exynos_drm_manager;
 struct exynos_drm_manager_ops {
@@ -207,6 +209,7 @@ struct exynos_drm_manager_ops {
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
