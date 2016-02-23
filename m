From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 3/6] clk: samsung: exynos5433: Fix definitions of SCLK ISP
 SENSOR0 clocks
Date: Tue, 23 Feb 2016 13:14:29 +0100
Message-ID: <1456229672-13445-4-git-send-email-s.nawrocki@samsung.com>
References: <1456229672-13445-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41721 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751393AbcBWMSj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Feb 2016 07:18:39 -0500
In-reply-to: <1456229672-13445-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, jonghwa3.lee@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

From: Marek Szyprowski <m.szyprowski@samsung.com>

This fixes bit field offsets in the CMU_TOP CLK_DIV_SCLK_ISP_SENSOR_{A,B}
clock definitions.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index cf096f9..a1dfcb8 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -490,9 +490,9 @@ static struct samsung_div_clock top_div_clks[] __initdata = {
 	DIV(CLK_DIV_SCLK_ISP_SENSOR1_A, "div_sclk_isp_sensor1_a",
 			"mout_sclk_isp_sensor1", DIV_TOP_CAM11, 8, 4),
 	DIV(CLK_DIV_SCLK_ISP_SENSOR0_B, "div_sclk_isp_sensor0_b",
-			"div_sclk_isp_sensor0_a", DIV_TOP_CAM11, 12, 4),
+			"div_sclk_isp_sensor0_a", DIV_TOP_CAM11, 4, 4),
 	DIV(CLK_DIV_SCLK_ISP_SENSOR0_A, "div_sclk_isp_sensor0_a",
-			"mout_sclk_isp_sensor0", DIV_TOP_CAM11, 8, 4),
+			"mout_sclk_isp_sensor0", DIV_TOP_CAM11, 0, 4),
 
 	/* DIV_TOP_FSYS0 */
 	DIV(CLK_DIV_SCLK_MMC1_B, "div_sclk_mmc1_b", "div_sclk_mmc1_a",
-- 
1.9.1
