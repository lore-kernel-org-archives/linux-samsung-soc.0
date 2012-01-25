From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 4/6] ARM: SAMSUNG: Correct framebuffer window size on Nuri board
Date: Wed, 25 Jan 2012 15:23:25 +0100
Message-ID: <1327501407-1927-5-git-send-email-s.nawrocki@samsung.com>
References: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20544 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751415Ab2AYOXz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jan 2012 09:23:55 -0500
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LYC002PBYNR9Q60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2012 14:23:52 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYC00M8BYNROR@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2012 14:23:51 +0000 (GMT)
In-reply-to: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

The real LCD resolution on Nuri is 1024x600, not 1280x800. This change
fixes the color distortion (green shadows) on half of the screen.
Also increase framebuffer virtual size for display panning support.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-nuri.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index cc8d2f6..ab8318c 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -222,14 +222,14 @@ static struct s3c_fb_pd_win nuri_fb_win0 = {
 		.lower_margin	= 1,
 		.hsync_len	= 48,
 		.vsync_len	= 3,
-		.xres		= 1280,
-		.yres		= 800,
+		.xres		= 1024,
+		.yres		= 600,
 		.refresh	= 60,
 	},
 	.max_bpp	= 24,
 	.default_bpp	= 16,
-	.virtual_x	= 1280,
-	.virtual_y	= 800,
+	.virtual_x	= 1024,
+	.virtual_y	= 2 * 600,
 };
 
 static struct s3c_fb_platdata nuri_fb_pdata __initdata = {
-- 
1.7.8.3
