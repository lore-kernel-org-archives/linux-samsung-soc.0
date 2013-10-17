From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH] ARM: dts: Exynos5420: Add device nodes for TMU blocks
Date: Thu, 17 Oct 2013 15:34:00 +0530
Message-ID: <1382004240-3282-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:32276 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754352Ab3JQJn0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 05:43:26 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, amit.daniel@samsung.com, cpgs@samsung.com

Exynos5420 SoC has per core thermal management unit, this patch adds
tmu device nodes to the DT device list.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---

Note: This patch has been tested on kgene's for-next branch 
after applying Naveen's patchset

[1/3,v6] thermal: samsung: add intclr_fall_shift bit in exynos_tmu_register
https://patchwork.kernel.org/patch/3058501/
[2/3,v6] thermal: samsung: change base_common to more meaningful base_second
https://patchwork.kernel.org/patch/3058541/
[3/3,v6] thermal: samsung: Add TMU support for Exynos5420 SoCs
https://patchwork.kernel.org/patch/3058571/

 arch/arm/boot/dts/exynos5420.dtsi |   45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 09aa06c..c6270cd 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -190,6 +190,51 @@
 		status = "okay";
 	};
 
+	/* tmu for CPU0 */
+	tmu@10060000 {
+		compatible = "samsung,exynos5420-tmu";
+		reg = <0x10060000 0x100>;
+		interrupts = <0 65 0>;
+		clocks = <&clock 318>;
+		clock-names = "tmu_apbif";
+	};
+
+	/* tmu for CPU1 */
+	tmu@10064000 {
+		compatible = "samsung,exynos5420-tmu";
+		reg = <0x10064000 0x100>;
+		interrupts = <0 183 0>;
+		clocks = <&clock 318>;
+		clock-names = "tmu_apbif";
+	};
+
+	/* tmu for CPU2 */
+	tmu@10068000 {
+		compatible = "samsung,exynos5420-tmu";
+		reg = <0x10068000 0x100>;
+		interrupts = <0 184 0>;
+		clocks = <&clock 318>;
+		clock-names = "tmu_apbif";
+	};
+
+	/* tmu for CPU3 */
+	tmu@1006c000 {
+		compatible = "samsung,exynos5420-tmu";
+		reg = <0x1006c000 0x100>;
+		interrupts = <0 185 0>;
+		clocks = <&clock 318>;
+		clock-names = "tmu_apbif";
+	};
+
+	/* tmu for GPU */
+	tmu@100a0000 {
+		compatible = "samsung,exynos5420-tmu";
+		reg = <0x100a0000 0x100>;
+		interrupts = <0 215 0>;
+		clocks = <&clock 318>;
+		clock-names = "tmu_apbif";
+	};
+
 	serial@12C00000 {
 		clocks = <&clock 257>, <&clock 128>;
 		clock-names = "uart", "clk_uart_baud0";
-- 
1.7.10.4
