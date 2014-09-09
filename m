From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 6/9] drm/exynos/dsi: unregister connector on removal
Date: Tue, 09 Sep 2014 15:16:10 +0200
Message-ID: <1410268573-2297-7-git-send-email-a.hajda@samsung.com>
References: <1410268573-2297-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1410268573-2297-1-git-send-email-a.hajda@samsung.com>
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
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

During component unbind connector should be unregistered.
Also DSI host should be unregistered after KMS cleanup.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 0065a5a..24741d8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1441,6 +1441,9 @@ exynos_dsi_detect(struct drm_connector *connector, bool force)
 
 static void exynos_dsi_connector_destroy(struct drm_connector *connector)
 {
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+	connector->dev = NULL;
 }
 
 static struct drm_connector_funcs exynos_dsi_connector_funcs = {
@@ -1661,10 +1664,10 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 
 	exynos_dsi_dpms(&exynos_dsi_display, DRM_MODE_DPMS_OFF);
 
-	mipi_dsi_host_unregister(&dsi->dsi_host);
-
+	exynos_dsi_connector_destroy(&dsi->connector);
 	encoder->funcs->destroy(encoder);
-	drm_connector_cleanup(&dsi->connector);
+
+	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
 
 static const struct component_ops exynos_dsi_component_ops = {
-- 
1.9.1
