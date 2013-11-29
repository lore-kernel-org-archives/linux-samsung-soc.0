From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Add missing frequency property to exynos5250
Date: Fri, 29 Nov 2013 17:04:52 +0530
Message-ID: <1385724892-20518-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:38800 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751240Ab3K2LhU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Nov 2013 06:37:20 -0500
Received: by mail-pd0-f176.google.com with SMTP id w10so13683874pde.35
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Nov 2013 03:37:19 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Added missing clock frequency property to CPU node to avoid
boot time warnings.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 9db5047812f3..d871e6241d8a 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -60,11 +60,13 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0>;
+			clock-frequency = <1700000000>;
 		};
 		cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <1>;
+			clock-frequency = <1700000000>;
 		};
 	};
 
-- 
1.7.9.5
