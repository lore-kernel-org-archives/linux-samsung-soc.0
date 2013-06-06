From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: add ohci and ehci controller nodes for EXYNOS5440
Date: Thu, 06 Jun 2013 10:51:42 +0900
Message-ID: <09d701ce6258$64ef1fc0$2ecd5f40$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:65198 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756103Ab3FFBvp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 21:51:45 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNY000O87U7XFA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Jun 2013 10:51:43 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Thomas Abraham' <thomas.ab@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

EXYNOS5440 includes both OHCI and EHCI usb host controllers.
Add device tree nodes for both of these controllers.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 2607739..f3faabf 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -225,4 +225,19 @@
 		clock-names = "sata";
 	};
 
+	ohci@220000 {
+		compatible = "samsung,exynos-ohci";
+		reg = <0x220000 0x1000>;
+		interrupts = <0 29 0>;
+		clocks = <&clock 24>;
+		clock-names = "usbhost";
+	};
+
+	ehci@221000 {
+		compatible = "samsung,exynos-ehci";
+		reg = <0x221000 0x1000>;
+		interrupts = <0 29 0>;
+		clocks = <&clock 24>;
+		clock-names = "usbhost";
+	};
 };
-- 
1.7.10.4
