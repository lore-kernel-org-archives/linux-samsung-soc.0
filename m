From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH 2/2] arm: dt: Exynos5420: populate cpu node enteries to 8 cpus
Date: Thu,  5 Sep 2013 14:54:46 +0530
Message-ID: <1378373086-30676-3-git-send-email-chander.kashyap@linaro.org>
References: <1378373086-30676-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:61536 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1763464Ab3IEJZG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Sep 2013 05:25:06 -0400
Received: by mail-pa0-f45.google.com with SMTP id bg4so1656566pad.32
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Sep 2013 02:25:06 -0700 (PDT)
In-Reply-To: <1378373086-30676-1-git-send-email-chander.kashyap@linaro.org>
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
index e97c87b..59489f6 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -57,6 +57,34 @@
 			reg = <0x3>;
 			clock-frequency = <1800000000>;
 		};
+
+		cpu4: cpu@4 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x100>;
+			clock-frequency = <1000000000>;
+		};
+
+		cpu5: cpu@5 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x101>;
+			clock-frequency = <1000000000>;
+		};
+
+		cpu6: cpu@6 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x102>;
+			clock-frequency = <1000000000>;
+		};
+
+		cpu7: cpu@7 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x103>;
+			clock-frequency = <1000000000>;
+		};
 	};
 
 	clock: clock-controller@0x10010000 {
-- 
1.7.9.5
