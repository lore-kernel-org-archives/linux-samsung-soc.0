From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 5/5] ARM: dts: add mipi dsi device node to exynos3250.dtsi
Date: Mon, 18 Aug 2014 17:21:33 +0900
Message-ID: <1408350093-26220-6-git-send-email-inki.dae@samsung.com>
References: <1408350093-26220-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12310 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751417AbaHRIVi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Aug 2014 04:21:38 -0400
In-reply-to: <1408350093-26220-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, kgene.kim@samsung.com, Inki Dae <inki.dae@samsung.com>

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 2bab12f..480dedf 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -234,6 +234,21 @@
 			status = "disabled";
 		};
 
+		dsi_0: dsi@11C80000 {
+			compatible = "samsung,exynos3250-mipi-dsi";
+			reg = <0x11C80000 0x10000>;
+			interrupts = <0 83 0>;
+			samsung,phy-type = <0>;
+			samsung,power-domain = <&pd_lcd0>;
+			phys = <&mipi_phy 1>;
+			phy-names = "dsim";
+			clocks = <&cmu CLK_DSIM0>, <&cmu CLK_SCLK_MIPI0>;
+			clock-names = "bus_clk", "pll_clk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		mshc_0: mshc@12510000 {
 			compatible = "samsung,exynos5250-dw-mshc";
 			reg = <0x12510000 0x1000>;
-- 
1.7.9.5
