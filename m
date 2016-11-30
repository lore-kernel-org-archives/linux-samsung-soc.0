From: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: [PATCH] arm64: dts: exynos: Add flash led dt node for TM2 board
Date: Wed, 30 Nov 2016 13:27:42 +0900
Message-ID: <1480480062-3472-1-git-send-email-sw0312.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35768 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752395AbcK3E3D (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 23:29:03 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, Ingi Kim <ingi2.kim@samsung.com>

From: Ingi Kim <ingi2.kim@samsung.com>

This patch adds Kinetic ktd2692 flash led device node for TM2 board.

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index f21bdc2..3ba305f 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -58,6 +58,19 @@
 		reg = <0x0 0x20000000 0x0 0xc0000000>;
 	};
 
+	camera-flash {
+		compatible = "kinetic,ktd2692";
+		ctrl-gpios = <&gpc0 1 0>;
+		aux-gpios = <&gpc0 2 0>;
+
+		flash-led {
+			label = "ktd2692-flash";
+			led-max-microamp = <300000>;
+			flash-max-microamp = <1500000>;
+			flash-max-timeout-us = <1835000>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
-- 
1.7.4.1
