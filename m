From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 2/2] arm: dt: Add device tree source file for Exynos4 and let boards include it
Date: Mon,  1 Aug 2011 17:20:37 +0100
Message-ID: <1312215637-716-3-git-send-email-thomas.abraham@linaro.org>
References: <1312215637-716-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:56048 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753215Ab1HAQUv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Aug 2011 12:20:51 -0400
Received: by wyg8 with SMTP id 8so1710025wyg.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Aug 2011 09:20:50 -0700 (PDT)
In-Reply-To: <1312215637-716-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Create a new device tree source file for Samsung's Exynos4 architecture
and let Exynos4 based boards include it. We start with a almost empty
device tree source file and incrementally add nodes as we improve the
device tree coverage for Exynos4 architecture and related boards.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 Documentation/devicetree/bindings/arm/samsung.txt |    8 ++++
 arch/arm/boot/dts/exynos4-smdkv310.dts            |   31 ++++++++++++++
 arch/arm/boot/dts/exynos4.dtsi                    |   44 +++++++++++++++++++++
 3 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung.txt
 create mode 100644 arch/arm/boot/dts/exynos4-smdkv310.dts
 create mode 100644 arch/arm/boot/dts/exynos4.dtsi

diff --git a/Documentation/devicetree/bindings/arm/samsung.txt b/Documentation/devicetree/bindings/arm/samsung.txt
new file mode 100644
index 0000000..ce4a1aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/samsung.txt
@@ -0,0 +1,8 @@
+Samsung Exynos4 based SMDKV310 eval board
+
+    SMDKV310 eval board is based on Samsung's Exynos4 processor architecture.
+
+Required root node properties:
+    - compatible = "samsung,smdkv310","samsung,exynos4"
+        (a) "samsung,smdkv310" - for Samsung's SMDKV310 eval board.
+        (b) "samsung,exynos4"  - for boards based on Exynos4 architecture.
diff --git a/arch/arm/boot/dts/exynos4-smdkv310.dts b/arch/arm/boot/dts/exynos4-smdkv310.dts
new file mode 100644
index 0000000..526f137
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4-smdkv310.dts
@@ -0,0 +1,31 @@
+/*
+ * Samsung's Exynos4 based SMDKV310 board device tree source.
+ *
+ * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ * Copyright (c) 2010-2011 Linaro Ltd.
+ *		www.linaro.org
+ *
+ * Device tree source file for Samsung's SMDKV310 board which is based on
+ * Samsung's Exynos4 architecture.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/dts-v1/;
+/include/ "exynos4.dtsi"
+
+/ {
+	model = "Samsung Exynos4 smdkv310 eval board";
+	compatible = "samsung,smdkv310", "samsung,exynos4";
+
+	memory {
+		reg = <0x40000000 0x80000000>;
+	};
+
+	chosen {
+		bootargs ="root=/dev/mmcblk0p1 rootfstype=ext2 rootwait console=ttySAC1,115200";
+	};
+};
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
new file mode 100644
index 0000000..232b911
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -0,0 +1,44 @@
+/*
+ * Samsung's Exynos4 Architecture device tree source.
+ *
+ * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ * Copyright (c) 2010-2011 Linaro Ltd.
+ *		www.linaro.org
+ *
+ * This file acts as the core device tree for Samsung's Exynos4 based board
+ * device tree files. The Exynos4 architecture related device tree nodes
+ * will be listed in this file and Exynos4 based board device tree files
+ * should include this file.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/include/ "skeleton.dtsi"
+
+/ {
+	compatible = "samsung,exynos4";
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&intc>;
+		ranges;
+
+		intc:interrupt-controller@10490000 {
+			compatible = "samsung,exynos4-gic","arm,cortex-a9-gic";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0x10490000 0x1000>, <0x10480000 0x100>;
+		};
+
+		watchdog@10060000 {
+			compatible = "samsung,s3c2410-wdt";
+			reg = <0x10060000 0x100>;
+			interrupts = <107>;
+		};
+	};
+};
-- 
1.7.4.1
