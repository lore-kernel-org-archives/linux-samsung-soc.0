From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2 2/2] ARM: dts: enable pwm backlight for snow
Date: Mon, 19 May 2014 10:45:40 +0530
Message-ID: <1400476540-14828-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1400476540-14828-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:61791 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994AbaESFRM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 01:17:12 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5T00KTR2OMKS40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 May 2014 14:17:11 +0900 (KST)
In-reply-to: <1400476540-14828-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>, Olof Johansson <olof@lixom.net>

Add PWM backlight node for exynos5250 based snow board.

Signed-off-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/boot/dts/exynos5250-snow.dts |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 9d1ca09..09c79db 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -365,4 +365,14 @@
 		vdd_osc-supply = <&ldo10_reg>;
 		vdd_pll-supply = <&ldo8_reg>;
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
