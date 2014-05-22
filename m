From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos4: add port sub-nodes to exynos usb host
 modules
Date: Thu, 22 May 2014 07:54:49 +0200
Message-ID: <1400738089-7423-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38079 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750720AbaEVFzO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 01:55:14 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5Y001J2OFV8470@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 May 2014 06:55:07 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

This patch adds port sub-nodes to exynos4 ehci and ohci modules, which
are required by recently merged new exynos4 usb2 phy support.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Hello,

This patch requires merging on top of '[PATCHv5 0/4] Enable usbphy and
hsotg for exynos4' patch series recently posted by Chanho Park.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland
---
 arch/arm/boot/dts/exynos4.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 0eb768cc0b80..3b42753484d5 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -296,6 +296,26 @@
 		clocks = <&clock CLK_USB_HOST>;
 		clock-names = "usbhost";
 		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+		    reg = <0>;
+		    phys = <&exynos_usbphy 1>;
+		    phy-names = "host";
+		    status = "disabled";
+		};
+		port@1 {
+		    reg = <1>;
+		    phys = <&exynos_usbphy 2>;
+		    phy-names = "hsic0";
+		    status = "disabled";
+		};
+		port@2 {
+		    reg = <2>;
+		    phys = <&exynos_usbphy 3>;
+		    phy-names = "hsic1";
+		    status = "disabled";
+		};
 	};
 
 	ohci@12590000 {
@@ -305,6 +325,14 @@
 		clocks = <&clock CLK_USB_HOST>;
 		clock-names = "usbhost";
 		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+		    reg = <0>;
+		    phys = <&exynos_usbphy 1>;
+		    phy-names = "host";
+		    status = "disabled";
+		};
 	};
 
 	i2s1: i2s@13960000 {
-- 
1.9.2
