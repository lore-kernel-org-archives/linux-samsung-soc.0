From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/3] ARM: EXYNOS: Add G2D support to exynos5250
Date: Fri,  5 Jul 2013 14:12:29 +0530
Message-ID: <1373013749-14530-3-git-send-email-sachin.kamat@linaro.org>
References: <1373013749-14530-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:61964 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757167Ab3GEI6G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Jul 2013 04:58:06 -0400
Received: by mail-pd0-f171.google.com with SMTP id y14so1815656pdi.16
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jul 2013 01:58:06 -0700 (PDT)
In-Reply-To: <1373013749-14530-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, mturquette@linaro.org, inki.dae@samsung.com

Adds G2D node to exynos5250 DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index ef57277..6f356ce 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -163,6 +163,14 @@
 		clock-names = "watchdog";
 	};
 
+	g2d@10850000 {
+		compatible = "samsung,exynos5250-g2d";
+		reg = <0x10850000 0x1000>;
+		interrupts = <0 91 0>;
+		clocks = <&clock 345>;
+		clock-names = "fimg2d";
+	};
+
 	codec@11000000 {
 		compatible = "samsung,mfc-v6";
 		reg = <0x11000000 0x10000>;
-- 
1.7.9.5
