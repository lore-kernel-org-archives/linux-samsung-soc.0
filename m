From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH 2/2] ARM: EXYNOS5: Add gscalar device from DT
Date: Fri, 06 Jul 2012 18:15:02 +0530
Message-ID: <1341578702-10263-3-git-send-email-shaik.ameer@samsung.com>
References: <1341578702-10263-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:10619 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750914Ab2GFMb2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jul 2012 08:31:28 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6Q0088WO42U300@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Jul 2012 21:31:27 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6Q003Y0O3Z1X20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Jul 2012 21:31:24 +0900 (KST)
In-reply-to: <1341578702-10263-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, olofj@google.com, prashanth.g@samsung.com, joshi@samsung.com, ameersk@gmail.com, thomas.ab@samsung.com

Adding all 4 gscalar devices from DT device list in machine file.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi      |   31 +++++++++++++++++++++++++++++++
 arch/arm/mach-exynos/mach-exynos5-dt.c |    8 ++++++++
 2 files changed, 39 insertions(+), 0 deletions(-)

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
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 7b1e11a..76b081c 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -50,6 +50,14 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA0, "dma-pl330.0", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA1, "dma-pl330.1", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos-gsc", 0x13E00000,
+				"exynos-gsc.0", NULL),
+	OF_DEV_AUXDATA("samsung,exynos-gsc", 0x13E10000,
+				"exynos-gsc.1", NULL),
+	OF_DEV_AUXDATA("samsung,exynos-gsc", 0x13E20000,
+				"exynos-gsc.2", NULL),
+	OF_DEV_AUXDATA("samsung,exynos-gsc", 0x13E30000,
+				"exynos-gsc.3", NULL),
 	{},
 };
 
-- 
1.7.0.4
