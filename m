From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 4/6] ARM: dts: Add MFC codec support to Origen DT
Date: Wed, 30 Jan 2013 12:41:27 +0530
Message-ID: <1359529889-26318-5-git-send-email-sachin.kamat@linaro.org>
References: <1359529889-26318-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:52838 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753974Ab3A3HUq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 02:20:46 -0500
Received: by mail-pb0-f41.google.com with SMTP id ro12so804458pbb.28
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 23:20:46 -0800 (PST)
In-Reply-To: <1359529889-26318-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

This patch adds MFC codec support to Origen DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index f271001..052606b 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -57,6 +57,12 @@
 		status = "okay";
 	};
 
+	codec@13400000 {
+		samsung,mfc-r = <0x43000000 0x800000>;
+		samsung,mfc-l = <0x51000000 0x800000>;
+		status = "okay";
+	};
+
 	serial@13800000 {
 		status = "okay";
 	};
-- 
1.7.4.1
