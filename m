From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] hwmon: ntc_thermistor: Fix typo (pullup-uV -> pullup-uv)
Date: Wed, 23 Oct 2013 10:44:50 +0900
Message-ID: <1382492690-4056-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60697 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753859Ab3JWBpC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Oct 2013 21:45:02 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, rob@landley.net, kgene.kim@samsung.com, jic23@kernel.org, ch.naveen@samsung.com, dianders@chromium.org, lars@metafoo.de, sachin.kamat@linaro.org, kyungmin.park@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>

This patch fix typo of property name from 'pullup-uV' to 'pullup-uv'.
The ntc_thermistor.c use 'pullup-uv' when parsing dt data.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
index 47ada1d..5d49f2b 100644
--- a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
@@ -49,7 +49,7 @@ adc@12D10000 {
 	/* NTC thermistor is a hwmon device */
 	ncp15wb473@0 {
 		compatible = "ntc,ncp15wb473";
-		pullup-uV = <1800000>;
+		pullup-uv = <1800000>;
 		pullup-ohm = <47000>;
 		pulldown-ohm = <0>;
 		io-channels = <&adc 4>;
-- 
1.8.0
