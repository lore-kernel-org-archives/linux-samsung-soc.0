From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 5/6] arm: dts: Add nodes in smdkv310 device tree source file
Date: Mon, 20 Jun 2011 16:32:31 +0530
Message-ID: <1308567752-13451-6-git-send-email-thomas.abraham@linaro.org>
References: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19227 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752126Ab1FTKxP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 06:53:15 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN3002UK4WH3MC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Jun 2011 19:53:14 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LN300JSM4W4PB@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Jun 2011 19:53:14 +0900 (KST)
In-reply-to: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, patches@linaro.org

Include device tree nodes for watchdog timer, sdhci instance 0 and 1,
and uart instances 0 to 3.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4-smdkv310.dts |  135 +++++++++++++++++++++++++++++++-
 1 files changed, 133 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4-smdkv310.dts b/arch/arm/boot/dts/exynos4-smdkv310.dts
index dd6c80a..721563f 100644
--- a/arch/arm/boot/dts/exynos4-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4-smdkv310.dts
@@ -1,11 +1,142 @@
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
+	compatible = "samsung,smdkv310", "samsung,s5pv310", "samsung,exynos4210";
 
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
+		intc:interrupt-controller@0x10501000 {
+			compatible = "samsung,exynos4-gic","arm,cortex-a9-gic";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0x10501000 0x1000>, <0x10500100 0x100>;
+			irq-start = <61>;
+		};
+
+		watchdog@0x10060000 {
+			compatible = "samsung,s3c2410-wdt";
+			reg = <0x10060000 0x400>;
+			interrupts = <552>;
+		};
+
+		sdhci@0x12530000 {
+			compatible = "samsung,s3c-sdhci";
+			reg = <0x12530000 0x1000>;
+			interrupts = <362>;
+		};
+
+		sdhci@0x12510000 {
+			compatible = "samsung,s3c-sdhci";
+			reg = <0x12510000 0x1000>;
+			interrupts = <360>;
+		};
+
+		serial@0x13800000 {
+			compatible = "samsung,s5pv210-uart";
+			reg = <0x13800000 0x100>;
+			interrupts = <16 18 17>;
+			fifosize = <256>;
+			hwport = <0>;
+			flags = <0>;
+			uart_flags = <0>;
+			has_fracval = <1>;
+			ucon_default = <0x3c5>;
+			ulcon_default = <0x3>;
+			ufcon_default = <0x111>;
+			uart_clksrc0 {
+				clk_name = "uclk1";
+				divisor = <1>;
+				min_baud = <0>;
+				max_baud = <0>;
+			};
+		};
+
+		serial@0x13810000 {
+			compatible = "samsung,s5pv210-uart";
+			reg = <0x13810000 0x100>;
+			interrupts = <20 22 21>;
+			fifosize = <64>;
+			hwport = <1>;
+			flags = <0>;
+			uart_flags = <0>;
+			has_fracval = <1>;
+			ucon_default = <0x3c5>;
+			ulcon_default = <0x3>;
+			ufcon_default = <0x111>;
+			uart_clksrc0 {
+				clk_name = "uclk1";
+				divisor = <1>;
+				min_baud = <0>;
+				max_baud = <0>;
+			};
+		};
+
+		serial@0x13820000 {
+			compatible = "samsung,s5pv210-uart";
+			reg = <0x13820000 0x100>;
+			interrupts = <24 26 25>;
+			fifosize = <16>;
+			hwport = <1>;
+			flags = <0>;
+			uart_flags = <0>;
+			has_fracval = <1>;
+			ucon_default = <0x3c5>;
+			ulcon_default = <0x3>;
+			ufcon_default = <0x111>;
+			uart_clksrc0 {
+				clk_name = "uclk1";
+				divisor = <1>;
+				min_baud = <0>;
+				max_baud = <0>;
+			};
+		};
+
+		serial@0x13830000 {
+			compatible = "samsung,s5pv210-uart";
+			reg = <0x13830000 0x100>;
+			interrupts = <28 30 29>;
+			fifosize = <16>;
+			hwport = <1>;
+			flags = <0>;
+			uart_flags = <0>;
+			has_fracval = <1>;
+			ucon_default = <0x3c5>;
+			ulcon_default = <0x3>;
+			ufcon_default = <0x111>;
+			uart_clksrc0 {
+				clk_name = "uclk1";
+				divisor = <1>;
+				min_baud = <0>;
+				max_baud = <0>;
+			};
+		};
 	};
 };
-- 
1.6.6.rc2
