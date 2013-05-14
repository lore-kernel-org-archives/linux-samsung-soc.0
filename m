From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 1/3] ARM: dts: Add DT node for DP controller for Arndale Board
Date: Tue, 14 May 2013 19:42:44 +0530
Message-ID: <1368540766-9818-2-git-send-email-vikas.sajjan@linaro.org>
References: <1368540766-9818-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:46395 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754772Ab3ENONC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 May 2013 10:13:02 -0400
Received: by mail-pa0-f51.google.com with SMTP id ld10so559441pab.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 May 2013 07:13:01 -0700 (PDT)
In-Reply-To: <1368540766-9818-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jg1.han@samsung.com, s.trumtrar@pengutronix.de, tomasz.figa@gmail.com, olof@lixom.net, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Add DT node for DP controller to exynos5250 based Arndale Board

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
Reviewed-by: Jingoo Han <jg1.han@samsung.com>
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
