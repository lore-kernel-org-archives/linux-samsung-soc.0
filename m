From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH 1/9] drm/exynos: correct timing porch conversion
Date: Wed, 22 Jan 2014 15:35:27 +0100
Message-ID: <1390401336-22915-2-git-send-email-a.hajda@samsung.com>
References: <1390401336-22915-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1390401336-22915-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 8caaac2..b611f33 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -538,21 +538,18 @@ static void fimd_mode_set(struct exynos_drm_manager *mgr,
 {
 	struct fimd_context *ctx = mgr->ctx;
 	struct fimd_mode_data *mode = &ctx->mode;
-	int hblank, vblank;
 
-	vblank = in_mode->crtc_vblank_end - in_mode->crtc_vblank_start;
 	mode->vtotal = in_mode->crtc_vtotal;
 	mode->vdisplay = in_mode->crtc_vdisplay;
 	mode->vsync_len = in_mode->crtc_vsync_end - in_mode->crtc_vsync_start;
-	mode->vbpd = (vblank - mode->vsync_len) / 2;
-	mode->vfpd = vblank - mode->vsync_len - mode->vbpd;
+	mode->vbpd = in_mode->crtc_vtotal - in_mode->crtc_vsync_end;
+	mode->vfpd = in_mode->crtc_vsync_start - in_mode->crtc_vdisplay;
 
-	hblank = in_mode->crtc_hblank_end - in_mode->crtc_hblank_start;
 	mode->htotal = in_mode->crtc_htotal;
 	mode->hdisplay = in_mode->crtc_hdisplay;
 	mode->hsync_len = in_mode->crtc_hsync_end - in_mode->crtc_hsync_start;
-	mode->hbpd = (hblank - mode->hsync_len) / 2;
-	mode->hfpd = hblank - mode->hsync_len - mode->hbpd;
+	mode->hbpd = in_mode->crtc_htotal - in_mode->crtc_hsync_end;
+	mode->hfpd = in_mode->crtc_hsync_start - in_mode->crtc_hdisplay;
 
 	mode->clkdiv = fimd_calc_clkdiv(ctx, in_mode);
 
-- 
1.8.3.2
