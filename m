From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v4 09/13] ARM: dts: Add SPI1 controller and s5c73m3 sensor node
 for TRATS2
Date: Wed, 24 Jul 2013 15:17:21 +0200
Message-ID: <1374671845-30373-10-git-send-email-s.nawrocki@samsung.com>
References: <1374671845-30373-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:9051 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750902Ab3GXNTg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 09:19:36 -0400
In-reply-to: <1374671845-30373-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andrzej Hajda <a.hajda@samsung.com>

From: Andrzej Hajda <a.hajda@samsung.com>

This patch add dts entries required for the SPI bus used for
firware upload by the S5C73M3 camera.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 5558e5a..fb7b9ae 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -482,6 +482,22 @@
 		};
 	};
 
+	spi_1: spi@13930000 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&spi1_bus>;
+		status = "okay";
+
+		s5c73m3_spi: s5c73m3 {
+			compatible = "samsung,s5c73m3";
+			spi-max-frequency = <50000000>;
+			reg = <0>;
+			controller-data {
+				cs-gpio = <&gpb 5 0>;
+				samsung,spi-feedback-delay = <2>;
+			};
+		};
+	};
+
 	camera {
 		pinctrl-0 = <&cam_port_b_clk_active>;
 		pinctrl-names = "default";
-- 
1.7.9.5
