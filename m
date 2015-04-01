From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH -v4 1/8] drm/exynos: fimd: fix alpha setting for XR24 pixel format
Date: Wed,  1 Apr 2015 13:02:05 -0300
Message-ID: <1427904132-15677-2-git-send-email-gustavo@padovan.org>
References: <1427904132-15677-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f172.google.com ([209.85.216.172]:36673 "EHLO
	mail-qc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752694AbbDAQCV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Apr 2015 12:02:21 -0400
Received: by qcgx3 with SMTP id x3so45023430qcg.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2015 09:02:20 -0700 (PDT)
In-Reply-To: <1427904132-15677-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

XR24 planes were not shown properly, so now set the right registers
to correctly enable displaying these planes.

It also moves the alpha register settings to fimd_win_set_pixfmt()
to keep all pixel format stuff together.

v2: remove leftover var alpha

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 33 +++++++++++++++++++++-----------
 include/video/samsung_fimd.h             |  5 +++++
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 0d5681f..e16ba75 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -54,6 +54,9 @@
 /* size control register for hardware windows 1 ~ 2. */
 #define VIDOSD_D(win)		(VIDOSD_BASE + 0x0C + (win) * 16)
 
+#define VIDWnALPHA0(win)	(VIDW_ALPHA + 0x00 + (win) * 8)
+#define VIDWnALPHA1(win)	(VIDW_ALPHA + 0x04 + (win) * 8)
+
 #define VIDWx_BUF_START(win, buf)	(VIDW_BUF_START(buf) + (win) * 8)
 #define VIDWx_BUF_END(win, buf)		(VIDW_BUF_END(buf) + (win) * 8)
 #define VIDWx_BUF_SIZE(win, buf)	(VIDW_BUF_SIZE(buf) + (win) * 4)
@@ -625,6 +628,24 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
 	}
 
 	writel(val, ctx->regs + WINCON(win));
+
+	/* hardware window 0 doesn't support alpha channel. */
+	if (win != 0) {
+		/* OSD alpha */
+		val = VIDISD14C_ALPHA0_R(0xf) |
+			VIDISD14C_ALPHA0_G(0xf) |
+			VIDISD14C_ALPHA0_B(0xf) |
+			VIDISD14C_ALPHA1_R(0xf) |
+			VIDISD14C_ALPHA1_G(0xf) |
+			VIDISD14C_ALPHA1_B(0xf);
+
+		writel(val, ctx->regs + VIDOSD_C(win));
+
+		val = VIDW_ALPHA_R(0xf) | VIDW_ALPHA_G(0xf) |
+			VIDW_ALPHA_G(0xf);
+		writel(val, ctx->regs + VIDWnALPHA0(win));
+		writel(val, ctx->regs + VIDWnALPHA1(win));
+	}
 }
 
 static void fimd_win_set_colkey(struct fimd_context *ctx, unsigned int win)
@@ -672,7 +693,7 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	struct fimd_context *ctx = crtc->ctx;
 	struct fimd_win_data *win_data;
 	int win = zpos;
-	unsigned long val, alpha, size;
+	unsigned long val, size;
 	unsigned int last_x;
 	unsigned int last_y;
 
@@ -749,16 +770,6 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
 	DRM_DEBUG_KMS("osd pos: tx = %d, ty = %d, bx = %d, by = %d\n",
 			win_data->offset_x, win_data->offset_y, last_x, last_y);
 
-	/* hardware window 0 doesn't support alpha channel. */
-	if (win != 0) {
-		/* OSD alpha */
-		alpha = VIDISD14C_ALPHA1_R(0xf) |
-			VIDISD14C_ALPHA1_G(0xf) |
-			VIDISD14C_ALPHA1_B(0xf);
-
-		writel(alpha, ctx->regs + VIDOSD_C(win));
-	}
-
 	/* OSD size */
 	if (win != 3 && win != 4) {
 		u32 offset = VIDOSD_D(win);
diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
index a20e4a3..5132428 100644
--- a/include/video/samsung_fimd.h
+++ b/include/video/samsung_fimd.h
@@ -289,6 +289,11 @@
 #define VIDISD14C_ALPHA1_B_LIMIT		0xf
 #define VIDISD14C_ALPHA1_B(_x)			((_x) << 0)
 
+#define VIDW_ALPHA				0x021c
+#define VIDW_ALPHA_R(_x)			((_x) << 16)
+#define VIDW_ALPHA_G(_x)			((_x) << 8)
+#define VIDW_ALPHA_B(_x)			((_x) << 0)
+
 /* Video buffer addresses */
 #define VIDW_BUF_START(_buff)			(0xA0 + ((_buff) * 8))
 #define VIDW_BUF_START1(_buff)			(0xA4 + ((_buff) * 8))
-- 
2.1.0
