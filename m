From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH v2 1/2] ARM: DTS: use new compatible string for thermistors in
 trats2
Date: Fri, 27 Jun 2014 11:38:14 +0530
Message-ID: <1403849295-29538-2-git-send-email-ch.naveen@samsung.com>
References: <1403849295-29538-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1403849295-29538-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, gregkh@linuxfoundation.org, naveenkrishna.ch@gmail.com, cpgs@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

As Murata Manufactures the NTC based thermistors. The vendor
name in the compatibility is preposed to change to "murata"

This patch uses the new compatibility string in exynos4412 based
Trats2 board.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
---
Changes since v1: None

 arch/arm/boot/dts/exynos4412-trats2.dts |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 11967f4..d35755a 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -771,7 +771,7 @@
 	};
 
 	thermistor-ap@0 {
-		compatible = "ntc,ncp15wb473";
+		compatible = "murata,ncp15wb473";
 		pullup-uv = <1800000>;	 /* VCC_1.8V_AP */
 		pullup-ohm = <100000>;	 /* 100K */
 		pulldown-ohm = <100000>; /* 100K */
@@ -779,7 +779,7 @@
 	};
 
 	thermistor-battery@1 {
-		compatible = "ntc,ncp15wb473";
+		compatible = "murata,ncp15wb473";
 		pullup-uv = <1800000>;	 /* VCC_1.8V_AP */
 		pullup-ohm = <100000>;	 /* 100K */
 		pulldown-ohm = <100000>; /* 100K */
-- 
1.7.9.5
