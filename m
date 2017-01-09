From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 2/3] arm64: dts: exynos5433: add HDMI node
Date: Mon, 09 Jan 2017 11:40:36 +0100
Message-ID: <1483958437-6572-2-git-send-email-a.hajda@samsung.com>
References: <1483958437-6572-1-git-send-email-a.hajda@samsung.com>
 <CGME20170109104054eucas1p1e67bb21985880fec1aaeec1969dbe5e0@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:14825 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964875AbdAIKlE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 05:41:04 -0500
In-reply-to: <1483958437-6572-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

HDMI converts RGB/I80 signal from DECON_TV to HDMI/TMDS video stream.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
v2:
  - replaced magic numbers with macros,
  - removed power domains
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 5552f77..f82d26e 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -837,6 +837,35 @@
 			iommu-names = "m0", "m1";
 		};
 
+		hdmi: hdmi@13970000 {
+			compatible = "samsung,exynos5433-hdmi";
+			reg = <0x13970000 0x70000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_disp CLK_PCLK_HDMI>,
+				<&cmu_disp CLK_PCLK_HDMIPHY>,
+				<&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO>,
+				<&cmu_disp CLK_PHYCLK_HDMI_PIXEL>,
+				<&cmu_disp CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY>,
+				<&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_TMDS_CLKO_USER>,
+				<&cmu_disp CLK_PHYCLK_HDMIPHY_PIXEL_CLKO_PHY>,
+				<&cmu_disp CLK_MOUT_PHYCLK_HDMIPHY_PIXEL_CLKO_USER>,
+				<&xxti>, <&cmu_disp CLK_SCLK_HDMI_SPDIF>;
+			clock-names = "hdmi_pclk", "hdmi_i_pclk",
+				"i_tmds_clk", "i_pixel_clk",
+				"tmds_clko", "tmds_clko_user",
+				"pixel_clko", "pixel_clko_user",
+				"oscclk", "i_spdif_clk";
+			phy = <&hdmiphy>;
+			ddc = <&hsi2c_11>;
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			samsung,sysreg-phandle = <&syscon_disp>;
+			status = "disabled";
+		};
+
+		hdmiphy: hdmiphy@13af0000 {
+			reg = <0x13af0000 0x80>;
+		};
+
 		syscon_disp: syscon@13b80000 {
 			compatible = "syscon";
 			reg = <0x13b80000 0x1010>;
-- 
2.7.4
