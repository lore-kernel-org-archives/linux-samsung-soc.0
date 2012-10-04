From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/8] dts: exynos: add device tree support for exynos5 mixer
Date: Thu, 04 Oct 2012 21:44:22 +0530
Message-ID: <1349367268-32553-3-git-send-email-rahul.sharma@samsung.com>
References: <1349367268-32553-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39714 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754969Ab2JDH4K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Oct 2012 03:56:10 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBC00IL7ZCZC5S0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Oct 2012 16:56:09 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBC00ERUZCY1M40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Oct 2012 16:56:08 +0900 (KST)
In-reply-to: <1349367268-32553-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, fahad.k@samsung.com, l.krishna@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patch adds support for device tree based discovery for exynos5
mixer. Mixer node is also renamed with "exynos5-mixer".

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi       |    8 ++++++++
 arch/arm/mach-exynos/include/mach/map.h |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c  |    2 ++
 3 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 4e019b5..e4483bc 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -499,4 +499,12 @@
 		interrupts = <0 95 0>;
 		version = "1.4";
         };
+
+        mixer {
+		compatible = "samsung,exynos5-mixer";
+		reg = <0x14450000 0x10000>;
+		interrupts = <0 94 0>;
+		version = "16.0.33.0";
+		vp-support = <0>;
+        };
 };
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 7b9efb2..314ee75 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -201,6 +201,7 @@
 #define EXYNOS4_PA_SDO			0x12C20000
 #define EXYNOS4_PA_HDMI			0x12D00000
 #define EXYNOS4_PA_IIC_HDMIPHY		0x138E0000
+#define EXYNOS5_PA_MIXER		0x14450000
 #define EXYNOS5_PA_HDMI		0x14530000
 
 #define EXYNOS4_PA_IIC(x)		(0x13860000 + ((x) * 0x10000))
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 43449fb..cdad7c1 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -66,6 +66,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
 	OF_DEV_AUXDATA("samsung,exynos5-hdmi", EXYNOS5_PA_HDMI,
 				"exynos5-hdmi", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5-mixer", EXYNOS5_PA_MIXER,
+				"exynos5-mixer", NULL),
 	{},
 };
 
-- 
1.7.0.4
