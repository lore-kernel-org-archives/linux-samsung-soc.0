From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Add MFC memory banks to Exynos5420 boards
Date: Mon, 17 Mar 2014 11:41:29 +0530
Message-ID: <1395036689-31382-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:62922 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751799AbaCQGRu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Mar 2014 02:17:50 -0400
Received: by mail-pb0-f41.google.com with SMTP id jt11so5259265pbb.14
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Mar 2014 23:17:49 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

Add MFC memory banks to Exynos5420 based SMDK and Arndale-octa boards.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |    5 +++++
 arch/arm/boot/dts/exynos5420-smdk5420.dts     |    5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index f509e8fc290f..051bde7c3665 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -37,6 +37,11 @@
 		status = "okay";
 	};
 
+	codec@11000000 {
+		samsung,mfc-r = <0x43000000 0x800000>;
+		samsung,mfc-l = <0x51000000 0x800000>;
+	};
+
 	mmc@12200000 {
 		status = "okay";
 		broken-cd;
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index ae1ee0470fca..6a9b4553d802 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -68,6 +68,11 @@
 		status = "okay";
 	};
 
+	codec@11000000 {
+		samsung,mfc-r = <0x43000000 0x800000>;
+		samsung,mfc-l = <0x51000000 0x800000>;
+	};
+
 	mmc@12200000 {
 		status = "okay";
 		broken-cd;
-- 
1.7.9.5
