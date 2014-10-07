From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/4] drm/exynos/dsi: remove redundant encoder field
Date: Tue, 07 Oct 2014 14:01:10 +0200
Message-ID: <1412683271-15835-4-git-send-email-a.hajda@samsung.com>
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

The patch removes redundant encoder field from private DSI context.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 39ec450..634904a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -271,7 +271,6 @@ struct exynos_dsi {
 	struct exynos_drm_display display;
 	struct mipi_dsi_host dsi_host;
 	struct drm_connector connector;
-	struct drm_encoder *encoder;
 	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct device *dev;
@@ -1105,7 +1104,7 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 {
 	struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
-	struct drm_encoder *encoder = dsi->encoder;
+	struct drm_encoder *encoder = dsi->display.encoder;
 
 	if (dsi->state & DSIM_STATE_ENABLED)
 		exynos_drm_crtc_te_handler(encoder->crtc);
@@ -1475,7 +1474,7 @@ exynos_dsi_best_encoder(struct drm_connector *connector)
 {
 	struct exynos_dsi *dsi = connector_to_dsi(connector);
 
-	return dsi->encoder;
+	return dsi->display.encoder;
 }
 
 static struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs = {
@@ -1491,8 +1490,6 @@ static int exynos_dsi_create_connector(struct exynos_drm_display *display,
 	struct drm_connector *connector = &dsi->connector;
 	int ret;
 
-	dsi->encoder = encoder;
-
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 
 	ret = drm_connector_init(encoder->dev, connector,
-- 
1.9.1
