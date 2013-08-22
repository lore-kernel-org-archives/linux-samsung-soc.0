From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v5 2/3] ARM: dts: Update the "status" property of RTC DT node for Exynos5250 SoC
Date: Thu, 22 Aug 2013 17:03:27 +0530
Message-ID: <1377171208-23515-3-git-send-email-vikas.sajjan@linaro.org>
References: <1377171208-23515-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f50.google.com ([209.85.160.50]:48578 "EHLO
	mail-pb0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753304Ab3HVLdr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 07:33:47 -0400
Received: by mail-pb0-f50.google.com with SMTP id uo5so1652707pbc.37
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2013 04:33:46 -0700 (PDT)
In-Reply-To: <1377171208-23515-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org

Moves the RTC DT node's "status" property from exynos5250 board
(arndale & snow) dts files to exynos5250.dtsi, since the bindings
in exynos5250.dtsi depicts the RTC h/w completely.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |    4 ----
 arch/arm/boot/dts/exynos5250-snow.dts    |    4 ----
 arch/arm/boot/dts/exynos5250.dtsi        |    1 +
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 452d0b0..cee55fa 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -538,10 +538,6 @@
 		};
 	};
 
-	rtc {
-		status = "okay";
-	};
-
 	usb_hub_bus {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index e79331d..fd711e2 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -171,10 +171,6 @@
 		};
 	};
 
-	rtc {
-		status = "okay";
-	};
-
 	/*
 	 * On Snow we've got SIP WiFi and so can keep drive strengths low to
 	 * reduce EMI.
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index b278b00..b054c3c 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -183,6 +183,7 @@
 	rtc@101E0000 {
 		clocks = <&clock 337>;
 		clock-names = "rtc";
+		status = "okay";
 	};
 
 	tmu@10060000 {
-- 
1.7.9.5
