From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: dts: exynos4210-origen: Enable on-board keys as wakeup source
Date: Tue, 18 Sep 2012 15:39:08 +0530
Message-ID: <1347962948-30984-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:38238 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756559Ab2IRKM1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Sep 2012 06:12:27 -0400
Received: by pbbrr13 with SMTP id rr13so10766847pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Sep 2012 03:12:27 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, patches@linaro.org

On board keys on Origen board can serve as wakeup sources, hence they
are marked accordingly in the device tree file.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 0c49caa..e867eb7 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -64,30 +64,35 @@
 			label = "Up";
 			gpios = <&gpx2 0 0 0 2>;
 			linux,code = <103>;
+			gpio-key,wakeup;
 		};
 
 		down {
 			label = "Down";
 			gpios = <&gpx2 1 0 0 2>;
 			linux,code = <108>;
+			gpio-key,wakeup;
 		};
 
 		back {
 			label = "Back";
 			gpios = <&gpx1 7 0 0 2>;
 			linux,code = <158>;
+			gpio-key,wakeup;
 		};
 
 		home {
 			label = "Home";
 			gpios = <&gpx1 6 0 0 2>;
 			linux,code = <102>;
+			gpio-key,wakeup;
 		};
 
 		menu {
 			label = "Menu";
 			gpios = <&gpx1 5 0 0 2>;
 			linux,code = <139>;
+			gpio-key,wakeup;
 		};
 	};
 
-- 
1.7.4.1
