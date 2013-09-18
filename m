From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] ARM: dts: exynos5: add pwm DT nodes to Exynos5250 and
 Exynos5420
Date: Wed, 18 Sep 2013 17:59:16 +0530
Message-ID: <1379507356-16866-1-git-send-email-l.krishna@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Add the device-tree binding for the PWM controller to Exynos5250 and Exynos5420

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |    9 +++++++++
 arch/arm/boot/dts/exynos5420.dtsi |    9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 864ae90..99abc72 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -521,6 +521,15 @@
 		};
 	};
 
+	pwm: pwm@12dd0000 {
+		compatible = "samsung,exynos4210-pwm";
+		reg = <0x12dd0000 0x100>;
+		samsung,pwm-outputs = <0>, <1>, <2>, <3>;
+		#pwm-cells = <3>;
+		clocks = <&clock 311>;
+		clock-names = "timers";
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index d537cd7..80afc8b 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -206,6 +206,15 @@
 		clock-names = "uart", "clk_uart_baud0";
 	};
 
+	pwm: pwm@12dd0000 {
+		compatible = "samsung,exynos4210-pwm";
+		reg = <0x12dd0000 0x100>;
+		samsung,pwm-outputs = <0>, <1>, <2>, <3>;
+		#pwm-cells = <3>;
+		clocks = <&clock 279>;
+		clock-names = "timers";
+	};
+
 	dp_phy: video-phy@10040728 {
 		compatible = "samsung,exynos5250-dp-video-phy";
 		reg = <0x10040728 4>;
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
