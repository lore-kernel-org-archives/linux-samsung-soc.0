From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2 2/4] ARM: dts: s5pv210: aries: Support for more devices present on Aries
Date: Tue,  8 Jan 2019 17:55:59 +0100
Message-ID: <20190108165601.25708-3-pawel.mikolaj.chmiel@gmail.com>
References: <20190108165601.25708-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108165601.25708-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, pawel.mikolaj.chmiel@gmail.com, xc-racer2@live.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Jonathan Bakker <xc-racer2@live.ca>

This commit enables following devices present on Aries based phones:
- pwm-vibrator attached to PWM 1
- poweroff support
- Atmel maXTouch touchscreen, connected to i2c2
- Broadcom BCM4329 bluetooth over uart0

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
Changes from v1:
   - Touchscreen irq pin should have PULL_NONE, since it's already
     pulled up with 2.8v
   - Touchscreen irq should be edge failing (like in vendor sources)
---
 arch/arm/boot/dts/s5pv210-aries.dtsi | 68 ++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/s5pv210-aries.dtsi b/arch/arm/boot/dts/s5pv210-aries.dtsi
index 89525e56cc7c..8ff70b856334 100644
--- a/arch/arm/boot/dts/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/s5pv210-aries.dtsi
@@ -41,6 +41,13 @@
 		};
 	};
 
+	vibrator_pwr: regulator-fixed-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vibrator-en";
+		enable-active-high;
+		gpio = <&gpj1 1 GPIO_ACTIVE_HIGH>;
+	};
+
 	wifi_pwrseq: wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpg1 2 GPIO_ACTIVE_LOW>;
@@ -314,6 +321,22 @@
 			reg = <0x36>;
 		};
 	};
+
+	vibrator: pwm-vibrator {
+		compatible = "pwm-vibrator";
+		pwms = <&pwm 1 44642 0>;
+		pwm-names = "enable";
+		vcc-supply = <&vibrator_pwr>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm1_out>;
+	};
+
+	poweroff: syscon-poweroff {
+		compatible = "syscon-poweroff";
+		regmap = <&pmu_syscon>;
+		offset = <0x681c>; /* PS_HOLD_CONTROL */
+		value = <0x5200>;
+	};
 };
 
 &fimd {
@@ -347,6 +370,23 @@
 	status = "okay";
 };
 
+&i2c2 {
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-max-bus-freq = <400000>;
+	samsung,i2c-slave-addr = <0x10>;
+	status = "okay";
+
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		interrupt-parent = <&gpj0>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_irq>;
+		reset-gpios = <&gpj1 3 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &mfc {
 	memory-region = <&mfc_left>, <&mfc_right>;
 };
@@ -372,6 +412,13 @@
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
+	bt_host_wake: bt-host-wake {
+		samsung,pins = "gph2-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <S3C64XX_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
 	tf_detect: tf-detect {
 		samsung,pins = "gph3-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
@@ -384,6 +431,17 @@
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
 	};
+
+	ts_irq: ts-irq {
+		samsung,pins = "gpj0-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <S3C64XX_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+};
+
+&pwm {
+	samsung,pwm-outputs = <1>;
 };
 
 &sdhci1 {
@@ -421,6 +479,16 @@
 
 &uart0 {
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <115200>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&uart0_data &uart0_fctl &bt_host_wake>;
+		shutdown-gpios = <&gpb 3 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpg3 4 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gph2 5 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &uart1 {
-- 
2.17.1
