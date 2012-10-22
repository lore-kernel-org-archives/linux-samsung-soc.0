From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 1/6] dts: exynos: add device tree support for exynos5 hdmi
Date: Mon, 22 Oct 2012 17:01:02 +0530
Message-ID: <1350905467-23832-2-git-send-email-rahul.sharma@samsung.com>
References: <1350905467-23832-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43820 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753358Ab2JVLRg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Oct 2012 07:17:36 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCA003LWKP8KKJ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Oct 2012 20:17:34 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCA00260KJ6TJ50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Oct 2012 20:17:33 +0900 (KST)
In-reply-to: <1350905467-23832-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: tomasz.figa@gmail.com, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patch adds support for device tree based discovery for exynos5
hdmi. Hdmi node is also renamed with "exynos5-hdmi".

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 .../devicetree/bindings/drm/exynos/hdmi.txt        |   22 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    4 +++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 +++++
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 +
 4 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/hdmi.txt

diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
new file mode 100644
index 0000000..589edee
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
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index a352df4..2a478ab 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -166,4 +166,8 @@
 	spi_2: spi@12d40000 {
 		status = "disabled";
 	};
+
+	hdmi {
+		hpd-gpio = <&gpx3 7 0xf 1 3>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index f69e389..e43b321 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -492,4 +492,10 @@
 			#gpio-cells = <4>;
 		};
 	};
+
+	hdmi {
+		compatible = "samsung,exynos5-hdmi";
+		reg = <0x14530000 0x100000>;
+		interrupts = <0 95 0>;
+	};
 };
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index ce82f30..f37d676 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -64,6 +64,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA0, "dma-pl330.0", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA1, "dma-pl330.1", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5-hdmi", 0x14530000,
+				"exynos5-hdmi", NULL),
 	{},
 };
 
-- 
1.7.0.4
