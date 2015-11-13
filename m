From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/4] ARM: dts: exynos4: add rotator nodes
Date: Fri, 13 Nov 2015 14:29:43 +0100
Message-ID: <1447421386-8084-1-git-send-email-m.szyprowski@samsung.com>
References: <5645A0C5.3090006@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:47862 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753392AbbKMNas (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2015 08:30:48 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXR00L4X9JABW30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Nov 2015 13:30:46 +0000 (GMT)
In-reply-to: <5645A0C5.3090006@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

This patch adds device node for Rotator device to Exynos 4210 and 4x12
device tree files.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi    | 9 +++++++++
 arch/arm/boot/dts/exynos4210.dtsi | 4 ++++
 arch/arm/boot/dts/exynos4x12.dtsi | 4 ++++
 3 files changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 2f31f77..3e01d4d 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -718,6 +718,15 @@
 		iommus = <&sysmmu_jpeg>;
 	};
 
+	rotator: rotator@12810000 {
+		compatible = "samsung,exynos4210-rotator";
+		reg = <0x12810000 0x64>;
+		interrupts = <0 83 0>;
+		clocks = <&clock CLK_ROTATOR>;
+		clock-names = "rotator";
+		iommus = <&sysmmu_rotator>;
+	};
+
 	hdmi: hdmi@12D00000 {
 		compatible = "samsung,exynos4210-hdmi";
 		reg = <0x12D00000 0x70000>;
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 3e5ba66..e3048ae 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -279,3 +279,7 @@
 		<&clock CLK_OUT_CPU>, <&clock CLK_XXTI>, <&clock CLK_XUSBXTI>;
 	#clock-cells = <1>;
 };
+
+&rotator {
+	power-domains = <&pd_lcd0>;
+};
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index b77dac61..148b47a 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -339,6 +339,10 @@
 	compatible = "samsung,exynos4212-jpeg";
 };
 
+&rotator {
+	compatible = "samsung,exynos4212-rotator";
+};
+
 &mixer {
 	compatible = "samsung,exynos4212-mixer";
 	clock-names = "mixer", "hdmi", "sclk_hdmi", "vp";
-- 
1.9.2
