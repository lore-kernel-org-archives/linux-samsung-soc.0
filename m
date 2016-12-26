From: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC PATCH 3/6] ARM64: dts: exynos5433: add the pcie_phy node for PCIe
Date: Mon, 26 Dec 2016 14:20:26 +0900
Message-ID: <20161226052029.10552-4-jh80.chung@samsung.com>
References: <20161226052029.10552-1-jh80.chung@samsung.com>
 <CGME20161226052031epcas5p451b1352d6c8c5205a69246c2994b9506@epcas5p4.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20161226052029.10552-1-jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

To use the generic PHY framework, adds the pcie_phy node.

Signed-off-by: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 64226d5..2a15f18 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -805,6 +805,11 @@
 			reg = <0x145f0000 0x1038>;
 		};
 
+		syscon_fsys: syscon@156f0000 {
+			compatible = "syscon";
+			reg = <0x156f0000 0x1044>;
+		};
+
 		gsc_0: video-scaler@13C00000 {
 			compatible = "samsung,exynos5433-gsc";
 			reg = <0x13c00000 0x1000>;
@@ -1443,6 +1448,15 @@
 				status = "disabled";
 			};
 		};
+
+		pcie_phy: pcie-phy@15680000 {
+			#phy-cells = <0>;
+			compatible = "samsung,exynos5433-pcie-phy";
+			reg = <0x15680000 0x1000>;
+			samsung,pmureg-phandle = <&pmu_system_controller>;
+			samsung,fsys-sysreg = <&syscon_fsys>;
+			status = "okay";
+		};
 	};
 
 	timer: timer {
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
