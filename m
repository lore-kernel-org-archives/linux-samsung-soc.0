From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH RESEND 2/2] ARM: dts: Add secure firmware support for Arndale-octa
Date: Tue, 20 May 2014 09:20:10 +0530
Message-ID: <1400557810-28428-2-git-send-email-tushar.behera@linaro.org>
References: <1400557810-28428-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:60431 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103AbaETDwQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 23:52:16 -0400
Received: by mail-pa0-f47.google.com with SMTP id lf10so6668099pab.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 20:52:16 -0700 (PDT)
In-Reply-To: <1400557810-28428-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com

Arndale-Octa board is always configured to work with trustzone
firmware binary. Added DTS node entry to enable this support.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 896a2a6..253d101 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -26,6 +26,11 @@
 		bootargs = "console=ttySAC3,115200";
 	};
 
+	firmware@02073000 {
+		compatible = "samsung,secure-firmware";
+		reg = <0x02073000 0x1000>;
+	};
+
 	fixed-rate-clocks {
 		oscclk {
 			compatible = "samsung,exynos5420-oscclk";
-- 
1.7.9.5
