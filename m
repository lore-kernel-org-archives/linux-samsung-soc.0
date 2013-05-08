From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 2/3] ARM: dts: Add clock provider information for DP controller in Exynos5250 SoC
Date: Wed,  8 May 2013 11:31:33 +0530
Message-ID: <1367992894-20198-3-git-send-email-vikas.sajjan@linaro.org>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:53045 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750834Ab3EHGCE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 May 2013 02:02:04 -0400
Received: by mail-pa0-f41.google.com with SMTP id rl6so1081071pac.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2013 23:02:03 -0700 (PDT)
In-Reply-To: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds clock provider information for DP controller required by CCF.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 4bd9e9c..2773d22 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -651,6 +651,8 @@
 		reg = <0x145b0000 0x1000>;
 		interrupts = <10 3>;
 		interrupt-parent = <&combiner>;
+		clocks = <&clock 342>;
+		clock-names = "dp";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-- 
1.7.9.5
