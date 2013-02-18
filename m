From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/7] ARM: dts: Add G2D node to SMDKV310
Date: Mon, 18 Feb 2013 10:32:08 +0530
Message-ID: <1361163733-4338-3-git-send-email-sachin.kamat@linaro.org>
References: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:37020 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754668Ab3BRFMR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Feb 2013 00:12:17 -0500
Received: by mail-pb0-f43.google.com with SMTP id md12so1467121pbc.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Feb 2013 21:12:17 -0800 (PST)
In-Reply-To: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, patches@linaro.org, sachin.kamat@linaro.org

Added G2D DT node to SMDKV310 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-smdkv310.dts |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index 2b1e03a..7bb16aa 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -43,6 +43,10 @@
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
