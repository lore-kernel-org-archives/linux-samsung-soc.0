From: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: [PATCH 4/4] ARM: dts: samsung: add analog audio codec on TOPEET iTop 4412 Elite
Date: Sun, 28 Aug 2016 19:21:09 +0800
Message-ID: <1472383269-3126-5-git-send-email-ayaka@soulik.info>
References: <CAL_JsqKY=VEZ+U11kY+XbMWuXhaFDr6GpnR3AXKd1U=9_=8fgA@mail.gmail.com>
 <1472383269-3126-1-git-send-email-ayaka@soulik.info>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472383269-3126-1-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Enable the WM8960 analog audio codec on TOPEET iTop 4412 Elite board.

Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
---
 arch/arm/boot/dts/exynos4412-itop-elite.dts | 77 +++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index 2d11b9a..e1cda54 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -15,6 +15,7 @@
 
 /dts-v1/;
 #include "exynos4412-itop-scp-core.dtsi"
+#include <dt-bindings/sound/samsung-i2s.h>
 
 / {
 	model = "TOPEET iTop 4412 Elite board based on Exynos4412";
@@ -75,6 +76,54 @@
 			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "wm-sound";
+
+		assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>,
+				<&clock_audss EXYNOS_MOUT_I2S>,
+				<&clock_audss EXYNOS_DOUT_SRP>,
+				<&clock_audss EXYNOS_DOUT_AUD_BUS>;
+		assigned-clock-parents = <&clock CLK_FOUT_EPLL>,
+				<&clock_audss EXYNOS_MOUT_AUDSS>;
+		assigned-clock-rates = <0>,
+				<0>,
+				<112896000>,
+				<11289600>;
+
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&link0_codec>;
+		simple-audio-card,frame-master = <&link0_codec>;
+
+		simple-audio-card,widgets =
+			"Microphone", "Mic Jack",
+			"Line", "Line In",
+			"Line", "Line Out",
+			"Speaker", "Speaker",
+			"Headphone", "Headphone Jack";
+		simple-audio-card,routing =
+			"Headphone Jack", "HP_L",
+			"Headphone Jack", "HP_R",
+			"Speaker", "SPK_LP",
+			"Speaker", "SPK_LN",
+			"Speaker", "SPK_RP",
+			"Speaker", "SPK_RN",
+			"LINPUT1", "Mic Jack",
+			"LINPUT3", "Mic Jack",
+			"RINPUT1", "Mic Jack",
+			"RINPUT2", "Mic Jack";
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s0 0>;
+		};
+
+		link0_codec: simple-audio-card,codec {
+			sound-dai = <&codec>;
+			clocks = <&i2s0 CLK_I2S_CDCLK>;
+			system-clock-frequency = <11289600>;
+		};
+	};
 	
 	beep {
 		compatible = "pwm-beeper";
@@ -143,6 +192,34 @@
 	status = "okay";
 };
 
+&i2c_4 {
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-slave-addr = <0x10>;
+	samsung,i2c-max-bus-freq = <100000>;
+	pinctrl-0 = <&i2c4_bus>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	codec: wm8960@1a {
+		compatible = "wlf,wm8960";
+		reg = <0x1a>;
+		clocks = <&pmu_system_controller 0>;
+		clock-names = "MCLK1";
+		wlf,shared-lrclk;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&i2s0 {
+	pinctrl-0 = <&i2s0_bus>;
+	pinctrl-names = "default";
+	status = "okay";
+	clocks = <&clock_audss EXYNOS_I2S_BUS>,
+		 <&clock_audss EXYNOS_DOUT_AUD_BUS>,
+		 <&clock_audss EXYNOS_SCLK_I2S>;
+	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+};
+
 &pwm {
 	pinctrl-0 = <&pwm1_out>;
 	pinctrl-names = "default";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
