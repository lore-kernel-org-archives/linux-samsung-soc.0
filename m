From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH] ARM: dts: Add dwmmc DT nodes for exynos5420 SOC
Date: Mon, 19 Aug 2013 15:47:12 +0530
Message-ID: <CAGm_ybiRQZ7zgNNxsjixDDJ84a5=o+PWwLZrnowp5wK=xoobxg@mail.gmail.com>
References: <1376894399-2766-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:34876 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750852Ab3HSKRO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Aug 2013 06:17:14 -0400
In-Reply-To: <1376894399-2766-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, devicetree@vger.kernel.org, sunil joshi <joshi@samsung.com>

Hi Yuvaraj,

On Mon, Aug 19, 2013 at 12:09 PM, Yuvaraj Kumar C D
<yuvaraj.cd@gmail.com> wrote:
> This patch adds the device tree node entries for exynos5420 SOC.
> Exynos5420 has a different version of DWMMC controller,so a new
> compatible string is used to distinguish it from the prior SOC's.
>
> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
> ---
>  .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |    2 +
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |   41 ++++++++++++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi                  |   33 ++++++++++++++++
>  3 files changed, 76 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> index 6d1c098..84cd56f 100644
> --- a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> +++ b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
> @@ -16,6 +16,8 @@ Required Properties:
>           specific extensions.
>         - "samsung,exynos5250-dw-mshc": for controllers with Samsung Exynos5250
>           specific extensions.
> +       - "samsung,exynos5420-dw-mshc": for controllers with Samsung Exynos5420
> +         specific extensions.
>
>  * samsung,dw-mshc-ciu-div: Specifies the divider value for the card interface
>    unit (ciu) clock. This property is applicable only for Exynos5 SoC's and
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index 08607df..4530700 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -30,4 +30,45 @@
>                         clock-frequency = <24000000>;
>                 };
>         };
> +
> +       dwmmc0@12200000 {
> +               num-slots = <1>;
> +               broken-cd;
> +               bypass-smu;
> +               supports-highspeed;
> +               fifo-depth = <0x80>;
> +               card-detect-delay = <200>;
> +               samsung,dw-mshc-ciu-div = <3>;
> +               samsung,dw-mshc-sdr-timing = <0 4>;
> +               samsung,dw-mshc-ddr-timing = <0 2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
> +
> +               slot@0 {
> +                       reg = <0>;
> +                       bus-width = <8>;
> +               };
> +       };

with these bindings if the MMC is operational, then IMHO its better to
make its status as "okay".

> +
> +       dwmmc1@12210000 {
> +               status = "disabled";
> +       };
> +
> +       dwmmc2@12220000 {

 ditto.

> +               num-slots = <1>;
> +               supports-highspeed;
> +               fifo-depth = <0x80>;
> +               card-detect-delay = <200>;
> +               samsung,dw-mshc-ciu-div = <3>;
> +               samsung,dw-mshc-sdr-timing = <2 3>;
> +               samsung,dw-mshc-ddr-timing = <1 2>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
> +
> +               slot@0 {
> +                       reg = <0>;
> +                       bus-width = <4>;
> +               };
> +       };
> +
>  };
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 9e90d1e..8559aa8 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -19,6 +19,9 @@
>         compatible = "samsung,exynos5420";
>
>         aliases {
> +               mshc0 = &dwmmc_0;
> +               mshc1 = &dwmmc_1;
> +               mshc2 = &dwmmc_2;
>                 pinctrl0 = &pinctrl_0;
>                 pinctrl1 = &pinctrl_1;
>                 pinctrl2 = &pinctrl_2;
> @@ -65,6 +68,36 @@
>                 #clock-cells = <1>;
>         };
>
> +       dwmmc_0: dwmmc0@12200000 {
> +               compatible = "samsung,exynos5420-dw-mshc";
> +               interrupts = <0 75 0>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x12200000 0x2000>;
> +               clocks = <&clock 351>, <&clock 132>;
> +               clock-names = "biu", "ciu";

with these bindings if the MMC is NOT operational yet, then IMHO its
better to make its status as "disabled".

> +       };
> +
> +       dwmmc_1: dwmmc1@12210000 {
> +               compatible = "samsung,exynos5420-dw-mshc";
> +               interrupts = <0 76 0>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x12210000 0x2000>;
> +               clocks = <&clock 352>, <&clock 133>;
> +               clock-names = "biu", "ciu";

ditto.

> +       };
> +
> +       dwmmc_2: dwmmc2@12220000 {
> +               compatible = "samsung,exynos5420-dw-mshc";
> +               interrupts = <0 77 0>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x12220000 0x2000>;
> +               clocks = <&clock 353>, <&clock 134>;
> +               clock-names = "biu", "ciu";

ditto.

> +       };
> +
>         mct@101C0000 {
>                 compatible = "samsung,exynos4210-mct";
>                 reg = <0x101C0000 0x800>;
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
