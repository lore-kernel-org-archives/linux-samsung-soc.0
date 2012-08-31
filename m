From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: dts: Use active low flag for gpio-keys on Origen
Date: Fri, 31 Aug 2012 09:43:49 +0530
Message-ID: <1346386430-3619-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33876 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750766Ab2HaEQa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Aug 2012 00:16:30 -0400
Received: by pbbrr13 with SMTP id rr13so4207834pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Aug 2012 21:16:29 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, sachin.kamat@linaro.org, patches@linaro.org, Olof Johansson <olof@lixom.net>, Thomas Abraham <thomas.abraham@linaro.org>

Commit: f447ed8b31d (gpio: samsung: add flags specifier to
device-tree binding) adds a flag to represent active low state
for gpio line. Since gpio-keys on Origen board are active low,
using this flag to represent the same.

Cc: Olof Johansson <olof@lixom.net>
Cc: Thomas Abraham <thomas.abraham@linaro.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
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
