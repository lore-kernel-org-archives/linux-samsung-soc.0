From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC v4 PATCH 01/18] drm/exynos: dsi: move the EoT packets
 configuration point
Date: Wed, 07 May 2014 16:46:22 +0900
Message-ID: <1399448799-8057-2-git-send-email-yj44.cho@samsung.com>
References: <1399448799-8057-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42549 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751134AbaEGHqp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 May 2014 03:46:45 -0400
In-reply-to: <1399448799-8057-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, laurent.pinchart@ideasonboard.com, s.trumtrar@pengutronix.de

This configuration could be used in MIPI DSI command mode also.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index eb73e3b..956e5f3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -472,8 +472,6 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 
 		if (!(dsi->mode_flags & MIPI_DSI_MODE_VSYNC_FLUSH))
 			reg |= DSIM_MFLUSH_VS;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
-			reg |= DSIM_EOT_DISABLE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 			reg |= DSIM_SYNC_INFORM;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
@@ -490,6 +488,9 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 			reg |= DSIM_HSA_MODE;
 	}
 
+	if (!(dsi->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
+		reg |= DSIM_EOT_DISABLE;
+
 	switch (dsi->format) {
 	case MIPI_DSI_FMT_RGB888:
 		reg |= DSIM_MAIN_PIX_FORMAT_RGB888;
-- 
1.7.9.5
