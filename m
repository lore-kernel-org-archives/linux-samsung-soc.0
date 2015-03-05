From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos4: add nodes for jpeg codec
Date: Thu, 05 Mar 2015 13:28:08 +0100
Message-ID: <1425558488-7039-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:26221 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755595AbbCEM2T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Mar 2015 07:28:19 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NKQ001C6O5ZYT50@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Mar 2015 12:32:23 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>

This patch adds nodes for hardware JPEG codec found in Exynos 4210 and
4x12 SoCs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi    | 9 +++++++++
 arch/arm/boot/dts/exynos4x12.dtsi | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 77ea547..1bd630a 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -685,6 +685,15 @@
 		#include "exynos4412-tmu-sensor-conf.dtsi"
 	};
 
+	jpeg-codec@11840000 {
+		compatible = "samsung,exynos4210-jpeg";
+		reg = <0x11840000 0x1000>;
+		interrupts = <0 88 0>;
+		clocks = <&clock CLK_JPEG>;
+		clock-names = "jpeg";
+		samsung,power-domain = <&pd_cam>;
+	};
+
 	hdmi: hdmi@12D00000 {
 		compatible = "samsung,exynos4210-hdmi";
 		reg = <0x12D00000 0x70000>;
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 6a6abe1..72b9a1d 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -299,6 +299,10 @@
 		status = "disabled";
 	};
 
+	jpeg-codec@11840000 {
+		compatible = "samsung,exynos4212-jpeg";
+	};
+
 	hdmi: hdmi@12D00000 {
 		compatible = "samsung,exynos4212-hdmi";
 	};
-- 
1.9.2
