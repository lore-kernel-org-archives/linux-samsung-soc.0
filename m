From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH 2/2] ARM: dts: Add max77693-haptic node for exynos4412-trats2
Date: Thu, 20 Nov 2014 23:26:16 +0900
Message-ID: <1416493576-10129-2-git-send-email-jaewon02.kim@samsung.com>
References: <1416493576-10129-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32473 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756502AbaKTO01 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 09:26:27 -0500
In-reply-to: <1416493576-10129-1-git-send-email-jaewon02.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Jaewon Kim <jaewon02.kim@samsung.com>

This patch adds max77693-haptic node to support for haptic motor driver.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 72462e8..8ddebbc 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -543,6 +543,12 @@
 					regulator-max-microamp = <2580000>;
 				};
 			};
+
+			max77693_haptic {
+				compatible = "maxim,max77693-haptic";
+				haptic-supply = <&ldo26_reg>;
+				pwms = <&pwm 0 38022 0>;
+			};
 		};
 	};
 
-- 
1.7.9.5
