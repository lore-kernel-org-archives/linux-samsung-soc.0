From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v3 3/4] ARM: dts: Update 5250 MFC node
Date: Wed, 14 Aug 2013 17:11:36 +0530
Message-ID: <1376480497-17572-4-git-send-email-arun.kk@samsung.com>
References: <1376480497-17572-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:44785 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759911Ab3HNLlg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 07:41:36 -0400
In-Reply-To: <1376480497-17572-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org, arun.kk@samsung.com

The patch adds the MFC clock entry for the 5250 SoC.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 88589b7..7c7b0d2 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -176,6 +176,8 @@
 		reg = <0x11000000 0x10000>;
 		interrupts = <0 96 0>;
 		samsung,power-domain = <&pd_mfc>;
+		clocks = <&clock 266>;
+		clock-names = "mfc";
 	};
 
 	rtc {
-- 
1.7.9.5
