From: Tony K Nadackal <tony.kn@samsung.com>
Subject: [PATCH] arm64: dts: Add jpeg device node for Exynos7
Date: Wed, 17 Dec 2014 13:09:36 +0530
Message-ID: <1418801976-22820-1-git-send-email-tony.kn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39380 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751234AbaLQHqp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Dec 2014 02:46:45 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, a.kesavan@samsung.com, bhushan.r@samsung.com, Tony K Nadackal <tony.kn@samsung.com>

Add jpeg device node for Exynos7

Signed-off-by: Tony K Nadackal <tony.kn@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 332537c..db3561f 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -562,6 +562,15 @@
 			clocks = <&clock_peric0 PCLK_PWM>;
 			clock-names = "timers";
 		};
+
+		jpeg: jpeg_codec@15020000 {
+			compatible = "samsung,exynos7-jpeg";
+			reg = <0x15020000 0x1000>;
+			interrupts = <0 434 0>;
+			clocks = <&clock_mscl ACLK_JPEG>;
+			clock-names = "jpeg";
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.2.0
