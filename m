From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [RESPIN v2 6/6] ARM: dts: change SROM node compatible from generic to
 model specific
Date: Mon, 11 Apr 2016 13:12:28 +0530
Message-ID: <1460360548-32127-7-git-send-email-pankaj.dubey@samsung.com>
References: <1460360548-32127-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1460360548-32127-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, p.fedin@samsung.com, olof@lixom.net, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch changes SROM nodes compatible from generic to model specific
to match with binding documentation. Also updating property
"samsung,srom-page-mode" as it is not defined as bool instead of int

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi            | 4 ++--
 arch/arm/boot/dts/exynos5.dtsi            | 4 ++--
 arch/arm/boot/dts/exynos5410-smdk5410.dts | 2 +-
 arch/arm/boot/dts/exynos5410.dtsi         | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 000d506..a55a159 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -77,8 +77,8 @@
 		reg = <0x10000000 0x100>;
 	};
 
-	sromc@12570000 {
-		compatible = "samsung,exynos-srom";
+	memory-controller@12570000 {
+		compatible = "samsung,exynos4210-srom";
 		reg = <0x12570000 0x14>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 92313ca..d5c0f18 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -31,8 +31,8 @@
 		reg = <0x10000000 0x100>;
 	};
 
-	sromc@12250000 {
-		compatible = "samsung,exynos-srom";
+	memory-controller@12250000 {
+		compatible = "samsung,exynos4210-srom";
 		reg = <0x12250000 0x14>;
 	};
 
diff --git a/arch/arm/boot/dts/exynos5410-smdk5410.dts b/arch/arm/boot/dts/exynos5410-smdk5410.dts
index a731fbe..0f6429e 100644
--- a/arch/arm/boot/dts/exynos5410-smdk5410.dts
+++ b/arch/arm/boot/dts/exynos5410-smdk5410.dts
@@ -97,7 +97,7 @@
 		smsc,irq-push-pull;
 		smsc,force-internal-phy;
 
-		samsung,srom-page-mode = <1>;
+		samsung,srom-page-mode;
 		samsung,srom-timing = <9 12 1 9 1 1>;
 	};
 };
diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index fa55867..7a56aec 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -102,8 +102,8 @@
 			reg = <0x10000000 0x100>;
 		};
 
-		sromc: sromc@12250000 {
-			compatible = "samsung,exynos-srom";
+		sromc: memory-controller@12250000 {
+			compatible = "samsung,exynos4210-srom";
 			reg = <0x12250000 0x14>;
 			#address-cells = <2>;
 			#size-cells = <1>;
-- 
2.4.5
