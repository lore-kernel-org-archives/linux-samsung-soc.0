From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH] drm/exynos: use 4WORD dma burst length for small fbs
Date: Wed, 07 May 2014 16:55:22 +0530
Message-ID: <1399461922-27131-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:32897 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755316AbaEGL03 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 May 2014 07:26:29 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5700F82BS3V750@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 May 2014 20:26:27 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>, Prathyush K <prathyush.k@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

In case of exynos, setting dma-burst to 16Word causes permanent
tearing for very small buffers, e.g. cursor buffer. Burst Mode
switching, which is based on overlay size is not recommended as
overlay size varies a lot towards the end of the screen. This
causes unstable DMA which results into tearing again.

Rendering small buffers with lower burst size doesn't
cause any noticable performance overhead. 128 pixel width is
selected based on mulitple experiments with exynos5 SoCs.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
Signed-off-by: Prathyush K <prathyush.k@samsung.com>
---
Based on Inki Dae's exynos-drm-next branch.

 drivers/gpu/drm/exynos/exynos_drm_fimd.c |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 40fd6cc..ef56077 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -38,6 +38,7 @@
  */
 
 #define FIMD_DEFAULT_FRAMERATE 60
+#define MIN_FB_WIDTH_FOR_16WORD_BURST 128
 
 /* position control register for hardware window 0, 2 ~ 4.*/
 #define VIDOSD_A(win)		(VIDOSD_BASE + 0x00 + (win) * 16)
@@ -446,6 +447,19 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win)
 
 	DRM_DEBUG_KMS("bpp = %d\n", win_data->bpp);
 
+	/*
+	 * In case of exynos, setting dma-burst to 16Word causes permanent
+	 * tearing for very small buffers, e.g. cursor buffer. Burst Mode
+	 * switching which is based on overlay size is not recommended as
+	 * overlay size varies alot towards the end of the screen and rapid
+	 * movement causes unstable DMA which results into iommu crash/tear.
+	 */
+
+	if (win_data->fb_width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
+		val &= ~WINCONx_BURSTLEN_MASK;
+		val |= WINCONx_BURSTLEN_4WORD;
+	}
+
 	writel(val, ctx->regs + WINCON(win));
 }
 
-- 
1.7.9.5
