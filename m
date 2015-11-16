From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: Don't build ARMv8 clock drivers on ARMv7
Date: Mon, 16 Nov 2015 12:05:05 +0900
Message-ID: <564947E1.1030409@samsung.com>
References: <1447637775-9887-1-git-send-email-k.kozlowski@samsung.com>
 <1447637775-9887-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1447637775-9887-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@linaro.org>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 2015=EB=85=84 11=EC=9B=94 16=EC=9D=BC 10:36, Krzysztof Kozlowski wro=
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
> ---
>  drivers/clk/samsung/Kconfig  | 13 +++++++++++++
>  drivers/clk/samsung/Makefile |  4 ++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfi=
g
> index 84196ecdaa12..5f138fc4d84d 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -2,6 +2,7 @@ config COMMON_CLK_SAMSUNG
>  	bool
>  	select COMMON_CLK
> =20
> +# ARMv7 SoCs:
>  config S3C2410_COMMON_CLK
>  	bool
>  	select COMMON_CLK_SAMSUNG
> @@ -24,3 +25,15 @@ config S3C2443_COMMON_CLK
>  	bool
>  	select COMMON_CLK_SAMSUNG
> =20
> +# ARMv8 SoCs:
> +config EXYNOS5433_COMMON_CLK
> +	bool
> +	depends on ARM64 || COMPILE_TEST
> +	default ARCH_EXYNOS
> +	select COMMON_CLK_SAMSUNG
> +
> +config EXYNOS7_COMMON_CLK
> +	bool
> +	depends on ARM64 || COMPILE_TEST
> +	default ARCH_EXYNOS
> +	select COMMON_CLK_SAMSUNG
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makef=
ile
> index 5f6833ea355d..a31332a24ef4 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -10,11 +10,11 @@ obj-$(CONFIG_SOC_EXYNOS5250)	+=3D clk-exynos5250.=
o
>  obj-$(CONFIG_SOC_EXYNOS5260)	+=3D clk-exynos5260.o
>  obj-$(CONFIG_SOC_EXYNOS5410)	+=3D clk-exynos5410.o
>  obj-$(CONFIG_SOC_EXYNOS5420)	+=3D clk-exynos5420.o
> -obj-$(CONFIG_ARCH_EXYNOS)	+=3D clk-exynos5433.o
> +obj-$(CONFIG_EXYNOS5433_COMMON_CLK)	+=3D clk-exynos5433.o
>  obj-$(CONFIG_SOC_EXYNOS5440)	+=3D clk-exynos5440.o
>  obj-$(CONFIG_ARCH_EXYNOS)	+=3D clk-exynos-audss.o
>  obj-$(CONFIG_ARCH_EXYNOS)	+=3D clk-exynos-clkout.o
> -obj-$(CONFIG_ARCH_EXYNOS7)	+=3D clk-exynos7.o
> +obj-$(CONFIG_EXYNOS7_COMMON_CLK)	+=3D clk-exynos7.o
>  obj-$(CONFIG_S3C2410_COMMON_CLK)+=3D clk-s3c2410.o
>  obj-$(CONFIG_S3C2410_COMMON_DCLK)+=3D clk-s3c2410-dclk.o
>  obj-$(CONFIG_S3C2412_COMMON_CLK)+=3D clk-s3c2412.o
>=20

Looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Regards,
Chanwoo Choi
