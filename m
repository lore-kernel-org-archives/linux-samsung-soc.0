From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 3/8] ARM: EXYNOS5: Add OHCI device from device tree
Date: Wed, 18 Jul 2012 19:15:23 +0530
Message-ID: <1342619128-25013-4-git-send-email-gautam.vivek@samsung.com>
References: <1342619128-25013-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32844 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751590Ab2GRNbD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jul 2012 09:31:03 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7C00I6FYVD56O0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jul 2012 22:31:02 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7C00MXCYV9WD70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jul 2012 22:31:02 +0900 (KST)
In-reply-to: <1342619128-25013-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, l.majewski@samsung.com, kyungmin.park@samsung.com, thomas.abraham@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, m.szyprowski@samsung.com
Cc: a.kesavan@samsung.com, yulgon.kim@samsung.com, boyko.lee@samsung.com, av.tikhomirov@samsung.com, joshi@samsung.com, olofj@google.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

From: Ajay Kumar <ajaykumar.rs@samsung.com>

This patch adds OHCI device from device tree for exynos5
and adds platform data.

Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>

diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
new file mode 100644
index 0000000..63b80b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -0,0 +1,19 @@
+Samsung Exynos SoC USB controller
+
+The device node for USB controller for Samsung SOC have
+following properties
+
+OHCI
+Required properties:
+ - compatible: should be "samsung,exynos-ohci" for USB 2.0
+   OHCI companion controller in host mode.
+ - reg: physical base address of the controller and length
+   of memory mapped.
+ - interrupts: interrupt number to the cpu.
+
+ohci {
+	compatible = "samsung,exynos-ohci";
+	reg = <0x12120000 0x100>;
+	interrupts = <0 71 0>;
+};
+
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index a3a2eb2..3c73d15 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -58,6 +58,12 @@
 		interrupts = <0 42 0>;
 	};
 
+	ohci {
+		compatible = "samsung,exynos-ohci";
+		reg = <0x12120000 0x100>;
+		interrupts = <0 71 0>;
+	};
+
 	rtc {
 		compatible = "samsung,s3c6410-rtc";
 		reg = <0x101E0000 0x100>;
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index ef770bc..39a4b34 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -15,12 +15,19 @@
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
 #include <mach/map.h>
+#include <mach/ohci.h>
 
 #include <plat/cpu.h>
 #include <plat/regs-serial.h>
+#include <plat/usb-phy.h>
 
 #include "common.h"
 
+static struct exynos4_ohci_platdata smdk5250_ohci_pdata = {
+	.phy_init = s5p_usb_phy_init,
+	.phy_exit = s5p_usb_phy_exit,
+};
+
 /*
  * The following lookup table is used to override device names when devices
  * are registered from device tree. This is temporarily added to enable
@@ -56,6 +63,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA0, "dma-pl330.0", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA1, "dma-pl330.1", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos-ohci", 0x12120000,
+				"exynos-ohci", &smdk5250_ohci_pdata),
 	{},
 };
 
-- 
1.7.0.4
