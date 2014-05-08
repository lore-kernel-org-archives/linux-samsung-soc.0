From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 1/5] ARM: dts: move dp hpd line to the board file for
 exynos5420
Date: Thu, 08 May 2014 11:49:51 +0530
Message-ID: <1399529995-8656-2-git-send-email-rahul.sharma@samsung.com>
References: <1399529995-8656-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23779 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103AbaEHGUz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 02:20:55 -0400
In-reply-to: <1399529995-8656-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Display controller HPD Gpio line is board specific. This patch
is moving the pinctrl for hpd gpio line to the respective board
file.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi |    7 -------
 arch/arm/boot/dts/exynos5420-smdk5420.dts |    7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
index ba686e4..7e4ac17 100644
--- a/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5420-pinctrl.dtsi
@@ -59,13 +59,6 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
-
-		dp_hpd: dp_hpd {
-			samsung,pins = "gpx0-7";
-			samsung,pin-function = <3>;
-			samsung,pin-pud = <0>;
-			samsung,pin-drv = <0>;
-		};
 	};
 
 	pinctrl@13410000 {
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 6910485..62d38c8 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -138,6 +138,13 @@
 			samsung,pin-pud = <1>;
 			samsung,pin-drv = <0>;
 		};
+
+		dp_hpd: dp_hpd {
+			samsung,pins = "gpx0-7";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
 	};
 
 	hdmi@14530000 {
-- 
1.7.9.5
