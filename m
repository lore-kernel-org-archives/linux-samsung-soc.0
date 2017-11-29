From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM64: dts: exynos: Add support for S3FWRN5 NFC chip to
 TM2(e) boards
Date: Wed, 29 Nov 2017 12:13:20 +0100
Message-ID: <20171129111320.14592-1-m.szyprowski@samsung.com>
References: <CGME20171129111327eucas1p2ddc03a0352a7bf2b3e1b9d4f9db99511@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:33547 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752332AbdK2LNa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 06:13:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Add device tree node with S3FWRN5 NFC chip to TM2(e) boards. The chip is
connected through HS-I2C bus #4.

Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
[mszyprow: rebased onto v4.15-rc1, moved node to exynos5433-tm2-common.dtsi,
 rephrased commit message]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 297597442c44..5028d7352856 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -741,6 +741,19 @@
 	};
 };
 
+&hsi2c_4 {
+	status = "okay";
+
+	s3fwrn5: nfc@27 {
+		compatible = "samsung,s3fwrn5-i2c";
+		reg = <0x27>;
+		interrupt-parent = <&gpa1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+		s3fwrn5,en-gpios = <&gpf1 4 GPIO_ACTIVE_HIGH>;
+		s3fwrn5,fw-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &hsi2c_5 {
 	status = "okay";
 
-- 
2.15.0
