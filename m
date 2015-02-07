From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 2/4] ARM: dts: exynos4: use pmureg device node to enable mipi
 phy
Date: Sat, 07 Feb 2015 20:53:06 +0900
Message-ID: <1423309988-11793-3-git-send-email-inki.dae@samsung.com>
References: <1423309988-11793-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39075 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755184AbbBGLxM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 7 Feb 2015 06:53:12 -0500
In-reply-to: <1423309988-11793-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, a.hajda@samsung.com, Inki Dae <inki.dae@samsung.com>

This patch removes mipi phy relevant properties from dsim device node
and makes the pmureg device node to be used instead to enable
mipi phy.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index b8168f1..42dfdcf 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -148,8 +148,7 @@
 		reg = <0x11C80000 0x10000>;
 		interrupts = <0 79 0>;
 		samsung,power-domain = <&pd_lcd0>;
-		phys = <&mipi_phy 1>;
-		phy-names = "dsim";
+		samsung,pmureg = <&pmu_system_controller>;
 		clocks = <&clock CLK_DSIM0>, <&clock CLK_SCLK_MIPI0>;
 		clock-names = "bus_clk", "pll_clk";
 		status = "disabled";
-- 
1.7.9.5
