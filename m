From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: add max77686 pmic node for smdk5250 board
Date: Sun, 16 Feb 2014 02:09:37 +0900
Message-ID: <52FF9F51.7030009@samsung.com>
References: <1390043340-1184-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:58207 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753443AbaBORJo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Feb 2014 12:09:44 -0500
Received: by mail-pa0-f51.google.com with SMTP id ld10so13670311pab.10
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Feb 2014 09:09:44 -0800 (PST)
In-Reply-To: <1390043340-1184-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

On 01/18/14 20:09, Thomas Abraham wrote:
> From: Thomas Abraham<thomas.ab@samsung.com>
>
> Add Maxim 77686 PMIC node for Exynos5250 based SMDK5250 board.
>
> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5250-smdk5250.dts |  142 +++++++++++++++++++++++++++++
>   1 files changed, 142 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> index 3e69837..5c1b7d9 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -36,6 +36,148 @@
>   			compatible = "samsung,s524ad0xd1";
>   			reg =<0x50>;
>   		};
> +
> +		max77686@09 {
> +			compatible = "maxim,max77686";
> +			reg =<0x09>;
> +
> +			voltage-regulators {
> +				ldo1_reg: LDO1 {
> +					regulator-name = "P1.0V_LDO_OUT1";
> +					regulator-min-microvolt =<1000000>;
> +					regulator-max-microvolt =<1000000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo2_reg: LDO2 {
> +					regulator-name = "P1.2V_LDO_OUT2";
> +					regulator-min-microvolt =<1200000>;
> +					regulator-max-microvolt =<1200000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo3_reg: LDO3 {
> +					regulator-name = "P1.8V_LDO_OUT3";
> +					regulator-min-microvolt =<1800000>;
> +					regulator-max-microvolt =<1800000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo4_reg: LDO4 {
> +					regulator-name = "P2.8V_LDO_OUT4";
> +					regulator-min-microvolt =<2800000>;
> +					regulator-max-microvolt =<2800000>;
> +				};
> +
> +				ldo5_reg: LDO5 {
> +					regulator-name = "P1.8V_LDO_OUT5";
> +					regulator-min-microvolt =<1800000>;
> +					regulator-max-microvolt =<1800000>;
> +				};
> +
> +				ldo6_reg: LDO6 {
> +					regulator-name = "P1.1V_LDO_OUT6";
> +					regulator-min-microvolt =<1100000>;
> +					regulator-max-microvolt =<1100000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo7_reg: LDO7 {
> +					regulator-name = "P1.1V_LDO_OUT7";
> +					regulator-min-microvolt =<1100000>;
> +					regulator-max-microvolt =<1100000>;
> +					regulator-always-on;
> +				};
> +
> +				ldo8_reg: LDO8 {
> +					regulator-name = "P1.0V_LDO_OUT8";
> +					regulator-min-microvolt =<1000000>;
> +					regulator-max-microvolt =<1000000>;
> +				};
> +
> +				ldo10_reg: LDO10 {
> +					regulator-name = "P1.8V_LDO_OUT10";
> +					regulator-min-microvolt =<1800000>;
> +					regulator-max-microvolt =<1800000>;
> +				};
> +
> +				ldo11_reg: LDO11 {
> +					regulator-name = "P1.8V_LDO_OUT11";
> +					regulator-min-microvolt =<1800000>;
> +					regulator-max-microvolt =<1800000>;
> +				};
> +
> +				ldo12_reg: LDO12 {
> +					regulator-name = "P3.0V_LDO_OUT12";
> +					regulator-min-microvolt =<3000000>;
> +					regulator-max-microvolt =<3000000>;
> +				};
> +
> +				ldo13_reg: LDO13 {
> +					regulator-name = "P1.8V_LDO_OUT13";
> +					regulator-min-microvolt =<1800000>;
> +					regulator-max-microvolt =<1800000>;
> +				};
> +
> +				ldo14_reg: LDO14 {
> +					regulator-name = "P1.8V_LDO_OUT14";
> +					regulator-min-microvolt =<1800000>;
> +					regulator-max-microvolt =<1800000>;
> +				};
> +
> +				ldo15_reg: LDO15 {
> +					regulator-name = "P1.0V_LDO_OUT15";
> +					regulator-min-microvolt =<1000000>;
> +					regulator-max-microvolt =<1000000>;
> +				};
> +
> +				ldo16_reg: LDO16 {
> +					regulator-name = "P1.8V_LDO_OUT16";
> +					regulator-min-microvolt =<1800000>;
> +					regulator-max-microvolt =<1800000>;
> +				};
> +
> +				buck1_reg: BUCK1 {
> +					regulator-name = "vdd_mif";
> +					regulator-min-microvolt =<950000>;
> +					regulator-max-microvolt =<1300000>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +				};
> +
> +				buck2_reg: BUCK2 {
> +					regulator-name = "vdd_arm";
> +					regulator-min-microvolt =<850000>;
> +					regulator-max-microvolt =<1350000>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +				};
> +
> +				buck3_reg: BUCK3 {
> +					regulator-name = "vdd_int";
> +					regulator-min-microvolt =<900000>;
> +					regulator-max-microvolt =<1200000>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +				};
> +
> +				buck4_reg: BUCK4 {
> +					regulator-name = "vdd_g3d";
> +					regulator-min-microvolt =<850000>;
> +					regulator-max-microvolt =<1300000>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +				};
> +
> +				buck5_reg: BUCK5 {
> +					regulator-name = "P1.8V_BUCK_OUT5";
> +					regulator-min-microvolt =<1800000>;
> +					regulator-max-microvolt =<1800000>;
> +					regulator-always-on;
> +					regulator-boot-on;
> +				};
> +			};
> +		};
>   	};
>
>   	vdd: fixed-regulator@0 {

Applied, thanks.

- Kukjin
