From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/6] ARM: S5PC110: update framebuffer setup information for Goni
Date: Fri, 10 Sep 2010 09:23:18 +0200
Message-ID: <1284103403-10696-2-git-send-email-m.szyprowski@samsung.com>
References: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35026 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751295Ab0IJHXa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 03:23:30 -0400
Received: from eu_spt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L8I00EZ7SJ3VY30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 08:23:27 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8I00CKKSJ2GC@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 08:23:27 +0100 (BST)
In-reply-to: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Change the default upper_margin and vsync_len to get rid of repeated last
line on the display.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/mach-goni.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index d9fe739..b0ae208 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -88,13 +88,12 @@ static struct s3c2410_uartcfg goni_uartcfgs[] __initdata = {
 /* Frame Buffer */
 static struct s3c_fb_pd_win goni_fb_win0 = {
 	.win_mode = {
-		.pixclock = 1000000000000ULL / ((16+16+2+480)*(28+3+2+800)*55),
 		.left_margin	= 16,
 		.right_margin	= 16,
-		.upper_margin	= 3,
+		.upper_margin	= 2,
 		.lower_margin	= 28,
 		.hsync_len	= 2,
-		.vsync_len	= 2,
+		.vsync_len	= 1,
 		.xres		= 480,
 		.yres		= 800,
 		.refresh	= 55,
-- 
1.7.2.2
