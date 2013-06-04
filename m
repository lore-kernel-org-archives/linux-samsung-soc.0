From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V5 5/5] ARM: dts: Update Samsung I2S documentation
Date: Tue, 04 Jun 2013 17:58:10 +0530
Message-ID: <1370348890-6645-6-git-send-email-padma.v@samsung.com>
References: <1370348890-6645-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19037 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752783Ab3FDMbs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jun 2013 08:31:48 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNV001M2C4ZOYZ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Jun 2013 21:31:47 +0900 (KST)
In-reply-to: <1370348890-6645-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@kernel.org, kgene.kim@samsung.com, mturquette@linaro.org

This patch updates the samsung i2s documentation for pinmux and
clock entries.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 .../devicetree/bindings/sound/samsung-i2s.txt      |   40 ++++++-------------
 1 files changed, 13 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
index 3070046..6f9d29f 100644
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
@@ -8,6 +8,10 @@ Required SoC Specific Properties:
 - dmas: list of DMA controller phandle and DMA request line ordered pairs.
 - dma-names: identifier string for each DMA request line in the dmas property.
   These strings correspond 1:1 with the ordered pairs in dmas.
+- clocks: from common clock binding. Handle to iis clock and RCLK src clk.
+- clock-names: from common clock binding: Should be "iis","i2s_opclk0" and
+  "i2s_opclk1". "iis" is the i2s bus clock and i2s_opclk selects the src of
+  RCLK which is a mux inside i2s controller.
 
 Optional SoC Specific Properties:
 
@@ -20,44 +24,26 @@ Optional SoC Specific Properties:
   then this flag is enabled.
 - samsung,idma-addr: Internal DMA register base address of the audio
   sub system(used in secondary sound source).
-
-Required Board Specific Properties:
-
-- gpios: The gpio specifier for data out,data in, LRCLK, CDCLK and SCLK
-  interface lines. The format of the gpio specifier depends on the gpio
-  controller.
-  The syntax of samsung gpio specifier is
-	<[phandle of the gpio controller node]
-	 [pin number within the gpio controller]
-	 [mux function]
-	 [flags and pull up/down]
-	 [drive strength]>
+- pinctrl-0: Should specify pin control groups used for this controller.
+- pinctrl-names: Should contain only one value - "default".
 
 Example:
 
-- SoC Specific Portion:
-
-i2s@03830000 {
+i2s0: i2s@03830000 {
 	compatible = "samsung,i2s-v5";
 	reg = <0x03830000 0x100>;
 	dmas = <&pdma0 10
 		&pdma0 9
 		&pdma0 8>;
 	dma-names = "tx", "rx", "tx-sec";
+	clocks = <&clock_audss EXYNOS_I2S_BUS>,
+		<&clock_audss EXYNOS_I2S_BUS>,
+		<&clock_audss EXYNOS_SCLK_I2S>;
+	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 	samsung,supports-6ch;
 	samsung,supports-rstclr;
 	samsung,supports-secdai;
 	samsung,idma-addr = <0x03000000>;
-};
-
-- Board Specific Portion:
-
-i2s@03830000 {
-	gpios = <&gpz 0 2 0 0>, /* I2S_0_SCLK */
-		<&gpz 1 2 0 0>, /* I2S_0_CDCLK */
-		<&gpz 2 2 0 0>, /* I2S_0_LRCK */
-		<&gpz 3 2 0 0>, /* I2S_0_SDI */
-		<&gpz 4 2 0 0>, /* I2S_0_SDO[1] */
-		<&gpz 5 2 0 0>, /* I2S_0_SDO[2] */
-		<&gpz 6 2 0 0>; /* I2S_0_SDO[3] */
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s0_bus>;
 };
-- 
1.7.4.4
