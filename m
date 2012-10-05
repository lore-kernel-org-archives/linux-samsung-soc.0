From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 1/2] ARM: Exynos5250: Enabling ehci-s5p driver
Date: Fri, 05 Oct 2012 15:40:17 +0530
Message-ID: <1349431818-15639-2-git-send-email-gautam.vivek@samsung.com>
References: <1349431818-15639-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38312 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755227Ab2JEKFH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Oct 2012 06:05:07 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBF00DBP00BN010@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Oct 2012 19:05:07 +0900 (KST)
Received: from vivekkumarg-linuxpc.sisodomain.com ([107.108.73.134])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MBF00HBA008FE50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Oct 2012 19:05:06 +0900 (KST)
In-reply-to: <1349431818-15639-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, kyungmin.park@samsung.com, jg1.han@samsung.com

Adding EHCI device tree node for Exynos5250 along with
the device base adress and gpio line for vbus.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 .../devicetree/bindings/usb/exynos-usb.txt         |   25 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    4 +++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++++
 arch/arm/mach-exynos/include/mach/map.h            |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 +
 5 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/exynos-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
new file mode 100644
index 0000000..56e35c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -0,0 +1,25 @@
+Samsung Exynos SoC USB controller
+
+The USB devices interface with USB controllers on Exynos SOCs.
+The device node has following properties.
+
+EHCI
+Required properties:
+ - compatible: should be "samsung,exynos-ehci" for USB 2.0
+   EHCI controller in host mode.
+ - reg: physical base address of the controller and length of memory mapped
+   region.
+ - interrupts: interrupt number to the cpu.
+
+Optional properties:
+ - samsung,vbus-gpio:  if present, specifies the GPIO that
+   needs to be pulled up for the bus to be powered.
+
+Example:
+
+	ehci {
+		compatible = "samsung,exynos-ehci";
+		reg = <0x12110000 0x100>;
+		interrupts = <0 71 0>;
+		samsung,vbus-gpio = <&gpx2 6 1 3 3>;
+	};
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index a352df4..089576b 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -166,4 +166,8 @@
 	spi_2: spi@12d40000 {
 		status = "disabled";
 	};
+
+	ehci {
+		samsung,vbus-gpio = <&gpx2 6 1 3 3>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index dddfd6e..73ea844 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -218,6 +218,12 @@
 		#size-cells = <0>;
 	};
 
+	ehci {
+		compatible = "samsung,exynos-ehci";
+		reg = <0x12110000 0x100>;
+		interrupts = <0 71 0>;
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 8480849..825fe40 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -195,6 +195,7 @@
 #define EXYNOS4_PA_EHCI			0x12580000
 #define EXYNOS4_PA_OHCI			0x12590000
 #define EXYNOS4_PA_HSPHY		0x125B0000
+#define EXYNOS5_PA_EHCI			0x12110000
 #define EXYNOS4_PA_MFC			0x13400000
 
 #define EXYNOS4_PA_UART			0x13800000
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index fee9dcd..6d950d7b 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -72,6 +72,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 				"exynos-gsc.2", NULL),
 	OF_DEV_AUXDATA("samsung,exynos5-gsc", EXYNOS5_PA_GSC3,
 				"exynos-gsc.3", NULL),
+	OF_DEV_AUXDATA("samsung,exynos-ehci", EXYNOS5_PA_EHCI,
+					"s5p-ehci", NULL),
 	{},
 };
 
-- 
1.7.6.5
