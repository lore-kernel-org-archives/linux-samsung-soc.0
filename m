From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 4/4] ARM: dts: exynos4: Set up power domains
Date: Tue, 02 Oct 2012 11:24:06 +0200
Message-ID: <1349169846-30385-5-git-send-email-t.figa@samsung.com>
References: <1349169846-30385-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:19911 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753266Ab2JBJYl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Oct 2012 05:24:41 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MB900KYKE4HGZ10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Oct 2012 18:24:40 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MB900MEOE4G7Q90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Oct 2012 18:24:40 +0900 (KST)
In-reply-to: <1349169846-30385-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, rjw@sisk.pl, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch adds device tree nodes for power domains of Exynos4 SoCs.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi    | 30 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi |  5 +++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index a26c3dd..0c14f50 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -30,6 +30,36 @@
 		spi2 = &spi_2;
 	};
 
+	pd_mfc: mfc-power-domain@10023C40 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023C40 0x20>;
+	};
+
+	pd_g3d: g3d-power-domain@10023C60 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023C60 0x20>;
+	};
+
+	pd_lcd0: lcd0-power-domain@10023C80 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023C80 0x20>;
+	};
+
+	pd_tv: tv-power-domain@10023C20 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023C20 0x20>;
+	};
+
+	pd_cam: cam-power-domain@10023C00 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023C00 0x20>;
+	};
+
+	pd_gps: gps-power-domain@10023CE0 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023CE0 0x20>;
+	};
+
 	gic:interrupt-controller@10490000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 214c557..f9f840e 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -31,6 +31,11 @@
 		pinctrl2 = &pinctrl_2;
 	};
 
+	pd_lcd1: lcd1-power-domain@10023CA0 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023CA0 0x20>;
+	};
+
 	gic:interrupt-controller@10490000 {
 		cpu-offset = <0x8000>;
 	};
-- 
1.7.12
