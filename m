From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: dts: Add heartbeat gpio-leds support to Origen
Date: Fri, 31 Aug 2012 09:43:50 +0530
Message-ID: <1346386430-3619-2-git-send-email-sachin.kamat@linaro.org>
References: <1346386430-3619-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33876 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750766Ab2HaEQd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Aug 2012 00:16:33 -0400
Received: by mail-pb0-f46.google.com with SMTP id rr13so4207834pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Aug 2012 21:16:33 -0700 (PDT)
In-Reply-To: <1346386430-3619-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, sachin.kamat@linaro.org, patches@linaro.org, Thomas Abraham <thomas.abraham@linaro.org>

Adds heartbeat gpio-leds support to Origen board.

Cc: Thomas Abraham <thomas.abraham@linaro.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index c37edf0..d69a799 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -91,6 +91,14 @@
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+		status {
+			gpios = <&gpx1 3 0 0x10000 2>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	keypad@100A0000 {
 		status = "disabled";
 	};
-- 
1.7.4.1
