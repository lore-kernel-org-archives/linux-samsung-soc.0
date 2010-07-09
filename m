From: Pawel Osciak <p.osciak@samsung.com>
Subject: [PATCH 19/19] s3c-fb: Add support for DMA channel control on S5PV210
Date: Fri, 09 Jul 2010 10:50:07 +0200
Message-ID: <1278665407-18002-20-git-send-email-p.osciak@samsung.com>
References: <1278665407-18002-1-git-send-email-p.osciak@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:64783 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754119Ab0GIIvS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Jul 2010 04:51:18 -0400
In-reply-to: <1278665407-18002-1-git-send-email-p.osciak@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, akpm@linux-foundation.org

S5PV210 SoCs allow enabling/disabling DMA channels per window. For a window
to display data from framebuffer memory, its channel has to be enabled.

Signed-off-by: Pawel Osciak <p.osciak@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/include/plat/regs-fb.h |    4 ++++
 drivers/video/s3c-fb.c                       |   15 +++++++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/regs-fb.h b/arch/arm/plat-samsung/include/plat/regs-fb.h
index 4359918..8f39aa5 100644
--- a/arch/arm/plat-samsung/include/plat/regs-fb.h
+++ b/arch/arm/plat-samsung/include/plat/regs-fb.h
@@ -223,6 +223,10 @@
 /* S5PV210 */
 #define SHADOWCON				(0x34)
 #define SHADOWCON_WINx_PROTECT(_win)		(1 << (10 + (_win)))
+/* DMA channels (all windows) */
+#define SHADOWCON_CHx_ENABLE(_win)		(1 << (_win))
+/* Local input channels (windows 0-2) */
+#define SHADOWCON_CHx_LOCAL_ENABLE(_win)	(1 << (5 + (_win)))
 
 #define VIDOSDxA_TOPLEFT_X_MASK			(0x7ff << 11)
 #define VIDOSDxA_TOPLEFT_X_SHIFT		(11)
diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
index a95314d..8ea974d 100644
--- a/drivers/video/s3c-fb.c
+++ b/drivers/video/s3c-fb.c
@@ -634,6 +634,13 @@ static int s3c_fb_set_par(struct fb_info *info)
 	writel(data, regs + sfb->variant.wincon + (win_no * 4));
 	writel(0x0, regs + sfb->variant.winmap + (win_no * 4));
 
+	/* Enable DMA channel for this window */
+	if (sfb->variant.has_shadowcon) {
+		data = readl(sfb->regs + SHADOWCON);
+		data |= SHADOWCON_CHx_ENABLE(win_no);
+		writel(data, sfb->regs + SHADOWCON);
+	}
+
 	shadow_protect_win(win, 0);
 
 	return 0;
@@ -1091,7 +1098,15 @@ static void s3c_fb_free_memory(struct s3c_fb *sfb, struct s3c_fb_win *win)
  */
 static void s3c_fb_release_win(struct s3c_fb *sfb, struct s3c_fb_win *win)
 {
+	u32 data;
+
 	if (win->fbinfo) {
+		if (sfb->variant.has_shadowcon) {
+			data = readl(sfb->regs + SHADOWCON);
+			data &= ~SHADOWCON_CHx_ENABLE(win->index);
+			data &= ~SHADOWCON_CHx_LOCAL_ENABLE(win->index);
+			writel(data, sfb->regs + SHADOWCON);
+		}
 		unregister_framebuffer(win->fbinfo);
 		if (win->fbinfo->cmap.len)
 			fb_dealloc_cmap(&win->fbinfo->cmap);
-- 
1.7.1.569.g6f426
