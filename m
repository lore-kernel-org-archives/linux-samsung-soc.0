From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 1/8] ARM: dts: exynos4: add port sub-nodes to exynos usb
 host modules
Date: Mon, 14 Jul 2014 14:48:19 +0200
Message-ID: <1405342106-10585-2-git-send-email-m.szyprowski@samsung.com>
References: <1405342106-10585-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36145 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755305AbaGNMsk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 08:48:40 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8P00DCPCWLSS70@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Jul 2014 13:48:21 +0100 (BST)
In-reply-to: <1405342106-10585-1-git-send-email-m.szyprowski@samsung.com>
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
index 17b22e9cc2aa..868925ab2aa4 100644
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
