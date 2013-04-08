From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: add device tree file for SD5v1 board
Date: Mon, 08 Apr 2013 16:23:53 +0900
Message-ID: <2c9301ce342a$06432ea0$12c98be0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:27530 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762615Ab3DHHXz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 03:23:55 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKX00KWSDVI7O00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Apr 2013 16:23:54 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>


This patch adds SD5v1.dts file for supporting SD5v1(Exynos5440) board.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/Makefile             |    1 +
 arch/arm/boot/dts/exynos5440-sd5v1.dts |   39 ++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5440-sd5v1.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d3cd880..11fef62 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -46,6 +46,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
 	exynos4412-smdk4412.dtb \
 	exynos4412-origen.dtb \
 	exynos5250-arndale.dtb \
+	exynos5440-sd5v1.dtb \
 	exynos5250-smdk5250.dtb \
 	exynos5250-snow.dtb \
 	exynos5440-ssdk5440.dtb
diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts b/arch/arm/boot/dts/exynos5440-sd5v1.dts
new file mode 100644
index 0000000..ef747b5
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
@@ -0,0 +1,39 @@
+/*
+ * SAMSUNG SD5v1 board device tree source
+ *
+ * Copyright (c) 2013 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/dts-v1/;
+/include/ "exynos5440.dtsi"
+
+/ {
+	model = "SAMSUNG SD5v1 board based on EXYNOS5440";
+	compatible = "samsung,sd5v1", "samsung,exynos5440";
+
+	chosen {
+		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel early_printk no_console_suspend mem=2048M@0x80000000
console=ttySAC0,115200";
+	};
+
+	fixed-rate-clocks {
+		xtal {
+			compatible = "samsung,clock-xtal";
+			clock-frequency = <50000000>;
+		};
+	};
+
+	gmac: ethernet@00230000 {
+		fixed_phy;
+		phy_addr = <1>;
+	};
+
+	spi {
+		status = "disabled";
+	};
+
+};
-- 
1.7.10.4
