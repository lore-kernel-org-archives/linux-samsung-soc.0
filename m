From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/3] ARM: dts: Add firmware node for secure boot on Arndale-octa
Date: Wed, 18 Dec 2013 13:35:35 +0530
Message-ID: <1387353935-1335-3-git-send-email-sachin.kamat@linaro.org>
References: <1387353935-1335-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:33511 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751017Ab3LRIIz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 03:08:55 -0500
Received: by mail-pb0-f42.google.com with SMTP id uo5so8161951pbc.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 00:08:54 -0800 (PST)
In-Reply-To: <1387353935-1335-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kgene.kim@samsung.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org

Add firmware node for doing secure boot on Arndale-octa board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 7340745ff979..ec68b0e89a25 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -24,6 +24,11 @@
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
