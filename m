From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: dts: Update display clock frequency for Origen-4210
Date: Thu, 26 Sep 2013 10:20:17 +0530
Message-ID: <1380171018-24229-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:39446 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891Ab3IZEug (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Sep 2013 00:50:36 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so614157pdj.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Sep 2013 21:50:36 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tushar.behera@linaro.org, sachin.kamat@linaro.org, patches@linaro.org

From: Tushar Behera <tushar.behera@linaro.org>

As per the timing information for supported panel, the value should
be between 47.2 MHz to 47.9 MHz for 60Hz refresh rate.

Total horizontal pixels = 1024 (x-res) + 80 (margin) + 48 (hsync) = 1152
Total vertical pixels = 600 (y-res) + 80 (margin) + 3 (vsync) = 653

Target pixel clock rate for refresh rate @60 Hz
	= 1152 * 653 * 60 = 47208960 Hz ~ 47.5 MHz

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 382d8c7..6906e8a 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -301,7 +301,7 @@
 	display-timings {
 		native-mode = <&timing0>;
 		timing0: timing {
-			clock-frequency = <50000>;
+			clock-frequency = <47500000>;
 			hactive = <1024>;
 			vactive = <600>;
 			hfront-porch = <64>;
-- 
1.7.9.5
