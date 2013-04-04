From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: dts: Add MFC clock entries for exynos4
Date: Thu,  4 Apr 2013 11:56:54 +0530
Message-ID: <1365056815-28000-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:60333 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761003Ab3DDGij (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 02:38:39 -0400
Received: by mail-pb0-f45.google.com with SMTP id ro12so983029pbb.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Apr 2013 23:38:39 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, rob.herring@calxeda.com, sachin.kamat@linaro.org, patches@linaro.org

Added MFC related clock entries in exynos4.dtsi file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
Based on Kukjin's for-next.
Dependent on the below patch:
https://patchwork.kernel.org/patch/2349361/
---
 arch/arm/boot/dts/exynos4.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 59e6730..4061f48 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -150,6 +150,8 @@
 		reg = <0x13400000 0x10000>;
 		interrupts = <0 94 0>;
 		samsung,power-domain = <&pd_mfc>;
+		clocks = <&clock 170>, <&clock 273>;
+		clock-names = "sclk_mfc", "mfc";
 		status = "disabled";
 	};
 
-- 
1.7.9.5
