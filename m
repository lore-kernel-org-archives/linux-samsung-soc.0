From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Keep LDO4 always ON on Arndale board
Date: Mon, 21 Apr 2014 10:33:19 +0530
Message-ID: <1398056599-327-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:62822 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750744AbaDUFE6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 01:04:58 -0400
Received: by mail-pa0-f44.google.com with SMTP id bj1so3349126pad.17
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Apr 2014 22:04:58 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

LDO4 regulator was getting disabled preventing the system from
going into low power states. Keep it always on to fix it.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 090f983..cde19c8 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -107,6 +107,7 @@
 					regulator-name = "VDD_IOPERI_1.8V";
 					regulator-min-microvolt = <1800000>;
 					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
 					op_mode = <1>;
 				};
 
-- 
1.7.9.5
