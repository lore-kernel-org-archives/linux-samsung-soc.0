From: juergen@kreuzholzen.de
Subject: (unknown)
Date: Sun, 16 Nov 2014 18:29:35 +0100
Message-ID: <E1Xq3dn-0006lG-NW@sslproxy02.your-server.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www291.your-server.de ([78.46.156.197]:51624 "EHLO
	www291.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755221AbaKPR3l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Nov 2014 12:29:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

>From 4a92cd8e4a9ee34466c3abb23a3d76fdfd484169 Mon Sep 17 00:00:00 2001
Message-Id: <4a92cd8e4a9ee34466c3abb23a3d76fdfd484169.1416158605.git.juergen@kreuzholzen.de>
In-Reply-To: <cover.1416158605.git.juergen@kreuzholzen.de>
References: <cover.1416158605.git.juergen@kreuzholzen.de>
From: Juergen Borleis <juergen@kreuzholzen.de>
Date: Sun, 9 Nov 2014 19:50:50 +0100
Subject: [PATCH 2/8] ARM/DTS/S3C64XX: add syscon driver
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

Some devices are controlled in one central unit: the syscon

Signed-off-by: Juergen Borleis <juergen@kreuzholzen.de>
---
 arch/arm/boot/dts/s3c64xx.dtsi | 6 ++++++
 arch/arm/mach-s3c64xx/Kconfig  | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/s3c64xx.dtsi b/arch/arm/boot/dts/s3c64xx.dtsi
index ff5bdaa..5efeb1f 100644
--- a/arch/arm/boot/dts/s3c64xx.dtsi
+++ b/arch/arm/boot/dts/s3c64xx.dtsi
@@ -103,6 +103,12 @@
 			status = "disabled";
 		};
 
+		pmu_syscon: systemc@7e00f000 {
+			compatible = "samsung,s3c6400-syscon", "syscon";
+			reg = <0x7e00f000 0x1000>;
+			status = "okay";
+		};
+
 		i2c0: i2c@7f004000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0x7f004000 0x1000>;
diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index 26ca242..d5c0812 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -303,6 +303,7 @@ config MACH_S3C64XX_DT
 	select PINCTRL
 	select PINCTRL_S3C64XX
 	select USE_OF
+	select MFD_SYSCON
 	help
 	  Machine support for Samsung S3C6400/S3C6410 machines with Device Tree
 	  enabled.
-- 
1.8.1
