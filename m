From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH] ARM: dts: Fix typo in trip point temperature for
 exynos5420/5440
Date: Thu, 07 May 2015 14:24:47 +0530
Message-ID: <1430988887-6743-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61845 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751995AbbEGIyW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 May 2015 04:54:22 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NNZ007DN22KQL50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 May 2015 17:54:21 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org, k.kozlowski@samsung.com, l.majewski@samsung.com, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kesavan.abhilash@gmail.com

Remove the extra zero in the "cpu-crit-0" trip point for exynos5420
and exynos5440.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/boot/dts/exynos5420-trip-points.dtsi | 2 +-
 arch/arm/boot/dts/exynos5440-trip-points.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-trip-points.dtsi b/arch/arm/boot/dts/exynos5420-trip-points.dtsi
index 5d31fc1..2180a01 100644
--- a/arch/arm/boot/dts/exynos5420-trip-points.dtsi
+++ b/arch/arm/boot/dts/exynos5420-trip-points.dtsi
@@ -28,7 +28,7 @@ trips {
 		type = "active";
 	};
 	cpu-crit-0 {
-		temperature = <1200000>; /* millicelsius */
+		temperature = <120000>; /* millicelsius */
 		hysteresis = <0>; /* millicelsius */
 		type = "critical";
 	};
diff --git a/arch/arm/boot/dts/exynos5440-trip-points.dtsi b/arch/arm/boot/dts/exynos5440-trip-points.dtsi
index 48adfa8..356e963 100644
--- a/arch/arm/boot/dts/exynos5440-trip-points.dtsi
+++ b/arch/arm/boot/dts/exynos5440-trip-points.dtsi
@@ -18,7 +18,7 @@ trips {
 		type = "active";
 	};
 	cpu-crit-0 {
-		temperature = <1050000>; /* millicelsius */
+		temperature = <105000>; /* millicelsius */
 		hysteresis = <0>; /* millicelsius */
 		type = "critical";
 	};
-- 
1.9.1
