From: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/4] ARM: dts: arndale: Add hdmi phy settings
Date: Thu, 19 Dec 2013 17:42:26 +0530
Message-ID: <1387455148-22999-3-git-send-email-s.shirish@samsung.com>
References: <1387455148-22999-1-git-send-email-s.shirish@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1387455148-22999-1-git-send-email-s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch moves the hdmi phy setting to arndale dts,
as its more of a per board configuration and also
shall be easier for supporting future chipsets.

Signed-off-by: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |   74 ++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index cee55fa..6bc562c 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -475,6 +475,80 @@
 		vdd_osc-supply = <&ldo10_reg>;
 		vdd_pll-supply = <&ldo8_reg>;
 		vdd-supply = <&ldo8_reg>;
+		hdmiphy-configs {
+			/*
+			* Eye diagram test passed for:
+			* Data de-emphasis: -0.7dB & Data Level: 880mV
+			* i.e., 0010 0110 = 0x26
+			* and Clock level of 515mV and diff 1030mV
+			* i.e., 0x66
+			*/
+			config0: config0 {
+				samsung,pixel-clock = <25200000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config1: config1 {
+				samsung,pixel-clock = <27000000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config2: config2 {
+				samsung,pixel-clock = <27027000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config3: config3 {
+				samsung,pixel-clock = <36000000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config4: config4 {
+				samsung,pixel-clock = <40000000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config5: config5 {
+				samsung,pixel-clock = <65000000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config6: config6 {
+				samsung,pixel-clock = <74176000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config7: config7 {
+				samsung,pixel-clock = <74250000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config8: config8 {
+				samsung,pixel-clock = <83500000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config9: config9 {
+				samsung,pixel-clock = <106500000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config10: config10 {
+				samsung,pixel-clock = <108000000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config11: config11 {
+				samsung,pixel-clock = <146250000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+			config12: config12 {
+				samsung,pixel-clock = <148500000>;
+				samsung,de-emphasis-level =  /bits/ 8 <0x26>;
+				samsung,clock-level =  /bits/ 8 < 0x66>;
+			};
+		};
 	};
 
 	regulators {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
