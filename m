From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] ARM: dts: Add syscon property to the MIPI phy in exynos5420
Date: Fri, 8 May 2015 18:38:53 +0200
Message-ID: <CABxcv=kMY6hLWqG93FjOhsjJc9AKg93T3MWDOjr+1Puv3KS0gQ@mail.gmail.com>
References: <1431091805-11451-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431091805-11451-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Tomeu,

I'm adding Krzysztof to the cc list since he is queuing Exynos patches
for Kukjin so is aware of this patch as well.

On Fri, May 8, 2015 at 3:30 PM, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
> Since e4b3d38088df6f3acd40 ("phy: exynos-video-mipi: Fix regression by
> adding support for PMU regmap") the syscon property is required in
> samsung,s5pv210-mipi-video-phy nodes, but this DTS hadn't been updated
> yet.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index f67b23f..72a56f1 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -541,6 +541,7 @@
>         mipi_phy: video-phy@10040714 {
>                 compatible = "samsung,s5pv210-mipi-video-phy";
>                 reg = <0x10040714 12>;

Shouldn't you remove the reg property too? the commit you mention
removes that property from the DT binding so it shouldn't be there.

> +               syscon = <&pmu_system_controller>;
>                 #phy-cells = <1>;
>         };
>
> --
> 2.4.0
>

With that change the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
