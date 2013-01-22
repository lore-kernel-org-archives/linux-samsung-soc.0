From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v2 1/2] ARM: Exynos5250: Enabling samsung-usbphy driver
Date: Tue, 22 Jan 2013 21:01:19 +0530
Message-ID: <1358868680-5757-2-git-send-email-gautam.vivek@samsung.com>
References: <1358868680-5757-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63504 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754021Ab3AVPZJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jan 2013 10:25:09 -0500
In-reply-to: <1358868680-5757-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, kgene.kim@samsung.com, grant.likely@secretlab.ca, dianders@chromium.org, balbi@ti.com, thomas.abraham@linaro.org, sylvester.nawrocki@gmail.com, tomasz.figa@gmail.com, p.paneri@samsung.com

Adding usbphy node for Exynos5250 along with the
necessary device data to be parsed.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 30485de..610e338 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -275,6 +275,21 @@
 		#size-cells = <0>;
 	};
 
+	usbphy@12130000 {
+		compatible = "samsung,exynos5250-usbphy";
+		reg = <0x12130000 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		usbphy-sys {
+			      /* USB device and host PHY_CONTROL registers */
+			reg = <0x10040704 0x8>,
+			      /* USB2.0 PHY configuration register */
+			      <0x10050230 0x4>;
+		};
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.6.5
