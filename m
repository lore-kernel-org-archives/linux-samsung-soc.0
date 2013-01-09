From: Prasanna Kumar <prasanna.ps@samsung.com>
Subject: [PATCH 2/2] ARM: dts: exynos5: Set up power domain for  MFC and
 G-scaler
Date: Wed, 09 Jan 2013 17:45:33 +0530
Message-ID: <1357733733-18769-3-git-send-email-prasanna.ps@samsung.com>
References: <1357733733-18769-1-git-send-email-prasanna.ps@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64304 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756157Ab3AIMNI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 07:13:08 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGC007ROXXS5T21@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 21:13:07 +0900 (KST)
Received: from user-ubuntu.sisodomain.com ([107.108.83.235])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGC00D24XT4IT90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 21:13:07 +0900 (KST)
In-reply-to: <1357733733-18769-1-git-send-email-prasanna.ps@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: Prasanna Kumar <prasanna.ps@samsung.com>

This patch adds device tree nodes for MFC and G-scaler power domains
of exynos5.It binds these power-domain nodes to repsective device tree nodes.

Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 30485de..6d0e87c 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -85,6 +85,7 @@
 		compatible = "samsung,mfc-v6";
 		reg = <0x11000000 0x10000>;
 		interrupts = <0 96 0>;
+		samsung,power-domain = <&pd_mfc>;
 	};
 
 	rtc {
@@ -554,28 +555,42 @@
 		};
 	};
 
+	pd_gsc: gsc-power-domain@0x10044000 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044000 0x20>;
+	};
+
+	pd_mfc: mfc-power-domain@0x10044040 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044040 0x20>;
+	};
+
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
1.7.5.4
