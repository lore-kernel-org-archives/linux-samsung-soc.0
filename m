From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH v3 2/2] arm: dt: Exynos5420: populate cpu node enteries to 8 cpus
Date: Thu,  5 Sep 2013 16:59:53 +0530
Message-ID: <1378380593-5305-3-git-send-email-chander.kashyap@linaro.org>
References: <1378380593-5305-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:45598 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935586Ab3IELaM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Sep 2013 07:30:12 -0400
Received: by mail-pa0-f41.google.com with SMTP id bj1so1796053pad.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Sep 2013 04:30:11 -0700 (PDT)
In-Reply-To: <1378380593-5305-1-git-send-email-chander.kashyap@linaro.org>
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
+		cpu4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x100>;
+			clock-frequency = <1000000000>;
+		};
+
+		cpu5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x101>;
+			clock-frequency = <1000000000>;
+		};
+
+		cpu6: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x102>;
+			clock-frequency = <1000000000>;
+		};
+
+		cpu7: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x103>;
+			clock-frequency = <1000000000>;
+		};
 	};
 
 	clock: clock-controller@0x10010000 {
-- 
1.7.9.5
