From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V10 1/3] ARM: dts: Add pmu sysreg node to exynos5250 and
 exynos5420 dtsi files
Date: Wed, 27 Nov 2013 17:20:08 +0530
Message-ID: <1385553010-30183-2-git-send-email-l.krishna@samsung.com>
References: <1385553010-30183-1-git-send-email-l.krishna@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1385553010-30183-1-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds pmusysreg node to exynos5250 and exynos5420 dtsi files to
handle PMU register accesses in a centralized way using syscon driver

Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/samsung/pmu.txt |   16 ++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi                     |    5 +++++
 arch/arm/boot/dts/exynos5420.dtsi                     |    5 +++++
 3 files changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/pmu.txt

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
new file mode 100644
index 0000000..307e727
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
@@ -0,0 +1,16 @@
+SAMSUNG Exynos SoC series PMU Registers
+
+Properties:
+ - name : should be 'syscon';
+ - compatible : should contain two values. First value must be one from following list:
+		   - "samsung,exynos5250-pmu" - for Exynos5250 SoC,
+		   - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
+		second value must be always "syscon".
+
+ - reg : offset and length of the register set.
+
+Example :
+pmu_syscon: syscon@10040000 {
+	compatible = "samsung,exynos5250-pmu", "syscon";
+	reg = <0x10040000 0x5000>;
+};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 9db5047..2f264ad 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -163,6 +163,11 @@
 		interrupts = <0 47 0>;
 	};
 
+	pmu_syscon: syscon@10040000 {
+		compatible = "samsung,exynos5250-pmu", "syscon";
+		reg = <0x10040000 0x5000>;
+	};
+
 	watchdog {
 		clocks = <&clock 336>;
 		clock-names = "watchdog";
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 09aa06c..06e97a7 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -310,4 +310,9 @@
 		clocks = <&clock 431>, <&clock 143>;
 		clock-names = "mixer", "sclk_hdmi";
 	};
+
+	pmu_syscon: syscon@10040000 {
+		compatible = "samsung,exynos5420-pmu", "syscon";
+		reg = <0x10040000 0x5000>;
+	};
 };
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
