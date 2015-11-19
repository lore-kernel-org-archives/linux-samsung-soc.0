From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] clk: samsung: Don't build ARMv8 clock drivers on ARMv7
Date: Thu, 19 Nov 2015 13:18:38 +0900
Message-ID: <CA+Ln22HAGwfPDqXBQatBraLd=DyGYF2WyV4wJ9RvGOc58puymQ@mail.gmail.com>
References: <1447637775-9887-1-git-send-email-k.kozlowski@samsung.com>
 <1447637775-9887-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1447637775-9887-2-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Good idea, just a couple of nits inline. Other than that:

Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

2015-11-16 10:36 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
> Currently the Exynos5433 (ARMv8 SoC) clock driver depends on ARCH_EXYNOS
> so it is built also on ARMv7. This does not bring any kind of benefit.
> There won't be a single kernel image for ARMv7 and ARMv8 SoCs (like
> multi_v7 for ARMv7).
>
> Instead build clock drivers only for respective SoC's architecture.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/clk/samsung/Kconfig  | 13 +++++++++++++
>  drivers/clk/samsung/Makefile |  4 ++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> index 84196ecdaa12..5f138fc4d84d 100644
> --- a/drivers/clk/samsung/Kconfig
> +++ b/drivers/clk/samsung/Kconfig
> @@ -2,6 +2,7 @@ config COMMON_CLK_SAMSUNG
>         bool
>         select COMMON_CLK
>
> +# ARMv7 SoCs:

nit: I'm not aware of any recent upgrade of the S3C24xx line-up to
ARMv7 cores. ;) I'd suggest "32-bit ARM SoCs" or just "ARM SoCs"...

>  config S3C2410_COMMON_CLK
>         bool
>         select COMMON_CLK_SAMSUNG
> @@ -24,3 +25,15 @@ config S3C2443_COMMON_CLK
>         bool
>         select COMMON_CLK_SAMSUNG
>
> +# ARMv8 SoCs:

and then here "64-bit ARM SoCs" or "ARM64 SoCs", whichever you prefer.
I'd lean towards simple "ARM" and "ARM64".

> +config EXYNOS5433_COMMON_CLK
> +       bool
> +       depends on ARM64 || COMPILE_TEST
> +       default ARCH_EXYNOS

nit: bool and default can be combined into def_bool ARCH_EXYNOS

> +       select COMMON_CLK_SAMSUNG
> +
> +config EXYNOS7_COMMON_CLK
> +       bool
> +       depends on ARM64 || COMPILE_TEST
> +       default ARCH_EXYNOS

nit: See above.

However, I don't think we can disable compilation of particular 64-bit
SoCs, so maybe there isn't much sense in splitting their clock drivers
into separate symbols?

Best regards,
Tomasz
