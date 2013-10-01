From: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH 2/5] ARM: dts: Add dp-controller node to exynos5250-snow
Date: Tue,  1 Oct 2013 19:40:57 -0400
Message-ID: <1380670860-17621-3-git-send-email-seanpaul@chromium.org>
References: <1380670860-17621-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f43.google.com ([209.85.216.43]:51016 "EHLO
	mail-qa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752725Ab3JAXlP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Oct 2013 19:41:15 -0400
Received: by mail-qa0-f43.google.com with SMTP id k15so3877058qaq.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Oct 2013 16:41:15 -0700 (PDT)
In-Reply-To: <1380670860-17621-1-git-send-email-seanpaul@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com
Cc: airlied@linux.ie, Sean Paul <seanpaul@chromium.org>

This patch adds the dp-controller node to the exynos5250-snow board dts
file.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 arch/arm/boot/dts/exynos5250-snow.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index e5af3f2..780511a 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -190,6 +190,18 @@
 		samsung,vbus-gpio = <&gpx1 1 0>;
 	};
 
+	dp-controller {
+		samsung,color-space = <0>;
+		samsung,dynamic-range = <0>;
+		samsung,ycbcr-coeff = <0>;
+		samsung,color-depth = <1>;
+		samsung,link-rate = <0x0a>;
+		samsung,lane-count = <2>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&dp_hpd>;
+	};
+
 	fimd: fimd@14400000 {
 		display-timings {
 			native-mode = <&lcd_timing>;
-- 
1.8.4
