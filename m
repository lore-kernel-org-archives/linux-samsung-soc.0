From: Satendra Singh Thakur <satendra.t@samsung.com>
Subject: [PATCH v2 03/13] drm/kms/mode/exynos-dsi: using helper func
 drm_display_mode_to_videomode for calculating timing parameters
Date: Mon,  7 May 2018 09:02:17 +0530
Message-ID: <1525663938-4172-1-git-send-email-satendra.t@samsung.com>
References: <920ac8d1-8d2d-1332-256d-21472f69fca5@arm.com>
        <CGME20180507033238epcas5p2601b5ccbba8fa02cdde4f1375e90abe9@epcas5p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <920ac8d1-8d2d-1332-256d-21472f69fca5@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robin.murphy@arm.com, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sst2005@gmail.com, madhur.verma@samsung.com, Satendra Singh Thakur <satendra.t@samsung.com>, Hemanshu Srivastava <hemanshu.s@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

To avoid duplicate logic for the same

Signed-off-by: Satendra Singh Thakur <satendra.t@samsung.com>
Acked-by: Madhur Verma <madhur.verma@samsung.com>
Cc: Hemanshu Srivastava <hemanshu.s@samsung.com>
---

 v2: Removed Mr Robin from reviewed-by field	

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 7904ffa..7fe84fd 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1490,17 +1490,8 @@ static void exynos_dsi_mode_set(struct drm_encoder *encoder,
 				struct drm_display_mode *adjusted_mode)
 {
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
-	struct videomode *vm = &dsi->vm;
-	struct drm_display_mode *m = adjusted_mode;
-
-	vm->hactive = m->hdisplay;
-	vm->vactive = m->vdisplay;
-	vm->vfront_porch = m->vsync_start - m->vdisplay;
-	vm->vback_porch = m->vtotal - m->vsync_end;
-	vm->vsync_len = m->vsync_end - m->vsync_start;
-	vm->hfront_porch = m->hsync_start - m->hdisplay;
-	vm->hback_porch = m->htotal - m->hsync_end;
-	vm->hsync_len = m->hsync_end - m->hsync_start;
+
+	drm_display_mode_to_videomode(adjusted_mode, &dsi->vm);
 }
 
 static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
-- 
2.7.4
