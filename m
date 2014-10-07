From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 4/4] drm/exynos/dsi: stop using display->ctx pointer
Date: Tue, 07 Oct 2014 14:01:11 +0200
Message-ID: <1412683271-15835-5-git-send-email-a.hajda@samsung.com>
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

The patch replaces accesses to display->ctx pointer by container_of
construct. It will allow to remove ctx field in the future.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 634904a..abdc3d1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -304,6 +304,11 @@ struct exynos_dsi {
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
 #define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
 
+static inline struct exynos_dsi *display_to_dsi(struct exynos_drm_display *d)
+{
+	return container_of(d, struct exynos_dsi, display);
+}
+
 static struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 	.plltmr_reg = 0x50,
 	.has_freqband = 1,
@@ -1397,7 +1402,7 @@ static void exynos_dsi_disable(struct exynos_dsi *dsi)
 
 static void exynos_dsi_dpms(struct exynos_drm_display *display, int mode)
 {
-	struct exynos_dsi *dsi = display->ctx;
+	struct exynos_dsi *dsi = display_to_dsi(display);
 
 	if (dsi->panel) {
 		switch (mode) {
@@ -1486,7 +1491,7 @@ static struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs = {
 static int exynos_dsi_create_connector(struct exynos_drm_display *display,
 				       struct drm_encoder *encoder)
 {
-	struct exynos_dsi *dsi = display->ctx;
+	struct exynos_dsi *dsi = display_to_dsi(display);
 	struct drm_connector *connector = &dsi->connector;
 	int ret;
 
@@ -1510,7 +1515,7 @@ static int exynos_dsi_create_connector(struct exynos_drm_display *display,
 static void exynos_dsi_mode_set(struct exynos_drm_display *display,
 			 struct drm_display_mode *mode)
 {
-	struct exynos_dsi *dsi = display->ctx;
+	struct exynos_dsi *dsi = display_to_dsi(display);
 	struct videomode *vm = &dsi->vm;
 
 	vm->hactive = mode->hdisplay;
@@ -1635,7 +1640,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 				void *data)
 {
 	struct exynos_drm_display *display = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = display->ctx;
+	struct exynos_dsi *dsi = display_to_dsi(display);
 	struct drm_device *drm_dev = data;
 	int ret;
 
@@ -1653,7 +1658,7 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 				void *data)
 {
 	struct exynos_drm_display *display = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = display->ctx;
+	struct exynos_dsi *dsi = display_to_dsi(display);
 
 	exynos_dsi_dpms(display, DRM_MODE_DPMS_OFF);
 
@@ -1755,8 +1760,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 		goto err_del_component;
 	}
 
-	dsi->display.ctx = dsi;
-
 	platform_set_drvdata(pdev, &dsi->display);
 
 	ret = component_add(dev, &exynos_dsi_component_ops);
-- 
1.9.1
