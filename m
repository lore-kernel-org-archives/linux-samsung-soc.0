Received: from mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52385D8C98
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2026 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418520; cv=none; b=sRU5Y85NAoJJsz5EJUxvurklZVaVPY5aPkhkaLvFhShtoCoiPTxY6mQ9LP2A1kgoJ/JSp51HUmPp/EuGpRkORcEXcH9Sb0OuuIYt8iitan9jI6OkVQY+HP1UohrEq156hd2N4IBZ1j2EoxKOvDZnbUcQw7MquAIzkPf4zctkef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418520; c=relaxed/simple;
	bh=SzI02gLB31rdRBXdxZnUG15NR4q5JTuaTqI3TN1AySo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJfr8zCPYZ5EyWmY9RMT1rGmxfDFcdX4y8VYstT2z2KvnH2pcJYuLTiOya0xuVj0MKZ/A+vDXttBrtgsJYgNe+1P/6Dl3+GfMuyROuqcMda2DSfUjFnWRzvf3iZFjDLQxLa/SNwF9hqAY8E/akLZwEdEx5+/mG0b2E8XFyWY0nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=gFthlh8R; arc=none smtp.client-ip=95.215.58.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="gFthlh8R"
X-Envelope-To: linux-samsung-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SzI02gLB31rdRBXdxZnUG15NR4q5JTuaTqI3TN1AySo=;
 c=simple/simple; d=grimler.se;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792418514; v=1; x=1793023314;
 b=gFthlh8RqYzvKI1oX2/97UppJJeOMecFST/Nxx/ALUKSoNkuDwlwlXtH8Iib9Xe6gvpPgdO7
 2qrhQBpUpiKjaY1XnHVRFW+bmY/b3dYpgvSu4bLF5WsUHbpgzpJXVdc5cZH3OfGPOe7jHgJST7J
 FV+8P8zFRehCLwM2R8B9ud30=
X-Envelope-To: linux-samsung-soc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 883bce923a1cf950;
	Mon, 19 Oct 2026 14:01:54 +0000
X-Mizu-Trace-ID: 883bce923a1cf950
X-Migadu-Flow: FLOW_OUT
Date: Mon, 19 Oct 2026 16:01:46 +0200
From: Henrik Grimler <henrik@grimler.se>
To: Josef Schlehofer <pepe.schlehofer@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
Message-ID: <20261019140146.GA26863@localhost>
References: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
 <20261018124459.3026-3-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018124459.3026-3-pepe.schlehofer@gmail.com>

Hi Josef,

Running dt-check-style --mode strict exynos4412-odroidu2.dts with
dt-check-style from
https://github.com/krzk/linux/blob/b4/dts-style-checker-blank-lines/scripts/dtc/dt-check-style
shows a few things that can be improved, commented inline.

On Sun, Oct 18, 2026 at 02:44:59PM +0200, Josef Schlehofer wrote:
> ODROID-U2 is a single board computer from Hardkernel based on the
> Samsung Exynos4412 Prime SoC with 2 GB of LPDDR2 RAM. It is the
> predecessor of the ODROID-U3 and shares most of its design:
> - microSD card slot and eMMC module socket
> - SMSC LAN9730 10/100 Ethernet on HSIC0
> - SMSC USB3503A hub on HSIC1 with two USB 2.0 host ports
> - micro-HDMI port with CEC
> - MAX98090 audio codec with a 3.5 mm headphone jack and an on-board
>   digital microphone
> - MAX77686 PMIC
> - 2-pin header for an optional PWM controlled cooling fan
> - blue heartbeat LED
> 
> Unlike the ODROID-U3, the micro-USB port has no VBUS supply switch, so
> it can only work in peripheral mode, and there is no expansion header
> with SPI. The 3.5 mm jack is headphone only and the speaker outputs of
> the codec are not connected.

I compared your linked schematics with the ones for odroid-u3 and
agree that this seems to be all the differences.

> Add an initial device tree for the board, based on the ODROID-U3 one,
> and update the comments in the common dtsi, as the LDO22 and BUCK8
> constraints are now also set by the ODROID-U2.
> 
> Also route "HiFi Capture" to "Mixer DAI RX", as on the ODROID-XU3. The
> odroid sound card driver adds only the playback routes for boards with
> a single CPU DAI, so without it the DPCM capture path to the I2S
> back-end is incomplete and recording from the digital microphone fails
> with "no backend DAIs enabled for Primary".
> 
> Link: https://www.hardkernel.com/shop/odroid-u2/
> Link: https://www.hardkernel.com/blog-2/odroid-u2-u-schematics/
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
> ---
>  arch/arm/boot/dts/samsung/Makefile            |   1 +
>  .../dts/samsung/exynos4412-odroid-common.dtsi |   6 +-
>  .../boot/dts/samsung/exynos4412-odroidu2.dts  | 139 ++++++++++++++++++
>  3 files changed, 143 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
> 
> diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
> index e0143ee8c82d..2a173e4b3e1a 100644
> --- a/arch/arm/boot/dts/samsung/Makefile
> +++ b/arch/arm/boot/dts/samsung/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
>  	exynos4412-i9305.dtb \
>  	exynos4412-itop-elite.dtb \
>  	exynos4412-n710x.dtb \
> +	exynos4412-odroidu2.dtb \
>  	exynos4412-odroidu3.dtb \
>  	exynos4412-odroidx.dtb \
>  	exynos4412-odroidx2.dtb \
> diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
> index 93ddbd4b0a18..b56b92c78c1d 100644
> --- a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
> @@ -414,8 +414,8 @@ ldo21_reg: LDO21 {
>  
>  			ldo22_reg: LDO22 {
>  				/*
> -				 * Only U3 uses it, so let it define the
> -				 * constraints
> +				 * Only U2 and U3 use it, so let them define
> +				 * the constraints
>  				 */
>  				regulator-name = "LDO22";
>  				regulator-boot-on;
> @@ -486,7 +486,7 @@ buck7_reg: BUCK7 {
>  			buck8_reg: BUCK8 {
>  				/*
>  				 * Constraints set by specific board: X,
> -				 * X2 and U3.
> +				 * X2, U2 and U3.
>  				 */
>  				regulator-name = "BUCK8_2.8V";
>  			};
> diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
> new file mode 100644
> index 000000000000..5cb5f874b562
> --- /dev/null
> +++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hardkernel's Exynos4412 based ODROID-U2 board device tree source
> + *
> + * Copyright (c) 2014 Marek Szyprowski <m.szyprowski@samsung.com>
> + * Copyright (c) 2026 Josef Schlehofer <pepe.schlehofer@gmail.com>
> + *
> + * Device tree source file for Hardkernel's ODROID-U2 board which is based
> + * on Samsung's Exynos4412 SoC.
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/leds/common.h>
> +#include "exynos4412-odroid-common.dtsi"
> +#include "exynos4412-prime.dtsi"
> +
> +/ {
> +	model = "Hardkernel ODROID-U2 board based on Exynos4412";
> +	compatible = "hardkernel,odroid-u2", "samsung,exynos4412", "samsung,exynos4";
> +
> +	aliases {
> +		ethernet = &ethernet;
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x40000000 0x7ff00000>;
> +	};

Please move below leds {} so that the nodes are sorted alphabetically.

> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led1 {
> +			function = LED_FUNCTION_HEARTBEAT;
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&gpc1 0 GPIO_ACTIVE_LOW>;
> +			default-state = "on";
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	fan0: pwm-fan {
> +		compatible = "pwm-fan";
> +		pwms = <&pwm 0 10000 0>;
> +		#cooling-cells = <2>;
> +		cooling-levels = <0 102 170 230>;
> +	};
> +};
> +
> +&adc {
> +	vdd-supply = <&ldo10_reg>;
> +	/* Nothing connected to ADC inputs, keep it disabled */
> +};
> +
> +/* Supply for LAN9730/SMSC95xx */
> +&buck8_reg {
> +	regulator-name = "BUCK8_P3V3";
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +};
> +
> +&cpu_thermal {
> +	cooling-maps {
> +		map0 {
> +			trip = <&cpu_alert1>;
> +			cooling-device = <&cpu0 9 9>, <&cpu1 9 9>,
> +					 <&cpu2 9 9>, <&cpu3 9 9>,
> +					 <&fan0 1 2>;
> +		};

Newline here between child nodes please.

> +		map1 {
> +			trip = <&cpu_alert2>;
> +			cooling-device = <&cpu0 15 15>, <&cpu1 15 15>,
> +					 <&cpu2 15 15>, <&cpu3 15 15>,
> +					 <&fan0 2 3>;
> +		};

Newline here between child nodes please.

> +		map2 {
> +			trip = <&cpu_alert0>;
> +			cooling-device = <&fan0 0 1>;
> +		};
> +	};
> +};
> +
> +&ehci {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	phys = <&exynos_usbphy 2>, <&exynos_usbphy 3>;
> +	phy-names = "hsic0", "hsic1";
> +
> +	ethernet: ethernet@2 {
> +		compatible = "usb424,9730";
> +		reg = <2>;
> +		local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
> +	};
> +};
> +
> +&hdmicec {
> +	needs-hpd;
> +};
> +
> +/* No VBUS supply switch on the micro-USB port */
> +&hsotg {
> +	dr_mode = "peripheral";
> +};
> +
> +/* VDDQ for MSHC (eMMC card) */
> +&ldo22_reg {
> +	regulator-name = "LDO22_VDDQ_MMC4_2.8V";
> +	regulator-min-microvolt = <2800000>;
> +	regulator-max-microvolt = <2800000>;
> +};
> +
> +&mshc_0 {
> +	vqmmc-supply = <&ldo22_reg>;
> +};
> +
> +&pwm {
> +	pinctrl-0 = <&pwm0_out>;
> +	pinctrl-names = "default";
> +	samsung,pwm-outputs = <0>;
> +	status = "okay";

Empty line before status please.

> +};
> +
> +&sound {
> +	model = "Odroid-U2";
> +	samsung,audio-widgets =
> +		"Headphone", "Headphone Jack",
> +		"Microphone", "DMIC";

Please sort samsung,audio-widgets after audio-routing (vendor prefixed
properties last).

> +	audio-routing = "Headphone Jack", "HPL",
> +			"Headphone Jack", "HPR",
> +			"DMICL", "DMIC",
> +			"DMICR", "DMIC",
> +			"Mixer DAI RX", "HiFi Capture";
> +};
> +
> +&usb3503 {
> +	clock-names = "refclk";

Please sort clock-names after clocks.

> +	clocks = <&pmu_system_controller 0>;
> +	refclk-frequency = <24000000>;
> +};
> -- 
> 2.54.0 (Apple Git-157)
> 
> 

Best regards
Henrik Grimler
