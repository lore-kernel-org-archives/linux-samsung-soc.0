From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v4 2/2] ARM: EXYNOS: Adds G-Scaler device from Device Tree
Date: Mon, 13 Aug 2012 15:32:24 +0530
Message-ID: <1344852144-25598-3-git-send-email-shaik.ameer@samsung.com>
References: <1344852144-25598-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:34303 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379Ab2HMJUj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Aug 2012 05:20:39 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8O004EBSLWS7M0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Aug 2012 18:20:38 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8O00L6USLWO650@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Aug 2012 18:20:38 +0900 (KST)
In-reply-to: <1344852144-25598-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, joshi@samsung.com, shaik.samsung@gmail.com, shaik.ameer@samsung.com

This patch adds,
- 4 G-Scaler devices to the DT device list
- G-Scaler specific entries to the machine file
- binding documentation for G-Scaler entries

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 .../devicetree/bindings/media/exynos5-gsc.txt      |   32 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |   28 +++++++++++++++++
 arch/arm/mach-exynos/include/mach/map.h            |    5 +++
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 +++++
 4 files changed, 73 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/exynos5-gsc.txt

diff --git a/Documentation/devicetree/bindings/media/exynos5-gsc.txt b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
new file mode 100644
index 0000000..6bd49e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
@@ -0,0 +1,32 @@
+* Samsung Exynos5 G-Scaler device
+
+G-Scaler is used for scaling and color space conversion on EXYNOS5 SoCs.
+
+Required properties:
+- compatible: should be "samsung,exynos5-gsc"
+- reg: should contain G-Scaler physical address location and length.
+- interrupts: should contain G-Scaler interrupt number
+
+Example:
+
+gsc_0:  gsc@0x13e00000 {
+	compatible = "samsung,exynos5-gsc";
+	reg = <0x13e00000 0x1000>;
+	interrupts = <0 85 0>;
+};
+
+Aliases:
+Each G-Scaler node should have a numbered alias in the aliases node,
+in the form of gscN, N = 0...3. G-Scaler driver uses these aliases
+to retrieve the device IDs using "of_alias_get_id()" call.
+
+Example:
+
+aliases {
+	gsc0 =&gsc_0;
+	gsc1 =&gsc_1;
+	gsc2 =&gsc_2;
+	gsc3 =&gsc_3;
+};
+
+
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 004aaa8..b55794b 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -27,6 +27,10 @@
 		spi0 = &spi_0;
 		spi1 = &spi_1;
 		spi2 = &spi_2;
+		gsc0 = &gsc_0;
+		gsc1 = &gsc_1;
+		gsc2 = &gsc_2;
+		gsc3 = &gsc_3;
 	};
 
 	gic:interrupt-controller@10481000 {
@@ -460,4 +464,28 @@
 			#gpio-cells = <4>;
 		};
 	};
+
+	gsc_0:  gsc@0x13e00000 {
+		compatible = "samsung,exynos5-gsc";
+		reg = <0x13e00000 0x1000>;
+		interrupts = <0 85 0>;
+	};
+
+	gsc_1:  gsc@0x13e10000 {
+		compatible = "samsung,exynos5-gsc";
+		reg = <0x13e10000 0x1000>;
+		interrupts = <0 86 0>;
+	};
+
+	gsc_2:  gsc@0x13e20000 {
+		compatible = "samsung,exynos5-gsc";
+		reg = <0x13e20000 0x1000>;
+		interrupts = <0 87 0>;
+	};
+
+	gsc_3:  gsc@0x13e30000 {
+		compatible = "samsung,exynos5-gsc";
+		reg = <0x13e30000 0x1000>;
+		interrupts = <0 88 0>;
+	};
 };
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 9d1f3ac..b2021bd 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -121,6 +121,11 @@
 #define EXYNOS4_PA_SYSMMU_MFC_L		0x13620000
 #define EXYNOS4_PA_SYSMMU_MFC_R		0x13630000
 
+#define EXYNOS5_PA_GSC0			0x13E00000
+#define EXYNOS5_PA_GSC1			0x13E10000
+#define EXYNOS5_PA_GSC2			0x13E20000
+#define EXYNOS5_PA_GSC3			0x13E30000
+
 #define EXYNOS5_PA_SYSMMU_MDMA1		0x10A40000
 #define EXYNOS5_PA_SYSMMU_SSS		0x10A50000
 #define EXYNOS5_PA_SYSMMU_2D		0x10A60000
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index ef770bc..e707eb1 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -56,6 +56,14 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA0, "dma-pl330.0", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA1, "dma-pl330.1", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5-gsc", EXYNOS5_PA_GSC0,
+				"exynos-gsc.0", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5-gsc", EXYNOS5_PA_GSC1,
+				"exynos-gsc.1", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5-gsc", EXYNOS5_PA_GSC2,
+				"exynos-gsc.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5-gsc", EXYNOS5_PA_GSC3,
+				"exynos-gsc.3", NULL),
 	{},
 };
 
-- 
1.7.0.4
