From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos: remove explicit encoder/connector
 de-initialization
Date: Mon, 22 Sep 2014 11:30:48 +0200
Message-ID: <1411378248-17479-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

All KMS objects are destroyed by drm_mode_config_cleanup in proper order
so component drivers should not care about it.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi Inki,

This is another spin-off of exynos_drm tests regarding your
component support update.
The patch is based as usual on the latest exynos-drm-next branch.

Regards
Andrzej
---
 drivers/gpu/drm/exynos/exynos_dp_core.c  | 5 -----
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 4 ----
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 4 ----
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 3 ---
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 6 ------
 5 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index cd50ece..6adb1e5 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1355,13 +1355,8 @@ static void exynos_dp_unbind(struct device *dev, struct device *master,
 				void *data)
 {
 	struct exynos_drm_display *display = dev_get_drvdata(dev);
-	struct exynos_dp_device *dp = display->ctx;
-	struct drm_encoder *encoder = dp->encoder;
 
 	exynos_dp_dpms(display, DRM_MODE_DPMS_OFF);
-
-	exynos_dp_connector_destroy(&dp->connector);
-	encoder->funcs->destroy(encoder);
 }
 
 static const struct component_ops exynos_dp_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 96c87db..3dc678e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -338,14 +338,10 @@ err_del_component:
 
 int exynos_dpi_remove(struct device *dev)
 {
-	struct drm_encoder *encoder = exynos_dpi_display.encoder;
 	struct exynos_dpi *ctx = exynos_dpi_display.ctx;
 
 	exynos_dpi_dpms(&exynos_dpi_display, DRM_MODE_DPMS_OFF);
 
-	exynos_dpi_connector_destroy(&ctx->connector);
-	encoder->funcs->destroy(encoder);
-
 	if (ctx->panel)
 		drm_panel_detach(ctx->panel);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 24741d8..acf7e9e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1660,13 +1660,9 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 				void *data)
 {
 	struct exynos_dsi *dsi = exynos_dsi_display.ctx;
-	struct drm_encoder *encoder = dsi->encoder;
 
 	exynos_dsi_dpms(&exynos_dsi_display, DRM_MODE_DPMS_OFF);
 
-	exynos_dsi_connector_destroy(&dsi->connector);
-	encoder->funcs->destroy(encoder);
-
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index d565207..9395e85 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -639,9 +639,6 @@ static int vidi_remove(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	encoder->funcs->destroy(encoder);
-	drm_connector_cleanup(&ctx->connector);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 7910fb3..563a19e 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2312,12 +2312,6 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 
 static void hdmi_unbind(struct device *dev, struct device *master, void *data)
 {
-	struct exynos_drm_display *display = get_hdmi_display(dev);
-	struct drm_encoder *encoder = display->encoder;
-	struct hdmi_context *hdata = display->ctx;
-
-	hdmi_connector_destroy(&hdata->connector);
-	encoder->funcs->destroy(encoder);
 }
 
 static const struct component_ops hdmi_component_ops = {
-- 
1.9.1
