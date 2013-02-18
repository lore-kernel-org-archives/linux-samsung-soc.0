From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/7] ARM: dts: Add G2D node to exynos4210-origen
Date: Mon, 18 Feb 2013 10:32:09 +0530
Message-ID: <1361163733-4338-4-git-send-email-sachin.kamat@linaro.org>
References: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f44.google.com ([209.85.210.44]:34076 "EHLO
	mail-da0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757515Ab3BRFMV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Feb 2013 00:12:21 -0500
Received: by mail-da0-f44.google.com with SMTP id z20so2296488dae.31
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Feb 2013 21:12:20 -0800 (PST)
In-Reply-To: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, patches@linaro.org, sachin.kamat@linaro.org

Added G2D DT node to Origen4210 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 052606b..e081d89 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -57,6 +57,10 @@
 		status = "okay";
 	};
 
+	g2d@12800000 {
+		status = "okay";
+	};
+
 	codec@13400000 {
 		samsung,mfc-r = <0x43000000 0x800000>;
 		samsung,mfc-l = <0x51000000 0x800000>;
-- 
1.7.4.1
