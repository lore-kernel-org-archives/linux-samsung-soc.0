From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 2/5] ARM: dts: OdroidXU3: Enable TMU at Exynos5422 base.
Date: Fri, 10 Apr 2015 01:14:16 +0930
Message-ID: <1428594259-3915-3-git-send-email-linux.amoon@gmail.com>
References: <1428594259-3915-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36244 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754072AbbDIPov (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Apr 2015 11:44:51 -0400
In-Reply-To: <1428594259-3915-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Eduardo Valentin <edubezval@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>

This commit enables TMU IP block on the Exynos5422 OdroidXU3
device.

Tested on OdroidXU3 board.

Changes since v1 : None

Tested-by: Markus Reichl <m.reichl@fivetechno.de>
Acked-by: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index 04d982b..6e7ee53 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -287,6 +287,31 @@
 		#cooling-cells = <2>;
 		cooling-levels = <0 130 170 230>;
 	};
+
+	tmu@10060000 {
+		vtmu-supply = <&ldo10_reg>;
+		status = "okay";
+	};
+
+	tmu@10064000 {
+		vtmu-supply = <&ldo10_reg>;
+		status = "okay";
+	};
+
+	tmu@10068000 {
+		vtmu-supply = <&ldo10_reg>;
+		status = "okay";
+	};
+
+	tmu@1006c000 {
+		vtmu-supply = <&ldo10_reg>;
+		status = "okay";
+	};
+
+	tmu@100a0000 {
+		vtmu-supply = <&ldo10_reg>;
+		status = "okay";
+	};
 };
 
 &hdmi {
-- 
1.9.1
