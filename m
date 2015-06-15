From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv7 4/4] ARM: dts: exynos5422-odroidxu3: Enable thermal-zones
Date: Mon, 15 Jun 2015 12:23:23 +0930
Message-ID: <1434336803-4132-4-git-send-email-linux.amoon@gmail.com>
References: <1434336803-4132-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:34955 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753933AbbFOCx4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 14 Jun 2015 22:53:56 -0400
In-Reply-To: <1434336803-4132-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>

Include exynos5422-cpu-thermal.dtsi to enable thermal_zone support.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Acked-by: Lukasz Majewski <l.majewski@samsung.com>
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 96d894e..2b65932 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/sound/samsung-i2s.h>
 #include "exynos5800.dtsi"
+#include "exynos5422-cpu-thermal.dtsi"
 
 / {
 	memory {
-- 
2.4.3
