From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 1/2] arm: dts: Add nodes in smdkv310 device tree source file
Date: Sun, 17 Jul 2011 10:28:19 +0530
Message-ID: <1310878700-1507-2-git-send-email-thomas.abraham@linaro.org>
References: <1310878700-1507-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28201 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076Ab1GQEqf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jul 2011 00:46:35 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOG00DU9NXL5P10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 17 Jul 2011 13:46:34 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOG00J0INXHII@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 17 Jul 2011 13:46:34 +0900 (KST)
In-reply-to: <1310878700-1507-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org

Include device tree nodes for watchdog timer and sdhci instance 0 and 1.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4-smdkv310.dts |   61 ++++++++++++++++++++++++++++++-
 1 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4-smdkv310.dts b/arch/arm/boot/dts/exynos4-smdkv310.dts
index dd6c80a..155f836 100644
--- a/arch/arm/boot/dts/exynos4-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4-smdkv310.dts
@@ -1,11 +1,68 @@
+/*
+ * Samsung's Exynos4 based smdkv310 board device tree source.
+ *
+ * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ * Copyright (c) 2010-2011 Linaro Ltd.
+ *		www.linaro.org
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
 /dts-v1/;
 /include/ "skeleton.dtsi"
 
 / {
 	model = "Samsung Exynos4 SMDKV310 eval board";
-	compatible = "samsung,smdkv310", "samsung,s5pv310";
+	compatible = "samsung,smdkv310", "samsung,exynos4210";
 
 	memory {
-		reg = <0x40000000 0x08000000>;
+		reg = <0x40000000 0x80000000>;
+	};
+
+	chosen {
+		bootargs = "root=/dev/mmcblk0p1 rootfstype=ext3 rootwait console=ttySAC1,115200";
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+		compatible = "simple-bus";
+		ranges;
+
+		intc:interrupt-controller@10501000 {
+			compatible = "samsung,exynos4-gic","arm,cortex-a9-gic";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0x10501000 0x1000>, <0x10500100 0x100>;
+			irq-start = <61>;
+		};
+
+		watchdog@10060000 {
+			compatible = "samsung,s3c2410-wdt";
+			reg = <0x10060000 0x400>;
+			interrupts = <552>;
+		};
+
+		sdhci@12530000 {
+			compatible = "samsung,s3c6410-sdhci";
+			reg = <0x12530000 0x1000>;
+			interrupts = <362>;
+			samsung,sdhci-bus-width = <4>;
+			samsung,sdhci-cd-type = <0>;
+			samsung,sdhci-clkdiv-external;
+		};
+
+		sdhci@12510000 {
+			compatible = "samsung,s3c6410-sdhci";
+			reg = <0x12510000 0x1000>;
+			interrupts = <360>;
+			samsung,sdhci-bus-width = <4>;
+			samsung,sdhci-cd-type = <0>;
+			samsung,sdhci-clkdiv-external;
+		};
 	};
 };
-- 
1.7.1
