From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 3/5] ARM: dts: exynos4412-odroidx: add support for USB (phy,
 host, device)
Date: Wed, 25 Jun 2014 15:26:11 +0200
Message-ID: <1403702773-9141-4-git-send-email-m.szyprowski@samsung.com>
References: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17380 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752780AbaFYN00 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 09:26:26 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N7Q00ENG7ZZ0K10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jun 2014 14:26:24 +0100 (BST)
In-reply-to: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

From: Kamil Debski <k.debski@samsung.com>

This patch adds basic support for USB modules (host and device) on
OdroidX board.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
[removed incorrect port@2 node]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroidx.dts | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index fda9ac23dd55..4c853fbf7202 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -148,6 +148,16 @@
 		pinctrl-names = "default";
 		status = "okay";
 
+		usb3503@08 {
+			compatible = "smsc,usb3503";
+			reg = <0x08>;
+
+			intn-gpios = <&gpx3 0 0>;
+			connect-gpios = <&gpx3 4 0>;
+			reset-gpios = <&gpx3 5 0>;
+			initial-mode = <1>;
+		};
+
 		max77686: pmic@09 {
 			compatible = "maxim,max77686";
 			reg = <0x09>;
@@ -338,4 +348,21 @@
 			};
 		};
 	};
+
+	exynos-usbphy@125B0000 {
+		status = "okay";
+	};
+
+	hsotg@12480000 {
+		status = "okay";
+		vusb_d-supply = <&ldo15_reg>;
+		vusb_a-supply = <&ldo12_reg>;
+	};
+
+	ehci@12580000 {
+		status = "okay";
+		port@1 {
+			status = "okay";
+		};
+	};
 };
-- 
1.9.2
