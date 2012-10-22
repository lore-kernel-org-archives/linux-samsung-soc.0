From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 2/6] dts: exynos: add device tree support for exynos5 mixer
Date: Mon, 22 Oct 2012 17:01:03 +0530
Message-ID: <1350905467-23832-3-git-send-email-rahul.sharma@samsung.com>
References: <1350905467-23832-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19993 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752706Ab2JVLSs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Oct 2012 07:18:48 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCA0031BKR61WP0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Oct 2012 20:18:46 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCA00260KJ6TJ50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Oct 2012 20:18:46 +0900 (KST)
In-reply-to: <1350905467-23832-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: tomasz.figa@gmail.com, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patch adds support for device tree based discovery for exynos5
mixer. Mixer node is also renamed with "exynos5-mixer".

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 .../devicetree/bindings/drm/exynos/mixer.txt       |   15 +++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++++++
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 ++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/mixer.txt

diff --git a/Documentation/devicetree/bindings/drm/exynos/mixer.txt b/Documentation/devicetree/bindings/drm/exynos/mixer.txt
new file mode 100644
index 0000000..9b2ea03
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
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index e43b321..dd02b40 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -498,4 +498,10 @@
 		reg = <0x14530000 0x100000>;
 		interrupts = <0 95 0>;
 	};
+
+	mixer {
+		compatible = "samsung,exynos5-mixer";
+		reg = <0x14450000 0x10000>;
+		interrupts = <0 94 0>;
+	};
 };
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index f37d676..bb2d1ae 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -66,6 +66,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
 	OF_DEV_AUXDATA("samsung,exynos5-hdmi", 0x14530000,
 				"exynos5-hdmi", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5-mixer", 0x14450000,
+				"exynos5-mixer", NULL),
 	{},
 };
 
-- 
1.7.0.4
