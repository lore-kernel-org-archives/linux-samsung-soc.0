From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 3/4] ARM: dts: exynos4: Add nodes for USB PHY block
Date: Tue, 25 Jun 2013 17:38:25 +0200
Message-ID: <1372174706-5459-4-git-send-email-t.figa@samsung.com>
References: <1372174706-5459-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:27340 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752693Ab3FYPjG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Jun 2013 11:39:06 -0400
In-reply-to: <1372174706-5459-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, devicetree-discuss@lists.ozlabs.org, Felipe Balbi <balbi@ti.com>, Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, m.szyprowski@samsung.com, l.majewski@samsung.com, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds device tree nodes for USB OTG PHYs of Exynos4210 and
Exynos4x12 SoCs.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4210.dtsi | 15 +++++++++++++++
 arch/arm/boot/dts/exynos4x12.dtsi | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 54710de..3c71ea5 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -114,6 +114,21 @@
 		interrupts = <2 4>;
 	};
 
+	usbphy@125B0000 {
+		compatible = "samsung,exynos4210-usb2phy";
+		reg = <0x125B0000 0x100>;
+		clocks = <&clock 305>;
+		clock-names = "otg";
+		status = "disabled";
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		usbphy-sys {
+			reg = <0x10020704 0x8>;
+		};
+	};
+
 	g2d@12800000 {
 		compatible = "samsung,s5pv210-g2d";
 		reg = <0x12800000 0x1000>;
diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index e3380a7..267ed95 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -79,4 +79,19 @@
 		interrupts = <0 89 0>;
 		status = "disabled";
 	};
+
+	usbphy@125B0000 {
+		compatible = "samsung,exynos4x12-usb2phy";
+		reg = <0x125B0000 0x100>;
+		clocks = <&clock 305>;
+		clock-names = "otg";
+		status = "disabled";
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		usbphy-sys {
+			reg = <0x10020704 0x8>;
+		};
+	};
 };
-- 
1.8.2.1
