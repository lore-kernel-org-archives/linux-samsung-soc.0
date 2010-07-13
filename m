From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH v2] s3c-fb: Automatically calculate pixel clock when none is given
Date: Tue, 13 Jul 2010 02:05:45 +0200
Message-ID: <4c3baddb.d37b0e0a.67e4.ffffcb55@mx.google.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:59921 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751776Ab0GMAFv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jul 2010 20:05:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-fbdev@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, akpm@linux-foundation.org, ben-linux@fluff.org

This patch adds a simple algorithm which calculates the pixel clock based on the
video mode parameters. This is only done when no pixel clock is supplied through
the platform data.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---

Changes since v1:
Re-posted this to the correct fbdev mailing list.

---
 drivers/video/s3c-fb.c |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
index 9682ecc..e4715eb 100644
--- a/drivers/video/s3c-fb.c
+++ b/drivers/video/s3c-fb.c
@@ -654,6 +654,28 @@ static struct fb_ops s3c_fb_ops = {
 };
 
 /**
+ * s3c_fb_missing_pixclock() - calculates pixel clock
+ * @mode: The video mode to change.
+ *
+ * Calculate the pixel clock when none has been given through platform data.
+ */
+static void __devinit s3c_fb_missing_pixclock(struct fb_videomode *mode)
+{
+	u64 pixclk = 1000000000000ULL;
+	u32 div;
+
+	div  = mode->left_margin + mode->hsync_len + mode->right_margin +
+	       mode->xres;
+	div *= mode->upper_margin + mode->vsync_len + mode->lower_margin +
+	       mode->yres;
+	div *= mode->refresh ? : 60;
+
+	do_div(pixclk, div);
+
+	mode->pixclock = pixclk;
+}
+
+/**
  * s3c_fb_alloc_memory() - allocate display memory for framebuffer window
  * @sfb: The base resources for the hardware.
  * @win: The window to initialise memory for.
@@ -925,6 +947,9 @@ static int __devinit s3c_fb_probe(struct platform_device *pdev)
 		if (!pd->win[win])
 			continue;
 
+		if (!pd->win[win]->win_mode.pixclock)
+			s3c_fb_missing_pixclock(&pd->win[win]->win_mode);
+
 		ret = s3c_fb_probe_win(sfb, win, &sfb->windows[win]);
 		if (ret < 0) {
 			dev_err(dev, "failed to create window %d\n", win);
-- 
1.7.0.4
