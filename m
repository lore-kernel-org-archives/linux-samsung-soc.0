From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: dts: Add secure firmware support for Arndale-octa
Date: Mon, 19 May 2014 16:39:17 +0530
Message-ID: <1400497757-18991-2-git-send-email-tushar.behera@linaro.org>
References: <1400497757-18991-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:59199 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754075AbaESLLX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 07:11:23 -0400
Received: by mail-pb0-f46.google.com with SMTP id rq2so5747841pbb.33
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2014 04:11:22 -0700 (PDT)
In-Reply-To: <1400497757-18991-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

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
