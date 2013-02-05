From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v3 2/2] ARM: Exynos5250: Enabling samsung-usb3phy driver
Date: Tue, 05 Feb 2013 18:33:54 +0530
Message-ID: <1360069434-20417-3-git-send-email-gautam.vivek@samsung.com>
References: <1360069434-20417-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20357 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751585Ab3BEM7N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 07:59:13 -0500
In-reply-to: <1360069434-20417-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, balbi@ti.com, grant.likely@secretlab.ca, sylvester.nawrocki@gmail.com, tomasz.figa@gmail.com, dianders@chromium.org, p.paneri@samsung.com

Adding device node for Samsung USB 3.0 PHY controller driver
on Exynos5250 along with the necessary device data to be parsed.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index d1865a8..451dcdb 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -99,6 +99,18 @@
 		interrupts = <0 65 0>;
 	};
 
+	usbphy@12100000 {
+		compatible = "samsung,exynos5250-usb3phy";
+		reg = <0x12100000 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		usbphy-sys {
+			reg = <0x10040704 0x8>;
+		};
+	};
+
 	usbphy@12130000 {
 		compatible = "samsung,exynos5250-usb2phy";
 		reg = <0x12130000 0x100>;
-- 
1.7.6.5
