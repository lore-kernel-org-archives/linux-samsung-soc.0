From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 2/4] ARM: dts: enable dp-controller for exynos5250 based
 snow board
Date: Fri, 09 May 2014 15:39:44 +0530
Message-ID: <1399630186-22610-3-git-send-email-rahul.sharma@samsung.com>
References: <1399630186-22610-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57814 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753864AbaEIKKa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 06:10:30 -0400
In-reply-to: <1399630186-22610-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Enable dp-controller for snow board.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250-snow.dts |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 796954c..7b10e32 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -207,6 +207,35 @@
 		};
 	};
 
+	dp-controller@145B0000 {
+		status = "okay";
+		pinctrl-names = "default";
+		pinctrl-0 = <&dp_hpd>;
+		samsung,color-space = <0>;
+		samsung,dynamic-range = <0>;
+		samsung,ycbcr-coeff = <0>;
+		samsung,color-depth = <1>;
+		samsung,link-rate = <0x0a>;
+		samsung,lane-count = <2>;
+		samsung,hpd-gpio = <&gpx0 7 0>;
+
+		display-timings {
+			native-mode = <&timing1>;
+
+			timing1: timing@1 {
+				clock-frequency = <70589280>;
+				hactive = <1366>;
+				vactive = <768>;
+				hfront-porch = <40>;
+				hback-porch = <40>;
+				hsync-len = <32>;
+				vback-porch = <10>;
+				vfront-porch = <12>;
+				vsync-len = <6>;
+			};
+		};
+	};
+
 	fimd@14400000 {
 		status = "okay";
 		samsung,invert-vclk;
-- 
1.7.9.5
