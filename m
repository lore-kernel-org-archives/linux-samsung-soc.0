From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: dts: Add sdhci node for exynos4412-origen
Date: Thu, 17 Jan 2013 11:18:13 +0530
Message-ID: <1358401693-3361-2-git-send-email-sachin.kamat@linaro.org>
References: <1358401693-3361-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:47207 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751632Ab3AQF4v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 00:56:51 -0500
Received: by mail-pb0-f41.google.com with SMTP id xa7so1193868pbc.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Jan 2013 21:56:50 -0800 (PST)
In-Reply-To: <1358401693-3361-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added sdhci node for exynos4412-origen.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4412-origen.dts |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index fe70bc6..4eba374 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -36,6 +36,14 @@
 		enable-active-high;
 	};
 
+	sdhci@12530000 {
+		bus-width = <4>;
+		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
+		pinctrl-names = "default";
+		vmmc-supply = <&mmc_reg>;
+		status = "okay";
+	};
+
 	serial@13800000 {
 		status = "okay";
 	};
-- 
1.7.4.1
