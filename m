From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/4] drm/exynos/dsi: remove global variable exynos_dsi_display
Date: Tue, 07 Oct 2014 14:01:08 +0200
Message-ID: <1412683271-15835-2-git-send-email-a.hajda@samsung.com>
References: <1412683271-15835-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1412683271-15835-1-git-send-email-a.hajda@samsung.com>
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
Cc: Kukjin Kim <kgene.kim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

exynos_dsi_display is used by internal Exynos DRM framework for
representing pair encoder->connecter. As it should be mapped 1:1 to dsi
private context it seems more reasonable to embed it directly
in that context. As a result further code simplification will be possible.
Moreover it will be possible to handle multiple DSI devices in the system.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 38 ++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index acf7e9e..84e3808 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -268,6 +268,7 @@ struct exynos_dsi_driver_data {
 };
 
 struct exynos_dsi {
+	struct exynos_drm_display display;
 	struct mipi_dsi_host dsi_host;
 	struct drm_connector connector;
 	struct drm_encoder *encoder;
@@ -1531,10 +1532,6 @@ static struct exynos_drm_display_ops exynos_dsi_display_ops = {
 	.dpms = exynos_dsi_dpms
 };
 
-static struct exynos_drm_display exynos_dsi_display = {
-	.type = EXYNOS_DISPLAY_TYPE_LCD,
-	.ops = &exynos_dsi_display_ops,
-};
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
 
 /* of_* functions will be removed after merge of of_graph patches */
@@ -1640,28 +1637,28 @@ end:
 static int exynos_dsi_bind(struct device *dev, struct device *master,
 				void *data)
 {
+	struct exynos_drm_display *display = dev_get_drvdata(dev);
+	struct exynos_dsi *dsi = display->ctx;
 	struct drm_device *drm_dev = data;
-	struct exynos_dsi *dsi;
 	int ret;
 
-	ret = exynos_drm_create_enc_conn(drm_dev, &exynos_dsi_display);
+	ret = exynos_drm_create_enc_conn(drm_dev, display);
 	if (ret) {
 		DRM_ERROR("Encoder create [%d] failed with %d\n",
-				exynos_dsi_display.type, ret);
+			  display->type, ret);
 		return ret;
 	}
 
-	dsi = exynos_dsi_display.ctx;
-
 	return mipi_dsi_host_register(&dsi->dsi_host);
 }
 
 static void exynos_dsi_unbind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct exynos_dsi *dsi = exynos_dsi_display.ctx;
+	struct exynos_drm_display *display = dev_get_drvdata(dev);
+	struct exynos_dsi *dsi = display->ctx;
 
-	exynos_dsi_dpms(&exynos_dsi_display, DRM_MODE_DPMS_OFF);
+	exynos_dsi_dpms(display, DRM_MODE_DPMS_OFF);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
@@ -1673,22 +1670,23 @@ static const struct component_ops exynos_dsi_component_ops = {
 
 static int exynos_dsi_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct exynos_dsi *dsi;
 	int ret;
 
-	ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR,
-					exynos_dsi_display.type);
+	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
+	if (!dsi)
+		return -ENOMEM;
+
+	dsi->display.type = EXYNOS_DISPLAY_TYPE_LCD;
+	dsi->display.ops = &exynos_dsi_display_ops;
+
+	ret = exynos_drm_component_add(dev, EXYNOS_DEVICE_TYPE_CONNECTOR,
+				       dsi->display.type);
 	if (ret)
 		return ret;
 
-	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
-	if (!dsi) {
-		dev_err(&pdev->dev, "failed to allocate dsi object.\n");
-		ret = -ENOMEM;
-		goto err_del_component;
-	}
-
 	/* To be checked as invalid one */
 	dsi->te_gpio = -ENOENT;
 
-- 
1.9.1
