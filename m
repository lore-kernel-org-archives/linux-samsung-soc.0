From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 2/2] ARM: dts: Add USB PHY node to Exynos4210
Date: Wed, 29 May 2013 18:48:12 +0900
Message-ID: <000201ce5c51$a261d530$e7257f90$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12108 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964948Ab3E2JsO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 May 2013 05:48:14 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Vivek Gautam' <gautam.vivek@samsung.com>, 'Praveen Paneri' <p.paneri@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, Jingoo Han <jg1.han@samsung.com>

Add device node for USB 2.0 PHY controller to Exynos4210.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
Tested on Exynos4210.

 arch/arm/boot/dts/exynos4210.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 3c173c7..bec6637 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -135,6 +135,20 @@
 		clock-names = "usbhost";
 	};
 
+	usb2_phy: usbphy@125b0000 {
+		compatible = "samsung,exynos4210-usb2phy";
+		reg = <0x125b0000 0x100>;
+		clocks = <&clock 2>, <&clock 305>;
+		clock-names = "xusbxti", "usb_device";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		usbphy-sys {
+			reg = <0x10020704 0x8>;
+		};
+	};
+
 	g2d@12800000 {
 		compatible = "samsung,s5pv210-g2d";
 		reg = <0x12800000 0x1000>;
-- 
1.7.10.4
