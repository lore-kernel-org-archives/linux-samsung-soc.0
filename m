From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] clk: exynos4: Add clock ID for ppmuleft/right
Date: Wed, 12 Mar 2014 16:08:10 +0900
Message-ID: <1394608090-25362-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62053 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756185AbaCLHIv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Mar 2014 03:08:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: t.figa@samsung.com, a.hajda@samsung.com, mturquette@linaro.org, kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, Chanwoo Choi <cw00.choi@samsung.com>

There is no gate for the PPMU Left/Right to the LEFT/RIGHTBUS block.
So, this patch add ppmuleft/right clock which is used to calculate memory bus
utilization by using PPMU(Performance Profiling Monitoring Unit).

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c   |  2 ++
 include/dt-bindings/clock/exynos4.h | 26 ++++++++++++++------------
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 010f071..3819485 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -717,6 +717,8 @@ static struct samsung_gate_clock exynos4_gate_clks[] __initdata = {
 			0, 0),
 	GATE(CLK_AC97, "ac97", "aclk100", GATE_IP_PERIL, 27,
 			0, 0),
+	GATE(CLK_PPMULEFT, "ppmuleft", "aclk200", GATE_IP_LEFTBUS, 1, 0, 0),
+	GATE(CLK_PPMURIGHT, "ppmuright", "aclk200", GATE_IP_RIGHTBUS, 1, 0, 0),
 };
 
 /* list of gate clocks supported in exynos4210 soc */
diff --git a/include/dt-bindings/clock/exynos4.h b/include/dt-bindings/clock/exynos4.h
index 75aff33..cd7fecf 100644
--- a/include/dt-bindings/clock/exynos4.h
+++ b/include/dt-bindings/clock/exynos4.h
@@ -215,20 +215,22 @@
 #define CLK_SPI1_ISP_SCLK	381 /* Exynos4x12 only */
 #define CLK_UART_ISP_SCLK	382 /* Exynos4x12 only */
 #define CLK_TMU_APBIF		383
+#define CLK_PPMULEFT		384
+#define CLK_PPMURIGHT		385
 
 /* mux clocks */
-#define CLK_MOUT_FIMC0		384
-#define CLK_MOUT_FIMC1		385
-#define CLK_MOUT_FIMC2		386
-#define CLK_MOUT_FIMC3		387
-#define CLK_MOUT_CAM0		388
-#define CLK_MOUT_CAM1		389
-#define CLK_MOUT_CSIS0		390
-#define CLK_MOUT_CSIS1		391
-#define CLK_MOUT_G3D0		392
-#define CLK_MOUT_G3D1		393
-#define CLK_MOUT_G3D		394
-#define CLK_ACLK400_MCUISP	395 /* Exynos4x12 only */
+#define CLK_MOUT_FIMC0		386
+#define CLK_MOUT_FIMC1		387
+#define CLK_MOUT_FIMC2		388
+#define CLK_MOUT_FIMC3		389
+#define CLK_MOUT_CAM0		390
+#define CLK_MOUT_CAM1		391
+#define CLK_MOUT_CSIS0		392
+#define CLK_MOUT_CSIS1		393
+#define CLK_MOUT_G3D0		394
+#define CLK_MOUT_G3D1		395
+#define CLK_MOUT_G3D		396
+#define CLK_ACLK400_MCUISP	397 /* Exynos4x12 only */
 
 /* div clocks */
 #define CLK_DIV_ISP0		450 /* Exynos4x12 only */
-- 
1.8.0
