From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH] ARM: dts: move dp hpd gpio pin to pinctrl_0 for exynos5420
 peach_pit
Date: Wed, 21 May 2014 17:57:22 +0530
Message-ID: <1400675242-7423-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58497 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752566AbaEUM2h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 08:28:37 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

DP Hpd Gpio pin which is "gpx2-6" in Exynos 5420 based peach board,
belongs to Pinctrl_0. It has moved to pinctrl_0 from pinctrl_3.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
Based on Kukjin's for-next branch.

 arch/arm/boot/dts/exynos5420-peach-pit.dts |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index d4127b0..29f64de 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -117,6 +117,13 @@
 		samsung,pin-pud = <1>;
 		samsung,pin-drv = <0>;
 	};
+
+	dp_hpd_gpio: dp_hpd_gpio {
+		samsung,pins = "gpx2-6";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <0>;
+	};
 };
 
 &pinctrl_3 {
@@ -133,13 +140,6 @@
 		samsung,pin-pud = <0>;
 		samsung,pin-drv = <0>;
 	};
-
-	dp_hpd_gpio: dp_hpd_gpio {
-		samsung,pins = "gpx2-6";
-		samsung,pin-function = <0>;
-		samsung,pin-pud = <3>;
-		samsung,pin-drv = <0>;
-	};
 };
 
 &rtc {
-- 
1.7.9.5
