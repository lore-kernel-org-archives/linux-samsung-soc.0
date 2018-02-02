From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 07/10] ARM: dts: exynos: Use camera label in exynos4412
Date: Fri, 02 Feb 2018 16:43:52 +0100
Message-ID: <1517586235-16603-8-git-send-email-m.purski@samsung.com>
References: <1517586235-16603-1-git-send-email-m.purski@samsung.com>
        <CGME20180202154410eucas1p2e2964ae42245dcd2038bd2ec977f09bb@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1517586235-16603-1-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Camera label has been defined in exynos4.dtsi. Use it in exynos4412
instead of defining a new node.

Signed-off-by: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos4412.dtsi | 172 +++++++++++++++++++-------------------
 1 file changed, 86 insertions(+), 86 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index a49daf9..a6f3f59 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -283,92 +283,6 @@
 		iommus = <&sysmmu_g2d>;
 	};
 
-	camera {
-		clocks = <&clock CLK_SCLK_CAM0>, <&clock CLK_SCLK_CAM1>,
-			 <&clock CLK_PIXELASYNCM0>, <&clock CLK_PIXELASYNCM1>;
-		clock-names = "sclk_cam0", "sclk_cam1", "pxl_async0", "pxl_async1";
-
-		/* fimc_[0-3] are configured outside, under phandles */
-		fimc_lite_0: fimc-lite@12390000 {
-			compatible = "samsung,exynos4212-fimc-lite";
-			reg = <0x12390000 0x1000>;
-			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&pd_isp>;
-			clocks = <&isp_clock CLK_ISP_FIMC_LITE0>;
-			clock-names = "flite";
-			iommus = <&sysmmu_fimc_lite0>;
-			status = "disabled";
-		};
-
-		fimc_lite_1: fimc-lite@123a0000 {
-			compatible = "samsung,exynos4212-fimc-lite";
-			reg = <0x123A0000 0x1000>;
-			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&pd_isp>;
-			clocks = <&isp_clock CLK_ISP_FIMC_LITE1>;
-			clock-names = "flite";
-			iommus = <&sysmmu_fimc_lite1>;
-			status = "disabled";
-		};
-
-		fimc_is: fimc-is@12000000 {
-			compatible = "samsung,exynos4212-fimc-is";
-			reg = <0x12000000 0x260000>;
-			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&pd_isp>;
-			clocks = <&isp_clock CLK_ISP_FIMC_LITE0>,
-				 <&isp_clock CLK_ISP_FIMC_LITE1>,
-				 <&isp_clock CLK_ISP_PPMUISPX>,
-				 <&isp_clock CLK_ISP_PPMUISPMX>,
-				 <&isp_clock CLK_ISP_FIMC_ISP>,
-				 <&isp_clock CLK_ISP_FIMC_DRC>,
-				 <&isp_clock CLK_ISP_FIMC_FD>,
-				 <&isp_clock CLK_ISP_MCUISP>,
-				 <&isp_clock CLK_ISP_GICISP>,
-				 <&isp_clock CLK_ISP_MCUCTL_ISP>,
-				 <&isp_clock CLK_ISP_PWM_ISP>,
-				 <&isp_clock CLK_ISP_DIV_ISP0>,
-				 <&isp_clock CLK_ISP_DIV_ISP1>,
-				 <&isp_clock CLK_ISP_DIV_MCUISP0>,
-				 <&isp_clock CLK_ISP_DIV_MCUISP1>,
-				 <&clock CLK_MOUT_MPLL_USER_T>,
-				 <&clock CLK_ACLK200>,
-				 <&clock CLK_ACLK400_MCUISP>,
-				 <&clock CLK_DIV_ACLK200>,
-				 <&clock CLK_DIV_ACLK400_MCUISP>,
-				 <&clock CLK_UART_ISP_SCLK>;
-			clock-names = "lite0", "lite1", "ppmuispx",
-				      "ppmuispmx", "isp",
-				      "drc", "fd", "mcuisp",
-				      "gicisp", "mcuctl_isp", "pwm_isp",
-				      "ispdiv0", "ispdiv1", "mcuispdiv0",
-				      "mcuispdiv1", "mpll", "aclk200",
-				      "aclk400mcuisp", "div_aclk200",
-				      "div_aclk400mcuisp", "uart";
-			iommus = <&sysmmu_fimc_isp>, <&sysmmu_fimc_drc>,
-				 <&sysmmu_fimc_fd>, <&sysmmu_fimc_mcuctl>;
-			iommu-names = "isp", "drc", "fd", "mcuctl";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-			status = "disabled";
-
-			pmu@10020000 {
-				reg = <0x10020000 0x3000>;
-			};
-
-			i2c1_isp: i2c-isp@12140000 {
-				compatible = "samsung,exynos4212-i2c-isp";
-				reg = <0x12140000 0x100>;
-				clocks = <&isp_clock CLK_ISP_I2C1_ISP>;
-				clock-names = "i2c_isp";
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
-		};
-	};
-
 	mshc_0: mmc@12550000 {
 		compatible = "samsung,exynos4412-dw-mshc";
 		reg = <0x12550000 0x1000>;
@@ -662,6 +576,92 @@
 		     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 };
 
+&camera {
+	clocks = <&clock CLK_SCLK_CAM0>, <&clock CLK_SCLK_CAM1>,
+		 <&clock CLK_PIXELASYNCM0>, <&clock CLK_PIXELASYNCM1>;
+	clock-names = "sclk_cam0", "sclk_cam1", "pxl_async0", "pxl_async1";
+
+	/* fimc_[0-3] are configured outside, under phandles */
+	fimc_lite_0: fimc-lite@12390000 {
+		compatible = "samsung,exynos4212-fimc-lite";
+		reg = <0x12390000 0x1000>;
+		interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&pd_isp>;
+		clocks = <&isp_clock CLK_ISP_FIMC_LITE0>;
+		clock-names = "flite";
+		iommus = <&sysmmu_fimc_lite0>;
+		status = "disabled";
+	};
+
+	fimc_lite_1: fimc-lite@123a0000 {
+		compatible = "samsung,exynos4212-fimc-lite";
+		reg = <0x123A0000 0x1000>;
+		interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&pd_isp>;
+		clocks = <&isp_clock CLK_ISP_FIMC_LITE1>;
+		clock-names = "flite";
+		iommus = <&sysmmu_fimc_lite1>;
+		status = "disabled";
+	};
+
+	fimc_is: fimc-is@12000000 {
+		compatible = "samsung,exynos4212-fimc-is";
+		reg = <0x12000000 0x260000>;
+		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&pd_isp>;
+		clocks = <&isp_clock CLK_ISP_FIMC_LITE0>,
+			 <&isp_clock CLK_ISP_FIMC_LITE1>,
+			 <&isp_clock CLK_ISP_PPMUISPX>,
+			 <&isp_clock CLK_ISP_PPMUISPMX>,
+			 <&isp_clock CLK_ISP_FIMC_ISP>,
+			 <&isp_clock CLK_ISP_FIMC_DRC>,
+			 <&isp_clock CLK_ISP_FIMC_FD>,
+			 <&isp_clock CLK_ISP_MCUISP>,
+			 <&isp_clock CLK_ISP_GICISP>,
+			 <&isp_clock CLK_ISP_MCUCTL_ISP>,
+			 <&isp_clock CLK_ISP_PWM_ISP>,
+			 <&isp_clock CLK_ISP_DIV_ISP0>,
+			 <&isp_clock CLK_ISP_DIV_ISP1>,
+			 <&isp_clock CLK_ISP_DIV_MCUISP0>,
+			 <&isp_clock CLK_ISP_DIV_MCUISP1>,
+			 <&clock CLK_MOUT_MPLL_USER_T>,
+			 <&clock CLK_ACLK200>,
+			 <&clock CLK_ACLK400_MCUISP>,
+			 <&clock CLK_DIV_ACLK200>,
+			 <&clock CLK_DIV_ACLK400_MCUISP>,
+			 <&clock CLK_UART_ISP_SCLK>;
+		clock-names = "lite0", "lite1", "ppmuispx",
+			      "ppmuispmx", "isp",
+			      "drc", "fd", "mcuisp",
+			      "gicisp", "mcuctl_isp", "pwm_isp",
+			      "ispdiv0", "ispdiv1", "mcuispdiv0",
+			      "mcuispdiv1", "mpll", "aclk200",
+			      "aclk400mcuisp", "div_aclk200",
+			      "div_aclk400mcuisp", "uart";
+		iommus = <&sysmmu_fimc_isp>, <&sysmmu_fimc_drc>,
+			 <&sysmmu_fimc_fd>, <&sysmmu_fimc_mcuctl>;
+		iommu-names = "isp", "drc", "fd", "mcuctl";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		status = "disabled";
+
+		pmu@10020000 {
+			reg = <0x10020000 0x3000>;
+		};
+
+		i2c1_isp: i2c-isp@12140000 {
+			compatible = "samsung,exynos4212-i2c-isp";
+			reg = <0x12140000 0x100>;
+			clocks = <&isp_clock CLK_ISP_I2C1_ISP>;
+			clock-names = "i2c_isp";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
 &exynos_usbphy {
 	compatible = "samsung,exynos4x12-usb2-phy";
 	samsung,sysreg-phandle = <&sys_reg>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
