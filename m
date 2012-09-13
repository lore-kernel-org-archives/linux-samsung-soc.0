From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Add dp clock support for EXYNOS5
Date: Thu, 13 Sep 2012 15:50:03 +0900
Message-ID: <006601cd917c$00b07930$02116b90$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52588 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755952Ab2IMGuF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Sep 2012 02:50:05 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAA00J1D0B0A1Q0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Sep 2012 15:50:04 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.119.56])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAA005WU0BFDX30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Sep 2012 15:50:03 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

Add dp clock instance for EXYNOS5 dp controller.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index eb3f4fc..d688abe 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -683,6 +683,11 @@ static struct clk exynos5_init_clocks_off[] = {
 		.enable		= exynos5_clk_ip_disp1_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
+		.name		= "dp",
+		.devname	= "exynos-dp",
+		.enable		= exynos5_clk_ip_disp1_ctrl,
+		.ctrlbit	= (1 << 4),
+	}, {
 		.name		= "jpeg",
 		.enable		= exynos5_clk_ip_gen_ctrl,
 		.ctrlbit	= (1 << 2),
-- 
1.7.1
