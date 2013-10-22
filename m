From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: dts: Enable RTC node in exynos4.dtsi file
Date: Tue, 22 Oct 2013 16:06:54 +0530
Message-ID: <1382438215-13215-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:48818 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751826Ab3JVKh7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Oct 2013 06:37:59 -0400
Received: by mail-pa0-f53.google.com with SMTP id kq14so9530379pab.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Oct 2013 03:37:59 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Since there are no board specific properties for the RTC node,
keep it enabled in the dtsi file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index a73eeb5..e262946 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -205,7 +205,6 @@
 		interrupts = <0 44 0>, <0 45 0>;
 		clocks = <&clock 346>;
 		clock-names = "rtc";
-		status = "disabled";
 	};
 
 	keypad@100A0000 {
-- 
1.7.9.5
