From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 4/8 v2] ARM: EXYNOS5: Add EHCI device from device tree
Date: Sat, 21 Jul 2012 16:02:05 +0530
Message-ID: <1342866729-30460-5-git-send-email-gautam.vivek@samsung.com>
References: <1342866729-30460-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40445 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754Ab2GUKRd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jul 2012 06:17:33 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7I006SD9WXPW10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 21 Jul 2012 19:17:32 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7I000KP9WQC260@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 21 Jul 2012 19:17:32 +0900 (KST)
In-reply-to: <1342866729-30460-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, l.majewski@samsung.com, kyungmin.park@samsung.com, thomas.abraham@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, m.szyprowski@samsung.com
Cc: a.kesavan@samsung.com, yulgon.kim@samsung.com, boyko.lee@samsung.com, av.tikhomirov@samsung.com, joshi@samsung.com, olofj@google.com, prashanth.g@samsung.com, ajaykumar.rs@samsung.com

This patch adds EHCI device from device tree for exynos5
and adds platform data.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 .../devicetree/bindings/usb/exynos-usb.txt         |   22 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    4 +++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 +++++
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 +++++++
 4 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
index 63b80b9..45dadca 100644
--- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -17,3 +17,25 @@ ohci {
 	interrupts = <0 71 0>;
 };
 
+EHCI
+Required properties:
+ - compatible:	should be "samsung,exynos-ehci" for USB 2.0
+   EHCI controller in host mode.
+ - reg: physical base address of the controller and length
+   of memory mapped.
+ - interrupts: interrupt number to the cpu.
+
+Optional properties:
+ - samsung,vbus-gpio:  if present, specifies the GPIO
+   that needs to be pulled up for the bus to be powered.
+
+ehci {
+	compatible = "samsung,exynos-ehci";
+	reg = <0x12110000 0x100>;
+	interrupts = <0 71 0>;
+};
+
+ehci {
+	samsung,vbus-gpio = <&gpx2 6 1 3 3>;
+};
+
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 8a5e348..bf18286 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -109,4 +109,8 @@
 	spi_2: spi@12d40000 {
 		status = "disabled";
 	};
+
+	ehci {
+		samsung,vbus-gpio = <&gpx2 6 1 3 3>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 3c73d15..988f52a 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -64,6 +64,12 @@
 		interrupts = <0 71 0>;
 	};
 
+	ehci {
+		compatible = "samsung,exynos-ehci";
+		reg = <0x12110000 0x100>;
+		interrupts = <0 71 0>;
+	};
+
 	rtc {
 		compatible = "samsung,s3c6410-rtc";
 		reg = <0x101E0000 0x100>;
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 39a4b34..0cc626e 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -20,6 +20,7 @@
 #include <plat/cpu.h>
 #include <plat/regs-serial.h>
 #include <plat/usb-phy.h>
+#include <plat/ehci.h>
 
 #include "common.h"
 
@@ -28,6 +29,11 @@ static struct exynos4_ohci_platdata smdk5250_ohci_pdata = {
 	.phy_exit = s5p_usb_phy_exit,
 };
 
+static struct s5p_ehci_platdata smdk5250_ehci_pdata = {
+	.phy_init = s5p_usb_phy_init,
+	.phy_exit = s5p_usb_phy_exit,
+};
+
 /*
  * The following lookup table is used to override device names when devices
  * are registered from device tree. This is temporarily added to enable
@@ -65,6 +71,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
 	OF_DEV_AUXDATA("samsung,exynos-ohci", 0x12120000,
 				"exynos-ohci", &smdk5250_ohci_pdata),
+	OF_DEV_AUXDATA("samsung,exynos-ehci", 0x12110000,
+				"s5p-ehci", &smdk5250_ehci_pdata),
 	{},
 };
 
-- 
1.7.0.4
