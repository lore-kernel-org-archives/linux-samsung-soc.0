From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/7] arm: dts: exynos: add vbus regulator to USB2 phy nodes
Date: Fri, 21 Aug 2015 14:38:38 +0200
Message-ID: <1440160723-6636-3-git-send-email-m.szyprowski@samsung.com>
References: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:22196 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751769AbbHUMjQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Aug 2015 08:39:16 -0400
In-reply-to: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>

Exynos USB2 PHY driver now supports VBUS regulator, so add it to all
boards which have it available. This also fixes commit
7eec1266751bd3a25e35ce88686634c768fedc24 ("ARM: dts: Add Maxim 77693
PMIC to exynos4412-trats2"), which added new regulators to Trats2 board,
but without linking them to the consumers.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-monk.dts           | 1 +
 arch/arm/boot/dts/exynos3250-rinato.dts         | 1 +
 arch/arm/boot/dts/exynos4210-trats.dts          | 2 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 2 +-
 arch/arm/boot/dts/exynos4412-trats2.dts         | 1 +
 5 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 540a0adf2be6..35b39d2255d3 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -161,6 +161,7 @@
 };
 
 &exynos_usbphy {
+	vbus-supply = <&safeout_reg>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 41a5fafb9aa9..23623cd3ebd9 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -153,6 +153,7 @@
 
 &exynos_usbphy {
 	status = "okay";
+	vbus-supply = <&safeout_reg>;
 };
 
 &hsotg {
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index ba34886f8b65..01d38f2145b9 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -251,6 +251,7 @@
 
 &exynos_usbphy {
 	status = "okay";
+	vbus-supply = <&safe1_sreg>;
 };
 
 &fimd {
@@ -448,7 +449,6 @@
 
 			safe1_sreg: ESAFEOUT1 {
 			     regulator-name = "SAFEOUT1";
-			     regulator-always-on;
 			};
 
 			safe2_sreg: ESAFEOUT2 {
diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index eb379526e234..2c04297825fe 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -248,6 +248,7 @@
 
 &exynos_usbphy {
 	status = "okay";
+	vbus-supply = <&safeout1_reg>;
 };
 
 &fimd {
@@ -486,7 +487,6 @@
 
 			safeout1_reg: ESAFEOUT1 {
 				regulator-name = "SAFEOUT1";
-				regulator-always-on;
 			};
 
 			safeout2_reg: ESAFEOUT2 {
diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 2a1ebb76ebe0..50a5e8a85283 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -391,6 +391,7 @@
 };
 
 &exynos_usbphy {
+	vbus-supply = <&esafeout1_reg>;
 	status = "okay";
 };
 
-- 
1.9.2
