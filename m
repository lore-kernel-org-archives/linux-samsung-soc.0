From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 43/50] ARM: dts: exynos: add bus_isp in Exynos5422
Date: Wed, 17 Jul 2019 12:02:47 +0200
Message-ID: <CAJKOXPcsH9YRzLOA1P5xc0Y3Zqh9+5o0RSxP-JcYOVEm7eO0Sw@mail.gmail.com>
References: <CGME20190715124509eucas1p1f2e44af951158fbef1a245467956ef93@eucas1p1.samsung.com>
 <20190715124417.4787-1-l.luba@partner.samsung.com>
 <20190715124417.4787-44-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190715124417.4787-44-l.luba@partner.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, kgene@kernel.org, myungjoo.ham@samsung.com, s.nawrocki@samsung.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 15 Jul 2019 at 14:45, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> Add bus_isp which changes ACLK400_ISP clock speed according to the bus
> documentation in the documentation. The bus_isp OPP table has been
> aligned to the new parent rate.

Title and msg needs fixing.

Please squash it with patch 18.

Best regards,
Krzysztof

> This patch sets the proper parent and
> picks the init frequency before the devfreq governor starts working.
> It sets also parent rate (DPLL to 1200MHz).
>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> index 990fe03fce75..852cb3dd495d 100644
> --- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> @@ -166,6 +166,18 @@
>         status = "okay";
>  };
>
> +&bus_isp {
> +       devfreq = <&bus_wcore>;
> +       assigned-clocks = <&clock CLK_MOUT_ACLK400_ISP>,
> +                         <&clock CLK_MOUT_SW_ACLK400_ISP>,
> +                         <&clock CLK_DOUT_ACLK400_ISP>,
> +                         <&clock CLK_FOUT_DPLL>;
> +       assigned-clock-parents = <&clock CLK_MOUT_SCLK_DPLL>,
> +                                <&clock CLK_DOUT_ACLK400_ISP>;
> +       assigned-clock-rates = <0>, <0>, <400000000>, <1200000000>;
> +       status = "okay";
> +};
> +
>  &cpu0 {
>         cpu-supply = <&buck6_reg>;
>  };
> --
> 2.17.1
>
