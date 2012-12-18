From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 2/2] ARM: Exynos5250: Enabling USB 3.0 phy for samsung-usbphy
 driver
Date: Tue, 18 Dec 2012 21:09:42 +0530
Message-ID: <1355845182-14104-3-git-send-email-gautam.vivek@samsung.com>
References: <1355845182-14104-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:31804 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932088Ab2LRPeb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Dec 2012 10:34:31 -0500
In-reply-to: <1355845182-14104-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, thomas.abraham@linaro.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, sylvester.nawrocki@gmail.com, p.paneri@samsung.com

Adding base address information required for enabling
USB 3.0 DRD phy on exynos5250 SOC.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index bbdb2c2..07b7477 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -316,7 +316,8 @@
 
 	usbphy@12130000 {
 		compatible = "samsung,exynos5250-usbphy";
-		reg = <0x12130000 0x100>;
+		reg = <0x12130000 0x100>,
+		      <0x12100000 0x100>;
 		samsung,usb-phyhandle = <&phy_h0 &phy_h1 &phy_h2>;
 		samsung,enable-mask = <1>;
 	};
-- 
1.7.6.5
