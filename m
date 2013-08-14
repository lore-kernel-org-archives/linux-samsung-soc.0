From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v3 2/4] ARM: dts: Remove unsused MFC clock from exynos4
Date: Wed, 14 Aug 2013 17:11:35 +0530
Message-ID: <1376480497-17572-3-git-send-email-arun.kk@samsung.com>
References: <1376480497-17572-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:57733 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759911Ab3HNLlc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 07:41:32 -0400
In-Reply-To: <1376480497-17572-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org, arun.kk@samsung.com

Removes the unused sclk_mfc from exynos4 dtsi file.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 597cfcf..42aa0c9 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -248,8 +248,8 @@
 		reg = <0x13400000 0x10000>;
 		interrupts = <0 94 0>;
 		samsung,power-domain = <&pd_mfc>;
-		clocks = <&clock 170>, <&clock 273>;
-		clock-names = "sclk_mfc", "mfc";
+		clocks = <&clock 273>;
+		clock-names = "mfc";
 		status = "disabled";
 	};
 
-- 
1.7.9.5
