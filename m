From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH 02/12] drm/exynos: move pm_runtime_get_sync() to
 exynos_dsi_init()
Date: Mon, 28 May 2018 11:47:06 +0200
Message-ID: <1527500833-16005-3-git-send-email-m.purski@samsung.com>
References: <1527500833-16005-1-git-send-email-m.purski@samsung.com>
        <CGME20180528094723eucas1p1776829e0b57d2ec6c4e28be872cf88fc@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1527500833-16005-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

In order to allow bridge drivers to use DSI transfers in their
pre_enable callbacks, pm_runtime_get_sync() should be performed before
exynos_dsi_enable(). DSIM_STATE_ENABLED flag now should not guard
from calling dsi_host_transfer() before enabling.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 9599e6b..94460b0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1312,6 +1312,7 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
 {
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 
+	pm_runtime_get_sync(dsi->dev);
 	exynos_dsi_reset(dsi);
 	exynos_dsi_enable_irq(dsi);
 
@@ -1388,7 +1389,6 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 	ret = drm_panel_prepare(dsi->panel);
 	if (ret < 0) {
 		dsi->state &= ~DSIM_STATE_ENABLED;
-		pm_runtime_put_sync(dsi->dev);
 		return;
 	}
 
@@ -1400,7 +1400,6 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
 		dsi->state &= ~DSIM_STATE_ENABLED;
 		exynos_dsi_set_display_enable(dsi, false);
 		drm_panel_unprepare(dsi->panel);
-		pm_runtime_put_sync(dsi->dev);
 		return;
 	}
 
@@ -1566,9 +1565,6 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
 	struct exynos_dsi_transfer xfer;
 	int ret;
 
-	if (!(dsi->state & DSIM_STATE_ENABLED))
-		return -EINVAL;
-
 	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
 		ret = exynos_dsi_init(dsi);
 		if (ret)
-- 
2.7.4
