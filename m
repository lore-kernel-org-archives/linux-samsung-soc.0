From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/6] clk: samsung: exynos5433: Fix definitions of MUX_SEL_CAM04
 clocks
Date: Tue, 23 Feb 2016 13:14:28 +0100
Message-ID: <1456229672-13445-3-git-send-email-s.nawrocki@samsung.com>
References: <1456229672-13445-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59177 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbcBWMSa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Feb 2016 07:18:30 -0500
In-reply-to: <1456229672-13445-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, jonghwa3.lee@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This corrects bit offsets in the MUX_SEL_CAM04 gate control register.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 982abb7..cf096f9 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -4753,21 +4753,21 @@ static struct samsung_mux_clock cam0_mux_clks[] __initdata = {
 	MUX(CLK_MOUT_SCLK_LITE_FREECNT_C, "mout_sclk_lite_freecnt_c",
 			mout_sclk_lite_freecnt_c_p, MUX_SEL_CAM04, 24, 1),
 	MUX(CLK_MOUT_SCLK_LITE_FREECNT_B, "mout_sclk_lite_freecnt_b",
-			mout_sclk_lite_freecnt_b_p, MUX_SEL_CAM04, 24, 1),
+			mout_sclk_lite_freecnt_b_p, MUX_SEL_CAM04, 20, 1),
 	MUX(CLK_MOUT_SCLK_LITE_FREECNT_A, "mout_sclk_lite_freecnt_a",
-			mout_sclk_lite_freecnt_a_p, MUX_SEL_CAM04, 24, 1),
+			mout_sclk_lite_freecnt_a_p, MUX_SEL_CAM04, 16, 1),
 	MUX(CLK_MOUT_SCLK_PIXELASYNC_LITE_C_B, "mout_sclk_pixelasync_lite_c_b",
-			mout_sclk_pixelasync_lite_c_b_p, MUX_SEL_CAM04, 24, 1),
+			mout_sclk_pixelasync_lite_c_b_p, MUX_SEL_CAM04, 12, 1),
 	MUX(CLK_MOUT_SCLK_PIXELASYNC_LITE_C_A, "mout_sclk_pixelasync_lite_c_a",
-			mout_sclk_pixelasync_lite_c_a_p, MUX_SEL_CAM04, 24, 1),
+			mout_sclk_pixelasync_lite_c_a_p, MUX_SEL_CAM04, 8, 1),
 	MUX(CLK_MOUT_SCLK_PIXELASYNC_LITE_C_INIT_B,
 			"mout_sclk_pixelasync_lite_c_init_b",
 			mout_sclk_pixelasync_lite_c_init_b_p,
-			MUX_SEL_CAM04, 24, 1),
+			MUX_SEL_CAM04, 4, 1),
 	MUX(CLK_MOUT_SCLK_PIXELASYNC_LITE_C_INIT_A,
 			"mout_sclk_pixelasync_lite_c_init_a",
 			mout_sclk_pixelasync_lite_c_init_a_p,
-			MUX_SEL_CAM04, 24, 1),
+			MUX_SEL_CAM04, 0, 1),
 };
 
 static struct samsung_div_clock cam0_div_clks[] __initdata = {
-- 
1.9.1
