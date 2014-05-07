From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC v4 PATCH 09/18] drm/exynos: dsi: add TE handler to support
 command mode interface
Date: Wed, 07 May 2014 16:46:30 +0900
Message-ID: <1399448799-8057-10-git-send-email-yj44.cho@samsung.com>
References: <1399448799-8057-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1399448799-8057-1-git-send-email-yj44.cho@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

To support command mode interface, the DSI host calls this handler
to notify the panel tearing effect synchronization signal to the
CRTC device manager to trigger to transfer video image.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 956e5f3..4a918ec 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -23,6 +23,7 @@
 #include <video/mipi_display.h>
 #include <video/videomode.h>
 
+#include "exynos_drm_crtc.h"
 #include "exynos_drm_drv.h"
 
 /* returns true iff both arguments logically differs */
@@ -1032,10 +1033,22 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
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
