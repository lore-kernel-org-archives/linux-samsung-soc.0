From: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 4/5] ARM: dts: exynos5420: add CCI node
Date: Mon,  5 May 2014 21:57:00 +0530
Message-ID: <1399307221-8659-5-git-send-email-a.kesavan@samsung.com>
References: <1399307221-8659-1-git-send-email-a.kesavan@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399307221-8659-1-git-send-email-a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Dave.Martin-5wv7dgnIgG8@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Add device-tree bindings for the ARM CCI-400 on Exynos5420.  There
are two slave interfaces: one for the A15 cluster and one for the
A7 cluster.

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |   27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index ff496ad..3140138 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -58,6 +58,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <0x0>;
 			clock-frequency = <1800000000>;
+			cci-control-port = <&cci_control1>;
 		};
 
 		cpu1: cpu@1 {
@@ -65,6 +66,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <0x1>;
 			clock-frequency = <1800000000>;
+			cci-control-port = <&cci_control1>;
 		};
 
 		cpu2: cpu@2 {
@@ -72,6 +74,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <0x2>;
 			clock-frequency = <1800000000>;
+			cci-control-port = <&cci_control1>;
 		};
 
 		cpu3: cpu@3 {
@@ -79,6 +82,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <0x3>;
 			clock-frequency = <1800000000>;
+			cci-control-port = <&cci_control1>;
 		};
 
 		cpu4: cpu@100 {
@@ -86,6 +90,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x100>;
 			clock-frequency = <1000000000>;
+			cci-control-port = <&cci_control0>;
 		};
 
 		cpu5: cpu@101 {
@@ -93,6 +98,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x101>;
 			clock-frequency = <1000000000>;
+			cci-control-port = <&cci_control0>;
 		};
 
 		cpu6: cpu@102 {
@@ -100,6 +106,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x102>;
 			clock-frequency = <1000000000>;
+			cci-control-port = <&cci_control0>;
 		};
 
 		cpu7: cpu@103 {
@@ -107,6 +114,26 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x103>;
 			clock-frequency = <1000000000>;
+			cci-control-port = <&cci_control0>;
+		};
+	};
+
+	cci@10d20000 {
+		compatible = "arm,cci-400";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x10d20000 0x1000>;
+		ranges = <0x0 0x10d20000 0x6000>;
+
+		cci_control0: slave-if@4000 {
+			compatible = "arm,cci-400-ctrl-if";
+			interface-type = "ace";
+			reg = <0x4000 0x1000>;
+		};
+		cci_control1: slave-if@5000 {
+			compatible = "arm,cci-400-ctrl-if";
+			interface-type = "ace";
+			reg = <0x5000 0x1000>;
 		};
 	};
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
