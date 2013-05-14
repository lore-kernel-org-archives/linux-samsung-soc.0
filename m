From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 3/3] ARM: dts: Add display timing node to exynos5250-arndale.dts
Date: Tue, 14 May 2013 19:42:46 +0530
Message-ID: <1368540766-9818-4-git-send-email-vikas.sajjan@linaro.org>
References: <1368540766-9818-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:56039 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755848Ab3ENONL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 May 2013 10:13:11 -0400
Received: by mail-pb0-f42.google.com with SMTP id up7so466843pbc.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 May 2013 07:13:10 -0700 (PDT)
In-Reply-To: <1368540766-9818-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jg1.han@samsung.com, s.trumtrar@pengutronix.de, tomasz.figa@gmail.com, olof@lixom.net, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds display timing node for a DP panel to Arndale Board DTS file

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index f68b820..c371f7c 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -459,4 +459,22 @@
 		samsung,lane-count = <4>;
 	};
 
+	fimd: fimd@14400000 {
+		display-timings {
+			native-mode = <&timing0>;
+			timing0: timing@0 {
+				/* 2560x1600 DP panel */
+				clock-frequency = <50000>;
+				hactive = <2560>;
+				vactive = <1600>;
+				hfront-porch = <48>;
+				hback-porch = <80>;
+				hsync-len = <32>;
+				vback-porch = <16>;
+				vfront-porch = <8>;
+				vsync-len = <6>;
+			};
+		};
+	};
+
 };
-- 
1.7.9.5
