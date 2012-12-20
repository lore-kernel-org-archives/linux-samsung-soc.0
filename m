From: Prasanna Kumar <prasanna.ps@samsung.com>
Subject: [PATCH v2 1/3] ARM: dts: exynos5: Set up power domain for
 MFC,G-scaler,MAU and ISP
Date: Thu, 20 Dec 2012 17:56:16 +0530
Message-ID: <1356006378-17441-2-git-send-email-prasanna.ps@samsung.com>
References: <CAPmaG0uqkRcoUBR8Gjv_+BSJ3hwxUCz0G-YKNQX=qvx83i6QOQ@mail.gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55626 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751296Ab2LTMF1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Dec 2012 07:05:27 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFB001GOW8Y2I11@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Dec 2012 21:05:25 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFB00BM9W63ML00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Dec 2012 21:05:25 +0900 (KST)
In-reply-to: <CAPmaG0uqkRcoUBR8Gjv_+BSJ3hwxUCz0G-YKNQX=qvx83i6QOQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org

This patch adds device tree nodes for MFC,G-scaler,MAU and ISP power domains
of exynos5.It binds these power-domain nodes to repsective device tree nodes.

Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 581e57a..71a37bd 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -83,6 +83,7 @@
 		compatible = "samsung,mfc-v6";
 		reg = <0x11000000 0x10000>;
 		interrupts = <0 96 0>;
+		samsung,power-domain = <&pd_mfc>;
 	};
 
 	rtc {
@@ -283,6 +284,7 @@
 		samsung,supports-rstclr;
 		samsung,supports-secdai;
 		samsung,idma-addr = <0x03000000>;
+		samsung,power-domain = <&pd_mau>;
 	};
 
 	i2s_1: i2s@12D60000 {
@@ -578,28 +580,51 @@
 		};
 	};
 
+	pd_gsc: gsc-power-domain@0x10044000 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044000 0x20>;
+	};
+
+	pd_isp: isp-power-domain@0x10044020 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044020 0x20>;
+		};
+
+	pd_mfc: mfc-power-domain@0x10044040 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044040 0x20>;
+	};
+
+	pd_mau: mau-power-domain@0x100440C0 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x100440C0 0x20>;
+	};
 	gsc_0:  gsc@0x13e00000 {
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e00000 0x1000>;
 		interrupts = <0 85 0>;
+		samsung,power-domain = <&pd_gsc>;
 	};
 
 	gsc_1:  gsc@0x13e10000 {
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e10000 0x1000>;
 		interrupts = <0 86 0>;
+		samsung,power-domain = <&pd_gsc>;
 	};
 
 	gsc_2:  gsc@0x13e20000 {
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e20000 0x1000>;
 		interrupts = <0 87 0>;
+		samsung,power-domain = <&pd_gsc>;
 	};
 
 	gsc_3:  gsc@0x13e30000 {
 		compatible = "samsung,exynos5-gsc";
 		reg = <0x13e30000 0x1000>;
 		interrupts = <0 88 0>;
+		samsung,power-domain = <&pd_gsc>;
 	};
 
 	hdmi {
-- 
1.7.0.4
