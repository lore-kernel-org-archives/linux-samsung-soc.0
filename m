From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 3/3] ARM: EXYNOS: Add g2d clock support for EXYNOS5
Date: Wed, 28 Nov 2012 19:59:49 +0530
Message-ID: <1354112989-3161-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1354112989-3161-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33315 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755057Ab2K1OIt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Nov 2012 09:08:49 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME700HE9BANEY80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Nov 2012 23:08:47 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME700GC9B6YQ860@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Nov 2012 23:08:47 +0900 (KST)
In-reply-to: <1354112989-3161-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: thomas.abraham@linaro.org

Add g2d clock instance for EXYNOS5 g2d controller.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 5c63bc7..f16b027 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -711,6 +711,10 @@ static struct clk exynos5_init_clocks_off[] = {
 		.enable		= exynos5_clk_ip_disp1_ctrl,
 		.ctrlbit	= (1 << 5),
 	}, {
+		.name		= "fimg2d",
+		.enable		= exynos5_clk_ip_acp_ctrl,
+		.ctrlbit	= (1 << 3),
+	}, {
 		.name		= "dp",
 		.devname	= "exynos-dp",
 		.enable		= exynos5_clk_ip_disp1_ctrl,
-- 
1.7.1
