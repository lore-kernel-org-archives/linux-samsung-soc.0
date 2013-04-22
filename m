From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/4] ARM: dts: Add TMU clock entries to exynos4210.dtsi
Date: Mon, 22 Apr 2013 10:02:52 +0530
Message-ID: <1366605175-19161-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:58582 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750825Ab3DVEpY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 00:45:24 -0400
Received: by mail-pd0-f179.google.com with SMTP id x11so3286948pdj.38
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Apr 2013 21:45:23 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Adds TMU clock entries to exynos4210.dtsi file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210.dtsi |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 50ab9d4..53654c4 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -111,6 +111,9 @@
 		interrupt-parent = <&combiner>;
 		reg = <0x100C0000 0x100>;
 		interrupts = <2 4>;
+		clocks = <&clock 383>;
+		clock-names = "tmu_apbif";
+		status = "disabled";
 	};
 
 	g2d@12800000 {
-- 
1.7.9.5
