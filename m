From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/4] ARM: dts: Enable TMU on Origen4210 board
Date: Mon, 22 Apr 2013 10:02:53 +0530
Message-ID: <1366605175-19161-2-git-send-email-sachin.kamat@linaro.org>
References: <1366605175-19161-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f41.google.com ([209.85.210.41]:40180 "EHLO
	mail-da0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750861Ab3DVEp1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 00:45:27 -0400
Received: by mail-da0-f41.google.com with SMTP id p8so2772399dan.28
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Apr 2013 21:45:26 -0700 (PDT)
In-Reply-To: <1366605175-19161-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Enables TMU on Origen4210 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 524b908..8b0a781 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -41,6 +41,10 @@
 		enable-active-high;
 	};
 
+	tmu@100C0000 {
+		status = "okay";
+	};
+
 	sdhci@12530000 {
 		bus-width = <4>;
 		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
-- 
1.7.9.5
