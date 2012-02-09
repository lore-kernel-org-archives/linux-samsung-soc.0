From: srikanth <ts.srikanth@samsung.com>
Subject: [PATCH 1/3] ARM: EXYNOS: SATA clock config update
Date: Thu, 09 Feb 2012 15:24:54 +0900
Message-ID: <004701cce6f3$899a3d50$9cceb7f0$%srikanth@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51303 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750819Ab2BIGY4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 01:24:56 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ400JJK4HHNNM0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 15:24:55 +0900 (KST)
Received: from DOTSSRIKANT01 ([12.23.118.165])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ4007KE4HICC10@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 15:24:54 +0900 (KST)
Content-language: en-gb
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk

SATA clock configuration update.

Signed-off-by: Srikanth TS <ts.srikanth@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index b0c4478..739a4d6 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -902,6 +902,16 @@ static struct clksrc_clk exynos5_clksrcs[] = {
 		.reg_div = { .reg = EXYNOS5_CLKDIV_TOP0, .shift = 24, .size = 3 },
 	}, {
 		.clk	= {
+			.name		= "sclk_sata",
+			.devname	= "ahci",
+			.enable		= exynos5_clk_ip_fsys_ctrl,
+			.ctrlbit	= (1 << 24),
+		},
+		.sources = &exynos5_clkset_aclk,
+		.reg_src = { .reg = EXYNOS5_CLKSRC_FSYS, .shift = 24, .size = 1 },
+		.reg_div = { .reg = EXYNOS5_CLKDIV_FSYS0, .shift = 20, .size = 4 },
+	}, {
+		.clk	= {
 			.name		= "sclk_gscl_wrap",
 			.devname	= "s5p-mipi-csis.0",
 			.enable		= exynos5_clksrc_mask_gscl_ctrl,
-- 
1.7.1
