From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/3] ARM64: dts: exynos5433: add HDMI node
Date: Thu, 05 Jan 2017 16:25:42 +0100
Message-ID: <1483629943-31183-2-git-send-email-a.hajda@samsung.com>
References: <1483629943-31183-1-git-send-email-a.hajda@samsung.com>
 <CGME20170105152604eucas1p2092deeb660630f09b857cd1f8d1e4dea@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1483629943-31183-1-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

HDMI converts RGB/I80 signal from DECON_TV to HDMI/TMDS video stream.

Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index b47951b..cf45446 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -843,6 +843,36 @@
 			iommu-names = "m0", "m1";
 		};
 
+		hdmi: hdmi@13970000 {
+			compatible = "samsung,exynos5433-hdmi";
+			reg = <0x13970000 0x70000>;
+			interrupts = <0 208 0>;
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
+			power-domains = <&pd_disp>;
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
