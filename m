From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: defconfig: Enable Panfrost driver
Date: Fri, 21 Jun 2019 13:15:35 -0700
Message-ID: <CA+E=qVe45NVCfpSHRF6=0aYRpURZA4DVz8W-XkSaNDB=1mX2kA@mail.gmail.com>
References: <20190621180208.25361-1-krzk@kernel.org> <20190621180208.25361-7-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190621180208.25361-7-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Joseph Kogut <joseph.kogut@gmail.com>, Inki Dae <inki.dae@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jun 21, 2019 at 11:04 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Enable support for Mali GPU with Panfrost driver, e.g. for Exynos5433
> and Exynos7 (having Mali T760).
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/configs/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6b4f5cf23324..972b17239f13 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -517,6 +517,7 @@ CONFIG_DRM_HISI_HIBMC=m
>  CONFIG_DRM_HISI_KIRIN=m
>  CONFIG_DRM_MESON=m
>  CONFIG_DRM_PL111=m
> +CONFIG_DRM_PANFROST=m

It makes sense to enable lima for arm64 defconfig as well since it's
used on number of 64-bit Allwinner SoCs.

>  CONFIG_FB=y
>  CONFIG_FB_MODE_HELPERS=y
>  CONFIG_BACKLIGHT_GENERIC=m
> @@ -717,7 +718,6 @@ CONFIG_ARCH_TEGRA_194_SOC=y
>  CONFIG_ARCH_K3_AM6_SOC=y
>  CONFIG_SOC_TI=y
>  CONFIG_TI_SCI_PM_DOMAINS=y
> -CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
>  CONFIG_EXTCON_USB_GPIO=y
>  CONFIG_EXTCON_USBC_CROS_EC=y
>  CONFIG_MEMORY=y
> --
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
