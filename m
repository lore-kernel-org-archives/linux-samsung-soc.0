From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V7 2/3] ARM: dts: update watchdog device nodes for Exynos5250
 and Exynos5420
Date: Mon, 11 Nov 2013 18:14:56 +0530
Message-ID: <1384173897-16106-3-git-send-email-l.krishna@samsung.com>
References: <1384173897-16106-1-git-send-email-l.krishna@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1384173897-16106-1-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
Cc: t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

In Exynos5 series SoCs, PMU has registers to enable/disable mask/unmask
watchdog timer which is not the case with s3c series SoCs so, there is a
need to have different compatible names for watchdog to handle these pmu
registers access.

Hence this patch removes watchdog node from Exynos5.dtsi common file and
make it separate by updating existing node in Exynos5250 and adding new node
to Exynos5420. This patch also makes the watchdog node enabled by default

Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5.dtsi    |    7 -------
 arch/arm/boot/dts/exynos5250.dtsi |    6 +++++-
 arch/arm/boot/dts/exynos5420.dtsi |    9 +++++++++
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index e52b038..f1fea28 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -81,13 +81,6 @@
 		status = "disabled";
 	};
 
-	watchdog {
-		compatible = "samsung,s3c2410-wdt";
-		reg = <0x101D0000 0x100>;
-		interrupts = <0 42 0>;
-		status = "disabled";
-	};
-
 	fimd@14400000 {
 		compatible = "samsung,exynos5250-fimd";
 		interrupt-parent = <&combiner>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 6056a83..69f6c6a 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -163,9 +163,13 @@
 		reg = <0x10040000 0x5000>;
 	};
 
-	watchdog {
+	watchdog@101D0000 {
+		compatible = "samsung,exynos5250-wdt";
+		reg = <0x101D0000 0x100>;
+		interrupts = <0 42 0>;
 		clocks = <&clock 336>;
 		clock-names = "watchdog";
+		samsung,syscon-phandle = <&pmu_syscon>;
 	};
 
 	g2d@10850000 {
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 39ce15a..61764bb 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -374,4 +374,13 @@
 		compatible = "samsung,exynos5420-pmu", "syscon";
 		reg = <0x10040000 0x5000>;
 	};
+
+        watchdog@101D0000 {
+		compatible = "samsung,exynos5420-wdt";
+		reg = <0x101D0000 0x100>;
+		interrupts = <0 42 0>;
+		clocks = <&clock 316>;
+		clock-names = "watchdog";
+		samsung,syscon-phandle = <&pmu_syscon>;
+        };
 };
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
