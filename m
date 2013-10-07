From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [Patch v4 2/2] ARM: dts: Exynos5420: populate cpu node entries to 8 cpus
Date: Mon,  7 Oct 2013 09:47:10 +0530
Message-ID: <1381119431-12697-3-git-send-email-chander.kashyap@linaro.org>
References: <1381119431-12697-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:36654 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751596Ab3JGERh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Oct 2013 00:17:37 -0400
Received: by mail-pd0-f175.google.com with SMTP id q10so6595361pdj.34
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Oct 2013 21:17:37 -0700 (PDT)
In-Reply-To: <1381119431-12697-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, thomas.abraham@linaro.org, sylvester.nawrocki@gmail.com, Chander Kashyap <chander.kashyap@linaro.org>

Exynos5420 is octa-core SoC from Samsung.
Hence populate all the CPU node entries.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index e97c87b..a28cc40 100644
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
