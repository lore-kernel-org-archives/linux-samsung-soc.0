From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 4/5] ARM: dts: exynos5420: add hdmi hpd gpio pinctrl node
Date: Thu, 20 Jun 2013 11:11:50 +0530
Message-ID: <1371706911-27016-5-git-send-email-rahul.sharma@samsung.com>
References: <1371706911-27016-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:35735 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752093Ab3FTFSf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 01:18:35 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOO00HPDEQVTR80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Jun 2013 14:18:34 +0900 (KST)
In-reply-to: <1371706911-27016-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add pinctrl node for hdmi-hpd gpio pin to exynos5420
device tree files.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    7 +++++++
 arch/arm/boot/dts/exynos5420-smdk5420.dts |    2 ++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index 5848c42..5706ad9 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -59,6 +59,13 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		hdmi_hpd_irq: hdmi-hpd-irq {
+		        samsung,pins = "gpx3-7";
+			samsung,pin-function = <0>;
+			samsung,pin-pud = <1>;
+			samsung,pin-drv = <0>;
+		};
 	};
 
 	pinctrl@13410000 {
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index b3721bd..2d6c74f 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -33,6 +33,8 @@
 
 	hdmi {
 		hpd-gpio = <&gpx3 7 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_hpd_irq>;
 	};
 
 	i2c_2: i2c@12C80000 {
-- 
1.7.10.4
