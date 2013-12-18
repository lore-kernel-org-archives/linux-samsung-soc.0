From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: dts: Add wake up key to Arndale octa board
Date: Wed, 18 Dec 2013 14:15:38 +0530
Message-ID: <1387356339-14082-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:65372 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753083Ab3LRIsu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 03:48:50 -0500
Received: by mail-pd0-f175.google.com with SMTP id w10so7898634pde.34
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 00:48:50 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Added GPIO based wake up key to Arndale octa board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index edd933feaf48..240caab5129f 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -12,6 +12,7 @@
 /dts-v1/;
 #include "exynos5420.dtsi"
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Insignal Arndale Octa evaluation board based on EXYNOS5420";
@@ -349,4 +350,14 @@
 		};
 	};
 
+	gpio_keys {
+		compatible = "gpio-keys";
+
+		wakeup {
+			label = "SW-TACT1";
+			gpios = <&gpx2 7 1>;
+			linux,code = <KEY_WAKEUP>;
+			gpio-key,wakeup;
+		};
+	};
 };
-- 
1.7.9.5
