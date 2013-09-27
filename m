From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V2 4/4] ARM: dts: exynos: add PMU registers addresses and mask
 bit to watchdog node
Date: Fri, 27 Sep 2013 15:46:26 +0530
Message-ID: <1380276986-24131-5-git-send-email-l.krishna@samsung.com>
References: <1380276986-24131-1-git-send-email-l.krishna@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1380276986-24131-1-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds support for specifying the pmu registers and masking bit
for watchdog to enable/disable and mask/unmask the watchdog reset request.

Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5.dtsi    |    4 ++--
 arch/arm/boot/dts/exynos5250.dtsi |    1 +
 arch/arm/boot/dts/exynos5420.dtsi |    1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index a8bf0c2..764c290 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -103,8 +103,8 @@
 	};
 
 	watchdog@101D0000 {
-		compatible = "samsung,s3c2410-wdt";
-		reg = <0x101D0000 0x100>;
+		compatible = "samsung,s3c5250-wdt";
+		reg = <0x101D0000 0x100>, <0x10040408 0x4>, <0x1004040c 0x4>;
 		interrupts = <0 42 0>;
 		status = "disabled";
 	};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 6bb42cf..8bf28a7a 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -161,6 +161,7 @@
 	watchdog@101D0000 {
 		clocks = <&clock 336>;
 		clock-names = "watchdog";
+		reset-mask-bit = <20>;
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9fadc23..29235ea 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -189,6 +189,7 @@
 	watchdog@101D0000 {
 		clocks = <&clock 316>;
 		clock-names = "watchdog";
+		reset-mask-bit = <0>;
 		status = "okay";
 	};
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
