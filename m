From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH v2 2/2] arm: dt: Exynos5420: populate cpu node enteries to 8 cpus
Date: Thu,  5 Sep 2013 15:52:30 +0530
Message-ID: <1378376550-27762-3-git-send-email-chander.kashyap@linaro.org>
References: <1378376550-27762-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:63305 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932066Ab3IEKWu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Sep 2013 06:22:50 -0400
Received: by mail-pd0-f171.google.com with SMTP id g10so1608825pdj.16
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Sep 2013 03:22:50 -0700 (PDT)
In-Reply-To: <1378376550-27762-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, Chander Kashyap <chander.kashyap@linaro.org>

Exynos5420 is octacore SoC from samsung.
Hence populate all the cpu node enteries.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index e97c87b..0bd1a40 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -57,6 +57,34 @@
 			reg = <0x3>;
 			clock-frequency = <1800000000>;
 		};
+
+		cpu4: cpu@0x100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x100>;
+			clock-frequency = <1000000000>;
+		};
+
+		cpu5: cpu@0x101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x101>;
+			clock-frequency = <1000000000>;
+		};
+
+		cpu6: cpu@0x102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x102>;
+			clock-frequency = <1000000000>;
+		};
+
+		cpu7: cpu@0x103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x103>;
+			clock-frequency = <1000000000>;
+		};
 	};
 
 	clock: clock-controller@0x10010000 {
-- 
1.7.9.5
