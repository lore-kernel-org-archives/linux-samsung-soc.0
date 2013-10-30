From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: dts: Fix sysreg node name in exynos4.dtsi
Date: Wed, 30 Oct 2013 15:35:53 +0530
Message-ID: <1383127554-13854-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:41332 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753756Ab3J3KHQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Oct 2013 06:07:16 -0400
Received: by mail-pa0-f42.google.com with SMTP id kp14so733020pab.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2013 03:07:16 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org

Fix the name as per DT node naming convention.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index e262946..68479c3 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -99,7 +99,7 @@
 		reg = <0x10440000 0x1000>;
 	};
 
-	sys_reg: sysreg {
+	sys_reg: sysreg@10010000 {
 		compatible = "samsung,exynos4-sysreg", "syscon";
 		reg = <0x10010000 0x400>;
 	};
-- 
1.7.9.5
