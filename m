From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 2/2] ARM: dts: enable pwm backlight for snow
Date: Thu, 08 May 2014 15:20:42 +0530
Message-ID: <1399542642-10001-2-git-send-email-ajaykumar.rs@samsung.com>
References: <1399542642-10001-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58755 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752845AbaEHJvm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 05:51:42 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N59001B3224XP40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 May 2014 18:51:40 +0900 (KST)
In-reply-to: <1399542642-10001-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ajaynumb@gmail.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>, Olof Johansson <olof@lixom.net>

Add PWM backlight node for exynos5250 based snow board.

Signed-off-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/boot/dts/exynos5250-snow.dts |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 1ce1088..35e4538 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -206,4 +206,14 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 1000000 0>;
+		brightness-levels = <0 100 500 1000 1500 2000 2500 2800>;
+		default-brightness-level = <7>;
+		pinctrl-0 = <&pwm0_out>;
+		pinctrl-names = "default";
+	};
+
 };
-- 
1.7.9.5
