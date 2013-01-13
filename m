From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 5/6] ARM: dts: Add basic dts include files for Samsung S3C64xx SoCs
Date: Sun, 13 Jan 2013 02:10:57 +0100
Message-ID: <1358039458-31960-6-git-send-email-tomasz.figa@gmail.com>
References: <1358039458-31960-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f170.google.com ([209.85.215.170]:41550 "EHLO
	mail-ea0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753920Ab3AMBLR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Jan 2013 20:11:17 -0500
Received: by mail-ea0-f170.google.com with SMTP id d11so1241221eaa.29
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Jan 2013 17:11:16 -0800 (PST)
In-Reply-To: <1358039458-31960-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Tomasz Figa <tomasz.figa@gmail.com>

This patch adds basic device tree definitions for Samsung S3C64xx SoCs.

Since all the SoCs in the series are very similar, the files are created
hierarchically - one file for the whole series and then separate files
for particular SoCs including the common one.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/boot/dts/s3c6400.dtsi | 33 ++++++++++++++
 arch/arm/boot/dts/s3c6410.dtsi | 33 ++++++++++++++
 arch/arm/boot/dts/s3c64xx.dtsi | 97 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 163 insertions(+)
 create mode 100644 arch/arm/boot/dts/s3c6400.dtsi
 create mode 100644 arch/arm/boot/dts/s3c6410.dtsi
 create mode 100644 arch/arm/boot/dts/s3c64xx.dtsi

diff --git a/arch/arm/boot/dts/s3c6400.dtsi b/arch/arm/boot/dts/s3c6400.dtsi
new file mode 100644
index 0000000..76106b8
--- /dev/null
+++ b/arch/arm/boot/dts/s3c6400.dtsi
@@ -0,0 +1,33 @@
+/*
+ * Samsung's S3C6400 SoC device tree source
+ *
+ * Copyright (c) 2013 Tomasz Figa <tomasz.figa@gmail.com>
+ *
+ * Samsung's S3C6400 SoC device nodes are listed in this file. S3C6400
+ * based board files can include this file and provide values for board specfic
+ * bindings.
+ *
+ * Note: This file does not include device nodes for all the controllers in
+ * S3C6400 SoC. As device tree coverage for S3C6400 increases, additional
+ * nodes can be added to this file.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/include/ "s3c64xx.dtsi"
+
+/ {
+	compatible = "samsung,s3c6400";
+
+	vic0: interrupt-controller@71200000 {
+		interrupt-mask = <0xfffffe1f>;
+		wakeup-mask = <0x00200004>;
+	};
+
+	vic1: interrupt-controller@71300000 {
+		interrupt-mask = <0xffffffff>;
+		wakeup-mask = <0x53020000>;
+	};
+};
diff --git a/arch/arm/boot/dts/s3c6410.dtsi b/arch/arm/boot/dts/s3c6410.dtsi
new file mode 100644
index 0000000..4a74df9
--- /dev/null
+++ b/arch/arm/boot/dts/s3c6410.dtsi
@@ -0,0 +1,33 @@
+/*
+ * Samsung's S3C6410 SoC device tree source
+ *
+ * Copyright (c) 2013 Tomasz Figa <tomasz.figa@gmail.com>
+ *
+ * Samsung's S3C6410 SoC device nodes are listed in this file. S3C6410
+ * based board files can include this file and provide values for board specfic
+ * bindings.
+ *
+ * Note: This file does not include device nodes for all the controllers in
+ * S3C6410 SoC. As device tree coverage for S3C6410 increases, additional
+ * nodes can be added to this file.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/include/ "s3c64xx.dtsi"
+
+/ {
+	compatible = "samsung,s3c6410";
+
+	vic0: interrupt-controller@71200000 {
+		interrupt-mask = <0xffffff7f>;
+		wakeup-mask = <0x00200004>;
+	};
+
+	vic1: interrupt-controller@71300000 {
+		interrupt-mask = <0xffffffff>;
+		wakeup-mask = <0x53020000>;
+	};
+};
diff --git a/arch/arm/boot/dts/s3c64xx.dtsi b/arch/arm/boot/dts/s3c64xx.dtsi
new file mode 100644
index 0000000..55d6e08
--- /dev/null
+++ b/arch/arm/boot/dts/s3c64xx.dtsi
@@ -0,0 +1,97 @@
+/*
+ * Samsung's S3C64xx SoC series common device tree source
+ *
+ * Copyright (c) 2013 Tomasz Figa <tomasz.figa@gmail.com>
+ *
+ * Samsung's S3C64xx SoC series device nodes are listed in this file.
+ * Particular SoCs from S3C64xx series can include this file and provide
+ * values for SoCs specfic bindings.
+ *
+ * Note: This file does not include device nodes for all the controllers in
+ * S3C64xx SoCs. As device tree coverage for S3C64xx increases, additional
+ * nodes can be added to this file.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/include/ "skeleton.dtsi"
+
+/ {
+	cpus {
+		cpu@0 {
+			compatible = "arm,arm1176jzf-s";
+		};
+	};
+
+	vic0: interrupt-controller@71200000 {
+		compatible = "arm,pl192-vic";
+		interrupt-controller;
+		reg = <0x71200000 0x1000>;
+		#interrupt-cells = <1>;
+	};
+
+	vic1: interrupt-controller@71300000 {
+		compatible = "arm,pl192-vic";
+		interrupt-controller;
+		reg = <0x71300000 0x1000>;
+		#interrupt-cells = <1>;
+	};
+
+	serial@7f005000 {
+		compatible = "samsung,s3c6400-uart";
+		reg = <0x7f005000 0x100>;
+		interrupt-parent = <&vic1>;
+		interrupts = <5 0>;
+		status = "disabled";
+	};
+
+	serial@7f005400 {
+		compatible = "samsung,s3c6400-uart";
+		reg = <0x7f005400 0x100>;
+		interrupt-parent = <&vic1>;
+		interrupts = <6 0>;
+		status = "disabled";
+	};
+
+	serial@7f005800 {
+		compatible = "samsung,s3c6400-uart";
+		reg = <0x7f005800 0x100>;
+		interrupt-parent = <&vic1>;
+		interrupts = <7 0>;
+		status = "disabled";
+	};
+
+	serial@7f005c00 {
+		compatible = "samsung,s3c6400-uart";
+		reg = <0x7f005c00 0x100>;
+		interrupt-parent = <&vic1>;
+		interrupts = <8 0>;
+		status = "disabled";
+	};
+
+	sdhci@7c200000 {
+		compatible = "samsung,s3c6410-sdhci";
+		reg = <0x7c200000 0x100>;
+		interrupt-parent = <&vic1>;
+		interrupts = <24 0>;
+		status = "disabled";
+	};
+
+	sdhci@7c300000 {
+		compatible = "samsung,s3c6410-sdhci";
+		reg = <0x7c300000 0x100>;
+		interrupt-parent = <&vic1>;
+		interrupts = <25 0>;
+		status = "disabled";
+	};
+
+	sdhci@7c400000 {
+		compatible = "samsung,s3c6410-sdhci";
+		reg = <0x7c400000 0x100>;
+		interrupt-parent = <&vic1>;
+		interrupts = <17 0>;
+		status = "disabled";
+	};
+};
-- 
1.8.1
