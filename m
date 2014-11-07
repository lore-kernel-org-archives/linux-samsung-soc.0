From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 4/4] ARM: dts: add mipi dsi device node to exynos4415.dtsi
Date: Fri, 07 Nov 2014 15:12:27 +0900
Message-ID: <1415340747-27904-5-git-send-email-yj44.cho@samsung.com>
References: <1415340747-27904-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45741 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751513AbaKGGMf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Nov 2014 01:12:35 -0500
In-reply-to: <1415340747-27904-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, kyungmin.park@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, cw00.choi@samsung.com, kgene.kim@samsung.com

This patch adds mipi dsi device node to exynos4415.dtsi.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4415.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4415.dtsi b/arch/arm/boot/dts/exynos4415.dtsi
index 30acb3a..6105236 100644
--- a/arch/arm/boot/dts/exynos4415.dtsi
+++ b/arch/arm/boot/dts/exynos4415.dtsi
@@ -246,6 +246,21 @@
 			status = "disabled";
 		};
 
+		dsi_0: dsi@11C80000 {
+			compatible = "samsung,exynos4415-mipi-dsi";
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
 		hsotg: hsotg@12480000 {
 			compatible = "samsung,s3c6400-hsotg";
 			reg = <0x12480000 0x20000>;
-- 
1.9.0
