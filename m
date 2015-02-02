From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 7/9] ARM: dts: Exynos: add 'hdmi' clock to mixer nodes
Date: Mon, 02 Feb 2015 14:20:26 +0100
Message-ID: <1422883228-10690-8-git-send-email-m.szyprowski@samsung.com>
References: <1422883228-10690-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:47871 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933260AbbBBNUt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 08:20:49 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJ500GEABXA9Z30@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Feb 2015 13:24:46 +0000 (GMT)
In-reply-to: <1422883228-10690-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, kyungmin.park@samsung.com

Mixed block needs to control hdmi clock to properly perform power on/off
operation, so add 'hdmi' clock also to mixer nodes.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 5 +++--
 arch/arm/boot/dts/exynos5420.dtsi | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 9bb1b0b738f5..e8c67fdb69fb 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -732,8 +732,9 @@
 		compatible = "samsung,exynos5250-mixer";
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
-		clocks = <&clock CLK_MIXER>, <&clock CLK_SCLK_HDMI>;
-		clock-names = "mixer", "sclk_hdmi";
+		clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
+			 <&clock CLK_SCLK_HDMI>;
+		clock-names = "mixer", "hdmi", "sclk_hdmi";
 	};
 
 	dp_phy: video-phy@10040720 {
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9dc2e9773b30..1b624104f84a 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -740,8 +740,9 @@
 		compatible = "samsung,exynos5420-mixer";
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
-		clocks = <&clock CLK_MIXER>, <&clock CLK_SCLK_HDMI>;
-		clock-names = "mixer", "sclk_hdmi";
+		clocks = <&clock CLK_MIXER>, <&clock CLK_HDMI>,
+			 <&clock CLK_SCLK_HDMI>;
+		clock-names = "mixer", "hdmi", "sclk_hdmi";
 		power-domains = <&disp_pd>;
 	};
 
-- 
1.9.2
