From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v2 7/9] ARM: dts: exynos: Use camera label in
 exynos4412-odroid-common
Date: Mon, 05 Feb 2018 08:57:06 +0100
Message-ID: <1517817428-7898-8-git-send-email-m.purski@samsung.com>
References: <1517817428-7898-1-git-send-email-m.purski@samsung.com>
        <CGME20180205075729eucas1p17ce438ffb3d7824a187e14b1c25fef6b@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56124 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752665AbeBEH5d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 02:57:33 -0500
In-reply-to: <1517817428-7898-1-git-send-email-m.purski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Maciej Purski <m.purski@samsung.com>

Camera label has been defined in exynos4.dtsi. Use it in odroid-common
instead of defining a new node.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 556ea78..d7ad07f 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -61,12 +61,6 @@
 		reset-gpios = <&gpk1 2 GPIO_ACTIVE_LOW>;
 	};
 
-	camera {
-		status = "okay";
-		pinctrl-names = "default";
-		pinctrl-0 = <>;
-	};
-
 	fixed-rate-clocks {
 		xxti {
 			compatible = "samsung,clock-xxti";
@@ -142,6 +136,12 @@
 	status = "okay";
 };
 
+&camera {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <>;
+};
+
 &clock_audss {
 	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
 			<&clock_audss EXYNOS_MOUT_I2S>,
-- 
2.7.4
