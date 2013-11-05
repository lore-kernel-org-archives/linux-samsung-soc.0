From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v3 1/2] ARM: dts: Fix sysreg node name in exynos4.dtsi
Date: Tue,  5 Nov 2013 11:48:21 +0530
Message-ID: <1383632302-23535-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:60968 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751006Ab3KEGT4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Nov 2013 01:19:56 -0500
Received: by mail-pa0-f52.google.com with SMTP id bj1so8048453pad.39
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Nov 2013 22:19:56 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, t.figa@samsung.com

Fix the name as per DT node naming convention.
- rename the node to syscon which is a more generic name.
- append the register value to the node name.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
Changes since v2:
None.
---
 arch/arm/boot/dts/exynos4.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index cb0f70cc552b..b7378154c0a1 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -99,7 +99,7 @@
 		reg = <0x10440000 0x1000>;
 	};
 
-	sys_reg: sysreg {
+	sys_reg: syscon@10010000 {
 		compatible = "samsung,exynos4-sysreg", "syscon";
 		reg = <0x10010000 0x400>;
 	};
-- 
1.7.9.5
