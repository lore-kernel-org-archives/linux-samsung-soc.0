From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 2/3] clk: samsung: Don't build ARMv8 clock drivers on
 ARMv7
Date: Thu, 28 Jan 2016 10:23:07 +0900
Message-ID: <56A96D7B.7080505@samsung.com>
References: <1453941324-15742-1-git-send-email-k.kozlowski@samsung.com>
 <1453941324-15742-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1453941324-15742-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 2016=EB=85=84 01=EC=9B=94 28=EC=9D=BC 09:35, Krzysztof Kozlowski wro=
te:
> Currently the Exynos5433 (ARMv8 SoC) clock driver depends on ARCH_EXY=
NOS
> so it is built also on ARMv7. This does not bring any kind of benefit=
=2E
> There won't be a single kernel image for ARMv7 and ARMv8 SoCs (like
> multi_v7 for ARMv7).
>=20
> Instead build clock drivers only for respective SoC's architecture.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> ---
>=20
> Changes since v3:
> 1. Rebase on next-20160127.
>=20
> Changes since v2:
> 1. Follow Arnd's advice making EXYNOS_ARM64_COMMON_CLK user-visible w=
hen
>    COMPILE_TEST is enabled.
> 2. Dropped accumulated tags because the logic is now different.
>=20
> Changes since v1:
> 1. Use one Kconfig symbol for clocks of all ARM64 SoCs (after
>    discussion): EXYNOS_ARM64_COMMON_CLK.
> 2. Minor cleanups after Tomasz's comments.
> 3. Added tags: Chanwoo's, Sylwester's, Alim's and Tomasz's (the tags
>    were given for v1 but assuming that change from 1. is not major
>    enough to require re-tagging).
> ---
>  drivers/clk/samsung/Kconfig  | 5 +++++
>  drivers/clk/samsung/Makefile | 4 ++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfi=
g
> index dd6093a33f84..5fd982d9f4d9 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -23,3 +23,8 @@ config S3C2443_COMMON_CLK
>  	bool "Samsung S3C2443 clock controller support" if COMPILE_TEST
>  	select COMMON_CLK_SAMSUNG
> =20
> +# ARM64 SoCs (e.g. Exynos5433, Exynos7):
> +config EXYNOS_ARM64_COMMON_CLK
> +	bool "Samsung Exynos ARMv8-family clock controller support" if COMP=
ILE_TEST
> +	default ARM64 && COMMON_CLK_SAMSUNG
> +	depends on (ARM64 && COMMON_CLK_SAMSUNG) || COMPILE_TEST
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makef=
ile
> index 5f6833ea355d..fc367d4b2902 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -10,11 +10,11 @@ obj-$(CONFIG_SOC_EXYNOS5250)	+=3D clk-exynos5250.=
o
>  obj-$(CONFIG_SOC_EXYNOS5260)	+=3D clk-exynos5260.o
>  obj-$(CONFIG_SOC_EXYNOS5410)	+=3D clk-exynos5410.o
>  obj-$(CONFIG_SOC_EXYNOS5420)	+=3D clk-exynos5420.o
> -obj-$(CONFIG_ARCH_EXYNOS)	+=3D clk-exynos5433.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos5433.o
>  obj-$(CONFIG_SOC_EXYNOS5440)	+=3D clk-exynos5440.o
>  obj-$(CONFIG_ARCH_EXYNOS)	+=3D clk-exynos-audss.o
>  obj-$(CONFIG_ARCH_EXYNOS)	+=3D clk-exynos-clkout.o
> -obj-$(CONFIG_ARCH_EXYNOS7)	+=3D clk-exynos7.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+=3D clk-exynos7.o
>  obj-$(CONFIG_S3C2410_COMMON_CLK)+=3D clk-s3c2410.o
>  obj-$(CONFIG_S3C2410_COMMON_DCLK)+=3D clk-s3c2410-dclk.o
>  obj-$(CONFIG_S3C2412_COMMON_CLK)+=3D clk-s3c2412.o
>=20

Looks good to me.=20
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Best Regards,
Chanwoo Choi

