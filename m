From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: specify all the per-cpu interrupts of arch timer for
 exynos5440
Date: Mon, 21 Jan 2013 17:41:27 -0800
Message-ID: <1358818887-16870-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30280 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751635Ab3AVBmH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 20:42:07 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH0006F77E1FZ50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Jan 2013 10:42:05 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MH0001MT7E1A9F0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Jan 2013 10:42:04 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

Need to be changed requirements in the 'cpus' node for exynos5440
to specify all the per-cpu interrupts of arch timer.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |   20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 5406689..c5bd8ed 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -28,7 +28,10 @@
 			compatible = "arm,cortex-a15";
 			timer {
 				compatible = "arm,armv7-timer";
-				interrupts = <1 13 0xf08>;
+				interrupts = <1 13 0xf08>,
+					     <1 14 0xf08>,
+					     <1 11 0xf08>,
+					     <1 10 0xf08>;
 				clock-frequency = <1000000>;
 			};
 		};
@@ -36,7 +39,10 @@
 			compatible = "arm,cortex-a15";
 			timer {
 				compatible = "arm,armv7-timer";
-				interrupts = <1 14 0xf08>;
+				interrupts = <1 13 0xf08>;
+					     <1 14 0xf08>,
+					     <1 11 0xf08>,
+					     <1 10 0xf08>;
 				clock-frequency = <1000000>;
 			};
 		};
@@ -44,7 +50,10 @@
 			compatible = "arm,cortex-a15";
 			timer {
 				compatible = "arm,armv7-timer";
-				interrupts = <1 14 0xf08>;
+				interrupts = <1 13 0xf08>;
+					     <1 14 0xf08>,
+					     <1 11 0xf08>,
+					     <1 10 0xf08>;
 				clock-frequency = <1000000>;
 			};
 		};
@@ -52,7 +61,10 @@
 			compatible = "arm,cortex-a15";
 			timer {
 				compatible = "arm,armv7-timer";
-				interrupts = <1 14 0xf08>;
+				interrupts = <1 13 0xf08>;
+					     <1 14 0xf08>,
+					     <1 11 0xf08>,
+					     <1 10 0xf08>;
 				clock-frequency = <1000000>;
 			};
 		};
-- 
1.7.10.4
