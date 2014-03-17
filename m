From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/9] drm/exynos: correct timing porch conversion
Date: Mon, 17 Mar 2014 11:27:19 +0100
Message-ID: <1395052045-23848-4-git-send-email-a.hajda@samsung.com>
References: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1395052045-23848-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Denis Carikli <denis@eukrea.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch corrects porch calculation. It should
be calculated as a difference between adjacent
respective fields of drm_display_mode.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index f78fbf4..10431b0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -221,7 +221,7 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
 	struct drm_display_mode *mode = &ctx->mode;
 	struct fimd_driver_data *driver_data;
 	u32 val, clkdiv, vidcon1;
-	int hblank, vblank, vsync_len, vbpd, vfpd, hsync_len, hbpd, hfpd;
+	int vsync_len, vbpd, vfpd, hsync_len, hbpd, hfpd;
 
 	driver_data = ctx->driver_data;
 	if (ctx->suspended)
@@ -240,10 +240,9 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
 	writel(vidcon1, ctx->regs + driver_data->timing_base + VIDCON1);
 
 	/* setup vertical timing values. */
-	vblank = mode->crtc_vblank_end - mode->crtc_vblank_start;
 	vsync_len = mode->crtc_vsync_end - mode->crtc_vsync_start;
-	vbpd = (vblank - vsync_len) / 2;
-	vfpd = vblank - vsync_len - vbpd;
+	vbpd = mode->crtc_vtotal - mode->crtc_vsync_end;
+	vfpd = mode->crtc_vsync_start - mode->crtc_vdisplay;
 
 	val = VIDTCON0_VBPD(vbpd - 1) |
 		VIDTCON0_VFPD(vfpd - 1) |
@@ -251,10 +250,9 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
 	writel(val, ctx->regs + driver_data->timing_base + VIDTCON0);
 
 	/* setup horizontal timing values.  */
-	hblank = mode->crtc_hblank_end - mode->crtc_hblank_start;
 	hsync_len = mode->crtc_hsync_end - mode->crtc_hsync_start;
-	hbpd = (hblank - hsync_len) / 2;
-	hfpd = hblank - hsync_len - hbpd;
+	hbpd = mode->crtc_htotal - mode->crtc_hsync_end;
+	hfpd = mode->crtc_hsync_start - mode->crtc_hdisplay;
 
 	val = VIDTCON1_HBPD(hbpd - 1) |
 		VIDTCON1_HFPD(hfpd - 1) |
-- 
1.8.3.2
