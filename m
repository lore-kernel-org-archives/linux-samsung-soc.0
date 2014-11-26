From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 4/4] clk: samsung: add cpu clock configuration data and
 instantiate cpu clock
Date: Wed, 26 Nov 2014 16:47:51 +0530
Message-ID: <1417000671-11996-5-git-send-email-a.kesavan@samsung.com>
References: <1417000671-11996-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40360 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752280AbaKZLTK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 06:19:10 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFN00B4L8RXV060@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Nov 2014 20:19:09 +0900 (KST)
In-reply-to: <1417000671-11996-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, kesavan.abhilash@gmail.com

Add the Atlas CPU clock configuration data and instantiate the CPU clock
type for Exynos7.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 drivers/clk/samsung/clk-cpu.h           |    5 +++++
 drivers/clk/samsung/clk-exynos7.c       |   28 +++++++++++++++++++++++++++-
 include/dt-bindings/clock/exynos7-clk.h |    3 ++-
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.h b/drivers/clk/samsung/clk-cpu.h
index 24e844e..1fd7f51 100644
--- a/drivers/clk/samsung/clk-cpu.h
+++ b/drivers/clk/samsung/clk-cpu.h
@@ -31,6 +31,11 @@
 #define E5420_KFC_DIV(kpll, pclk, aclk)					\
 		((((kpll) << 24) | ((pclk) << 20) | ((aclk) << 4)))
 
+#define EXYNOS7_ATL_DIV0(aclk, pclk, atclk, pclk_dbg) \
+		((aclk << 8) | (pclk << 12) | (atclk << 20) | (pclk_dbg << 26))
+#define EXYNOS7_ATL_DIV1(pll, hpm, cntclk) \
+		((pll << 0) | (hpm << 4) | (cntclk << 8))
+
 /**
  * struct exynos_cpuclk_data: config data to setup cpu clocks.
  * @prate: frequency of the primary parent clock (in KHz).
diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 78f66b4..dc9b7fb 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 
 #include "clk.h"
+#include "clk-cpu.h"
 #include <dt-bindings/clock/exynos7-clk.h>
 
 /* Register Offset definitions for CMU_TOPC (0x10570000) */
@@ -63,6 +64,25 @@ static const struct samsung_pll_rate_table pll1450x_24mhz_tbl[] = {
 	PLL_35XX_RATE(200000000, 200, 3, 3),
 };
 
+static const struct exynos_cpuclk_cfg_data exynos7_atlclk_d[] __initconst = {
+	{ 1600000, EXYNOS7_ATL_DIV0(2, 7, 7, 7), EXYNOS7_ATL_DIV1(1, 2, 7), },
+	{ 1500000, EXYNOS7_ATL_DIV0(2, 7, 7, 7), EXYNOS7_ATL_DIV1(1, 2, 7), },
+	{ 1400000, EXYNOS7_ATL_DIV0(2, 7, 7, 7), EXYNOS7_ATL_DIV1(1, 2, 7), },
+	{ 1300000, EXYNOS7_ATL_DIV0(2, 7, 7, 7), EXYNOS7_ATL_DIV1(1, 2, 7), },
+	{ 1200000, EXYNOS7_ATL_DIV0(1, 7, 7, 7), EXYNOS7_ATL_DIV1(1, 2, 7), },
+	{ 1100000, EXYNOS7_ATL_DIV0(1, 7, 7, 7), EXYNOS7_ATL_DIV1(1, 2, 7), },
+	{ 1000000, EXYNOS7_ATL_DIV0(1, 6, 6, 6), EXYNOS7_ATL_DIV1(1, 2, 6), },
+	{  900000, EXYNOS7_ATL_DIV0(1, 6, 6, 6), EXYNOS7_ATL_DIV1(1, 2, 6), },
+	{  800000, EXYNOS7_ATL_DIV0(1, 5, 5, 5), EXYNOS7_ATL_DIV1(1, 2, 5), },
+	{  700000, EXYNOS7_ATL_DIV0(1, 5, 5, 5), EXYNOS7_ATL_DIV1(1, 2, 5), },
+	{  600000, EXYNOS7_ATL_DIV0(1, 4, 4, 4), EXYNOS7_ATL_DIV1(1, 2, 4), },
+	{  500000, EXYNOS7_ATL_DIV0(1, 3, 3, 3), EXYNOS7_ATL_DIV1(1, 2, 3), },
+	{  400000, EXYNOS7_ATL_DIV0(1, 3, 3, 3), EXYNOS7_ATL_DIV1(1, 2, 3), },
+	{  300000, EXYNOS7_ATL_DIV0(1, 3, 3, 3), EXYNOS7_ATL_DIV1(1, 2, 3), },
+	{  200000, EXYNOS7_ATL_DIV0(1, 3, 3, 3), EXYNOS7_ATL_DIV1(1, 2, 3), },
+	{  0 },
+};
+
 static struct samsung_fixed_factor_clock topc_fixed_factor_clks[] __initdata = {
 	FFACTOR(0, "ffac_topc_bus0_pll_div2", "mout_bus0_pll_ctrl", 1, 2, 0),
 	FFACTOR(0, "ffac_topc_bus0_pll_div4",
@@ -518,7 +538,13 @@ static struct samsung_cmu_info atlas_cmu_info __initdata = {
 
 static void __init exynos7_clk_atlas_init(struct device_node *np)
 {
-	samsung_cmu_register_one(np, &atlas_cmu_info);
+	struct samsung_clk_provider *ctx;
+
+	ctx = samsung_cmu_register_one(np, &atlas_cmu_info);
+	exynos_register_cpu_clock(ctx, CLK_ATLAS_CLK, "atlclk",
+		mout_atlas_p[0], mout_atlas_p[1], 0x0,
+		exynos7_atlclk_d, ARRAY_SIZE(exynos7_atlclk_d),
+		CLK_CPU_HAS_DIV1, np);
 }
 
 CLK_OF_DECLARE(exynos7_clk_atlas, "samsung,exynos7-clock-atlas",
diff --git a/include/dt-bindings/clock/exynos7-clk.h b/include/dt-bindings/clock/exynos7-clk.h
index 93c78f9..33bc166 100644
--- a/include/dt-bindings/clock/exynos7-clk.h
+++ b/include/dt-bindings/clock/exynos7-clk.h
@@ -55,7 +55,8 @@
 #define CLK_ATLAS			12
 #define DOUT_SCLK_HPM_ATLAS		13
 #define DOUT_ATLAS_PLL			14
-#define ATLAS_NR_CLK			15
+#define CLK_ATLAS_CLK			15
+#define ATLAS_NR_CLK			16
 
 /* CCORE */
 #define PCLK_RTC			1
-- 
1.7.9.5
