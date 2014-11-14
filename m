From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH] ARM: dts: Explicitly set dr_mode on exynos5250-snow
Date: Fri, 14 Nov 2014 20:46:19 +0100
Message-ID: <1415994379-29165-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:53671 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161184AbaKNTqz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Nov 2014 14:46:55 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Explicitly set the dr_mode for the dwc3 controller on the
Snow board to host mode. This is required to ensure the
controller is initialized in the right mode if the kernel is
build with USB gadget support.

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 arch/arm/boot/dts/exynos5250-snow.dts | 4 ++++
 arch/arm/boot/dts/exynos5250.dtsi     | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index e51fcef..60429ad 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -624,4 +624,8 @@
 	num-cs = <1>;
 };
 
+&usbdrd_dwc3 {
+	dr_mode = "host";
+};
+
 #include "cros-ec-keyboard.dtsi"
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index f21b9aa..d55c1a2 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -555,7 +555,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		dwc3 {
+		usbdrd_dwc3: dwc3 {
 			compatible = "synopsys,dwc3";
 			reg = <0x12000000 0x10000>;
 			interrupts = <0 72 0>;
-- 
2.1.3
