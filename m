From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v3 3/9] drm/exynos: enable out_bridge in exynos_dsi_enable()
Date: Tue, 19 Jun 2018 10:19:24 +0200
Message-ID: <1529396370-18761-4-git-send-email-m.purski@samsung.com>
References: <1529396370-18761-1-git-send-email-m.purski@samsung.com>
 <CGME20180619081959eucas1p14aee2dfc0231d2f645e3c9071b92341e@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1529396370-18761-1-git-send-email-m.purski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, Maciej Purski <m.purski@samsung.com>, Archit Taneja <architt@codeaurora.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
List-Id: linux-samsung-soc@vger.kernel.org

As the out bridge will not be enabled directly by the framework,
it should be enabled by DSI. Exynos_dsi_enable() should handle a case,
when there is an out_bridge connected as a DSI peripheral.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 34 +++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index c0408c0..8aa7ace 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1386,25 +1386,33 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 
 	dsi->state |= DSIM_STATE_ENABLED;
 
-	ret = drm_panel_prepare(dsi->panel);
-	if (ret < 0) {
-		dsi->state &= ~DSIM_STATE_ENABLED;
-		pm_runtime_put_sync(dsi->dev);
-		return;
+	if (dsi->panel) {
+		ret = drm_panel_prepare(dsi->panel);
+		if (ret < 0) {
+			dsi->state &= ~DSIM_STATE_ENABLED;
+			return;
+		}
 	}
 
+	if (dsi->out_bridge)
+		drm_bridge_pre_enable(dsi->out_bridge);
+
 	exynos_dsi_set_display_mode(dsi);
 	exynos_dsi_set_display_enable(dsi, true);
 
-	ret = drm_panel_enable(dsi->panel);
-	if (ret < 0) {
-		dsi->state &= ~DSIM_STATE_ENABLED;
-		exynos_dsi_set_display_enable(dsi, false);
-		drm_panel_unprepare(dsi->panel);
-		pm_runtime_put_sync(dsi->dev);
-		return;
+	if (dsi->panel) {
+		ret = drm_panel_enable(dsi->panel);
+		if (ret < 0) {
+			dsi->state &= ~DSIM_STATE_ENABLED;
+			exynos_dsi_set_display_enable(dsi, false);
+			drm_panel_unprepare(dsi->panel);
+			return;
+		}
 	}
 
+	if (dsi->out_bridge)
+		drm_bridge_enable(dsi->out_bridge);
+
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
 }
 
@@ -1418,8 +1426,10 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
 	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
 
 	drm_panel_disable(dsi->panel);
+	drm_bridge_disable(dsi->out_bridge);
 	exynos_dsi_set_display_enable(dsi, false);
 	drm_panel_unprepare(dsi->panel);
+	drm_bridge_post_disable(dsi->out_bridge);
 
 	dsi->state &= ~DSIM_STATE_ENABLED;
 
-- 
2.7.4
