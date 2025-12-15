Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DDC26D4DF;
	Mon, 15 Dec 2025 18:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765824831; cv=none; b=oHnlIWdDK9kejMVlqory5lS8wMRX3ZwphTLNU+RHle4kiv2gqBsrWfZVXcGOvUF7iJEBOYr3vKOooJcNdXxFFepBvngzZdhCUBsghSLHKkBCtKo5nn37QzQ+UsyBSUL2TJfRtIdtjzMFl/M10PRGSoxVsPV3/VS5zRrgB8A7PTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765824831; c=relaxed/simple;
	bh=jdomaAaS9ijrM+IJ4dGcHfhGPKYNUFXl7Py3F57Vs18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwVJSUcERSUIjUCes5StPZtwspBAKR08ytmnENATS9vWvYYuLBTpTQGi1Vf/FbxffzTGwRDHVI4z3d8lKWPKKOgmyEWoUeksQjRlJDpLEFxZVNc6tojKyXorPyMxfNk6n64tvIFBG7xBXbyiMpKCqh5c0lVYucWjitwyXvoVL4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=KvaC/607; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="KvaC/607"
Received: from [172.16.12.102] (89-24-64-24.customers.tmcz.cz [89.24.64.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 58E2D53410C1;
	Mon, 15 Dec 2025 19:53:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1765824819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3RptwkM6xp9cJa34frcDFqgOWKE/ckK3f5Wc3OJ+TS0=;
	b=KvaC/607C3U7MqilyvB3zAYnNegJ7MIQA8SdUKqP5VJiaRqZeNdnde7S6+RN/5lxnOBcpV
	t0WTvafZc/a4tWna+L30FQVxCn0sl2vgOJftFXGsws12lHWLklD0JGZQxPCZc7nDez3AJv
	UlZ9tZIFsm3oxqdHC2TZ7HddPRFADOc=
Message-ID: <c62d6c99-0c8d-40e5-95fc-ae73ecaca926@ixit.cz>
Date: Mon, 15 Dec 2025 19:53:37 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] ARM: dts: exynos: Add Google Manta (Nexus 10)
To: Lukas Timmermann <linux@timmermann.space>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
References: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
 <20251215-lat3st-staging-v3-2-2e4914b64dd8@timmermann.space>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20251215-lat3st-staging-v3-2-2e4914b64dd8@timmermann.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Lucas,

thanks for the sending Nexus 10 upstream, see few nitpicks below:

On 15/12/2025 16:05, Lukas Timmermann wrote:
> From: Alexandre Marquet <tb@a-marquet.fr>
> 
> Manta is the code name for Google Nexus 10, and was manufactured by
> Samsung with their Exynos5250 SoC.
> This patch adds initial device-tree file for this board.
> 
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Co-developed-by: Lukas Timmermann <linux@timmermann.space>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>   arch/arm/boot/dts/samsung/Makefile             |   1 +
>   arch/arm/boot/dts/samsung/exynos5250-manta.dts | 511 +++++++++++++++++++++++++
>   2 files changed, 512 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
> index 7becf36656b1..e0143ee8c82d 100644
> --- a/arch/arm/boot/dts/samsung/Makefile
> +++ b/arch/arm/boot/dts/samsung/Makefile
> @@ -26,6 +26,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
>   	exynos4412-trats2.dtb
>   dtb-$(CONFIG_ARCH_EXYNOS5) += \
>   	exynos5250-arndale.dtb \
> +	exynos5250-manta.dtb \
>   	exynos5250-smdk5250.dtb \
>   	exynos5250-snow.dtb \
>   	exynos5250-snow-rev5.dtb \
> diff --git a/arch/arm/boot/dts/samsung/exynos5250-manta.dts b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> new file mode 100644
> index 000000000000..0f006590576c
> --- /dev/null
> +++ b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> @@ -0,0 +1,511 @@
> +// SPDX-License-Identifier: GPL-2.0

you could use here modern SPDX I guess (GPL-2.0-only)

> +/*
> + * Google Manta (Nexus 10) board device tree source
> + *
> + * Copyright (c) 2023-2025 Alexandre Marquet
> + * Copyright (c) 2025 Lukas Timmermann
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/maxim,max77686.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include "exynos-pinctrl.h"
> +#include "exynos5250.dtsi"
> +#include "exynos-mfc-reserved-memory.dtsi"
> +
> +/ {
> +	model = "Google Nexus 10";
> +	compatible = "google,manta", "samsung,exynos5250", "samsung,exynos5";
> +
> +	aliases {
> +		mmc0 = &mmc_0; /* eMMC */
> +		mmc1 = &mmc_1; /* WiFi */
> +	};
> +
> +	bmp180_vdda_reg: regulator-bmp180-vdda {
> +		compatible = "regulator-fixed";
> +		regulator-name = "BMP180_VDDA";
> +	};
something-something-regulator (all occurences within the DTS)

> +
> +	bmp180_vddd_reg: regulator-bmp180-vddd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "BMP180_VDDD";
> +	};
> +
> +	chosen {
> +		stdout-path = &serial_2;
> +	};
> +
> +	fixed-rate-clocks {
> +		xxti {
> +			compatible = "samsung,clock-xxti";
> +			clock-frequency = <24000000>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys>;
> +
> +		key-down {
> +			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			label = "volume down";
> +			debounce-interval = <5>;
> +		};
> +
> +		key-up {
> +			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			label = "volume up";
> +			debounce-interval = <5>;
> +		};
> +
> +		key-power {
> +			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_POWER>;
> +			label = "power";
> +			debounce-interval = <5>;
> +			wakeup-source;
> +		};
> +
> +		lid-switch {
> +			label = "Lid";
> +			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <5>; /* EV_SW */
> +			linux,code = <0>; /* SW_LID */
> +			debounce-interval = <10>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	multi-led {
> +		compatible = "leds-group-multicolor";
> +		color = <LED_COLOR_ID_RGB>;
> +		function = LED_FUNCTION_STATUS;
> +		leds = <&status_red>, <&status_green>, <&status_blue>, <&status_white>;
> +	};
> +
> +	pwrseq: mmc1-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpv1 0 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&wlan_pmena>;
> +		pinctrl-names = "default";
> +		clocks = <&max77686 MAX77686_CLK_PMIC>;
> +		clock-names = "ext_clock";
> +		post-power-on-delay-ms = <300>;
> +		power-off-delay-us = <50>;
> +	};
> +
> +	firmware@203f000 {
> +		compatible = "samsung,secure-firmware";
> +		reg = <0x0204efff 0x1000>;
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x40000000 0x20000000>,
> +		      <0x60000000 0x20000000>,
> +		      <0x80000000 0x20000000>,
> +		      <0xa0000000 0x1ff00000>;
> +	};
> +};
> +
> +&clock {
> +	assigned-clocks = <&clock CLK_FOUT_APLL>;
> +	assigned-clock-rates = <1000000000>;
> +};
> +
> +&cpu0 {
> +	cpu0-supply = <&buck2_reg>;
> +};
> +
> +&ehci {
> +	status = "disabled";
> +};
> +
> +&i2c_0 {
> +	status = "okay";

status should be before first sub-node (none in this case), with 
preceding newline, please change all occurences


> +	samsung,i2c-sda-delay = <100>;
> +	samsung,i2c-slave-addr = <0x10>;
> +};
> +
> +&i2c_1 {
> +	status = "okay";
> +
> +	pressure@77 {
> +		compatible = "bosch,bmp180";
> +		reg = <0x77>;
> +		vddd-supply = <&bmp180_vddd_reg>;
> +		vdda-supply = <&bmp180_vdda_reg>;
> +	};
> +
> +	imu@68 {
> +		compatible = "invensense,mpu6050";
> +		reg = <0x68>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&acc_int>;
> +		interrupt-parent = <&gpx1>;
> +		interrupts = <4 IRQ_TYPE_EDGE_RISING>;
> +		mount-matrix = "0",  "-1",  "0",
> +				"-1",  "0",  "0",
> +				"0",  "0", "-1";
> +
> +		i2c-gate {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			magnetometer@c {
> +				compatible = "asahi-kasei,ak8963";
> +				reg = <0x0c>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&msense_rst>;
> +				mount-matrix = "-1",  "0",  "0",
> +						"0",  "1",  "0",
> +						"0",  "0", "-1";
> +			};
> +		};
> +	};
> +
> +	led-controller@42 {
> +		compatible = "ams,as3668";
> +		reg = <0x42>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		status_red: led@0 {
> +			reg = <0x0>;
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_RED>;
> +		};
> +
> +		status_green: led@1 {
> +			reg = <0x1>;
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +		};
> +
> +		status_blue: led@2 {
> +			reg = <0x2>;
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_BLUE>;
> +		};
> +
> +		status_white: led@3 {
> +			reg = <0x3>;
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_WHITE>;
> +		};
> +	};
> +};
> +
> +&i2c_2 {
> +	status = "okay";
> +
> +	light-sensor@23 {
> +		compatible = "rohm,bh1721";
> +		reg = <0x23>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bh1721fvc_reset>;
> +		reset-gpios = <&gph1 2 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	onewire@18 {
> +		compatible = "maxim,ds2484";
> +		reg = <0x18>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&onewire_sleep>;
> +	};
> +};
> +
> +&i2c_5 {
> +	status = "okay";
> +	samsung,i2c-sda-delay = <100>;
> +
> +	max77686: pmic@9 {
> +		compatible = "maxim,max77686";
> +		reg = <0x09>;
> +		interrupt-parent = <&gpx0>;
> +		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&max77686_irq>;
> +		#clock-cells = <1>;
> +		wakeup-source;
> +
> +		voltage-regulators {
> +			ldo3_reg: LDO3 {
> +				regulator-name = "VCC_1.8V_AP";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +			ldo8_reg: LDO8 {
> +				regulator-name = "VMIPI_1.0V";
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +			ldo9_reg: LDO9 {
> +				regulator-name = "TOUCH_VDD_1.8V";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
> +			ldo10_reg: LDO10 {
> +				regulator-name = "VMIPI_1.8V";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +			ldo12_reg: LDO12 {
> +				regulator-name = "VUOTG_3.0V";
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3000000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +			ldo15_reg: LDO15 {
> +				regulator-name = "VHSIC_1.0V";
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +			ldo16_reg: LDO16 {
> +				regulator-name = "VHSIC_1.8V";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +			ldo17_reg: LDO17 {
> +				regulator-name = "5M_CORE_1.5V";
> +				regulator-min-microvolt = <1500000>;
> +				regulator-max-microvolt = <1500000>;
> +			};
> +			ldo18_reg: LDO18 {
> +				regulator-name = "CAM_IO_1.8V";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
> +			ldo19_reg: LDO19 {
> +				regulator-name = "VT_CAM_1.8V";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +			};
> +			ldo20_reg: LDO20 {
> +				regulator-name = "TA_CHECK_1.35V";
> +				regulator-min-microvolt = <1350000>;
> +				regulator-max-microvolt = <1350000>;
> +			};
> +			ldo23_reg: LDO23 {
> +				regulator-name = "TSP_AVDD_2.8V";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +			};
> +			ldo24_reg: LDO24 {
> +				regulator-name = "CAM_AF_2.8V";
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +			};
> +			ldo25_reg: LDO25 {
> +				regulator-name = "VADC_3.3V";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +			buck1_reg: BUCK1 {
> +				regulator-name = "vdd_mif";
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +			buck2_reg: BUCK2 {
> +				regulator-name = "vdd_arm";
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +			buck3_reg: BUCK3 {
> +				regulator-name = "vdd_int";
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +			buck4_reg: BUCK4 {
> +				regulator-name = "vdd_g3d";
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-boot-on;
> +			};
> +		};
> +	};
> +};
> +
> +&mali {
> +	status = "okay";
> +	mali-supply = <&buck4_reg>;
> +};
> +
> +&mixer {
> +	status = "okay";
> +};
> +
> +/* eMMC */
> +&mmc_0 {
> +	status = "okay";
> +	non-removable;
> +	max-frequency = <200000000>;
> +	sd-uhs-ddr50;
> +	mmc-ddr-1_8v;
> +	cap-mmc-hw-reset;
> +	mmc-hs200-1_8v;
> +	bus-width = <8>;
> +	card-detect-delay = <200>;
> +	samsung,dw-mshc-ciu-div = <3>;
> +	samsung,dw-mshc-sdr-timing = <1 2>;
> +	samsung,dw-mshc-ddr-timing = <2 3>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
> +};
> +
> +/* WiFi */
> +&mmc_1 {
> +	status = "okay";
> +	non-removable;
> +	max-frequency = <100000000>;
> +	sd-uhs-sdr50;
> +	cap-sd-highspeed;
> +	keep-power-in-suspend;
> +	bus-width = <4>;
> +	card-detect-delay = <0>;
> +	samsung,dw-mshc-ciu-div = <3>;
> +	samsung,dw-mshc-sdr-timing = <2 4>;
> +	samsung,dw-mshc-ddr-timing = <2 3>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sd1_clk &sd1_cmd &sd1_bus4>;
> +	mmc-pwrseq = <&pwrseq>;
> +
> +	wifi@1 {
> +		compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
> +		reg = <1>;
> +		interrupt-parent = <&gpx2>;
> +		interrupts = <5 IRQ_TYPE_NONE>;
> +		interrupt-names = "host-wake";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_irq>;
> +	};
> +};
> +
> +&ohci {
> +	status = "disabled";
> +};
> +
> +&pinctrl_0 {
> +	acc_int: acc-int-pins {
> +		samsung,pins = "gpx1-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +	};
> +
> +	max77686_irq: max77686-irq-pins {
> +		samsung,pins = "gpx0-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
> +	};

missing newlines (everywhere below)

> +	gpio_keys: gpio-keys-pins-pins {
> +		samsung,pins = "gpx2-0", "gpx2-1", "gpx2-7", "gpx1-3";
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +	wlan_irq: wlan-irq-pins {
> +		samsung,pins = "gpx2-5";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV3>;
> +	};
> +};
> +
> +&pinctrl_1 {
> +	bh1721fvc_reset: bh1721fvc-reset-pins {
> +		samsung,pins = "gph1-2";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +	msense_rst: msense-rst-pins {
> +		samsung,pins = "gpg2-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +	};
> +	onewire_sleep: onewire-sleep-pins {
> +		samsung,pins = "gpg0-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
> +	};
> +};
> +
> +&pinctrl_2 {
> +	wlan_pmena: wlan-pmena-pins {
> +		samsung,pins = "gpv1-0";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV3>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +		samsung,pin-val = <0>;
> +	};
> +};
> +
> +&pmu_system_controller {
> +	assigned-clocks = <&pmu_system_controller 0>;
> +	assigned-clock-parents = <&clock CLK_FIN_PLL>;
> +};
> +
> +&sd1_bus4 {
> +	samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
> +	samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
> +};
> +
> +&sd1_cmd {
> +	samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
> +	samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
> +};
> +
> +/* Bluetooth */
> +&serial_0 {
> +	status = "disabled";
> +};
> +
> +&serial_1 {
> +	pinctrl-names = "default", "flow-control";
> +	pinctrl-0 = <&uart1_data>;
> +	pinctrl-1 = <&uart1_data>, <&uart1_fctl>;

pinctrl-name follow after last pinctrl- entry.

> +};
> +
> +&serial_2 {
> +	pinctrl-names = "default", "flow-control";
> +	pinctrl-0 = <&uart2_data>;
> +	pinctrl-1 = <&uart2_data>, <&uart2_fctl>;

same

> +};
> +
> +&usbdrd {
> +	status = "disabled";
> +};
> +
> +&usbdrd_dwc3 {
> +	status = "disabled";
> +};
> +
> +&usbdrd_phy {
> +	status = "disabled";
> +};
> 

-- 
David Heidelberg

