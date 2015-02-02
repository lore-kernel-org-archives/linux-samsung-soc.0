From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 8/9] ARM: dts: exynos5250: add display power domain
Date: Mon, 02 Feb 2015 14:20:27 +0100
Message-ID: <1422883228-10690-9-git-send-email-m.szyprowski@samsung.com>
References: <1422883228-10690-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54119 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933217AbbBBNUt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 08:20:49 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJ5009CXBXH5C30@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Feb 2015 13:24:54 +0000 (GMT)
In-reply-to: <1422883228-10690-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, kyungmin.park@samsung.com

From: Andrzej Hajda <a.hajda@samsung.com>

The patch adds domain definition and references to it in appropriate devices.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
[mszyprow: rebased onto generic power domains dt bindings]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5250.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index e8c67fdb69fb..ae22bd98f956 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -102,6 +102,12 @@
 		#power-domain-cells = <0>;
 	};
 
+	pd_disp1: disp1-power-domain@100440A0 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x100440A0 0x20>;
+		#power-domain-cells = <0>;
+	};
+
 	clock: clock-controller@10010000 {
 		compatible = "samsung,exynos5250-clock";
 		reg = <0x10010000 0x30000>;
@@ -719,6 +725,7 @@
 	hdmi: hdmi {
 		compatible = "samsung,exynos4212-hdmi";
 		reg = <0x14530000 0x70000>;
+		power-domains = <&pd_disp1>;
 		interrupts = <0 95 0>;
 		clocks = <&clock CLK_HDMI>, <&clock CLK_SCLK_HDMI>,
 			 <&clock CLK_SCLK_PIXEL>, <&clock CLK_SCLK_HDMIPHY>,
@@ -731,6 +738,7 @@
 	mixer {
 		compatible = "samsung,exynos5250-mixer";
 		reg = <0x14450000 0x10000>;
+		power-domains = <&pd_disp1>;
 		interrupts = <0 94 0>;
 		clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
 			 <&clock CLK_SCLK_HDMI>;
@@ -744,6 +752,7 @@
 	};
 
 	dp: dp-controller@145B0000 {
+		power-domains = <&pd_disp1>;
 		clocks = <&clock CLK_DP>;
 		clock-names = "dp";
 		phys = <&dp_phy>;
@@ -751,6 +760,7 @@
 	};
 
 	fimd: fimd@14400000 {
+		power-domains = <&pd_disp1>;
 		clocks = <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
 		clock-names = "sclk_fimd", "fimd";
 	};
-- 
1.9.2
