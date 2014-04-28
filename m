From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCHv3 3/4] ARM: dts: exynos4: add hsotg device node
Date: Mon, 28 Apr 2014 11:28:44 +0900
Message-ID: <1398652125-4216-4-git-send-email-chanho61.park@samsung.com>
References: <1398652125-4216-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18348 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752586AbaD1C3C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Apr 2014 22:29:02 -0400
In-reply-to: <1398652125-4216-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: t.figa@samsung.com, k.debski@samsung.com, devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

This patch adds a hsotg node for exynos4 USB2.0 device controller.

Cc: Tomasz Figa <t.figa@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 5f9b23b..f8000dd 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -288,6 +288,17 @@
 		#phy-cells = <1>;
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
