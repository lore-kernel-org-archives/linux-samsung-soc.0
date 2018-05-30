From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v2 04/10] drm/exynos: add non-panel path to exynos_dsi_enable()
Date: Wed, 30 May 2018 14:15:55 +0200
Message-ID: <1527682561-1386-5-git-send-email-m.purski@samsung.com>
References: <1527682561-1386-1-git-send-email-m.purski@samsung.com>
 <CGME20180530121625eucas1p239693227eda97d090f3bfe530ded0c52@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1527682561-1386-1-git-send-email-m.purski@samsung.com>
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

As DSIM can now have a bridge connected as a peripheral, it should be
possible to successfully enable exynos_dsi, when there is no panel
provided.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 7b50bad..7f6a0b1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1382,27 +1382,25 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 	if (dsi->state & DSIM_STATE_ENABLED)
 		return;
 
-	pm_runtime_get_sync(dsi->dev);
-
-	dsi->state |= DSIM_STATE_ENABLED;
-
-	ret = drm_panel_prepare(dsi->panel);
-	if (ret < 0) {
-		dsi->state &= ~DSIM_STATE_ENABLED;
-		return;
+	if (dsi->panel) {
+		ret = drm_panel_prepare(dsi->panel);
+		if (ret < 0)
+			return;
 	}
 
 	exynos_dsi_set_display_mode(dsi);
 	exynos_dsi_set_display_enable(dsi, true);
 
-	ret = drm_panel_enable(dsi->panel);
-	if (ret < 0) {
-		dsi->state &= ~DSIM_STATE_ENABLED;
-		exynos_dsi_set_display_enable(dsi, false);
-		drm_panel_unprepare(dsi->panel);
-		return;
+	if (dsi->panel) {
+		ret = drm_panel_enable(dsi->panel);
+		if (ret < 0) {
+			exynos_dsi_set_display_enable(dsi, false);
+			drm_panel_unprepare(dsi->panel);
+			return;
+		}
 	}
 
+	dsi->state |= DSIM_STATE_ENABLED;
 	dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
 }
 
-- 
2.7.4
