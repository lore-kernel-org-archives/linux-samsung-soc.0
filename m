From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH v4 09/13] ARM: dts: exynos4: Use labels for overriding
 nodes in Odroid
Date: Mon, 11 May 2015 16:51:49 -0700
Message-ID: <20150511235148.GC4810@localhost.localdomain>
References: <1431351773-2031-1-git-send-email-k.kozlowski.k@gmail.com>
 <1431351773-2031-10-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:33437 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751464AbbEKQvv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 12:51:51 -0400
Content-Disposition: inline
In-Reply-To: <1431351773-2031-10-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org


--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2015 at 10:42:49PM +0900, Krzysztof Kozlowski wrote:
> Usage of labels instead of full paths reduces possible mistakes when
> overriding nodes.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Wrt thermal zones:

Acked-by: Eduardo Valentin <edubezval@gmail.com>

> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 732 ++++++++++++------=
------
>  arch/arm/boot/dts/exynos4412-odroidx.dts        |  16 +-
>  2 files changed, 374 insertions(+), 374 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/b=
oot/dts/exynos4412-odroid-common.dtsi
> index d6b49e5b32e9..ca7d168d1dd6 100644
> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
> @@ -38,16 +38,6 @@
>  		};
>  	};
> =20
> -	i2s0: i2s@03830000 {
> -		pinctrl-0 =3D <&i2s0_bus>;
> -		pinctrl-names =3D "default";
> -		status =3D "okay";
> -		clocks =3D <&clock_audss EXYNOS_I2S_BUS>,
> -			 <&clock_audss EXYNOS_DOUT_AUD_BUS>,
> -			 <&clock_audss EXYNOS_SCLK_I2S>;
> -		clock-names =3D "iis", "i2s_opclk0", "i2s_opclk1";
> -	};
> -
>  	sound: sound {
>  		compatible =3D "simple-audio-card";
>  		assigned-clocks =3D <&clock_audss EXYNOS_MOUT_AUDSS>,
> @@ -83,427 +73,437 @@
>  		reset-gpios =3D <&gpk1 2 1>;
>  	};
> =20
> -	mmc@12550000 {
> -		pinctrl-0 =3D <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
> -		pinctrl-names =3D "default";
> -		vmmc-supply =3D <&ldo20_reg &buck8_reg>;
> -		mmc-pwrseq =3D <&emmc_pwrseq>;
> -		status =3D "okay";
> -
> -		num-slots =3D <1>;
> -		broken-cd;
> -		card-detect-delay =3D <200>;
> -		samsung,dw-mshc-ciu-div =3D <3>;
> -		samsung,dw-mshc-sdr-timing =3D <2 3>;
> -		samsung,dw-mshc-ddr-timing =3D <1 2>;
> -		bus-width =3D <8>;
> -		cap-mmc-highspeed;
> -	};
> -
> -	watchdog@10060000 {
> -		status =3D "okay";
> -	};
> -
> -	rtc@10070000 {
> -		status =3D "okay";
> -		clocks =3D <&clock CLK_RTC>, <&max77686 MAX77686_CLK_AP>;
> -		clock-names =3D "rtc", "rtc_src";
> -	};
> -
> -	g2d@10800000 {
> -		status =3D "okay";
> -	};
> -
>  	camera {
>  		status =3D "okay";
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <>;
> +	};
> =20
> -		fimc_0: fimc@11800000 {
> -			status =3D "okay";
> -			assigned-clocks =3D <&clock CLK_MOUT_FIMC0>,
> -					<&clock CLK_SCLK_FIMC0>;
> -			assigned-clock-parents =3D <&clock CLK_MOUT_MPLL_USER_T>;
> -			assigned-clock-rates =3D <0>, <176000000>;
> -		};
> -
> -		fimc_1: fimc@11810000 {
> -			status =3D "okay";
> -			assigned-clocks =3D <&clock CLK_MOUT_FIMC1>,
> -					<&clock CLK_SCLK_FIMC1>;
> -			assigned-clock-parents =3D <&clock CLK_MOUT_MPLL_USER_T>;
> -			assigned-clock-rates =3D <0>, <176000000>;
> +	fixed-rate-clocks {
> +		xxti {
> +			compatible =3D "samsung,clock-xxti";
> +			clock-frequency =3D <0>;
>  		};
> =20
> -		fimc_2: fimc@11820000 {
> -			status =3D "okay";
> -			assigned-clocks =3D <&clock CLK_MOUT_FIMC2>,
> -					<&clock CLK_SCLK_FIMC2>;
> -			assigned-clock-parents =3D <&clock CLK_MOUT_MPLL_USER_T>;
> -			assigned-clock-rates =3D <0>, <176000000>;
> +		xusbxti {
> +			compatible =3D "samsung,clock-xusbxti";
> +			clock-frequency =3D <24000000>;
>  		};
> +	};
> =20
> -		fimc_3: fimc@11830000 {
> -			status =3D "okay";
> -			assigned-clocks =3D <&clock CLK_MOUT_FIMC3>,
> -					<&clock CLK_SCLK_FIMC3>;
> -			assigned-clock-parents =3D <&clock CLK_MOUT_MPLL_USER_T>;
> -			assigned-clock-rates =3D <0>, <176000000>;
> +	thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			cooling-maps {
> +				map0 {
> +				     /* Corresponds to 800MHz at freq_table */
> +				     cooling-device =3D <&cpu0 7 7>;
> +				};
> +				map1 {
> +				     /* Corresponds to 200MHz at freq_table */
> +				     cooling-device =3D <&cpu0 13 13>;
> +			       };
> +		       };
>  		};
>  	};
> +};
> =20
> -	sdhci@12530000 {
> -		bus-width =3D <4>;
> -		pinctrl-0 =3D <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
> -		pinctrl-names =3D "default";
> -		vmmc-supply =3D <&ldo4_reg &ldo21_reg>;
> -		cd-gpios =3D <&gpk2 2 0>;
> -		cd-inverted;
> -		status =3D "okay";
> -	};
> +/* RSTN signal for eMMC */
> +&sd1_cd {
> +	samsung,pin-pud =3D <0>;
> +	samsung,pin-drv =3D <0>;
> +};
> =20
> -	serial@13800000 {
> -		status =3D "okay";
> +&pinctrl_1 {
> +	gpio_power_key: power_key {
> +		samsung,pins =3D "gpx1-3";
> +		samsung,pin-pud =3D <0>;
>  	};
> =20
> -	serial@13810000 {
> -		status =3D "okay";
> +	max77686_irq: max77686-irq {
> +		samsung,pins =3D "gpx3-2";
> +		samsung,pin-function =3D <0>;
> +		samsung,pin-pud =3D <0>;
> +		samsung,pin-drv =3D <0>;
>  	};
> =20
> -	fixed-rate-clocks {
> -		xxti {
> -			compatible =3D "samsung,clock-xxti";
> -			clock-frequency =3D <0>;
> -		};
> -
> -		xusbxti {
> -			compatible =3D "samsung,clock-xusbxti";
> -			clock-frequency =3D <24000000>;
> -		};
> +	hdmi_hpd: hdmi-hpd {
> +		samsung,pins =3D "gpx3-7";
> +		samsung,pin-pud =3D <1>;
>  	};
> +};
> =20
> -	i2c@13860000 {
> -		pinctrl-0 =3D <&i2c0_bus>;
> -		pinctrl-names =3D "default";
> -		samsung,i2c-sda-delay =3D <100>;
> -		samsung,i2c-max-bus-freq =3D <400000>;
> -		status =3D "okay";
> +&ehci {
> +	status =3D "okay";
> +};
> =20
> -		usb3503: usb3503@08 {
> -			compatible =3D "smsc,usb3503";
> -			reg =3D <0x08>;
> +&exynos_usbphy {
> +	status =3D "okay";
> +};
> =20
> -			intn-gpios =3D <&gpx3 0 0>;
> -			connect-gpios =3D <&gpx3 4 0>;
> -			reset-gpios =3D <&gpx3 5 0>;
> -			initial-mode =3D <1>;
> -		};
> +&fimc_0 {
> +	status =3D "okay";
> +	assigned-clocks =3D <&clock CLK_MOUT_FIMC0>,
> +			<&clock CLK_SCLK_FIMC0>;
> +	assigned-clock-parents =3D <&clock CLK_MOUT_MPLL_USER_T>;
> +	assigned-clock-rates =3D <0>, <176000000>;
> +};
> =20
> -		max77686: pmic@09 {
> -			compatible =3D "maxim,max77686";
> -			interrupt-parent =3D <&gpx3>;
> -			interrupts =3D <2 0>;
> -			pinctrl-names =3D "default";
> -			pinctrl-0 =3D <&max77686_irq>;
> -			reg =3D <0x09>;
> -			#clock-cells =3D <1>;
> -
> -			voltage-regulators {
> -				ldo1_reg: LDO1 {
> -					regulator-name =3D "VDD_ALIVE_1.0V";
> -					regulator-min-microvolt =3D <1000000>;
> -					regulator-max-microvolt =3D <1000000>;
> -					regulator-always-on;
> -				};
> +&fimc_1 {
> +	status =3D "okay";
> +	assigned-clocks =3D <&clock CLK_MOUT_FIMC1>,
> +			<&clock CLK_SCLK_FIMC1>;
> +	assigned-clock-parents =3D <&clock CLK_MOUT_MPLL_USER_T>;
> +	assigned-clock-rates =3D <0>, <176000000>;
> +};
> =20
> -				ldo2_reg: LDO2 {
> -					regulator-name =3D "VDDQ_M1_2_1.8V";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -				};
> +&fimc_2 {
> +	status =3D "okay";
> +	assigned-clocks =3D <&clock CLK_MOUT_FIMC2>,
> +			<&clock CLK_SCLK_FIMC2>;
> +	assigned-clock-parents =3D <&clock CLK_MOUT_MPLL_USER_T>;
> +	assigned-clock-rates =3D <0>, <176000000>;
> +};
> =20
> -				ldo3_reg: LDO3 {
> -					regulator-name =3D "VDDQ_EXT_1.8V";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -				};
> +&fimc_3 {
> +	status =3D "okay";
> +	assigned-clocks =3D <&clock CLK_MOUT_FIMC3>,
> +			<&clock CLK_SCLK_FIMC3>;
> +	assigned-clock-parents =3D <&clock CLK_MOUT_MPLL_USER_T>;
> +	assigned-clock-rates =3D <0>, <176000000>;
> +};
> =20
> -				ldo4_reg: LDO4 {
> -					regulator-name =3D "VDDQ_MMC2_2.8V";
> -					regulator-min-microvolt =3D <2800000>;
> -					regulator-max-microvolt =3D <2800000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +&g2d {
> +	status =3D "okay";
> +};
> =20
> -				ldo5_reg: LDO5 {
> -					regulator-name =3D "VDDQ_MMC1_3_1.8V";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +&hdmi {
> +	hpd-gpio =3D <&gpx3 7 0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&hdmi_hpd>;
> +	vdd-supply =3D <&ldo8_reg>;
> +	vdd_osc-supply =3D <&ldo10_reg>;
> +	vdd_pll-supply =3D <&ldo8_reg>;
> +	ddc =3D <&i2c_2>;
> +	status =3D "okay";
> +};
> =20
> -				ldo6_reg: LDO6 {
> -					regulator-name =3D "VDD10_MPLL_1.0V";
> -					regulator-min-microvolt =3D <1000000>;
> -					regulator-max-microvolt =3D <1000000>;
> -					regulator-always-on;
> -				};
> +&hsotg {
> +	dr_mode =3D "peripheral";
> +	status =3D "okay";
> +	vusb_d-supply =3D <&ldo15_reg>;
> +	vusb_a-supply =3D <&ldo12_reg>;
> +};
> =20
> -				ldo7_reg: LDO7 {
> -					regulator-name =3D "VDD10_XPLL_1.0V";
> -					regulator-min-microvolt =3D <1000000>;
> -					regulator-max-microvolt =3D <1000000>;
> -					regulator-always-on;
> -				};
> +&i2c_0 {
> +	pinctrl-0 =3D <&i2c0_bus>;
> +	pinctrl-names =3D "default";
> +	samsung,i2c-sda-delay =3D <100>;
> +	samsung,i2c-max-bus-freq =3D <400000>;
> +	status =3D "okay";
> +
> +	usb3503: usb3503@08 {
> +		compatible =3D "smsc,usb3503";
> +		reg =3D <0x08>;
> +
> +		intn-gpios =3D <&gpx3 0 0>;
> +		connect-gpios =3D <&gpx3 4 0>;
> +		reset-gpios =3D <&gpx3 5 0>;
> +		initial-mode =3D <1>;
> +	};
> =20
> -				ldo8_reg: ldo@8 {
> -					regulator-compatible =3D "LDO8";
> -					regulator-name =3D "VDD10_HDMI_1.0V";
> -					regulator-min-microvolt =3D <1000000>;
> -					regulator-max-microvolt =3D <1000000>;
> -				};
> +	max77686: pmic@09 {
> +		compatible =3D "maxim,max77686";
> +		interrupt-parent =3D <&gpx3>;
> +		interrupts =3D <2 0>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&max77686_irq>;
> +		reg =3D <0x09>;
> +		#clock-cells =3D <1>;
> +
> +		voltage-regulators {
> +			ldo1_reg: LDO1 {
> +				regulator-name =3D "VDD_ALIVE_1.0V";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +				regulator-always-on;
> +			};
> =20
> -				ldo10_reg: ldo@10 {
> -					regulator-compatible =3D "LDO10";
> -					regulator-name =3D "VDDQ_MIPIHSI_1.8V";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -				};
> +			ldo2_reg: LDO2 {
> +				regulator-name =3D "VDDQ_M1_2_1.8V";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +			};
> =20
> -				ldo11_reg: LDO11 {
> -					regulator-name =3D "VDD18_ABB1_1.8V";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -				};
> +			ldo3_reg: LDO3 {
> +				regulator-name =3D "VDDQ_EXT_1.8V";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +			};
> =20
> -				ldo12_reg: LDO12 {
> -					regulator-name =3D "VDD33_USB_3.3V";
> -					regulator-min-microvolt =3D <3300000>;
> -					regulator-max-microvolt =3D <3300000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +			ldo4_reg: LDO4 {
> +				regulator-name =3D "VDDQ_MMC2_2.8V";
> +				regulator-min-microvolt =3D <2800000>;
> +				regulator-max-microvolt =3D <2800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> =20
> -				ldo13_reg: LDO13 {
> -					regulator-name =3D "VDDQ_C2C_W_1.8V";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +			ldo5_reg: LDO5 {
> +				regulator-name =3D "VDDQ_MMC1_3_1.8V";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> =20
> -				ldo14_reg: LDO14 {
> -					regulator-name =3D "VDD18_ABB0_2_1.8V";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +			ldo6_reg: LDO6 {
> +				regulator-name =3D "VDD10_MPLL_1.0V";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +				regulator-always-on;
> +			};
> =20
> -				ldo15_reg: LDO15 {
> -					regulator-name =3D "VDD10_HSIC_1.0V";
> -					regulator-min-microvolt =3D <1000000>;
> -					regulator-max-microvolt =3D <1000000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +			ldo7_reg: LDO7 {
> +				regulator-name =3D "VDD10_XPLL_1.0V";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +				regulator-always-on;
> +			};
> =20
> -				ldo16_reg: LDO16 {
> -					regulator-name =3D "VDD18_HSIC_1.8V";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +			ldo8_reg: ldo@8 {
> +				regulator-compatible =3D "LDO8";
> +				regulator-name =3D "VDD10_HDMI_1.0V";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +			};
> =20
> -				ldo20_reg: LDO20 {
> -					regulator-name =3D "LDO20_1.8V";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-boot-on;
> -				};
> +			ldo10_reg: ldo@10 {
> +				regulator-compatible =3D "LDO10";
> +				regulator-name =3D "VDDQ_MIPIHSI_1.8V";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +			};
> =20
> -				ldo21_reg: LDO21 {
> -					regulator-name =3D "LDO21_3.3V";
> -					regulator-min-microvolt =3D <3300000>;
> -					regulator-max-microvolt =3D <3300000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +			ldo11_reg: LDO11 {
> +				regulator-name =3D "VDD18_ABB1_1.8V";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +			};
> =20
> -				ldo25_reg: LDO25 {
> -					regulator-name =3D "VDDQ_LCD_1.8V";
> -					regulator-min-microvolt =3D <1800000>;
> -					regulator-max-microvolt =3D <1800000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +			ldo12_reg: LDO12 {
> +				regulator-name =3D "VDD33_USB_3.3V";
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> =20
> -				buck1_reg: BUCK1 {
> -					regulator-name =3D "vdd_mif";
> -					regulator-min-microvolt =3D <1000000>;
> -					regulator-max-microvolt =3D <1000000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +			ldo13_reg: LDO13 {
> +				regulator-name =3D "VDDQ_C2C_W_1.8V";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> =20
> -				buck2_reg: BUCK2 {
> -					regulator-name =3D "vdd_arm";
> -					regulator-min-microvolt =3D <900000>;
> -					regulator-max-microvolt =3D <1350000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +			ldo14_reg: LDO14 {
> +				regulator-name =3D "VDD18_ABB0_2_1.8V";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> =20
> -				buck3_reg: BUCK3 {
> -					regulator-name =3D "vdd_int";
> -					regulator-min-microvolt =3D <1000000>;
> -					regulator-max-microvolt =3D <1000000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +			ldo15_reg: LDO15 {
> +				regulator-name =3D "VDD10_HSIC_1.0V";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> =20
> -				buck4_reg: BUCK4 {
> -					regulator-name =3D "vdd_g3d";
> -					regulator-min-microvolt =3D <900000>;
> -					regulator-max-microvolt =3D <1100000>;
> -					regulator-microvolt-offset =3D <50000>;
> -				};
> +			ldo16_reg: LDO16 {
> +				regulator-name =3D "VDD18_HSIC_1.8V";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> =20
> -				buck5_reg: BUCK5 {
> -					regulator-name =3D "VDDQ_CKEM1_2_1.2V";
> -					regulator-min-microvolt =3D <1200000>;
> -					regulator-max-microvolt =3D <1200000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +			ldo20_reg: LDO20 {
> +				regulator-name =3D "LDO20_1.8V";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-boot-on;
> +			};
> =20
> -				buck6_reg: BUCK6 {
> -					regulator-name =3D "BUCK6_1.35V";
> -					regulator-min-microvolt =3D <1350000>;
> -					regulator-max-microvolt =3D <1350000>;
> -					regulator-always-on;
> -					regulator-boot-on;
> -				};
> +			ldo21_reg: LDO21 {
> +				regulator-name =3D "LDO21_3.3V";
> +				regulator-min-microvolt =3D <3300000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> =20
> -				buck7_reg: BUCK7 {
> -					regulator-name =3D "BUCK7_2.0V";
> -					regulator-min-microvolt =3D <2000000>;
> -					regulator-max-microvolt =3D <2000000>;
> -					regulator-always-on;
> -				};
> +			ldo25_reg: LDO25 {
> +				regulator-name =3D "VDDQ_LCD_1.8V";
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> =20
> -				buck8_reg: BUCK8 {
> -					regulator-name =3D "BUCK8_2.8V";
> -					regulator-min-microvolt =3D <2800000>;
> -					regulator-max-microvolt =3D <2800000>;
> -				};
> +			buck1_reg: BUCK1 {
> +				regulator-name =3D "vdd_mif";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +				regulator-always-on;
> +				regulator-boot-on;
>  			};
> -		};
> -	};
> =20
> -	i2c@13870000 {
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&i2c1_bus>;
> -		status =3D "okay";
> -		max98090: max98090@10 {
> -			compatible =3D "maxim,max98090";
> -			reg =3D <0x10>;
> -			interrupt-parent =3D <&gpx0>;
> -			interrupts =3D <0 0>;
> -			clocks =3D <&i2s0 CLK_I2S_CDCLK>;
> -			clock-names =3D "mclk";
> -			#sound-dai-cells =3D <0>;
> -		};
> -	};
> +			buck2_reg: BUCK2 {
> +				regulator-name =3D "vdd_arm";
> +				regulator-min-microvolt =3D <900000>;
> +				regulator-max-microvolt =3D <1350000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> =20
> -	exynos-usbphy@125B0000 {
> -		status =3D "okay";
> -	};
> +			buck3_reg: BUCK3 {
> +				regulator-name =3D "vdd_int";
> +				regulator-min-microvolt =3D <1000000>;
> +				regulator-max-microvolt =3D <1000000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> =20
> -	hsotg@12480000 {
> -		dr_mode =3D "peripheral";
> -		status =3D "okay";
> -		vusb_d-supply =3D <&ldo15_reg>;
> -		vusb_a-supply =3D <&ldo12_reg>;
> -	};
> +			buck4_reg: BUCK4 {
> +				regulator-name =3D "vdd_g3d";
> +				regulator-min-microvolt =3D <900000>;
> +				regulator-max-microvolt =3D <1100000>;
> +				regulator-microvolt-offset =3D <50000>;
> +			};
> =20
> -	ehci: ehci@12580000 {
> -		status =3D "okay";
> -	};
> +			buck5_reg: BUCK5 {
> +				regulator-name =3D "VDDQ_CKEM1_2_1.2V";
> +				regulator-min-microvolt =3D <1200000>;
> +				regulator-max-microvolt =3D <1200000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> =20
> -	tmu@100C0000 {
> -		vtmu-supply =3D <&ldo10_reg>;
> -		status =3D "okay";
> -	};
> +			buck6_reg: BUCK6 {
> +				regulator-name =3D "BUCK6_1.35V";
> +				regulator-min-microvolt =3D <1350000>;
> +				regulator-max-microvolt =3D <1350000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> =20
> -	thermal-zones {
> -		cpu_thermal: cpu-thermal {
> -			cooling-maps {
> -				map0 {
> -				     /* Corresponds to 800MHz at freq_table */
> -				     cooling-device =3D <&cpu0 7 7>;
> -				};
> -				map1 {
> -				     /* Corresponds to 200MHz at freq_table */
> -				     cooling-device =3D <&cpu0 13 13>;
> -			       };
> -		       };
> +			buck7_reg: BUCK7 {
> +				regulator-name =3D "BUCK7_2.0V";
> +				regulator-min-microvolt =3D <2000000>;
> +				regulator-max-microvolt =3D <2000000>;
> +				regulator-always-on;
> +			};
> +
> +			buck8_reg: BUCK8 {
> +				regulator-name =3D "BUCK8_2.8V";
> +				regulator-min-microvolt =3D <2800000>;
> +				regulator-max-microvolt =3D <2800000>;
> +			};
>  		};
>  	};
> +};
> =20
> -	mixer: mixer@12C10000 {
> -		status =3D "okay";
> +&i2c_1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1_bus>;
> +	status =3D "okay";
> +	max98090: max98090@10 {
> +		compatible =3D "maxim,max98090";
> +		reg =3D <0x10>;
> +		interrupt-parent =3D <&gpx0>;
> +		interrupts =3D <0 0>;
> +		clocks =3D <&i2s0 CLK_I2S_CDCLK>;
> +		clock-names =3D "mclk";
> +		#sound-dai-cells =3D <0>;
>  	};
> +};
> =20
> -	hdmi@12D00000 {
> -		hpd-gpio =3D <&gpx3 7 0>;
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&hdmi_hpd>;
> -		vdd-supply =3D <&ldo8_reg>;
> -		vdd_osc-supply =3D <&ldo10_reg>;
> -		vdd_pll-supply =3D <&ldo8_reg>;
> -		ddc =3D <&hdmi_ddc>;
> -		status =3D "okay";
> -	};
> +&i2c_2 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c2_bus>;
> +};
> =20
> -	hdmi_ddc: i2c@13880000 {
> -		status =3D "okay";
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&i2c2_bus>;
> -	};
> +&i2c_8 {
> +	status =3D "okay";
> +};
> =20
> -	i2c@138E0000 {
> -		status =3D "okay";
> -	};
> +&i2s0 {
> +	pinctrl-0 =3D <&i2s0_bus>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +	clocks =3D <&clock_audss EXYNOS_I2S_BUS>,
> +		 <&clock_audss EXYNOS_DOUT_AUD_BUS>,
> +		 <&clock_audss EXYNOS_SCLK_I2S>;
> +	clock-names =3D "iis", "i2s_opclk0", "i2s_opclk1";
>  };
> =20
> -/* RSTN signal for eMMC */
> -&sd1_cd {
> -	samsung,pin-pud =3D <0>;
> -	samsung,pin-drv =3D <0>;
> +&mixer {
> +	status =3D "okay";
>  };
> =20
> -&pinctrl_1 {
> -	gpio_power_key: power_key {
> -		samsung,pins =3D "gpx1-3";
> -		samsung,pin-pud =3D <0>;
> -	};
> +&mshc_0 {
> +	pinctrl-0 =3D <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
> +	pinctrl-names =3D "default";
> +	vmmc-supply =3D <&ldo20_reg &buck8_reg>;
> +	mmc-pwrseq =3D <&emmc_pwrseq>;
> +	status =3D "okay";
> +
> +	num-slots =3D <1>;
> +	broken-cd;
> +	card-detect-delay =3D <200>;
> +	samsung,dw-mshc-ciu-div =3D <3>;
> +	samsung,dw-mshc-sdr-timing =3D <2 3>;
> +	samsung,dw-mshc-ddr-timing =3D <1 2>;
> +	bus-width =3D <8>;
> +	cap-mmc-highspeed;
> +};
> =20
> -	max77686_irq: max77686-irq {
> -		samsung,pins =3D "gpx3-2";
> -		samsung,pin-function =3D <0>;
> -		samsung,pin-pud =3D <0>;
> -		samsung,pin-drv =3D <0>;
> -	};
> +&rtc {
> +	status =3D "okay";
> +	clocks =3D <&clock CLK_RTC>, <&max77686 MAX77686_CLK_AP>;
> +	clock-names =3D "rtc", "rtc_src";
> +};
> =20
> -	hdmi_hpd: hdmi-hpd {
> -		samsung,pins =3D "gpx3-7";
> -		samsung,pin-pud =3D <1>;
> -	};
> +&sdhci_2 {
> +	bus-width =3D <4>;
> +	pinctrl-0 =3D <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
> +	pinctrl-names =3D "default";
> +	vmmc-supply =3D <&ldo4_reg &ldo21_reg>;
> +	cd-gpios =3D <&gpk2 2 0>;
> +	cd-inverted;
> +	status =3D "okay";
> +};
> +
> +&serial_0 {
> +	status =3D "okay";
> +};
> +
> +&serial_1 {
> +	status =3D "okay";
> +};
> +
> +&tmu {
> +	vtmu-supply =3D <&ldo10_reg>;
> +	status =3D "okay";
> +};
> +
> +&watchdog {
> +	status =3D "okay";
>  };
> diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts=
/exynos4412-odroidx.dts
> index cb1cfe7239c4..679ac103ebf6 100644
> --- a/arch/arm/boot/dts/exynos4412-odroidx.dts
> +++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
> @@ -38,14 +38,6 @@
>  		};
>  	};
> =20
> -	serial@13820000 {
> -		status =3D "okay";
> -	};
> -
> -	serial@13830000 {
> -		status =3D "okay";
> -	};
> -
>  	gpio_keys {
>  		pinctrl-0 =3D <&gpio_power_key &gpio_home_key>;
> =20
> @@ -83,3 +75,11 @@
>  		samsung,pin-pud =3D <0>;
>  	};
>  };
> +
> +&serial_2 {
> +	status =3D "okay";
> +};
> +
> +&serial_3 {
> +	status =3D "okay";
> +};
> --=20
> 2.1.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJVUUCNAAoJEMLUO4d9pOJWDeIH/2gicPo6BhXXaKNKQ4/e4rGE
M6FnYsu5qoPkW3QgnjJT4kb8Nr8s/lyB1YvOcTfDDZzpqrteO3HhDxxrs90yps6b
OZnbJ+D9F3sqtnUZF63clSSxWIwzNt4/jvcf0fBwyjrjSC1bkXcdoKsVz1Tlgqe8
GE5FaAVigJ3cyC9a0b/IiG2lagcM0KzcG3T+hJ3jeGQG4pzFWRa2QJex71X+yfw0
ETn297pmddc4IS5Z5F1ll5Aq0rJl72JfA/xjPcaZCuAXf0Nlfx0f41LQsptXgYqo
nWwrtFXmaETg5LbNreEV00mkHmtwXA+ep4p8BH5pM0O+4i0SnYvC3YahOnXEfGg=
=9GhN
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--
