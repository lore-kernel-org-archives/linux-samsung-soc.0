From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 1/6] dts: exynos: add device tree support for exynos5 hdmi
Date: Tue, 16 Oct 2012 05:00:29 +0530
Message-ID: <1350343834-23992-2-git-send-email-rahul.sharma@samsung.com>
References: <1350343834-23992-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40493 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753575Ab2JONfv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Oct 2012 09:35:51 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBX00BH2SFKHQ90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Oct 2012 22:35:50 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBX00J11SB7CL20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Oct 2012 22:35:49 +0900 (KST)
In-reply-to: <1350343834-23992-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patch adds support for device tree based discovery for exynos5
hdmi. Hdmi node is also renamed with "exynos5-hdmi".

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 .../devicetree/bindings/drm/exynos/hdmi.txt        |   22 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    4 +++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 +++++
 arch/arm/mach-exynos/include/mach/map.h            |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 +
 5 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/hdmi.txt

diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
new file mode 100644
index 0000000..8b0fa7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
@@ -0,0 +1,22 @@
+Device-Tree bindings for drm hdmi driver
+
+Required properties:
+- compatible: value should be "samsung,exynos5-hdmi".
+- reg: physical base address of the hdmi and length of memory mapped
+	region.
+- interrupts: interrupt number to the cpu.
+- hpd-gpio: following information about the hotplug gpio pin.
+	a) phandle of the gpio controller node.
+	b) pin number within the gpio controller.
+	c) pin function mode.
+	d) optional flags and pull up/down.
+	e) drive strength.
+
+Example:
+
+	hdmi {
+		compatible = "samsung,exynos5-hdmi";
+		reg = <0x14530000 0x100000>;
+		interrupts = <0 95 0>;
+		hpd-gpio = <&gpx3 7 0xf 1 3>;
+	};
\ No newline at end of file
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index a352df4..0d51678 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -166,4 +166,8 @@
 	spi_2: spi@12d40000 {
 		status = "disabled";
 	};
+
+	hdmi@14530000 {
+		hpd-gpio = <&gpx3 7 0xf 1 3>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index f69e389..ec7ea2d 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -492,4 +492,10 @@
 			#gpio-cells = <4>;
 		};
 	};
+
+	hdmi@14530000 {
+		compatible = "samsung,exynos5-hdmi";
+		reg = <0x14530000 0x100000>;
+		interrupts = <0 95 0>;
+	};
 };
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 5edbbe9..7b9efb2 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -201,6 +201,7 @@
 #define EXYNOS4_PA_SDO			0x12C20000
 #define EXYNOS4_PA_HDMI			0x12D00000
 #define EXYNOS4_PA_IIC_HDMIPHY		0x138E0000
+#define EXYNOS5_PA_HDMI		0x14530000
 
 #define EXYNOS4_PA_IIC(x)		(0x13860000 + ((x) * 0x10000))
 #define EXYNOS5_PA_IIC(x)		(0x12C60000 + ((x) * 0x10000))
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index ce82f30..43449fb 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -64,6 +64,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA0, "dma-pl330.0", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA1, "dma-pl330.1", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5-hdmi", EXYNOS5_PA_HDMI,
+				"exynos5-hdmi", NULL),
 	{},
 };
 
-- 
1.7.0.4
