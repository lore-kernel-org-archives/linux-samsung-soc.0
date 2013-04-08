From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 1/2] ARM: dts: Add MFC clock entries for exynos4
Date: Mon,  8 Apr 2013 11:44:16 +0530
Message-ID: <1365401657-5428-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f49.google.com ([209.85.210.49]:56055 "EHLO
	mail-da0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934769Ab3DHG0U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Apr 2013 02:26:20 -0400
Received: by mail-da0-f49.google.com with SMTP id t11so2454236daj.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Apr 2013 23:26:19 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added MFC related clock entries in exynos4.dtsi file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Based on Kukjin's for-next tree.
No change since v1 (except added reviewed-by tag).
---
 arch/arm/boot/dts/exynos4.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 800ff11..74f18d2 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -155,6 +155,8 @@
 		reg = <0x13400000 0x10000>;
 		interrupts = <0 94 0>;
 		samsung,power-domain = <&pd_mfc>;
+		clocks = <&clock 170>, <&clock 273>;
+		clock-names = "sclk_mfc", "mfc";
 		status = "disabled";
 	};
 
-- 
1.7.9.5
