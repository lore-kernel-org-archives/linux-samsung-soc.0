From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/6] arm64: dts: exynos: Add USB Device dt node for Exynos5433
Date: Thu, 02 Apr 2015 17:34:33 +0900
Message-ID: <1427963677-32661-3-git-send-email-cw00.choi@samsung.com>
References: <1427963677-32661-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1427963677-32661-1-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Jaewon Kim <jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

This patch adds USB DRD(Dual Role Device) and PHY
device tree node to use USB Device.

Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Jaewon Kim <jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 47 ++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 8a1875d..b460f5f 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -959,6 +959,53 @@
 			#phy-cells = <1>;
 			status = "disabled";
 		};
+
+		usbdrd30: usb@15400000 {
+			compatible = "samsung,exynos5250-dwusb3";
+			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>,
+				<&cmu_fsys CLK_SCLK_USBDRD30>;
+			clock-names = "usbdrd30", "usbdrd30_susp_clk";
+			assigned-clocks =
+				<&cmu_fsys CLK_MOUT_SCLK_USBDRD30_USER>,
+				<&cmu_top CLK_MOUT_SCLK_USBDRD30>,
+				<&cmu_top CLK_DIV_SCLK_USBDRD30>;
+			assigned-clock-parents =
+				<&cmu_top CLK_SCLK_USBDRD30_FSYS>,
+				<&cmu_top CLK_MOUT_BUS_PLL_USER>;
+			assigned-clock-rates = <0>, <0>, <66700000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			dwc3 {
+				compatible = "snps,dwc3";
+				reg = <0x15400000 0x10000>;
+				interrupts = <0 231 0>;
+				phys = <&usbdrd30_phy 0>, <&usbdrd30_phy 1>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+
+		};
+
+		usbdrd30_phy: phy@15500000 {
+			compatible = "samsung,exynos5433-usbdrd-phy";
+			reg = <0x15500000 0x100>;
+			clocks = <&cmu_fsys CLK_ACLK_USBDRD30>, <&xxti>,
+				<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK>,
+				<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK>,
+				<&cmu_fsys CLK_SCLK_USBDRD30>;
+			clock-names = "phy", "ref", "phy_utmi", "phy_pipe", "itp";
+			assigned-clocks =
+				<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_USER>,
+				<&cmu_fsys CLK_MOUT_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_USER>;
+			assigned-clock-parents =
+				<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PIPE_PCLK_PHY>,
+				<&cmu_fsys CLK_PHYCLK_USBDRD30_UDRD30_PHYCLOCK_PHY>;
+			#phy-cells = <1>;
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
