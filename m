From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/3] clk: samsung: exynos5433: Add data for 250MHz and
 278MHz PLL rates
Date: Thu, 26 Jan 2017 13:37:53 +0100
Message-ID: <1485434274-6579-3-git-send-email-m.szyprowski@samsung.com>
References: <1485434274-6579-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126123805eucas1p2b95ab23660b7a6631ab7f639ebaff0fc@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45896 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751690AbdAZMiK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 07:38:10 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKE00L5H0FIJV20@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jan 2017 12:38:06 +0000 (GMT)
In-reply-to: <1485434274-6579-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Default clock configuration applied by the bootloader for TM2 and TM2e
boards includes 250MHz and 278MHz rate for DISP PLL clock. To ensure such
configuration for those boards with 'assigned-clocks*' properties,
parameters for those two additional rates are needed.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 6ee91ae875c3..11343a597093 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -739,7 +739,9 @@
 	PLL_35XX_RATE(350000000U,  350, 6,  2),
 	PLL_35XX_RATE(333000000U,  222, 4,  2),
 	PLL_35XX_RATE(300000000U,  500, 5,  3),
+	PLL_35XX_RATE(278000000U,  556, 6,  3),
 	PLL_35XX_RATE(266000000U,  532, 6,  3),
+	PLL_35XX_RATE(250000000U,  500, 6,  3),
 	PLL_35XX_RATE(200000000U,  400, 6,  3),
 	PLL_35XX_RATE(166000000U,  332, 6,  3),
 	PLL_35XX_RATE(160000000U,  320, 6,  3),
-- 
1.9.1
