From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 3/5] ARM: EXYNOS4: Fix clock name and clock id for dw_mmc
 controller
Date: Thu, 14 Apr 2011 14:53:41 +0530
Message-ID: <1302773023-26524-4-git-send-email-thomas.ab@samsung.com>
References: <1302773023-26524-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61667 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754096Ab1DNJaQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Apr 2011 05:30:16 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LJM00JHVXWQIW80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Apr 2011 18:19:38 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LJM00GH3XWGFX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Apr 2011 18:19:38 +0900 (KST)
In-reply-to: <1302773023-26524-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

Fix the incorrect clock name and clock id for the dw_mmc controller.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-exynos4/clock.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/clock.c
index 871f9d5..6c89991 100644
--- a/arch/arm/mach-exynos4/clock.c
+++ b/arch/arm/mach-exynos4/clock.c
@@ -473,8 +473,8 @@ static struct clk init_clocks_off[] = {
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 8),
 	}, {
-		.name		= "hsmmc",
-		.id		= 4,
+		.name		= "dwmmc",
+		.id		= -1,
 		.parent		= &clk_aclk_133.clk,
 		.enable		= exynos4_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 9),
@@ -1072,8 +1072,8 @@ static struct clksrc_clk clksrcs[] = {
 		.reg_div = { .reg = S5P_CLKDIV_FSYS2, .shift = 24, .size = 8 },
 	}, {
 		.clk		= {
-			.name		= "sclk_mmc",
-			.id		= 4,
+			.name		= "sclk_dwmmc",
+			.id		= -1,
 			.parent         = &clk_dout_mmc4.clk,
 			.enable		= exynos4_clksrc_mask_fsys_ctrl,
 			.ctrlbit	= (1 << 16),
-- 
1.6.6.rc2
