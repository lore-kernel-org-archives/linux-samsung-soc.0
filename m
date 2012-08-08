From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: cleanup unused code related to GPS
Date: Wed, 08 Aug 2012 09:56:28 +0900
Message-ID: <0a2e01cd7500$a4765280$ed62f780$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40333 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751674Ab2HHA4a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 20:56:30 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8E00FVVVWVFT70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Aug 2012 09:56:28 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8E006I0VY4XIA0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Aug 2012 09:56:28 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Jonghwan Choi' <jhbird.choi@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>

From: Jonghwan Choi <jhbird.choi@samsung.com>

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c    |    9 ---------
 arch/arm/mach-exynos/include/mach/map.h |    1 -
 2 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 774533c..3b00e29 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -166,11 +166,6 @@ static int exynos5_clk_ip_gen_ctrl(struct clk *clk, int enable)
 	return s5p_gatectrl(EXYNOS5_CLKGATE_IP_GEN, clk, enable);
 }
 
-static int exynos5_clk_ip_gps_ctrl(struct clk *clk, int enable)
-{
-	return s5p_gatectrl(EXYNOS5_CLKGATE_IP_GPS, clk, enable);
-}
-
 static int exynos5_clk_ip_mfc_ctrl(struct clk *clk, int enable)
 {
 	return s5p_gatectrl(EXYNOS5_CLKGATE_IP_MFC, clk, enable);
@@ -672,10 +667,6 @@ static struct clk exynos5_init_clocks_off[] = {
 		.enable		= exynos5_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 7),
 	}, {
-		.name		= "gps",
-		.enable		= exynos5_clk_ip_gps_ctrl,
-		.ctrlbit	= ((1 << 3) | (1 << 2) | (1 << 0)),
-	}, {
 		.name		= "nfcon",
 		.enable		= exynos5_clk_ip_fsys_ctrl,
 		.ctrlbit	= (1 << 22),
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index c72b675..9d1f3ac 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -131,7 +131,6 @@
 #define EXYNOS5_PA_SYSMMU_JPEG		0x11F20000
 #define EXYNOS5_PA_SYSMMU_IOP		0x12360000
 #define EXYNOS5_PA_SYSMMU_RTIC		0x12370000
-#define EXYNOS5_PA_SYSMMU_GPS		0x12630000
 #define EXYNOS5_PA_SYSMMU_ISP		0x13260000
 #define EXYNOS5_PA_SYSMMU_DRC		0x12370000
 #define EXYNOS5_PA_SYSMMU_SCALERC	0x13280000
-- 
1.7.4.1
