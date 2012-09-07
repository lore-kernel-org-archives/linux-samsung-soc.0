From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH Resend 1/2] ARM: dts: Use active low flag for gpio-keys on Origen
Date: Fri,  7 Sep 2012 14:36:09 +0530
Message-ID: <1347008770-11421-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:59526 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755052Ab2IGJJE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 05:09:04 -0400
Received: by dady13 with SMTP id y13so1680263dad.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Sep 2012 02:09:04 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, sachin.kamat@linaro.org, kgene.kim@samsung.com

Commit: f447ed8b31d (gpio: samsung: add flags specifier to
device-tree binding) adds a flag to represent active low state
for gpio line. Since gpio-keys on Origen board are active low,
using this flag to represent the same.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 0c49caa..c37edf0 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -62,31 +62,31 @@
 
 		up {
 			label = "Up";
-			gpios = <&gpx2 0 0 0 2>;
+			gpios = <&gpx2 0 0 0x10000 2>;
 			linux,code = <103>;
 		};
 
 		down {
 			label = "Down";
-			gpios = <&gpx2 1 0 0 2>;
+			gpios = <&gpx2 1 0 0x10000 2>;
 			linux,code = <108>;
 		};
 
 		back {
 			label = "Back";
-			gpios = <&gpx1 7 0 0 2>;
+			gpios = <&gpx1 7 0 0x10000 2>;
 			linux,code = <158>;
 		};
 
 		home {
 			label = "Home";
-			gpios = <&gpx1 6 0 0 2>;
+			gpios = <&gpx1 6 0 0x10000 2>;
 			linux,code = <102>;
 		};
 
 		menu {
 			label = "Menu";
-			gpios = <&gpx1 5 0 0 2>;
+			gpios = <&gpx1 5 0 0x10000 2>;
 			linux,code = <139>;
 		};
 	};
-- 
1.7.4.1
