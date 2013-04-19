From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] clk: exynos4: Add clock entries for TMU
Date: Fri, 19 Apr 2013 11:46:06 +0530
Message-ID: <1366352166-20967-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:47478 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756330Ab3DSG2a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Apr 2013 02:28:30 -0400
Received: by mail-pa0-f52.google.com with SMTP id fb10so2079798pad.39
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Apr 2013 23:28:30 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, Thomas Abraham <thomas.abraham@linaro.org>, Mike Turquette <mturquette@linaro.org>

Added clock entries for thermal management unit (TMU) for
Exynos4 SoCs.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>
---
Should be applied on top of the below patches:
https://patchwork.kernel.org/patch/2448711/
https://patchwork.kernel.org/patch/2459831/
---
 .../devicetree/bindings/clock/exynos4-clock.txt    |    1 +
 drivers/clk/samsung/clk-exynos4.c                  |    4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos4-clock.txt b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
index 14d5c2a..5b17c4d 100644
--- a/Documentation/devicetree/bindings/clock/exynos4-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
@@ -236,6 +236,7 @@ Exynos4 SoC and this is specified where applicable.
   spi0_isp_sclk       380     Exynos4x12
   spi1_isp_sclk       381     Exynos4x12
   uart_isp_sclk       382     Exynos4x12
+  tmu		      383
 
 		[Mux Clocks]
 
diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 09cf161..fc4f662 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -170,7 +170,7 @@ enum exynos4_clks {
 	gicisp, smmu_isp, smmu_drc, smmu_fd, smmu_lite0, smmu_lite1, mcuctl_isp,
 	mpwm_isp, i2c0_isp, i2c1_isp, mtcadc_isp, pwm_isp, wdt_isp, uart_isp,
 	asyncaxim, smmu_ispcx, spi0_isp, spi1_isp, pwm_isp_sclk, spi0_isp_sclk,
-	spi1_isp_sclk, uart_isp_sclk,
+	spi1_isp_sclk, uart_isp_sclk, tmu,
 
 	/* mux clocks */
 	mout_fimc0 = 384, mout_fimc1, mout_fimc2, mout_fimc3, mout_cam0,
@@ -815,6 +815,7 @@ static struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
 	GATE_A(keyif, "keyif", "aclk100", E4210_GATE_IP_PERIR, 16, 0, 0, "keypad"),
 	GATE_DA(sclk_fimd1, "exynos4-fb.1", "sclk_fimd1", "div_fimd1",
 			E4210_SRC_MASK_LCD1, 0, CLK_SET_RATE_PARENT, 0, "sclk_fimd"),
+	GATE(tmu, "tmu", "aclk100", E4210_GATE_IP_PERIR, 17, 0, 0),
 };
 
 /* list of gate clocks supported in exynos4x12 soc */
@@ -915,6 +916,7 @@ static struct samsung_gate_clock exynos4x12_gate_clks[] __initdata = {
 	GATE(spi1_isp, "spi1_isp", "aclk200", E4X12_GATE_ISP1, 13,
 			CLK_IGNORE_UNUSED, 0),
 	GATE(g2d, "g2d", "aclk200", GATE_IP_DMC, 23, 0, 0),
+	GATE(tmu, "tmu", "aclk100", E4X12_GATE_IP_PERIR, 17, 0, 0),
 };
 
 #ifdef CONFIG_OF
-- 
1.7.9.5
