From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 6/8] DT: arm: exynos: add DMC device for exynos5422
Date: Tue, 29 Jan 2019 16:13:49 +0100
Message-ID: <CAJKOXPfHzspKWxHcf=DGf73v0sdnG=oDAa-9QLv2eRCHoC9RwQ@mail.gmail.com>
References: <CGME20190128192154eucas1p2e696de47c5aab0cdb80cff32254daaf9@eucas1p2.samsung.com>
 <1548703299-15806-1-git-send-email-l.luba@partner.samsung.com> <1548703299-15806-7-git-send-email-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548703299-15806-7-git-send-email-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, myungjoo.ham@samsung.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 28 Jan 2019 at 20:21, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> Add description of Dynamic Memory Controller and PPMU counters.
> They are used by exynos5-dmc driver.
>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Mark Rutland <mark.rutland@arm.com>
> CC: Kukjin Kim <kgene@kernel.org>
> CC: Krzysztof Kozlowski <krzk@kernel.org>
> CC: devicetree@vger.kernel.org
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-samsung-soc@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi             | 81 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 22 ++++++++
>  2 files changed, 103 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index aaff158..6880d13 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -1337,6 +1337,87 @@
>                                 opp-hz = /bits/ 64 <400000000>;
>                         };
>                 };
> +
> +               ppmu_dmc0_0: ppmu_dmc0_0@10d00000 {
> +                       compatible = "samsung,exynos-ppmu";
> +                       reg = <0x10d00000 0x2000>;
> +                       clocks = <&clock CLK_PCLK_PPMU_DREX0_0>;
> +                       clock-names = "ppmu";
> +                       events {
> +                               ppmu_event_dmc0_0: ppmu-event3-dmc0_0 {
> +                                       event-name = "ppmu-event3-dmc0_0";
> +                               };
> +                       };
> +               };
> +
> +

No need for double line.

> +               ppmu_dmc0_1: ppmu_dmc0_1@10d10000 {
> +                       compatible = "samsung,exynos-ppmu";
> +                       reg = <0x10d10000 0x2000>;
> +                       clocks = <&clock CLK_PCLK_PPMU_DREX0_1>;
> +                       clock-names = "ppmu";
> +                       events {
> +                               ppmu_event_dmc0_1: ppmu-event3-dmc0_1 {
> +                                       event-name = "ppmu-event3-dmc0_1";
> +                               };
> +                       };
> +               };
> +
> +               ppmu_dmc1_0: ppmu_dmc1_0@10d10000 {
> +                       compatible = "samsung,exynos-ppmu";
> +                       reg = <0x10d60000 0x2000>;
> +                       clocks = <&clock CLK_PCLK_PPMU_DREX1_0>;
> +                       clock-names = "ppmu";
> +                       events {
> +                               ppmu_event_dmc1_0: ppmu-event3-dmc1_0 {
> +                                       event-name = "ppmu-event3-dmc1_0";
> +                               };
> +                       };
> +               };
> +
> +               ppmu_dmc1_1: ppmu_dmc1_1@10d70000 {

1. Generic node name, e.g. "ppmu".
2. Please put all ppmu nodes after nocp nodes to group everything logically.

> +                       compatible = "samsung,exynos-ppmu";
> +                       reg = <0x10d70000 0x2000>;
> +                       clocks = <&clock CLK_PCLK_PPMU_DREX1_1>;
> +                       clock-names = "ppmu";
> +                       events {
> +                               ppmu_event_dmc1_1: ppmu-event3-dmc1_1 {
> +                                       event-name = "ppmu-event3-dmc1_1";
> +                               };
> +                       };
> +               };
> +
> +               dmc: dmc@10c20000 {

1. Node name: memory-controller.
2. Put it before nocp nodes.

> +                       compatible = "samsung,exynos5422-dmc";
> +                       reg = <0x10c20000 0x10000>, <0x10c30000 0x10000>,
> +                               <0x10030000 0x1000>, <0x10000000 0x1000>;
> +                       clocks =        <&clock CLK_FOUT_SPLL>,

Weird indentation.

> +                                       <&clock CLK_MOUT_SCLK_SPLL>,
> +                                       <&clock CLK_FF_DOUT_SPLL2>,

Indent all continued lines with first entry (like in other places in this file).

> +                                       <&clock CLK_FOUT_BPLL>,
> +                                       <&clock CLK_MOUT_BPLL>,
> +                                       <&clock CLK_SCLK_BPLL>,
> +                                       <&clock CLK_MOUT_MX_MSPLL_CCORE>,
> +                                       <&clock CLK_MOUT_MX_MSPLL_CCORE_PHY>,
> +                                       <&clock CLK_MOUT_MCLK_CDREX>,
> +                                       <&clock CLK_DOUT_CLK2X_PHY0>,
> +                                       <&clock CLK_CLKM_PHY0>,
> +                                       <&clock CLK_CLKM_PHY1>
> +                                       ;

Join the trailing semicolon with previous lines.

> +                       clock-names =   "fout_spll",
> +                                       "mout_sclk_spll",

Indent all continued lines with first entry (like in other places in this file).

> +                                       "ff_dout_spll2",
> +                                       "fout_bpll",
> +                                       "mout_bpll",
> +                                       "sclk_bpll",
> +                                       "mout_mx_mspll_ccore",
> +                                       "mout_mx_mspll_ccore_phy",
> +                                       "mout_mclk_cdrex",
> +                                       "dout_clk2x_phy0",
> +                                       "clkm_phy0",
> +                                       "clkm_phy1"
> +                                       ;

Join the trailing semicolon with previous lines.
> +               };
>         };
>
>         thermal-zones {
> diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> index bf09eab..54ee8b2 100644
> --- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> @@ -119,6 +119,28 @@
>         status = "okay";
>  };
>
> +&ppmu_dmc0_0 {
> +       status = "okay";
> +};
> +
> +&ppmu_dmc0_1 {
> +       status = "okay";
> +};
> +
> +&ppmu_dmc1_0 {
> +       status = "okay";
> +};
> +
> +&ppmu_dmc1_1 {
> +       status = "okay";
> +};

Put the new entries respecting alphabetical order (order of label name).

> +
> +&dmc {

The same.

Best regards,
Krzysztof

> +       devfreq-events = <&ppmu_dmc0_0>, <&ppmu_dmc0_1>,
> +                       <&ppmu_dmc1_0>, <&ppmu_dmc1_1>;
> +       status = "okay";
> +};
> +
>  &cpu0 {
>         cpu-supply = <&buck6_reg>;
>  };
> --
> 2.7.4
>
