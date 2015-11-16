From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/2] arm64: EXYNOS: Consolidate ARCH_EXYNOS7 symbol into
 ARCH_EXYNOS
Date: Mon, 16 Nov 2015 11:55:34 +0900
Message-ID: <564945A6.904@samsung.com>
References: <1447637775-9887-1-git-send-email-k.kozlowski@samsung.com>
 <1447637775-9887-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1447637775-9887-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@linaro.org>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 2015=EB=85=84 11=EC=9B=94 16=EC=9D=BC 10:36, Krzysztof Kozlowski wro=
te:
> The ARMv8 Exynos family SoCs in Linux kernel are currently:
>  - Exynos5433 (controlled by ARCH_EXYNOS),
>  - Exynos7 (controlled by ARCH_EXYNOS7).
>=20
> It duplicates Kconfig symbols unnecessarily, so consolidate them into
> one ARCH_EXYNOS. Future SoCs could fall also under the ARCH_EXYNOS
> symbol.
>=20
> The commit should not bring any visible functional change.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm64/Kconfig.platforms        | 11 ++---------
>  arch/arm64/boot/dts/exynos/Makefile |  2 +-
>  arch/arm64/configs/defconfig        |  2 +-
>  3 files changed, 4 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platfo=
rms
> index 4043c35962cc..afa19baca94e 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -13,21 +13,14 @@ config ARCH_BERLIN
>  	  This enables support for Marvell Berlin SoC Family
> =20
>  config ARCH_EXYNOS
> -	bool
> -	help
> -	  This enables support for Samsung Exynos SoC family
> -
> -config ARCH_EXYNOS7
> -	bool "ARMv8 based Samsung Exynos7"
> -	select ARCH_EXYNOS
> +	bool "ARMv8 based Samsung Exynos SoC family"
>  	select COMMON_CLK_SAMSUNG
>  	select HAVE_S3C2410_WATCHDOG if WATCHDOG
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
>  	select PINCTRL_EXYNOS
> -
>  	help
> -	  This enables support for Samsung Exynos7 SoC family
> +	  This enables support for Samsung Exynos ARMv8 SoC family
> =20
>  config ARCH_LAYERSCAPE
>  	bool "ARMv8 based Freescale Layerscape SoC family"
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dt=
s/exynos/Makefile
> index 20310e5b6d6f..50c9b9383cfa 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -1,4 +1,4 @@
> -dtb-$(CONFIG_ARCH_EXYNOS7) +=3D exynos7-espresso.dtb
> +dtb-$(CONFIG_ARCH_EXYNOS) +=3D exynos7-espresso.dtb
> =20
>  always		:=3D $(dtb-y)
>  subdir-y	:=3D $(dts-dirs)
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defcon=
fig
> index bdd7aa358d2a..a396fa7c69a5 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -33,7 +33,7 @@ CONFIG_MODULE_UNLOAD=3Dy
>  # CONFIG_IOSCHED_DEADLINE is not set
>  CONFIG_ARCH_BCM_IPROC=3Dy
>  CONFIG_ARCH_BERLIN=3Dy
> -CONFIG_ARCH_EXYNOS7=3Dy
> +CONFIG_ARCH_EXYNOS=3Dy
>  CONFIG_ARCH_LAYERSCAPE=3Dy
>  CONFIG_ARCH_HISI=3Dy
>  CONFIG_ARCH_MEDIATEK=3Dy
>=20

When I sent the EXYNOS5433 patch[1], we don't want to add the each conf=
ig
for each Exynos SoC. So, I think this patch is good to use only one ARC=
H_EXYNOS config
for all ARMv8 Exynos SoC.
[1] https://lkml.org/lkml/2015/2/24/85

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Regards,
Chanwoo Choi

