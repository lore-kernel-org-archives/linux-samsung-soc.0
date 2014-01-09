From: Thomas Abraham <ta.omasab@gmail.com>
Subject: [PATCH 6/6] arm: dts: add cpu nodes for Exynos4210 SoC
Date: Thu,  9 Jan 2014 21:29:25 +0530
Message-ID: <1389283165-17708-7-git-send-email-thomas.ab@samsung.com>
References: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:39716 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751402AbaAIQAx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jan 2014 11:00:53 -0500
In-Reply-To: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, kgene.kim@samsung.com, shawn.guo@linaro.org, viresh.kumar@linaro.org

Add CPU nodes for Exynos4210 SoC and also properties required by the
cpufreq-cpu0 driver.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/boot/dts/exynos4210-origen.dts         |    6 ++++++
 arch/arm/boot/dts/exynos4210-trats.dts          |    6 ++++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts |    6 ++++++
 arch/arm/boot/dts/exynos4210.dtsi               |   22 ++++++++++++++++++++++
 4 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 2aa13cb..afecd8f 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -32,6 +32,12 @@
 		bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC2,115200 init=/linuxrc";
 	};
 
+	cpus {
+		cpu: cpu@0 {
+			cpu0-supply = <&buck1_reg>;
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 63cc571..25487d7 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -30,6 +30,12 @@
 		bootargs = "console=ttySAC2,115200N8 root=/dev/mmcblk0p5 rootwait earlyprintk panic=5";
 	};
 
+	cpus {
+		cpu: cpu@0 {
+			cpu0-supply = <&varm_breg>;
+		};
+	};
+
 	regulators {
 		compatible = "simple-bus";
 
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index d2e3f5f..74d5a70 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -28,6 +28,12 @@
 		bootargs = "console=ttySAC2,115200N8 root=/dev/mmcblk0p5 rw rootwait earlyprintk panic=5 maxcpus=1";
 	};
 
+	cpus {
+		cpu: cpu@0 {
+			cpu0-supply = <&vdd_arm_reg>;
+		};
+	};
+
 	mct@10050000 {
 		compatible = "none";
 	};
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 48ecd7a..3db2da8 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -36,6 +36,28 @@
 		reg = <0x10023CA0 0x20>;
 	};
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <0>;
+			clocks = <&clock 12>;
+			clock-names = "cpu";
+
+			operating-points = <
+				200000	950000
+				400000	975000
+				500000	975000
+				800000	1075000
+				1000000	1150000
+				1200000	1250000
+			>;
+			safe-opp-index = <3>;
+		};
+	};
+
 	gic: interrupt-controller@10490000 {
 		cpu-offset = <0x8000>;
 	};
-- 
1.6.6.rc2
