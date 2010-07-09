From: Pawel Osciak <p.osciak@samsung.com>
Subject: [PATCH 17/19] s3c-fb: Protect window-specific registers during updates
Date: Fri, 09 Jul 2010 10:50:05 +0200
Message-ID: <1278665407-18002-18-git-send-email-p.osciak@samsung.com>
References: <1278665407-18002-1-git-send-email-p.osciak@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:64783 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754119Ab0GIIvP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Jul 2010 04:51:15 -0400
In-reply-to: <1278665407-18002-1-git-send-email-p.osciak@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, akpm@linux-foundation.org

Newer hardware (S3C6410, S5P) have the ability to block updates from shadow
registers during reconfiguration. Add protect calls for set_par and clear
protection when resetting.

Signed-off-by: Pawel Osciak <p.osciak@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/video/s3c-fb.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
index 2173869..b10d16d 100644
--- a/drivers/video/s3c-fb.c
+++ b/drivers/video/s3c-fb.c
@@ -450,6 +450,8 @@ static int s3c_fb_set_par(struct fb_info *info)
 
 	dev_dbg(sfb->dev, "setting framebuffer parameters\n");
 
+	shadow_protect_win(win, 1);
+
 	switch (var->bits_per_pixel) {
 	case 32:
 	case 24:
@@ -632,6 +634,8 @@ static int s3c_fb_set_par(struct fb_info *info)
 	writel(data, regs + sfb->variant.wincon + (win_no * 4));
 	writel(0x0, regs + sfb->variant.winmap + (win_no * 4));
 
+	shadow_protect_win(win, 0);
+
 	return 0;
 }
 
@@ -1228,11 +1232,14 @@ static int __devinit s3c_fb_probe_win(struct s3c_fb *sfb, unsigned int win_no,
 static void s3c_fb_clear_win(struct s3c_fb *sfb, int win)
 {
 	void __iomem *regs = sfb->regs;
+	u32 reg;
 
 	writel(0, regs + sfb->variant.wincon + (win * 4));
 	writel(0, regs + VIDOSD_A(win, sfb->variant));
 	writel(0, regs + VIDOSD_B(win, sfb->variant));
 	writel(0, regs + VIDOSD_C(win, sfb->variant));
+	reg = readl(regs + SHADOWCON);
+	writel(reg & ~SHADOWCON_WINx_PROTECT(win), regs + SHADOWCON);
 }
 
 static int __devinit s3c_fb_probe(struct platform_device *pdev)
-- 
1.7.1.569.g6f426
