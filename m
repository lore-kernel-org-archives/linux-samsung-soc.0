From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v6 01/14] drm/exynos: dsi: move the EoT packets configuration
 point
Date: Thu, 17 Jul 2014 18:01:16 +0900
Message-ID: <1405587689-1466-2-git-send-email-yj44.cho@samsung.com>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This configuration could be used in MIPI DSI command mode also.
And adds user manual description for display configuration.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 2df3592..58bfb2a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -468,13 +468,20 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 	/* DSI configuration */
 	reg = 0;
 
+	/*
+	 * The first bit of mode_flags specifies display configuration.
+	 * If this bit is set[= MIPI_DSI_MODE_VIDEO], dsi will support video
+	 * mode, otherwise it will support command mode.
+	 */
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
 		reg |= DSIM_VIDEO_MODE;
 
+		/*
+		 * The user manual describes that following bits are ignored in
+		 * command mode.
+		 */
 		if (!(dsi->mode_flags & MIPI_DSI_MODE_VSYNC_FLUSH))
 			reg |= DSIM_MFLUSH_VS;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
-			reg |= DSIM_EOT_DISABLE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 			reg |= DSIM_SYNC_INFORM;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
@@ -491,6 +498,9 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 			reg |= DSIM_HSA_MODE;
 	}
 
+	if (!(dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
+		reg |= DSIM_EOT_DISABLE;
+
 	switch (dsi->format) {
 	case MIPI_DSI_FMT_RGB888:
 		reg |= DSIM_MAIN_PIX_FORMAT_RGB888;
-- 
1.9.0
