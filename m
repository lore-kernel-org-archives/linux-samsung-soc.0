From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv4 3/4] ARM: dts: exynos4: add hsotg device node
Date: Fri, 02 May 2014 13:26:08 +0900
Message-ID: <1399004769-31033-4-git-send-email-chanho61.park@samsung.com>
References: <1399004769-31033-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44079 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769AbaEBE0U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 00:26:20 -0400
In-reply-to: <1399004769-31033-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, t.figa@samsung.com, k.debski@samsung.com, Chanho Park <chanho61.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

This patch adds a hsotg node for exynos4 USB2.0 device controller.

Cc: Tomasz Figa <t.figa@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index e72acb7..206f519 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -288,6 +288,17 @@
 		status = "disabled";
 	};
 
+	hsotg@12480000 {
+		compatible = "samsung,s3c6400-hsotg";
+		reg = <0x12480000 0x20000>;
+		interrupts = <0 71 0>;
+		clocks = <&clock CLK_USB_DEVICE>;
+		clock-names = "otg";
+		phys = <&exynos_usbphy 0>;
+		phy-names = "usb2-phy";
+		status = "disabled";
+	};
+
 	ehci@12580000 {
 		compatible = "samsung,exynos4210-ehci";
 		reg = <0x12580000 0x100>;
-- 
1.8.3.2
