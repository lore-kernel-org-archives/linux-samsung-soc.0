From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 5/5] ARM: dts: enable dp-controller for exynos5420 based
 peach-pit board
Date: Thu, 08 May 2014 11:49:55 +0530
Message-ID: <1399529995-8656-6-git-send-email-rahul.sharma@samsung.com>
References: <1399529995-8656-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23851 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752853AbaEHGVF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 02:21:05 -0400
In-reply-to: <1399529995-8656-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Enable dp-controller for peach-pit board.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts |   34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index f75da5b..ed76f33 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -74,6 +74,13 @@
 		samsung,pin-pud = <0>;
 		samsung,pin-drv = <0>;
 	};
+
+	dp_hpd: dp_hpd {
+		samsung,pins = "gpx2-6";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <0>;
+	};
 };
 
 &rtc {
@@ -150,3 +157,30 @@
 	status = "okay";
 	samsung,invert-vclk;
 };
+
+&dp {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp_hpd>;
+	samsung,color-space = <0>;
+	samsung,dynamic-range = <0>;
+	samsung,ycbcr-coeff = <0>;
+	samsung,color-depth = <1>;
+	samsung,link-rate = <0x06>;
+	samsung,lane-count = <2>;
+	samsung,hpd-gpio = <&gpx2 6 0>;
+	display-timings {
+		native-mode = <&timing1>;
+		timing1: timing@1 {
+			clock-frequency = <70589280>;
+			hactive = <1366>;
+			vactive = <768>;
+			hfront-porch = <40>;
+			hback-porch = <40>;
+			hsync-len = <32>;
+			vback-porch = <10>;
+			vfront-porch = <12>;
+			vsync-len = <6>;
+		};
+	};
+};
-- 
1.7.9.5
