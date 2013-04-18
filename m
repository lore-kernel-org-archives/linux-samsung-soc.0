From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 4/5] ARM: dts: Add clock entries to G2D node for exynos4x12
Date: Thu, 18 Apr 2013 16:45:18 +0530
Message-ID: <1366283719-9615-4-git-send-email-sachin.kamat@linaro.org>
References: <1366283719-9615-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f45.google.com ([209.85.210.45]:60509 "EHLO
	mail-da0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935355Ab3DRL1w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Apr 2013 07:27:52 -0400
Received: by mail-da0-f45.google.com with SMTP id v40so1314591dad.18
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Apr 2013 04:27:51 -0700 (PDT)
In-Reply-To: <1366283719-9615-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added clock entries to G2D node for exynos4x12 DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4x12.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index e3380a7..284abc6 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -77,6 +77,8 @@
 		compatible = "samsung,exynos4212-g2d";
 		reg = <0x10800000 0x1000>;
 		interrupts = <0 89 0>;
+		clocks = <&clock 177>, <&clock 277>;
+		clock-names = "sclk_fimg2d", "fimg2d";
 		status = "disabled";
 	};
 };
-- 
1.7.9.5
