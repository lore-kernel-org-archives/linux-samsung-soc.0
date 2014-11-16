From: juergen@kreuzholzen.de
Subject: (unknown)
Date: Sun, 16 Nov 2014 18:29:36 +0100
Message-ID: <E1Xq3dn-0006lG-VG@sslproxy02.your-server.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www291.your-server.de ([78.46.156.197]:51631 "EHLO
	www291.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755359AbaKPR3l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Nov 2014 12:29:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

>From 37a8cf1ed215f68517eae2818be35df042b7e2d0 Mon Sep 17 00:00:00 2001
Message-Id: <37a8cf1ed215f68517eae2818be35df042b7e2d0.1416158605.git.juergen@kreuzholzen.de>
In-Reply-To: <cover.1416158605.git.juergen@kreuzholzen.de>
References: <cover.1416158605.git.juergen@kreuzholzen.de>
From: Juergen Borleis <juergen@kreuzholzen.de>
Date: Sun, 9 Nov 2014 19:55:08 +0100
Subject: [PATCH 3/8] ARM/DTS/S3C64XX: add RTC device
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

Signed-off-by: Juergen Borleis <juergen@kreuzholzen.de>
---
 arch/arm/boot/dts/s3c6410.dtsi | 4 ++++
 arch/arm/boot/dts/s3c64xx.dtsi | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/s3c6410.dtsi b/arch/arm/boot/dts/s3c6410.dtsi
index eb4226b..3c35c94 100644
--- a/arch/arm/boot/dts/s3c6410.dtsi
+++ b/arch/arm/boot/dts/s3c6410.dtsi
@@ -36,6 +36,10 @@
 	valid-wakeup-mask = <0x53020000>;
 };
 
+&rtc {
+	compatible = "samsung,s3c6410-rtc";
+};
+
 &soc {
 	clocks: clock-controller@7e00f000 {
 		compatible = "samsung,s3c6410-clock";
diff --git a/arch/arm/boot/dts/s3c64xx.dtsi b/arch/arm/boot/dts/s3c64xx.dtsi
index 5efeb1f..48de957 100644
--- a/arch/arm/boot/dts/s3c64xx.dtsi
+++ b/arch/arm/boot/dts/s3c64xx.dtsi
@@ -103,6 +103,15 @@
 			status = "disabled";
 		};
 
+		rtc: rtc@7e005000 {
+			compatible = "samsung,s3c6400-rtc";
+			reg = <0x7e005000 0x1000>;
+			interrupts-extended = <&vic1 28>, <&vic0 2>;
+			clock-names = "rtc";
+			clocks = <&clocks PCLK_RTC>;
+			status = "disabled";
+		};
+
 		pmu_syscon: systemc@7e00f000 {
 			compatible = "samsung,s3c6400-syscon", "syscon";
 			reg = <0x7e00f000 0x1000>;
-- 
1.8.1
