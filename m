From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 1/2] ARM: dts: Add USB Host nodes to Exynos4210
Date: Wed, 29 May 2013 18:47:29 +0900
Message-ID: <000101ce5c51$887309f0$99591dd0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11988 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964948Ab3E2Jra (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 May 2013 05:47:30 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Vivek Gautam' <gautam.vivek@samsung.com>, 'Praveen Paneri' <p.paneri@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, Jingoo Han <jg1.han@samsung.com>

Add device nodes for USB Host EHCI and OHCI controllers to Exynos4210.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
Tested on Exynos4210.

 arch/arm/boot/dts/exynos4210.dtsi |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 366795a..3c173c7 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -117,6 +117,24 @@
 		status = "disabled";
 	};
 
+	usb@12580000 {
+		compatible = "samsung,exynos4210-ehci";
+		reg = <0x12580000 0x100>;
+		interrupts = <0 70 0>;
+
+		clocks = <&clock 304>;
+		clock-names = "usbhost";
+	};
+
+	usb@12590000 {
+		compatible = "samsung,exynos4210-ohci";
+		reg = <0x12590000 0x100>;
+		interrupts = <0 70 0>;
+
+		clocks = <&clock 304>;
+		clock-names = "usbhost";
+	};
+
 	g2d@12800000 {
 		compatible = "samsung,s5pv210-g2d";
 		reg = <0x12800000 0x1000>;
-- 
1.7.10.4
