From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/6] clk: samsung: exynos5433: Fix typos in *_ISP_MPWM clock
 names
Date: Tue, 23 Feb 2016 13:14:27 +0100
Message-ID: <1456229672-13445-2-git-send-email-s.nawrocki@samsung.com>
References: <1456229672-13445-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60648 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751711AbcBWMSY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Feb 2016 07:18:24 -0500
In-reply-to: <1456229672-13445-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, jonghwa3.lee@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This fixes "MPWM" -> "WPWM" typo in 3 *ISP_MWPM clock definitions.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c   | 6 +++---
 include/dt-bindings/clock/exynos5433.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index b7f1fb7..982abb7 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5165,7 +5165,7 @@ static struct samsung_mux_clock cam1_mux_clks[] __initdata = {
 
 static struct samsung_div_clock cam1_div_clks[] __initdata = {
 	/* DIV_CAM10 */
-	DIV(CLK_DIV_SCLK_ISP_WPWM, "div_sclk_isp_wpwm",
+	DIV(CLK_DIV_SCLK_ISP_MPWM, "div_sclk_isp_mpwm",
 			"div_pclk_cam1_83", DIV_CAM10, 16, 2),
 	DIV(CLK_DIV_PCLK_CAM1_83, "div_pclk_cam1_83",
 			"mout_aclk_cam1_333_user", DIV_CAM10, 12, 2),
@@ -5359,7 +5359,7 @@ static struct samsung_gate_clock cam1_gate_clks[] __initdata = {
 			ENABLE_PCLK_CAM1, 5, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_ISP_I2C0, "pclk_isp_i2c0", "div_pclk_cam1_83",
 			ENABLE_PCLK_CAM1, 4, CLK_IGNORE_UNUSED, 0),
-	GATE(CLK_PCLK_ISP_MPWM, "pclk_isp_wpwm", "div_pclk_cam1_83",
+	GATE(CLK_PCLK_ISP_MPWM, "pclk_isp_mpwm", "div_pclk_cam1_83",
 			ENABLE_PCLK_CAM1, 3, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_FD, "pclk_fd", "div_pclk_fd",
 			ENABLE_PCLK_CAM1, 3, CLK_IGNORE_UNUSED, 0),
@@ -5392,7 +5392,7 @@ static struct samsung_gate_clock cam1_gate_clks[] __initdata = {
 			ENABLE_SCLK_CAM1, 5, 0, 0),
 	GATE(CLK_SCLK_ISP_SPI0, "sclk_isp_spi0", "mout_sclk_isp_spi0_user",
 			ENABLE_SCLK_CAM1, 4, 0, 0),
-	GATE(CLK_SCLK_ISP_MPWM, "sclk_isp_wpwm", "div_sclk_isp_wpwm",
+	GATE(CLK_SCLK_ISP_MPWM, "sclk_isp_mpwm", "div_sclk_isp_mpwm",
 			ENABLE_SCLK_CAM1, 3, 0, 0),
 	GATE(CLK_PCLK_DBG_ISP, "sclk_dbg_isp", "div_pclk_dbg_cam1",
 			ENABLE_SCLK_CAM1, 2, 0, 0),
diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 5c2636c..8e024fe 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -1303,7 +1303,7 @@
 #define CLK_MOUT_ACLK_LITE_C_B				13
 #define CLK_MOUT_ACLK_LITE_C_A				14
 
-#define CLK_DIV_SCLK_ISP_WPWM				15
+#define CLK_DIV_SCLK_ISP_MPWM				15
 #define CLK_DIV_PCLK_CAM1_83				16
 #define CLK_DIV_PCLK_CAM1_166				17
 #define CLK_DIV_PCLK_DBG_CAM1				18
-- 
1.9.1
