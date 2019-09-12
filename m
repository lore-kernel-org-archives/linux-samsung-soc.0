From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: exynos: remove obsolete IRQ lines
Date: Thu, 12 Sep 2019 17:23:58 +0200
Message-ID: <CAJKOXPcs5K46U9mF8evCpbEap_j0Sd5kUk-xiWjwyihAL7te=Q@mail.gmail.com>
References: <CGME20190912151829eucas1p216ca28e56f62e7f484c46ce30581200a@eucas1p2.samsung.com>
 <20190911133310.8365-1-m.falkowski@samsung.com> <20190912151756.27173-1-m.falkowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912151756.27173-1-m.falkowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Falkowski <m.falkowski@samsung.com>
Cc: devicetree@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 12 Sep 2019 at 17:18, Maciej Falkowski <m.falkowski@samsung.com> wrote:
>
> In commit 7222e8db2d506197ee183de0f9b76b3ad97e8c18 (iommu/exynos: Fix build
> errors) Exynos3250 iommu driver stopped supporting two IRQ lines.
> The second IRQ line in DTS is ignored and is not needed.
>
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - change commit message to proper version
> - add proper recipients

Thanks, you fixed it before I replied with comments. Except the
subject also the commit SHA should be shorter. The guide is here:
https://elixir.bootlin.com/linux/v5.3-rc8/source/Documentation/process/submitting-patches.rst#L183

No need to resend, I'll fix it while applying. However this will be
after merge window.

Best regards,
Krzysztof

> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index 784818490376..190d9160a5d1 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -314,8 +314,7 @@
>                 sysmmu_jpeg: sysmmu@11a60000 {
>                         compatible = "samsung,exynos-sysmmu";
>                         reg = <0x11a60000 0x1000>;
> -                       interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
>                         clock-names = "sysmmu", "master";
>                         clocks = <&cmu CLK_SMMUJPEG>, <&cmu CLK_JPEG>;
>                         power-domains = <&pd_cam>;
> @@ -355,8 +354,7 @@
>                 sysmmu_fimd0: sysmmu@11e20000 {
>                         compatible = "samsung,exynos-sysmmu";
>                         reg = <0x11e20000 0x1000>;
> -                       interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
>                         clock-names = "sysmmu", "master";
>                         clocks = <&cmu CLK_SMMUFIMD0>, <&cmu CLK_FIMD0>;
>                         power-domains = <&pd_lcd0>;
> @@ -507,8 +505,7 @@
>                 sysmmu_mfc: sysmmu@13620000 {
>                         compatible = "samsung,exynos-sysmmu";
>                         reg = <0x13620000 0x1000>;
> -                       interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>                         clock-names = "sysmmu", "master";
>                         clocks = <&cmu CLK_SMMUMFC_L>, <&cmu CLK_MFC>;
>                         power-domains = <&pd_mfc>;
> --
> 2.17.1
>
