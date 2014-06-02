From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v3 15/15] ARM: dts: exynos5420: add dsi node
Date: Mon, 02 Jun 2014 14:22:51 +0900
Message-ID: <1401686571-22148-16-git-send-email-yj44.cho@samsung.com>
References: <1401686571-22148-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:37250 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751821AbaFBFXC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jun 2014 01:23:02 -0400
In-reply-to: <1401686571-22148-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com

This patch adds common part of dsi node.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 6fde5fd..43b6852 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -478,6 +478,20 @@
 		#phy-cells = <1>;
 	};
 
+	dsi@14500000 {
+		compatible = "samsung,exynos5420-mipi-dsi";
+		reg = <0x14500000 0x10000>;
+		interrupts = <0 82 0>;
+		samsung,power-domain = <&disp_pd>;
+		phys = <&mipi_phy 1>;
+		phy-names = "dsim";
+		clocks = <&clock CLK_DSIM1>, <&clock CLK_SCLK_MIPI1>;
+		clock-names = "bus_clk", "pll_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	fimd@14400000 {
 		samsung,power-domain = <&disp_pd>;
 		clocks = <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
-- 
1.7.9.5
