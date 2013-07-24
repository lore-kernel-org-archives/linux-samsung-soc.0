From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v4 07/13] ARM: dts: Add AK8975 device node for Exynos4412
 TRATS2 board
Date: Wed, 24 Jul 2013 15:17:19 +0200
Message-ID: <1374671845-30373-8-git-send-email-s.nawrocki@samsung.com>
References: <1374671845-30373-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:27636 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902Ab3GXNTa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 09:19:30 -0400
In-reply-to: <1374671845-30373-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jacek Anaszewski <j.anaszewski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

From: Jacek Anaszewski <j.anaszewski@samsung.com>

This patch adds AK8975 magnetometer node and corresponding
i2c-gpio bus node for TRATS2 board.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
Changes since v3:
 - s/i2c-gpio@0/i2c-gpio-0, changed compatible string to "ak,ak8975".
---
 arch/arm/boot/dts/exynos4412-trats2.dts |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 056b835..cab4c0e 100644
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
+	i2c_ak8975: i2c-gpio-0 {
+		compatible = "i2c-gpio";
+		gpios = <&gpy2 4 0>, <&gpy2 5 0>;
+		i2c-gpio,delay-us = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		ak8975@0c {
+			compatible = "ak,ak8975";
+			reg = <0x0c>;
+			gpios = <&gpj0 7 0>;
+		};
+	};
 };
-- 
1.7.9.5
