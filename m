From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 4/4] ARM: dts: remove chip specific hdmi hpd pin from board
Date: Thu, 08 May 2014 16:07:59 +0530
Message-ID: <1399545479-20086-5-git-send-email-rahul.sharma@samsung.com>
References: <1399545479-20086-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20842 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753177AbaEHKjA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 06:39:00 -0400
In-reply-to: <1399545479-20086-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

"gpx3-7" is chip specific pin in Exynos5420 for hdmi
hotplug. This pin is moved to exynos5420-pinctrl.dts
and removed from the board file.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |    9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 6910485..11cd9bf 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -131,15 +131,6 @@
 		};
 	};
 
-	pinctrl@13400000 {
-		hdmi_hpd_irq: hdmi-hpd-irq {
-			samsung,pins = "gpx3-7";
-			samsung,pin-function = <0>;
-			samsung,pin-pud = <1>;
-			samsung,pin-drv = <0>;
-		};
-	};
-
 	hdmi@14530000 {
 		status = "okay";
 		hpd-gpio = <&gpx3 7 0>;
-- 
1.7.9.5
