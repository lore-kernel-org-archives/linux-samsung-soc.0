From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v2] drm/exynos/fimd: only finish pageflip if START == START_S
Date: Wed, 10 Dec 2014 14:57:02 -0200
Message-ID: <1418230622-744-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f181.google.com ([209.85.216.181]:36300 "EHLO
	mail-qc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756870AbaLJQ5M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Dec 2014 11:57:12 -0500
Received: by mail-qc0-f181.google.com with SMTP id m20so2433304qcx.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Dec 2014 08:57:11 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Daniel Kurtz <djkurtz@chromium.org>

From: Daniel Kurtz <djkurtz@chromium.org>

A framebuffer gets committed to FIMD's default window like this:
 exynos_drm_crtc_update()
  exynos_plane_commit()
   fimd_win_commit()

fimd_win_commit() programs BUF_START[0].  At each vblank, FIMD hardware
copies the value from BUF_START to BUF_START_S (BUF_START's shadow
register), starts scanning out from BUF_START_S, and asserts its irq.

This irq is handled by fimd_irq_handler(), which calls
exynos_drm_crtc_finish_pageflip() to free the old buffer that FIMD just
finished scanning out, and potentially commit the next pending flip.

There is a race, however, if fimd_win_commit() programs BUF_START(0)
between the actual vblank irq, and its corresponding fimd_irq_handler().

 => FIMD vblank: BUF_START_S[0] := BUF_START[0], and irq asserted
 | => fimd_win_commit(0) writes new BUF_START[0]
 |    exynos_drm_crtc_try_do_flip() marks exynos_fb as prepared
 => fimd_irq_handler()
    exynos_drm_crtc_finish_pageflip() sees prepared exynos_fb,
         and unmaps "old" fb
 ==> but, since BUF_START_S[0] still points to that "old" fb...
 ==> FIMD iommu fault

This patch ensures that fimd_irq_handler() only calls
exynos_drm_crtc_finish_pageflip() if any previously scheduled flip
has really completed.

This works because exynos_drm_crtc's flip fifo ensures that
fimd_win_commit() is never called more than once per
exynos_drm_crtc_finish_pageflip().

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 31 ++++++++++++++++++++++++-------
 include/video/samsung_fimd.h             |  1 +
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index e5810d1..95bac27 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -55,6 +55,7 @@
 #define VIDOSD_D(win)		(VIDOSD_BASE + 0x0C + (win) * 16)
 
 #define VIDWx_BUF_START(win, buf)	(VIDW_BUF_START(buf) + (win) * 8)
+#define VIDWx_BUF_START_S(win, buf)     (VIDW_BUF_START_S(buf) + (win) * 8)
 #define VIDWx_BUF_END(win, buf)		(VIDW_BUF_END(buf) + (win) * 8)
 #define VIDWx_BUF_SIZE(win, buf)	(VIDW_BUF_SIZE(buf) + (win) * 4)
 
@@ -1039,6 +1040,7 @@ static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
 {
 	struct fimd_context *ctx = (struct fimd_context *)dev_id;
 	u32 val, clear_bit;
+	u32 start, start_s;
 
 	val = readl(ctx->regs + VIDINTCON1);
 
@@ -1051,19 +1053,34 @@ static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
 		goto out;
 
 	if (ctx->i80_if) {
-		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
-
 		/* Exits triggering mode */
 		atomic_set(&ctx->triggering, 0);
 	} else {
 		drm_handle_vblank(ctx->drm_dev, ctx->pipe);
+	}
+
+	/*
+	 * Ensure finish_pageflip is called iff a pending flip has completed.
+	 * This works around a race between a page_flip request and the latency
+	 * between vblank interrupt and this irq_handler:
+	 *   => FIMD vblank: BUF_START_S[0] := BUF_START[0], and asserts irq
+	 *   | => fimd_win_commit(0) writes new BUF_START[0]
+	 *   |    exynos_drm_crtc_try_do_flip() marks exynos_fb as prepared
+	 *   => fimd_irq_handler()
+	 *       exynos_drm_crtc_finish_pageflip() sees prepared exynos_fb,
+	 *           and unmaps "old" fb
+	 *   ==> but, since BUF_START_S[0] still points to that "old" fb...
+	 *   ==> FIMD iommu fault
+	 */
+	start = readl(ctx->regs + VIDWx_BUF_START(0, 0));
+	start_s = readl(ctx->regs + VIDWx_BUF_START_S(0, 0));
+	if (start == start_s)
 		exynos_drm_crtc_finish_pageflip(ctx->drm_dev, ctx->pipe);
 
-		/* set wait vsync event to zero and wake up queue. */
-		if (atomic_read(&ctx->wait_vsync_event)) {
-			atomic_set(&ctx->wait_vsync_event, 0);
-			wake_up(&ctx->wait_vsync_queue);
-		}
+	/* set wait vsync event to zero and wake up queue. */
+	if (atomic_read(&ctx->wait_vsync_event)) {
+		atomic_set(&ctx->wait_vsync_event, 0);
+		wake_up(&ctx->wait_vsync_queue);
 	}
 
 out:
diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
index a20e4a3..f81d081 100644
--- a/include/video/samsung_fimd.h
+++ b/include/video/samsung_fimd.h
@@ -291,6 +291,7 @@
 
 /* Video buffer addresses */
 #define VIDW_BUF_START(_buff)			(0xA0 + ((_buff) * 8))
+#define VIDW_BUF_START_S(_buff)                 (0x40A0 + ((_buff) * 8))
 #define VIDW_BUF_START1(_buff)			(0xA4 + ((_buff) * 8))
 #define VIDW_BUF_END(_buff)			(0xD0 + ((_buff) * 8))
 #define VIDW_BUF_END1(_buff)			(0xD4 + ((_buff) * 8))
-- 
1.9.3
