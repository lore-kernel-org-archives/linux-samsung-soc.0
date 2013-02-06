From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 6/7] ARM: dts: Add G2D node to exynos4412-origen
Date: Wed,  6 Feb 2013 17:21:16 +0530
Message-ID: <1360151477-26460-7-git-send-email-sachin.kamat@linaro.org>
References: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:64183 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782Ab3BFMBL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 07:01:11 -0500
Received: by mail-pa0-f48.google.com with SMTP id hz10so775852pad.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 04:01:11 -0800 (PST)
In-Reply-To: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added G2D DT node to Origen4412 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
This patch is added on top of below patch:
http://www.spinics.net/lists/linux-samsung-soc/msg15543.html
---
 arch/arm/boot/dts/exynos4412-origen.dts |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index daa3884..1df7ebd 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -36,6 +36,10 @@
 		enable-active-high;
 	};
 
+	g2d@10800000 {
+		status = "okay";
+	};
+
 	sdhci@12530000 {
 		bus-width = <4>;
 		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sd2_cd>;
-- 
1.7.4.1
