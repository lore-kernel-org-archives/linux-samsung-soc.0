From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv3 4/4] ARM: dts: exynos4412-trats2: enable usb nodes
Date: Mon, 28 Apr 2014 11:28:45 +0900
Message-ID: <1398652125-4216-5-git-send-email-chanho61.park@samsung.com>
References: <1398652125-4216-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52634 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753024AbaD1C3C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Apr 2014 22:29:02 -0400
In-reply-to: <1398652125-4216-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: t.figa@samsung.com, k.debski@samsung.com, devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

This patch enables exynos_usbphy and hsotg device nodes.

Cc: Tomasz Figa <t.figa@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 9583563..a16db6c 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -665,6 +665,16 @@
 		};
 	};
 
+	exynos-usbphy@125B0000 {
+		status = "okay";
+	};
+
+	hsotg@12480000 {
+		vusb_d-supply = <&ldo15_reg>;
+		vusb_a-supply = <&ldo12_reg>;
+		status = "okay";
+	};
+
 	thermistor-ap@0 {
 		compatible = "ntc,ncp15wb473";
 		pullup-uv = <1800000>;	 /* VCC_1.8V_AP */
-- 
1.8.3.2
