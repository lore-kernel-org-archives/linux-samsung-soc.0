From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 Resend 2/2] ARM: dts: Add secure firmware support for Arndale-octa
Date: Wed, 28 May 2014 09:43:02 +0530
Message-ID: <1401250382-24046-2-git-send-email-sachin.kamat@linaro.org>
References: <1401250382-24046-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:41140 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774AbaE1EP1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 May 2014 00:15:27 -0400
Received: by mail-pa0-f44.google.com with SMTP id ld10so10280860pab.31
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 May 2014 21:15:27 -0700 (PDT)
In-Reply-To: <1401250382-24046-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, tushar.behera@linaro.org, sachin.kamat@linaro.org, tomasz.figa@gmail.com

From: Tushar Behera <tushar.behera@linaro.org>

Arndale-Octa board is always configured to work with trustzone
firmware binary. Added DTS node entry to enable this support.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 6ee8149fd5c4..434fd9d3e09d 100644
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
