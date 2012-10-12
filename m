From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 2/6] dts: exynos: add device tree support for exynos5 mixer
Date: Sat, 13 Oct 2012 02:12:31 +0530
Message-ID: <1350074555-26018-3-git-send-email-rahul.sharma@samsung.com>
References: <1350074555-26018-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25195 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754175Ab2JLLPf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Oct 2012 07:15:35 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBS005WN1XSZ6A0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Oct 2012 20:15:33 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBS006L91SLP040@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Oct 2012 20:15:32 +0900 (KST)
In-reply-to: <1350074555-26018-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patch adds support for device tree based discovery for exynos5
mixer. Mixer node is also renamed with "exynos5-mixer".

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 .../devicetree/bindings/drm/exynos/mixer.txt       |   15 +++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++++++
 arch/arm/mach-exynos/include/mach/map.h            |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 ++
 4 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/mixer.txt

diff --git a/Documentation/devicetree/bindings/drm/exynos/mixer.txt b/Documentation/devicetree/bindings/drm/exynos/mixer.txt
new file mode 100644
index 0000000..05e4731
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/exynos/mixer.txt
@@ -0,0 +1,15 @@
+Device-Tree bindings for mixer driver
+
+Required properties:
+- compatible: value should be "samsung,exynos5-mixer".
+- reg: physical base address of the mixer and length of memory mapped
+	region.
+- interrupts: interrupt number to the cpu.
+
+Example:
+
+	mixer {
+		compatible = "samsung,exynos5-mixer";
+		reg = <0x14450000 0x10000>;
+		interrupts = <0 94 0>;
+	};
\ No newline at end of file
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index eea84a3..6abadbf 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -498,4 +498,10 @@
 		reg = <0x14530000 0x100000>;
 		interrupts = <0 95 0>;
         };
+
+        mixer {
+		compatible = "samsung,exynos5-mixer";
+		reg = <0x14450000 0x10000>;
+		interrupts = <0 94 0>;
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
