From: Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH RESEND 2/2] ARM: dts: exynos3250: replace number by macro in
 gpio keys
Date: Tue, 06 Jan 2015 12:43:29 +0900
Message-ID: <1420515809-5151-3-git-send-email-beomho.seo@samsung.com>
References: <1420515809-5151-1-git-send-email-beomho.seo@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30367 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753379AbbAFDne (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jan 2015 22:43:34 -0500
In-reply-to: <1420515809-5151-1-git-send-email-beomho.seo@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, yj44.cho@samsung.com, cw00.choi@samsung.com, inki.dae@samsung.com, beomho.seo@samsung.com, Kukjin Kim <kgene@kernel.org>

This patch replace number by macro in gpio keys for exynos 3250 boards.

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Youngjun Cho <yj44.cho@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
---
 arch/arm/boot/dts/exynos3250-monk.dts   |    3 ++-
 arch/arm/boot/dts/exynos3250-rinato.dts |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 2129ab98..792a2c7 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -15,6 +15,7 @@
 /dts-v1/;
 #include "exynos3250.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Samsung Monk board";
@@ -37,7 +38,7 @@
 		compatible = "gpio-keys";
 
 		power_key {
-			gpios = <&gpx2 7 1>;
+			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
 			label = "power key";
 			debounce-interval = <10>;
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index c186ac6..3493bca 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -15,6 +15,7 @@
 /dts-v1/;
 #include "exynos3250.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Samsung Rinato board";
@@ -37,7 +38,7 @@
 		compatible = "gpio-keys";
 
 		power_key {
-			gpios = <&gpx2 7 1>;
+			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
 			label = "power key";
 			debounce-interval = <10>;
-- 
1.7.9.5
