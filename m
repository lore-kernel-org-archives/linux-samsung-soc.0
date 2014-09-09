From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 7/9] drm/exynos/dpi: unregister connector and panel on removal
Date: Tue, 09 Sep 2014 15:16:11 +0200
Message-ID: <1410268573-2297-8-git-send-email-a.hajda@samsung.com>
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

During component removal it should unregister connector
and optionally detach the panel.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index fa08f05..96c87db 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -342,8 +342,12 @@ int exynos_dpi_remove(struct device *dev)
 	struct exynos_dpi *ctx = exynos_dpi_display.ctx;
 
 	exynos_dpi_dpms(&exynos_dpi_display, DRM_MODE_DPMS_OFF);
+
+	exynos_dpi_connector_destroy(&ctx->connector);
 	encoder->funcs->destroy(encoder);
-	drm_connector_cleanup(&ctx->connector);
+
+	if (ctx->panel)
+		drm_panel_detach(ctx->panel);
 
 	exynos_drm_component_del(dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
 
-- 
1.9.1
