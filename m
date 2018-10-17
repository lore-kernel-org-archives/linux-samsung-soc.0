From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 6/6] arm64: platform: Add enable Exynos Multi-Core
 Timer driver
Date: Wed, 17 Oct 2018 14:03:17 +0900
Message-ID: <5BC6C295.9060502@samsung.com>
References: <20181015123112.9379-1-m.szyprowski@samsung.com>
        <CGME20181015123137eucas1p1cf043644b9b40e15c9d2f221f26bef51@eucas1p1.samsung.com>
        <20181015123112.9379-7-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20181015123112.9379-7-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Marek,

On 2018년 10월 15일 21:31, Marek Szyprowski wrote:
> On Exynos SoCs enabling MCT driver is required even if ARM Architected
> Timer driver is used to for managing timer hardware and clock source
> events.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 51bc479334a4..7cc687580fad 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -62,6 +62,7 @@ config ARCH_BRCMSTB
>  config ARCH_EXYNOS
>  	bool "ARMv8 based Samsung Exynos SoC family"
>  	select COMMON_CLK_SAMSUNG
> +	select CLKSRC_EXYNOS_MCT
>  	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
>  	select EXYNOS_PMU
>  	select HAVE_S3C2410_WATCHDOG if WATCHDOG
> 

I tested it on Exynos5433-based TM2 board.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
