From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v4 05/14] drm/exynos: dsi: add TE handler to support LCD I80
 interface
Date: Thu, 05 Jun 2014 15:19:45 +0900
Message-ID: <1401949194-20092-6-git-send-email-yj44.cho@samsung.com>
References: <1401949194-20092-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25286 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751189AbaFEGUD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jun 2014 02:20:03 -0400
In-reply-to: <1401949194-20092-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

To support LCD I80 interface, the DSI host calls this handler
to notify the panel tearing effect synchronization signal to
the CRTC device manager to trigger to transfer video image.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index df2d23d..db760d8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -24,6 +24,7 @@
 #include <video/mipi_display.h>
 #include <video/videomode.h>
 
+#include "exynos_drm_crtc.h"
 #include "exynos_drm_drv.h"
 
 /* returns true iff both arguments logically differs */
@@ -1033,10 +1034,22 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
 	return (ret < 0) ? ret : xfer.rx_done;
 }
 
+static int exynos_dsi_host_te_handler(struct mipi_dsi_host *host)
+{
+	struct exynos_dsi *dsi = host_to_dsi(host);
+	struct drm_encoder *encoder = dsi->encoder;
+
+	if (!(dsi->state & DSIM_STATE_ENABLED))
+		return -EPERM;
+
+	return exynos_drm_crtc_te_handler(encoder->crtc);
+}
+
 static const struct mipi_dsi_host_ops exynos_dsi_ops = {
 	.attach = exynos_dsi_host_attach,
 	.detach = exynos_dsi_host_detach,
 	.transfer = exynos_dsi_host_transfer,
+	.te_handler = exynos_dsi_host_te_handler,
 };
 
 static int exynos_dsi_poweron(struct exynos_dsi *dsi)
-- 
1.7.9.5
