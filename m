From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 3/3] ARM/dts: change compatible strings for hdmi subsystem
Date: Wed, 19 Jun 2013 18:21:09 +0530
Message-ID: <1371646269-21880-4-git-send-email-rahul.sharma@samsung.com>
References: <1371646269-21880-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56030 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934022Ab3FSMaP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 08:30:15 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MON00HDD42EV1V0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 21:30:14 +0900 (KST)
In-reply-to: <1371646269-21880-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

This patch renames the combatible strings for hdmi, mixer, ddc
and hdmiphy. It follows the convention of using compatible string
which represent the SoC in which the IP was added for the first
time.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/cros5250-common.dtsi    |    4 ++--
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    4 ++--
 arch/arm/boot/dts/exynos5250.dtsi         |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index 3f0239e..dc259e8b 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -190,7 +190,7 @@
 		samsung,i2c-max-bus-freq = <66000>;
 
 		hdmiddc@50 {
-			compatible = "samsung,exynos5-hdmiddc";
+			compatible = "samsung,exynos4210-hdmiddc";
 			reg = <0x50>;
 		};
 	};
@@ -224,7 +224,7 @@
 		samsung,i2c-max-bus-freq = <378000>;
 
 		hdmiphy@38 {
-			compatible = "samsung,exynos5-hdmiphy";
+			compatible = "samsung,exynos4212-hdmiphy";
 			reg = <0x38>;
 		};
 	};
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 3e0c792..f320d7c 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -72,7 +72,7 @@
 		samsung,i2c-max-bus-freq = <66000>;
 
 		hdmiddc@50 {
-			compatible = "samsung,exynos5-hdmiddc";
+			compatible = "samsung,exynos4210-hdmiddc";
 			reg = <0x50>;
 		};
 	};
@@ -102,7 +102,7 @@
 		samsung,i2c-max-bus-freq = <66000>;
 
 		hdmiphy@38 {
-			compatible = "samsung,exynos5-hdmiphy";
+			compatible = "samsung,exynos4212-hdmiphy";
 			reg = <0x38>;
 		};
 	};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 0673524..2f7763b 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -601,7 +601,7 @@
 	};
 
 	hdmi {
-		compatible = "samsung,exynos5-hdmi";
+		compatible = "samsung,exynos4212-hdmi";
 		reg = <0x14530000 0x70000>;
 		interrupts = <0 95 0>;
 		clocks = <&clock 333>, <&clock 136>, <&clock 137>,
@@ -611,7 +611,7 @@
 	};
 
 	mixer {
-		compatible = "samsung,exynos5-mixer";
+		compatible = "samsung,exynos5250-mixer";
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
 	};
-- 
1.7.10.4
