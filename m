From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V2 1/4] ARM: dts: Fix the watchdog DT node name for Exynos5
Date: Fri, 27 Sep 2013 15:46:23 +0530
Message-ID: <1380276986-24131-2-git-send-email-l.krishna@samsung.com>
References: <1380276986-24131-1-git-send-email-l.krishna@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1380276986-24131-1-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Fixes the watchdog DT node name for Exynos5 as per the DT node naming
convention also update "status" property for Exynos5250 SoC.

Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5.dtsi    |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 074739d..a8bf0c2 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -102,7 +102,7 @@
 		status = "disabled";
 	};
 
-	watchdog {
+	watchdog@101D0000 {
 		compatible = "samsung,s3c2410-wdt";
 		reg = <0x101D0000 0x100>;
 		interrupts = <0 42 0>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 7d7cc77..6bb42cf 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -158,9 +158,10 @@
 		interrupts = <0 47 0>;
 	};
 
-	watchdog {
+	watchdog@101D0000 {
 		clocks = <&clock 336>;
 		clock-names = "watchdog";
+		status = "okay";
 	};
 
 	g2d@10850000 {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
