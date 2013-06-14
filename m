From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: dts: Enable RTC node for exynos5250
Date: Fri, 14 Jun 2013 11:26:18 +0530
Message-ID: <1371189378-22823-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:54969 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751031Ab3FNGKy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 02:10:54 -0400
Received: by mail-pd0-f181.google.com with SMTP id 14so236615pdj.40
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jun 2013 23:10:53 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, patches@linaro.org

The kernel dump produced by s3c-rtc driver as reported by
commit 522ccdb6fd0e ("ARM: dts: Disable the RTC by default on exynos5")
are no longer reproducible in latest kernel.

Hence it would be good to re-enable RTC support for EXYNOS5250.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 0673524..ce4a150 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -188,7 +188,6 @@
 		interrupts = <0 43 0>, <0 44 0>;
 		clocks = <&clock 337>;
 		clock-names = "rtc";
-		status = "disabled";
 	};
 
 	tmu@10060000 {
-- 
1.7.9.5
