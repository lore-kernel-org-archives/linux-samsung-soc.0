From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH] clk: exynos5250: register display block gate clocks to common
 clock framework
Date: Wed, 20 Mar 2013 06:06:08 -0400
Message-ID: <1363773968-17433-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [203.254.224.34] ([203.254.224.34]:50576 "EHLO
	mailout4.samsung.com" rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org
	with ESMTP id S1758060Ab3CTJqi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Mar 2013 05:46:38 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJY00EEVDSV9AJ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Mar 2013 18:46:07 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, s.nawrocki@samsung.com

Add gate clocks for fimd, mie, dsim, dp, mixer and hdmi.
Register it to common clock framework.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 Documentation/devicetree/bindings/clock/exynos5250-clock.txt |  6 ++++++
 drivers/clk/samsung/clk-exynos5250.c                         | 10 +++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
index 7104f02..781a627 100644
--- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
@@ -149,6 +149,12 @@ clock which they consume.
   wdt			336
   rtc			337
   tmu			338
+  fimd1			339
+  mie1			340
+  dsim0			341
+  dp			342
+  mixer			343
+  hdmi			345
 
 Example 1: An example of a clock controller node is listed below.
 
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 1152125..5c1583a 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -62,6 +62,7 @@
 #define GATE_IP_PERIS		0x10960
 #define SRC_CDREX		0x20200
 #define PLL_DIV2_SEL		0x20a24
+#define GATE_IP_DISP1		0x10928
 
 /*
  * Let each supported clock get a unique id. This id is used to lookup the clock
@@ -98,7 +99,7 @@ enum exynos5250_clks {
 	spi2, i2s1, i2s2, pcm1, pcm2, pwm, spdif, ac97, hsi2c0, hsi2c1, hsi2c2,
 	hsi2c3, chipid, sysreg, pmu, cmu_top, cmu_core, cmu_mem, tzpc0, tzpc1,
 	tzpc2, tzpc3, tzpc4, tzpc5, tzpc6, tzpc7, tzpc8, tzpc9, hdmi_cec, mct,
-	wdt, rtc, tmu,
+	wdt, rtc, tmu, fimd1, mie1, dsim0, dp, mixer, hdmi,
 
 	nr_clks,
 };
@@ -150,6 +151,7 @@ static __initdata unsigned long exynos5250_clk_regs[] = {
 	GATE_IP_PERIS,
 	SRC_CDREX,
 	PLL_DIV2_SEL,
+	GATE_IP_DISP1,
 };
 
 /* list of all parent clock list */
@@ -455,6 +457,12 @@ struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
 			SRC_MASK_PERIC1, 20, CLK_SET_RATE_PARENT, 0),
 	GATE(sclk_spi2, "sclk_spi2", "div_spi_pre2",
 			SRC_MASK_PERIC1, 24, CLK_SET_RATE_PARENT, 0),
+	GATE(fimd1, "fimd1", "aclk200", GATE_IP_DISP1, 0, 0, 0),
+	GATE(mie1, "mie1", "aclk200", GATE_IP_DISP1, 1, 0, 0),
+	GATE(dsim0, "dsim0", "aclk200", GATE_IP_DISP1, 3, 0, 0),
+	GATE(dp, "dp", "aclk200", GATE_IP_DISP1, 4, 0, 0),
+	GATE(mixer, "mixer", "aclk200", GATE_IP_DISP1, 5, 0, 0),
+	GATE(hdmi, "hdmi", "aclk200", GATE_IP_DISP1, 6, 0, 0),
 };
 
 static __initdata struct of_device_id ext_clk_match[] = {
-- 
1.8.0
