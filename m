From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 4/7] ARM: dts: Add G2D node to exynos4x12.dtsi
Date: Mon, 18 Feb 2013 10:32:10 +0530
Message-ID: <1361163733-4338-5-git-send-email-sachin.kamat@linaro.org>
References: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:46547 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754668Ab3BRFMY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Feb 2013 00:12:24 -0500
Received: by mail-pa0-f42.google.com with SMTP id kq12so2646398pab.29
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Feb 2013 21:12:24 -0800 (PST)
In-Reply-To: <1361163733-4338-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, patches@linaro.org, sachin.kamat@linaro.org

Added G2D DT node to exynos4x12.dtsi file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4x12.dtsi |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 179a62e..3721eec 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -36,6 +36,13 @@
 			     <0 16 0>, <0 17 0>, <0 18 0>, <0 19 0>;
 	};
 
+	g2d@10800000 {
+		compatible = "samsung,exynos4212-g2d";
+		reg = <0x10800000 0x1000>;
+		interrupts = <0 89 0>;
+		status = "disabled";
+	};
+
 	pinctrl_0: pinctrl@11400000 {
 		compatible = "samsung,pinctrl-exynos4x12";
 		reg = <0x11400000 0x1000>;
-- 
1.7.4.1
