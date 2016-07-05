From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH] arm64: dts: exynos: add atlas clock controller node
Date: Wed,  6 Jul 2016 01:59:59 +0530
Message-ID: <1467750599-14008-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:33297 "EHLO
	mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933102AbcGEQWj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 12:22:39 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, k.kozlowski@samsung.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org

The atlas CMU generates all the necessary clocks for the Cortex-A57.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 8d7ce97..fd008e9 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -158,6 +158,14 @@
 				      "dout_sclk_mfc_pll";
 		};
 
+		clock_atlas: clock-controller@11800000 {
+			compatible = "samsung,exynos7-clock-atlas";
+			reg = <0x11800000 0x1100>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>, <&clock_topc SCLK_BUS0_PLL_ATLAS>;
+			clock-names = "fin_pll", "sclk_bus0_pll_atlas";
+		};
+
 		clock_ccore: clock-controller@105b0000 {
 			compatible = "samsung,exynos7-clock-ccore";
 			reg = <0x105b0000 0xd00>;
-- 
1.9.1
