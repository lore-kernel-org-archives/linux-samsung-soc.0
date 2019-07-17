From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 27/50] ARM: dts: exynos: align bus_wcore OPPs in Exynos5420
Date: Wed, 17 Jul 2019 12:15:37 +0200
Message-ID: <CAJKOXPfFZL8q9hM1vPsLq+Qxe-gMz4c8j0jgFKfdf5qs68MTmA@mail.gmail.com>
References: <CGME20190715124456eucas1p2acf15d00e3fa7b77fe3a2b10ce1ab74f@eucas1p2.samsung.com>
 <20190715124417.4787-1-l.luba@partner.samsung.com> <20190715124417.4787-28-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-28-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 15 Jul 2019 at 14:44, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> This is the most important bus in the Exynos5x SoC. The whole communication
> inside SoC does through that bus (apart from direct requests from CCI to
> DRAM controller). It is also modeled as a master bus in devfreq framework.
> It is also the only one OPP table throughout other buses which has voltage
> values. The devfreq software controls the speed of that bus and other
> buses. The other buses follows the rate of the master. There is only one
> regulator. The old lowest OPP had pair 925mV, 84MHz which is enough for

s/lowest/slowest/

> this frequency. However, due to the fact that the other buses follows the
> WCORE bus by taking the OPP from their table with the same id, e.g. opp02,
> the children frequency should be stable with the set voltage.
> It could cause random faults very hard to debug.
> Thus, the patch removes the lowest OPP to make other buses' lowest OPPs

s/lowest/slowest/

> working. The new lowest OPP has voltage high enough for buses working up
> to 333MHz. It also changes the frequencies of the OPPs to align them to
> PLL value such that it is possible to set them using only a divider without
> reprogramming OPP.

Reprogramming OPP? What is it?

> Reprogramming the PLL was not set, so the real frequency

I understood from the previous that reprogramming the OPP (PLL?) was
happening... Please rephrase entire sentence.

BR,
Krzysztof

> values were not the one from the OPP table, which could confuse the
> governor algorithms which relay on OPP speed values making the system to
> behave weird.
>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index f8c36ff0d4c3..a355c76af5a5 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -1107,22 +1107,18 @@
>                         compatible = "operating-points-v2";
>
>                         opp00 {
> -                               opp-hz = /bits/ 64 <84000000>;
> -                               opp-microvolt = <925000>;
> +                               opp-hz = /bits/ 64 <150000000>;
> +                               opp-microvolt = <950000>;
>                         };
>                         opp01 {
> -                               opp-hz = /bits/ 64 <111000000>;
> +                               opp-hz = /bits/ 64 <200000000>;
>                                 opp-microvolt = <950000>;
>                         };
>                         opp02 {
> -                               opp-hz = /bits/ 64 <222000000>;
> +                               opp-hz = /bits/ 64 <300000000>;
>                                 opp-microvolt = <950000>;
>                         };
>                         opp03 {
> -                               opp-hz = /bits/ 64 <333000000>;
> -                               opp-microvolt = <950000>;
> -                       };
> -                       opp04 {
>                                 opp-hz = /bits/ 64 <400000000>;
>                                 opp-microvolt = <987500>;
>                         };
> --
> 2.17.1
>
