From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 3/3] ARM: dts: Add display timing node to exynos5250-arndale.dts
Date: Wed,  8 May 2013 11:31:34 +0530
Message-ID: <1367992894-20198-4-git-send-email-vikas.sajjan@linaro.org>
References: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:37158 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881Ab3EHGCI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 May 2013 02:02:08 -0400
Received: by mail-pb0-f47.google.com with SMTP id uo1so969301pbc.34
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2013 23:02:07 -0700 (PDT)
In-Reply-To: <1367992894-20198-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Adds display timing node for a DP panel to Arndale Board DTS file

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index f68b820..c831a5c 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -459,4 +459,20 @@
 		samsung,lane-count = <4>;
 	};
 
+	display-timings {
+		native-mode = <&timing0>;
+		timing0: timing@0 {
+			/* 2560x1600 DP panel */
+			clock-frequency = <50000>;
+			hactive = <2560>;
+			vactive = <1600>;
+			hfront-porch = <48>;
+			hback-porch = <80>;
+			hsync-len = <32>;
+			vback-porch = <16>;
+			vfront-porch = <8>;
+			vsync-len = <6>;
+		};
+	};
+
 };
-- 
1.7.9.5
