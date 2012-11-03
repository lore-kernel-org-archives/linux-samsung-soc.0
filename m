From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] ARM: dts: add board dts file for Exynos4412 based SMDK board
Date: Sat, 03 Nov 2012 20:19:32 +0530
Message-ID: <1351954172-13645-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:44026 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754Ab2KCOY3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Nov 2012 10:24:29 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCX009LL1CSRG70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 03 Nov 2012 23:24:28 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCX00FY71CKNY90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 03 Nov 2012 23:24:28 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, chaos.youn@samsung.com, t.figa@samsung.com

Add a minimal board dts file for Samsung Exynos4412 based SMDK board.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
This patch depends the on the following patch posted by Tomasz Figa.
"ARM: dts: exynos4: Add support for Exynos4x12 SoCs"

 arch/arm/boot/dts/Makefile                |    1 +
 arch/arm/boot/dts/exynos4412-smdk4412.dts |   45 +++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4412-smdk4412.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f37cf9f..36488a5 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_DOVE) += dove-cm-a510.dtb \
 dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
 	exynos4210-smdkv310.dtb \
 	exynos4210-trats.dtb \
+	exynos4412-smdk4412.dtb \
 	exynos5250-smdk5250.dtb
 dtb-$(CONFIG_ARCH_HIGHBANK) += highbank.dtb
 dtb-$(CONFIG_ARCH_INTEGRATOR) += integratorap.dtb \
diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
new file mode 100644
index 0000000..f05bf57
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -0,0 +1,45 @@
+/*
+ * Samsung's Exynos4412 based SMDK board device tree source
+ *
+ * Copyright (c) 2012-2013 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * Device tree source file for Samsung's SMDK4412 board which is based on
+ * Samsung's Exynos4412 SoC.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/dts-v1/;
+/include/ "exynos4412.dtsi"
+
+/ {
+	model = "Samsung SMDK evaluation board based on Exynos4412";
+	compatible = "samsung,smdk4412", "samsung,exynos4412";
+
+	memory {
+		reg = <0x40000000 0x40000000>;
+	};
+
+	chosen {
+		bootargs ="root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
+	};
+
+	serial@13800000 {
+		status = "okay";
+	};
+
+	serial@13810000 {
+		status = "okay";
+	};
+
+	serial@13820000 {
+		status = "okay";
+	};
+
+	serial@13830000 {
+		status = "okay";
+	};
+};
-- 
1.6.6.rc2
