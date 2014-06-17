From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/4] ARM: dts: exynos4: add port sub-nodes to exynos usb host
 modules
Date: Tue, 17 Jun 2014 11:25:30 +0200
Message-ID: <1402997133-13827-2-git-send-email-m.szyprowski@samsung.com>
References: <1402997133-13827-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58533 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755570AbaFQJZt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jun 2014 05:25:49 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N7B0035J3IV7160@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jun 2014 10:25:43 +0100 (BST)
In-reply-to: <1402997133-13827-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

This patch adds port sub-nodes to exynos4 ehci and ohci modules, which
are required by recently merged new exynos4 usb2 phy support.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index b8ece4be41ca..c91284441694 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -322,6 +322,23 @@
 		clocks = <&clock CLK_USB_HOST>;
 		clock-names = "usbhost";
 		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+		    reg = <0>;
+		    phys = <&exynos_usbphy 1>;
+		    status = "disabled";
+		};
+		port@1 {
+		    reg = <1>;
+		    phys = <&exynos_usbphy 2>;
+		    status = "disabled";
+		};
+		port@2 {
+		    reg = <2>;
+		    phys = <&exynos_usbphy 3>;
+		    status = "disabled";
+		};
 	};
 
 	ohci@12590000 {
@@ -331,6 +348,13 @@
 		clocks = <&clock CLK_USB_HOST>;
 		clock-names = "usbhost";
 		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+		    reg = <0>;
+		    phys = <&exynos_usbphy 1>;
+		    status = "disabled";
+		};
 	};
 
 	i2s1: i2s@13960000 {
-- 
1.9.2
