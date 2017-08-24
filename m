From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 01/10] drm/exynos/decon5433: use readl_poll_timeout
 helpers
Date: Thu, 24 Aug 2017 15:33:50 +0200
Message-ID: <1503581639-580-2-git-send-email-a.hajda@samsung.com>
References: <1503581639-580-1-git-send-email-a.hajda@samsung.com>
        <CGME20170824133408eucas1p1e7b9988ac74fdd3e8dd8d25ead949ec5@eucas1p1.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1503581639-580-1-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Linux core provide helpers for polling with timeout, lets use them.

Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 5792ca88..237b4c9 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/component.h>
+#include <linux/iopoll.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
 #include <linux/of_gpio.h>
@@ -407,24 +408,19 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
 
 static void decon_swreset(struct decon_context *ctx)
 {
-	unsigned int tries;
 	unsigned long flags;
+	u32 val;
+	int ret;
 
 	writel(0, ctx->addr + DECON_VIDCON0);
-	for (tries = 2000; tries; --tries) {
-		if (~readl(ctx->addr + DECON_VIDCON0) & VIDCON0_STOP_STATUS)
-			break;
-		udelay(10);
-	}
+	readl_poll_timeout(ctx->addr + DECON_VIDCON0, val,
+			   ~val & VIDCON0_STOP_STATUS, 12, 20000);
 
 	writel(VIDCON0_SWRESET, ctx->addr + DECON_VIDCON0);
-	for (tries = 2000; tries; --tries) {
-		if (~readl(ctx->addr + DECON_VIDCON0) & VIDCON0_SWRESET)
-			break;
-		udelay(10);
-	}
+	ret = readl_poll_timeout(ctx->addr + DECON_VIDCON0, val,
+				 ~val & VIDCON0_SWRESET, 12, 20000);
 
-	WARN(tries == 0, "failed to software reset DECON\n");
+	WARN(ret < 0, "failed to software reset DECON\n");
 
 	spin_lock_irqsave(&ctx->vblank_lock, flags);
 	ctx->frame_id = 0;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
