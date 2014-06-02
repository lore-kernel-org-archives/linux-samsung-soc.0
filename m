From: YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 06/15] drm/exynos: dsi: add TE handler to support LCD I80
 interface
Date: Mon, 02 Jun 2014 14:22:42 +0900
Message-ID: <1401686571-22148-7-git-send-email-yj44.cho@samsung.com>
References: <1401686571-22148-1-git-send-email-yj44.cho@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1401686571-22148-1-git-send-email-yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

To support LCD I80 interface, the DSI host calls this handler
to notify the panel tearing effect synchronization signal to
the CRTC device manager to trigger to transfer video image.

Signed-off-by: YoungJun Cho <yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 0a4e3ce..783d7a5 100644
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
