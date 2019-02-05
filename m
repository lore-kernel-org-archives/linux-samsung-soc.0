From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/3] arm64: dts: exynos: add SlimSSS for Exynos5433
Date: Tue, 5 Feb 2019 12:23:30 +0100
Message-ID: <CAJKOXPfm1L2FvcyhbfYEgv-04RQpVnARc0zXt6j_41nCzfE53Q@mail.gmail.com>
References: <CGME20190124154538eucas1p2cdc2ce1eab4446e3ac139fd07d622ca7@eucas1p2.samsung.com>
 <20190124154521.13589-1-k.konieczny@partner.samsung.com> <20190124154521.13589-2-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124154521.13589-2-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 24 Jan 2019 at 16:45, Kamil Konieczny
<k.konieczny@partner.samsung.com> wrote:
>
> Add DT node for SlimSSS (aka Slim SecuritySubSystem) in Exynos5433 SoC.
> The users can use compatibility "samsung,exynos5433-slim-sss".
>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)

Before picking this up, bindings have to be accepted and I see
discussion is still ongoing (no Ack from Rob yet). Anyway this depends
on header file with clock ID, so it will have to wait for next cycle.

I will pick it up for v5.2, after v5.1 merge window.

Best regards,
Krzysztof
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index e7cd3b67d818..9e5fcb6c7776 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -559,6 +559,15 @@
>                                 <&cmu_top CLK_DIV_ACLK_IMEM_200>;
>                 };
>
> +               slim_sss: slim-sss@11140000 {
> +                       compatible = "samsung,exynos5433-slim-sss";
> +                       reg = <0x11140000 0x1000>;
> +                       interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
> +                       clock-names = "aclk", "pclk";
> +                       clocks = <&cmu_imem CLK_ACLK_SLIMSSS>,
> +                                <&cmu_imem CLK_PCLK_SLIMSSS>;
> +               };
> +
>                 pd_gscl: power-domain@105c4000 {
>                         compatible = "samsung,exynos5433-pd";
>                         reg = <0x105c4000 0x20>;
> --
> 2.20.0
>
