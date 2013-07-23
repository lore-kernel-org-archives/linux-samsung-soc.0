From: Dongjin Kim <tobetter@gmail.com>
Subject: [PATCH] ARM: dts: Add USBPHY nodes to Exynos4x12
Date: Wed, 24 Jul 2013 02:31:17 +0900
Message-ID: <1374600682-19376-1-git-send-email-tobetter@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:60583 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932262Ab3GWRbj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 13:31:39 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: Dongjin Kim <tobetter@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This patch adds device nodes for USBPHY to Exynos4x12.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 arch/arm/boot/dts/exynos4x12.dtsi |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 01da194..9c3335b 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -73,4 +73,22 @@
 		clock-names = "sclk_fimg2d", "fimg2d";
 		status = "disabled";
 	};
+
+	usbphy@125B00000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "samsung,exynos4x12-usb2phy";
+		reg = <0x125B0000 0x100>;
+		ranges;
+
+		clocks = <&clock 2>, <&clock 305>;
+		clock-names = "xusbxti", "otg";
+		status = "disabled";
+
+		usbphy-sys {
+			/* USB device and host PHY_CONTROL registers */
+			reg = <0x10020704 0xc>,
+			      <0x1001021c 0x4>;
+		};
+	};
 };
-- 
1.7.9.5
