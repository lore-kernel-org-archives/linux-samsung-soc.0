From: Pawel Osciak <p.osciak@samsung.com>
Subject: [PATCH 04/19] s3c-fb: only init window colour key controls for windows
 with blending
Date: Fri, 09 Jul 2010 10:49:52 +0200
Message-ID: <1278665407-18002-5-git-send-email-p.osciak@samsung.com>
References: <1278665407-18002-1-git-send-email-p.osciak@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:39640 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754809Ab0GIIv1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Jul 2010 04:51:27 -0400
In-reply-to: <1278665407-18002-1-git-send-email-p.osciak@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, akpm@linux-foundation.org

From: Ben Dooks <ben-linux@fluff.org>

The driver clears all windows, but also sets the windows' colour key
controls at the same time. However, the last window does not have these
registers as it is always blended into the previous window.

Move the colour key initialisation into the probe, and run it for only
nr_win-1 windows.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Pawel Osciak <p.osciak@samsung.com>
---
 drivers/video/s3c-fb.c |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
index 9c46f95..f9d0170 100644
--- a/drivers/video/s3c-fb.c
+++ b/drivers/video/s3c-fb.c
@@ -845,9 +845,6 @@ static void s3c_fb_clear_win(struct s3c_fb *sfb, int win)
 	void __iomem *regs = sfb->regs;
 
 	writel(0, regs + WINCON(win));
-	writel(0xffffff, regs + WxKEYCONy(win, 0));
-	writel(0xffffff, regs + WxKEYCONy(win, 1));
-
 	writel(0, regs + VIDOSD_A(win));
 	writel(0, regs + VIDOSD_B(win));
 	writel(0, regs + VIDOSD_C(win));
@@ -920,6 +917,12 @@ static int __devinit s3c_fb_probe(struct platform_device *pdev)
 	for (win = 0; win < S3C_FB_MAX_WIN; win++)
 		s3c_fb_clear_win(sfb, win);
 
+	/* initialise colour key controls */
+	for (win = 0; win < (S3C_FB_MAX_WIN - 1); win++) {
+		writel(0xffffff, sfb->regs + WxKEYCONy(win, 0));
+		writel(0xffffff, sfb->regs + WxKEYCONy(win, 1));
+	}
+
 	/* we have the register setup, start allocating framebuffers */
 
 	for (win = 0; win < S3C_FB_MAX_WIN; win++) {
@@ -1020,6 +1023,11 @@ static int s3c_fb_resume(struct platform_device *pdev)
 	for (win_no = 0; win_no < S3C_FB_MAX_WIN; win_no++)
 		s3c_fb_clear_win(sfb, win_no);
 
+	for (win_no = 0; win_no < S3C_FB_MAX_WIN - 1; win_no++) {
+		writel(0xffffff, sfb->regs + WxKEYCONy(win_no, 1));
+		writel(0xffffff, sfb->regs + WxKEYCONy(win_no, 1));
+	}
+
 	/* restore framebuffers */
 	for (win_no = 0; win_no < S3C_FB_MAX_WIN; win_no++) {
 		win = sfb->windows[win_no];
-- 
1.7.1.569.g6f426
