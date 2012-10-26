From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 7/7] ARM: dts: Add pin controller node for Samsung EXYNOS5440 SoC
Date: Sat, 27 Oct 2012 02:55:53 +0900
Message-ID: <1351274153-3120-7-git-send-email-kgene.kim@samsung.com>
References: <1351274153-3120-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:38952 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965545Ab2JZR46 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Oct 2012 13:56:58 -0400
Received: by mail-pa0-f46.google.com with SMTP id hz1so2086959pad.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Oct 2012 10:56:57 -0700 (PDT)
In-Reply-To: <1351274153-3120-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>

From: Thomas Abraham <thomas.abraham@linaro.org>

Add a pin controller node for Samsung Exynos5440 (EXYNOS5440) SoC.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index 380a89a..a7cda84 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -90,6 +90,23 @@
 		reg = <0xE0000 0x1000>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		#gpio-cells = <2>;
+
+		fan: fan {
+			samsung,exynos5440-pin-function = <1>;
+		};
+
+		hdd_led0: hdd_led0 {
+			samsung,exynos5440-pin-function = <2>;
+		};
+
+		hdd_led1: hdd_led1 {
+			samsung,exynos5440-pin-function = <3>;
+		};
+
+		uart1: uart1 {
+			samsung,exynos5440-pin-function = <4>;
+		};
 	};
 
 	i2c@F0000 {
-- 
1.7.4.4
