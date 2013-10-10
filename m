From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [RESEND] [PATCH] ARM: dts: exynos5: add pwm DT nodes to Exynos5250 and
 Exynos5420
Date: Thu, 10 Oct 2013 11:12:11 +0530
Message-ID: <1381383731-4359-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25242 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752026Ab3JJFVZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 01:21:25 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree@vger.kernel.org, t.figa@samsung.com, abrestic@chromium.org, olofj@chromium.org

Add the device-tree binding for the PWM controller to Exynos5250 and Exynos5420

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Olof Johansson <olofj@chromium.org>
Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    9 +++++++++
 arch/arm/boot/dts/exynos5420.dtsi |    9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 864ae90..99abc72 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -521,6 +521,15 @@
 		};
 	};
 
+	pwm: pwm@12dd0000 {
+		compatible = "samsung,exynos4210-pwm";
+		reg = <0x12dd0000 0x100>;
+		samsung,pwm-outputs = <0>, <1>, <2>, <3>;
+		#pwm-cells = <3>;
+		clocks = <&clock 311>;
+		clock-names = "timers";
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index d537cd7..80afc8b 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -206,6 +206,15 @@
 		clock-names = "uart", "clk_uart_baud0";
 	};
 
+	pwm: pwm@12dd0000 {
+		compatible = "samsung,exynos4210-pwm";
+		reg = <0x12dd0000 0x100>;
+		samsung,pwm-outputs = <0>, <1>, <2>, <3>;
+		#pwm-cells = <3>;
+		clocks = <&clock 279>;
+		clock-names = "timers";
+	};
+
 	dp_phy: video-phy@10040728 {
 		compatible = "samsung,exynos5250-dp-video-phy";
 		reg = <0x10040728 4>;
-- 
1.7.10.4
