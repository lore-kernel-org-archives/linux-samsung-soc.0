From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v6 7/7] ARM: dts: add hdmi ddc device for exynos5420 smdk board
Date: Thu, 29 Aug 2013 10:45:00 +0530
Message-ID: <1377753300-9118-8-git-send-email-rahul.sharma@samsung.com>
References: <1377753300-9118-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42950 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755606Ab3H2EzT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 00:55:19 -0400
In-reply-to: <1377753300-9118-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add hdmi ddc device tree node, which is a I2C device, to
exynos5420 smdk board file.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 6a31341..79524c7 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -76,4 +76,15 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&hdmi_hpd_irq>;
 	};
+
+	i2c_2: i2c@12C80000 {
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <66000>;
+		status = "okay";
+
+		hdmiddc@50 {
+			compatible = "samsung,exynos4210-hdmiddc";
+			reg = <0x50>;
+		};
+	};
 };
-- 
1.7.10.4
