From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V2] ARM: dts: exynos5: add pwm DT nodes to Exynos5250 and
 Exynos5420
Date: Thu, 10 Oct 2013 14:43:29 +0530
Message-ID: <1381396409-10313-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49420 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752100Ab3JJIxD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 04:53:03 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree@vger.kernel.org, t.figa@samsung.com, abrestic@chromium.org, olofj@chromium.org

Add the device-tree binding for the PWM controller to Exynos5250 and Exynos5420

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Olof Johansson <olofj@chromium.org>
Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
changes since v1:
	- Moved the common properties in the node to exynos5.dtsi file
	  suggested by Sachin Kamat <sachin.kamat@linaro.org>	  

 arch/arm/boot/dts/exynos5.dtsi    |    7 +++++++
 arch/arm/boot/dts/exynos5250.dtsi |    5 +++++
 arch/arm/boot/dts/exynos5420.dtsi |    5 +++++
 3 files changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 074739d..eb74ebc 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -109,6 +109,13 @@
 		status = "disabled";
 	};
 
+	pwm: pwm@12dd0000 {
+		compatible = "samsung,exynos4210-pwm";
+		reg = <0x12dd0000 0x100>;
+		samsung,pwm-outputs = <0>, <1>, <2>, <3>;
+		#pwm-cells = <3>;
+	};
+
 	fimd@14400000 {
 		compatible = "samsung,exynos5250-fimd";
 		interrupt-parent = <&combiner>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 7cb5c4b..52bf8d2 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -521,6 +521,11 @@
 		};
 	};
 
+	pwm: pwm@12dd0000 {
+		clocks = <&clock 311>;
+		clock-names = "timers";
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 09aa06c..9387b15 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -210,6 +210,11 @@
 		clock-names = "uart", "clk_uart_baud0";
 	};
 
+	pwm: pwm@12dd0000 {
+		clocks = <&clock 279>;
+		clock-names = "timers";
+	};
+
 	dp_phy: video-phy@10040728 {
 		compatible = "samsung,exynos5250-dp-video-phy";
 		reg = <0x10040728 4>;
-- 
1.7.10.4
