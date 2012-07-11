From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v2 2/2] ARM: EXYNOS: Add gscaler device from DT
Date: Wed, 11 Jul 2012 19:36:50 +0530
Message-ID: <1342015610-19261-3-git-send-email-shaik.ameer@samsung.com>
References: <1342015610-19261-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50293 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932494Ab2GKNxC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jul 2012 09:53:02 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M70003RO1870YU0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 22:53:01 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7000J0E17Q6330@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jul 2012 22:53:00 +0900 (KST)
In-reply-to: <1342015610-19261-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com, ameersk@gmail.com

This patch adds,
- 4 Gscaler devices to the DT device list
- Gscaler specific entries to the machine file
- binding documentation for Gscaler entries

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 .../devicetree/bindings/media/exynos5-gsc.txt      |   16 ++++++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |   31 ++++++++++++++++++++
 arch/arm/mach-exynos/include/mach/map.h            |    3 ++
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 +++++
 4 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/exynos5-gsc.txt

diff --git a/Documentation/devicetree/bindings/media/exynos5-gsc.txt b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
new file mode 100644
index 0000000..f743c60
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
@@ -0,0 +1,16 @@
+* Samsung Exynos5 Gscaler device
+
+Gscaler is used for scaling and color space conversion on EXYNOS5 SoCs.
+
+Required properties:
+- compatible: should be "samsung,exynos-gsc"
+- reg: should contian Gsaler physical address location and length.
+- interrupts: should contain Gscaler interrupt number
+
+Example:
+
+gsc_0:  gsc@0x13e00000 {
+	compatible = "samsung,exynos-gsc";
+	reg = <0x13e00000 0x1000>;
+	interrupts = <0 85 0>;
+};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 4272b29..b945c00 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -23,6 +23,13 @@
 	compatible = "samsung,exynos5250";
 	interrupt-parent = <&gic>;
 
+	aliases {
+		gsc0 = &gsc_0;
+		gsc1 = &gsc_1;
+		gsc2 = &gsc_2;
+		gsc3 = &gsc_3;
+	};
+
 	gic:interrupt-controller@10481000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
@@ -424,4 +431,28 @@
 			#gpio-cells = <4>;
 		};
 	};
+
+	gsc_0:  gsc@0x13e00000 {
+		compatible = "samsung,exynos-gsc";
+		reg = <0x13e00000 0x1000>;
+		interrupts = <0 85 0>;
+	};
+
+	gsc_1:  gsc@0x13e10000 {
+		compatible = "samsung,exynos-gsc";
+		reg = <0x13e10000 0x1000>;
+		interrupts = <0 86 0>;
+	};
+
+	gsc_2:  gsc@0x13e20000 {
+		compatible = "samsung,exynos-gsc";
+		reg = <0x13e20000 0x1000>;
+		interrupts = <0 87 0>;
+	};
+
+	gsc_3:  gsc@0x13e30000 {
+		compatible = "samsung,exynos-gsc";
+		reg = <0x13e30000 0x1000>;
+		interrupts = <0 88 0>;
+	};
 };
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index ca4aa89..e68d249 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -121,6 +121,9 @@
 #define EXYNOS4_PA_SYSMMU_MFC_L		0x13620000
 #define EXYNOS4_PA_SYSMMU_MFC_R		0x13630000
 
+/* x = 0...3 */
+#define EXYNOS5_PA_GSC(x)		(0x13e00000 + ((x) * 0x10000))
+
 #define EXYNOS5_PA_SYSMMU_MDMA1		0x10A40000
 #define EXYNOS5_PA_SYSMMU_SSS		0x10A50000
 #define EXYNOS5_PA_SYSMMU_2D		0x10A60000
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 7b1e11a..9eb83b6 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -50,6 +50,14 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA0, "dma-pl330.0", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA1, "dma-pl330.1", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos-gsc", EXYNOS5_PA_GSC(0),
+				"exynos-gsc.0", NULL),
+	OF_DEV_AUXDATA("samsung,exynos-gsc", EXYNOS5_PA_GSC(1),
+				"exynos-gsc.1", NULL),
+	OF_DEV_AUXDATA("samsung,exynos-gsc", EXYNOS5_PA_GSC(2),
+				"exynos-gsc.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos-gsc", EXYNOS5_PA_GSC(3),
+				"exynos-gsc.3", NULL),
 	{},
 };
 
-- 
1.7.0.4
