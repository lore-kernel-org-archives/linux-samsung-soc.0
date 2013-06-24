From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 7/8] ARM: dts: Add AK8975 device node for Exynos4412 TRATS2
 board
Date: Mon, 24 Jun 2013 20:05:50 +0200
Message-ID: <1372097151-18122-8-git-send-email-s.nawrocki@samsung.com>
References: <1372097151-18122-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24248 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753030Ab3FXSHF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Jun 2013 14:07:05 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOW00HJ9SZMSW50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Jun 2013 03:07:03 +0900 (KST)
In-reply-to: <1372097151-18122-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

From: Jacek Anaszewski <j.anaszewski@samsung.com>

This patch adds AK8975 magnetometer node and corresponding
i2c-gpio bus node for TRATS2 board.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1:
 - added node alias for i2c-gpio@0 I2C controller node.
---
 arch/arm/boot/dts/exynos4412-trats2.dts |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 056b835..b9de3b5 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -19,6 +19,10 @@
 	model = "Samsung Trats 2 based on Exynos4412";
 	compatible = "samsung,trats2", "samsung,exynos4412";

+	aliases {
+		i2c8 = &i2c_ak8975;
+	};
+
 	memory {
 		reg =  <0x40000000 0x40000000>;
 	};
@@ -453,4 +457,19 @@
 	serial@13830000 {
 		status = "okay";
 	};
+
+	i2c_ak8975: i2c-gpio@0 {
+		compatible = "i2c-gpio";
+		gpios = <&gpy2 4 0>, <&gpy2 5 0>;
+		i2c-gpio,delay-us = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		ak8975@0c {
+			compatible = "asahi-kasei,ak8975";
+			reg = <0x0c>;
+			gpios = <&gpj0 7 0>;
+		};
+	};
 };
--
1.7.9.5
