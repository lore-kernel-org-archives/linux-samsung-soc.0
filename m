From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH] ARM: dts: exynos5420/5250: add ADC device tree node
Date: Thu, 22 Aug 2013 15:48:11 +0530
Message-ID: <1377166691-5118-1-git-send-email-ch.naveen@samsung.com>
References: <1375349321-18646-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51018 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752296Ab3HVKYL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 06:24:11 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRX00HRNGVIXKB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Aug 2013 19:23:43 +0900 (KST)
In-reply-to: <1375349321-18646-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: naveenkrishna.ch@gmail.com

Add ADC device tree node for exynos5420 and exynos5250

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |   11 +++++++++++
 arch/arm/boot/dts/exynos5420.dtsi |   11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 1eec646..518f8cd 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -641,4 +641,15 @@
 		clocks = <&clock 133>, <&clock 339>;
 		clock-names = "sclk_fimd", "fimd";
 	};
+
+	adc: adc@12D10000 {
+		compatible = "samsung,exynos-adc-v1";
+		reg = <0x12D10000 0x100>, <0x10040718 0x4>;
+		interrupts = <0 106 0>;
+		clocks = <&clock 303>;
+		clock-names = "adc";
+		#io-channel-cells = <1>;
+		io-channel-ranges;
+		status = "disabled";
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 5353e32..0c5c055 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -218,4 +218,15 @@
 		clocks = <&clock 147>, <&clock 421>;
 		clock-names = "sclk_fimd", "fimd";
 	};
+
+	adc: adc@12D10000 {
+		compatible = "samsung,exynos-adc-v2";
+		reg = <0x12D10000 0x100>, <0x10040720 0x4>;
+		interrupts = <0 106 0>;
+		clocks = <&clock 270>;
+		clock-names = "adc";
+		#io-channel-cells = <1>;
+		io-channel-ranges;
+		status = "disabled";
+	};
 };
-- 
1.7.9.5
