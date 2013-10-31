From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Enable watchdog in Exynos4
Date: Thu, 31 Oct 2013 14:10:45 +0530
Message-ID: <1383208845-17227-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:48409 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751529Ab3JaImM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Oct 2013 04:42:12 -0400
Received: by mail-pa0-f53.google.com with SMTP id kx10so2173154pab.40
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2013 01:42:12 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Enabled watchdog in Exynos4.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index ce24edba7f6d..b7378154c0a1 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -196,7 +196,6 @@
 		interrupts = <0 43 0>;
 		clocks = <&clock 345>;
 		clock-names = "watchdog";
-		status = "disabled";
 	};
 
 	rtc@10070000 {
-- 
1.7.9.5
