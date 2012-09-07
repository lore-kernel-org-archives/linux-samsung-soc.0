From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH Resend 2/2] ARM: dts: Add heartbeat gpio-leds support to Origen
Date: Fri,  7 Sep 2012 14:36:10 +0530
Message-ID: <1347008770-11421-2-git-send-email-sachin.kamat@linaro.org>
References: <1347008770-11421-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33877 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755052Ab2IGJJI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 05:09:08 -0400
Received: by pbbrr13 with SMTP id rr13so3755207pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Sep 2012 02:09:08 -0700 (PDT)
In-Reply-To: <1347008770-11421-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, sachin.kamat@linaro.org, kgene.kim@samsung.com

Adds heartbeat gpio-leds support to Origen board.

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
