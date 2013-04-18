From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/5] ARM: dts: Add clock entries to G2D node for exynos4210
Date: Thu, 18 Apr 2013 16:45:17 +0530
Message-ID: <1366283719-9615-3-git-send-email-sachin.kamat@linaro.org>
References: <1366283719-9615-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:52123 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756178Ab3DRL1u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Apr 2013 07:27:50 -0400
Received: by mail-pb0-f43.google.com with SMTP id md4so10697pbc.30
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Apr 2013 04:27:49 -0700 (PDT)
In-Reply-To: <1366283719-9615-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Added clock entries to G2D node.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 66e6b03..50ab9d4 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -117,6 +117,8 @@
 		compatible = "samsung,s5pv210-g2d";
 		reg = <0x12800000 0x1000>;
 		interrupts = <0 89 0>;
+		clocks = <&clock 177>, <&clock 277>;
+		clock-names = "sclk_fimg2d", "fimg2d";
 		status = "disabled";
 	};
 };
-- 
1.7.9.5
