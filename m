From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/7] ARM: dts: Add G2D node to exynos4210-origen
Date: Wed,  6 Feb 2013 17:21:13 +0530
Message-ID: <1360151477-26460-4-git-send-email-sachin.kamat@linaro.org>
References: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:34178 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750782Ab3BFMBC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 07:01:02 -0500
Received: by mail-pa0-f53.google.com with SMTP id bg4so763037pad.40
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Feb 2013 04:01:01 -0800 (PST)
In-Reply-To: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

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
