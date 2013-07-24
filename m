From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 3/3] ARM: dts: exynos: add PMU registers addresses and mask bit
 to watchdog node
Date: Wed, 24 Jul 2013 15:08:19 +0530
Message-ID: <1374658699-3961-4-git-send-email-l.krishna@samsung.com>
References: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36807 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752474Ab3GXJQM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 05:16:12 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF00ER3OBO1W80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 18:15:38 +0900 (KST)
In-reply-to: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, jg1.han@samsung.com, t.figa@samsung.com, sachin.kamat@linaro.org

This patch adds support for specifying the pmu registers and masking bit
for watchdog to enable/disable and mask/unmask the watchdog reset request.

Reviewed-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5.dtsi    |    2 +-
 arch/arm/boot/dts/exynos5420.dtsi |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index f65e124..4d63b74 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -104,7 +104,7 @@
 
 	watchdog {
 		compatible = "samsung,s3c2410-wdt";
-		reg = <0x101D0000 0x100>;
+		reg = <0x101D0000 0x100>, <0x10040408 0x4>, <0x1004040c 0x4>;
 		interrupts = <0 42 0>;
 		status = "disabled";
 	};
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index e1d2d20..ea5b49f 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -150,5 +150,6 @@
 		clocks = <&clock 316>;
 		clock-names = "watchdog";
 		status = "okay";
+		reset-mask-bit = <0>;
 	};
 };
-- 
1.7.10.4
