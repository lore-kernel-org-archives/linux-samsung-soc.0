From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 1/3] ARM: dts: Add DT node for DP controller for Arndale Board
Date: Wed,  8 May 2013 11:31:32 +0530
Message-ID: <1367992894-20198-2-git-send-email-vikas.sajjan@linaro.org>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:46680 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750834Ab3EHGB7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 May 2013 02:01:59 -0400
Received: by mail-pd0-f175.google.com with SMTP id y14so978900pdi.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2013 23:01:59 -0700 (PDT)
In-Reply-To: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Add DT node for DP controller to exynos5250 based Arndale Board

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 02cfc76..f68b820 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -449,4 +449,14 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	dp-controller {
+		samsung,color-space = <0>;
+		samsung,dynamic-range = <0>;
+		samsung,ycbcr-coeff = <0>;
+		samsung,color-depth = <1>;
+		samsung,link-rate = <0x0a>;
+		samsung,lane-count = <4>;
+	};
+
 };
-- 
1.7.9.5
