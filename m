From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v3] ARM: DTS: CROS5250: Add max77686 device tree support
Date: Wed, 13 Feb 2013 09:13:34 +0530
Message-ID: <CAM4voande7QK7=TE5w+zdw-NY+7A243OrKG_YDbEDb9L=w_+uw@mail.gmail.com>
References: <1354099900-24779-1-git-send-email-a.kesavan@samsung.com>
	<1354677702-22669-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:44739 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752329Ab3BMDnf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Feb 2013 22:43:35 -0500
Received: by mail-oa0-f42.google.com with SMTP id i18so873072oag.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Feb 2013 19:43:34 -0800 (PST)
In-Reply-To: <1354677702-22669-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, dianders@chromium.org
Cc: olof@lixom.net, Abhilash Kesavan <a.kesavan@samsung.com>, thomas.abraham@linaro.org, rahul.sharma@samsung.com

Adding Kukjin Kim who was accidentally missed out in the re-worked patches.

On Wed, Dec 5, 2012 at 8:51 AM, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
> The exynos5250 based chromebooks have a max77686 pmic on i2c channel 0.
> Add support for the pmic in the common cros5250 dts file.
> Tested after enabling cpufreq support for exynos5250 SoC and varying the
> arm frequency/voltage using the userspace governer.
>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Acked-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes since v1:
> * Used generic names for the regulators
> * Changed BUCK5 as being default "ON"
> Changes since v2:
> * Fixed the LDO7 name from "P1.0V_LDO_OUT7" to "P1.1V_LDO_OUT7"
>
>  arch/arm/boot/dts/cros5250-common.dtsi |  138 ++++++++++++++++++++++++++++++++
>  1 files changed, 138 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
> index fddd174..8ab8394 100644
> --- a/arch/arm/boot/dts/cros5250-common.dtsi
> +++ b/arch/arm/boot/dts/cros5250-common.dtsi
> @@ -24,6 +24,144 @@
>                 samsung,i2c-max-bus-freq = <378000>;
>                 gpios = <&gpb3 0 2 3 0>,
>                         <&gpb3 1 2 3 0>;
> +
> +               max77686@09 {
> +                       compatible = "maxim,max77686";
> +                       reg = <0x09>;
> +
> +                       voltage-regulators {
> +                               ldo1_reg: LDO1 {
> +                                       regulator-name = "P1.0V_LDO_OUT1";
> +                                       regulator-min-microvolt = <1000000>;
> +                                       regulator-max-microvolt = <1000000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               ldo2_reg: LDO2 {
> +                                       regulator-name = "P1.8V_LDO_OUT2";
> +                                       regulator-min-microvolt = <1800000>;
> +                                       regulator-max-microvolt = <1800000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               ldo3_reg: LDO3 {
> +                                       regulator-name = "P1.8V_LDO_OUT3";
> +                                       regulator-min-microvolt = <1800000>;
> +                                       regulator-max-microvolt = <1800000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               ldo7_reg: LDO7 {
> +                                       regulator-name = "P1.1V_LDO_OUT7";
> +                                       regulator-min-microvolt = <1100000>;
> +                                       regulator-max-microvolt = <1100000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               ldo8_reg: LDO8 {
> +                                       regulator-name = "P1.0V_LDO_OUT8";
> +                                       regulator-min-microvolt = <1000000>;
> +                                       regulator-max-microvolt = <1000000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               ldo10_reg: LDO10 {
> +                                       regulator-name = "P1.8V_LDO_OUT10";
> +                                       regulator-min-microvolt = <1800000>;
> +                                       regulator-max-microvolt = <1800000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               ldo12_reg: LDO12 {
> +                                       regulator-name = "P3.0V_LDO_OUT12";
> +                                       regulator-min-microvolt = <3000000>;
> +                                       regulator-max-microvolt = <3000000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               ldo14_reg: LDO14 {
> +                                       regulator-name = "P1.8V_LDO_OUT14";
> +                                       regulator-min-microvolt = <1800000>;
> +                                       regulator-max-microvolt = <1800000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               ldo15_reg: LDO15 {
> +                                       regulator-name = "P1.0V_LDO_OUT15";
> +                                       regulator-min-microvolt = <1000000>;
> +                                       regulator-max-microvolt = <1000000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               ldo16_reg: LDO16 {
> +                                       regulator-name = "P1.8V_LDO_OUT16";
> +                                       regulator-min-microvolt = <1800000>;
> +                                       regulator-max-microvolt = <1800000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               buck1_reg: BUCK1 {
> +                                       regulator-name = "vdd_mif";
> +                                       regulator-min-microvolt = <950000>;
> +                                       regulator-max-microvolt = <1300000>;
> +                                       regulator-always-on;
> +                                       regulator-boot-on;
> +                               };
> +
> +                               buck2_reg: BUCK2 {
> +                                       regulator-name = "vdd_arm";
> +                                       regulator-min-microvolt = <850000>;
> +                                       regulator-max-microvolt = <1350000>;
> +                                       regulator-always-on;
> +                                       regulator-boot-on;
> +                               };
> +
> +                               buck3_reg: BUCK3 {
> +                                       regulator-name = "vdd_int";
> +                                       regulator-min-microvolt = <900000>;
> +                                       regulator-max-microvolt = <1200000>;
> +                                       regulator-always-on;
> +                                       regulator-boot-on;
> +                               };
> +
> +                               buck4_reg: BUCK4 {
> +                                       regulator-name = "vdd_g3d";
> +                                       regulator-min-microvolt = <850000>;
> +                                       regulator-max-microvolt = <1300000>;
> +                                       regulator-always-on;
> +                                       regulator-boot-on;
> +                               };
> +
> +                               buck5_reg: BUCK5 {
> +                                       regulator-name = "P1.8V_BUCK_OUT5";
> +                                       regulator-min-microvolt = <1800000>;
> +                                       regulator-max-microvolt = <1800000>;
> +                                       regulator-always-on;
> +                                       regulator-boot-on;
> +                               };
> +
> +                               buck6_reg: BUCK6 {
> +                                       regulator-name = "P1.35V_BUCK_OUT6";
> +                                       regulator-min-microvolt = <1350000>;
> +                                       regulator-max-microvolt = <1350000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               buck7_reg: BUCK7 {
> +                                       regulator-name = "P2.0V_BUCK_OUT7";
> +                                       regulator-min-microvolt = <2000000>;
> +                                       regulator-max-microvolt = <2000000>;
> +                                       regulator-always-on;
> +                               };
> +
> +                               buck8_reg: BUCK8 {
> +                                       regulator-name = "P2.85V_BUCK_OUT8";
> +                                       regulator-min-microvolt = <2850000>;
> +                                       regulator-max-microvolt = <2850000>;
> +                                       regulator-always-on;
> +                               };
> +                       };
> +               };
>         };
>
>         i2c@12C70000 {
> --
> 1.6.6.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
