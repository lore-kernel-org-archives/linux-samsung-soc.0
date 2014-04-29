From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: dts: Add PD entry to MFC codec on 5420
Date: Tue, 29 Apr 2014 12:19:43 +0530
Message-ID: <1398754183-30764-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:62934 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755136AbaD2GvD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Apr 2014 02:51:03 -0400
Received: by mail-pa0-f49.google.com with SMTP id kq14so736313pab.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2014 23:51:02 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

PD entry was missing in MFC codec node.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 6f662b5cc90d..2fd36b0a7568 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -131,6 +131,7 @@
 		interrupts = <0 96 0>;
 		clocks = <&clock CLK_MFC>;
 		clock-names = "mfc";
+		samsung,power-domain = <&mfc_pd>;
 	};
 
 	mmc_0: mmc@12200000 {
-- 
1.7.9.5
