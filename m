From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 7/7] ARM: dts: exynos5250: add display power domain
Date: Fri, 14 Nov 2014 07:58:56 +0100
Message-ID: <1415948336-1691-1-git-send-email-a.hajda@samsung.com>
References: <1415895785-26892-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:51518 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754331AbaKNG7N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Nov 2014 01:59:13 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NF0007WWOV9CY30@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Nov 2014 07:01:57 +0000 (GMT)
In-reply-to: <1415895785-26892-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

The patch adds domain definition and references to it in appropriate devices.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index f21b9aa..4fed676 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -100,6 +100,11 @@
 		reg = <0x10044040 0x20>;
 	};
 
+	pd_disp1: disp1-power-domain@100440A0 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x100440A0 0x20>;
+	};
+
 	clock: clock-controller@10010000 {
 		compatible = "samsung,exynos5250-clock";
 		reg = <0x10010000 0x30000>;
@@ -713,6 +718,7 @@
 	hdmi {
 		compatible = "samsung,exynos4212-hdmi";
 		reg = <0x14530000 0x70000>;
+		samsung,power-domain = <&pd_disp1>;
 		interrupts = <0 95 0>;
 		clocks = <&clock CLK_HDMI>, <&clock CLK_SCLK_HDMI>,
 			 <&clock CLK_SCLK_PIXEL>, <&clock CLK_SCLK_HDMIPHY>,
@@ -725,6 +731,7 @@
 	mixer {
 		compatible = "samsung,exynos5250-mixer";
 		reg = <0x14450000 0x10000>;
+		samsung,power-domain = <&pd_disp1>;
 		interrupts = <0 94 0>;
 		clocks = <&clock CLK_MIXER>, <&clock CLK_SCLK_HDMI>;
 		clock-names = "mixer", "sclk_hdmi";
@@ -737,6 +744,7 @@
 	};
 
 	dp-controller@145B0000 {
+		samsung,power-domain = <&pd_disp1>;
 		clocks = <&clock CLK_DP>;
 		clock-names = "dp";
 		phys = <&dp_phy>;
@@ -744,6 +752,7 @@
 	};
 
 	fimd@14400000 {
+		samsung,power-domain = <&pd_disp1>;
 		clocks = <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
 		clock-names = "sclk_fimd", "fimd";
 	};
-- 
1.9.1
