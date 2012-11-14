From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v3 06/11] ARM: dts: add xxti and xusbxti fixed rate clock nodes for exynos4 based platforms
Date: Thu, 15 Nov 2012 03:37:28 +0530
Message-ID: <1352930853-12268-7-git-send-email-thomas.abraham@linaro.org>
References: <1352930853-12268-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:44128 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933141Ab2KNWJD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Nov 2012 17:09:03 -0500
Received: by mail-pa0-f46.google.com with SMTP id hz1so608817pad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Nov 2012 14:09:03 -0800 (PST)
In-Reply-To: <1352930853-12268-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, mturquette@ti.com, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com, Thomas Abraham <thomas.abraham@linaro.org>

The clock frequency of xxti and xusbxti clocks is dependent on the frequency of the
on-board oscillator that is used to generate these clocks. So allow the frequency
of these clocks to be specfied from device tree.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts   |   12 ++++++++++++
 arch/arm/boot/dts/exynos4210-smdkv310.dts |   12 ++++++++++++
 arch/arm/boot/dts/exynos4412-smdk4412.dts |   12 ++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index f16c99f..de59733 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -121,4 +121,16 @@
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	fixed-rate-clocks {
+		xxti {
+			compatible = "samsung,clock-xxti", "fixed-clock";
+			clock-frequency = <0>;
+		};
+
+		xusbxti {
+			compatible = "samsung,clock-xusbxti", "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index 9b23a82..9a379eb 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -189,4 +189,16 @@
 			};
 		};
 	};
+
+	fixed-rate-clocks {
+		xxti {
+			compatible = "samsung,clock-xxti", "fixed-clock";
+			clock-frequency = <12000000>;
+		};
+
+		xusbxti {
+			compatible = "samsung,clock-xusbxti", "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index f05bf57..8f422fc 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -42,4 +42,16 @@
 	serial@13830000 {
 		status = "okay";
 	};
+
+	fixed-rate-clocks {
+		xxti {
+			compatible = "samsung,clock-xxti", "fixed-clock";
+			clock-frequency = <0>;
+		};
+
+		xusbxti {
+			compatible = "samsung,clock-xusbxti", "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+	};
 };
-- 
1.7.4.4
