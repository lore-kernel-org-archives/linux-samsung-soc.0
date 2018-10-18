From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 4/6] clocksource: exynos_mct: Add arch_timer
 cooperation mode for ARM64
Date: Thu, 18 Oct 2018 12:51:02 +0900
Message-ID: <5BC80326.2000108@samsung.com>
References: <20181017134159.9656-1-m.szyprowski@samsung.com>
        <CGME20181017134207eucas1p1b938eefe31fc47baaf538c9ebafc1a7e@eucas1p1.samsung.com>
        <20181017134159.9656-5-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20181017134159.9656-5-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Marek,

On 2018년 10월 17일 22:41, Marek Szyprowski wrote:
> To get ARM Architected Timers working on Samsung Exynos SoCs, one has to
> first configure and enable Exynos Multi-Core Timer, because they both
> share some common hardware blocks (global system counter). This patch
> adds a mode of cooperation with arch_timer driver, so kernel can use
> CP15 based timer interface via arch_timer driver, which is mandatory
> on ARM64. In such mode MCT driver only enables its clocks and starts
> global timer. Everything else will be handled by arch_timer driver.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clocksource/exynos_mct.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 02ad55db390b..1b19a4f03929 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -606,6 +606,15 @@ static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
>  	if (ret)
>  		return ret;
>  
> +	if (IS_ENABLED(CONFIG_ARM64) && IS_ENABLED(CONFIG_ARM_ARCH_TIMER)) {
> +		struct device_node *np = of_find_compatible_node(NULL, NULL,
> +							     "arm,armv8-timer");
> +		if (np) {
> +			of_node_put(np);
> +			exynos4_mct_frc_start();
> +			return 0;
> +		}
> +	}
>  
>  	ret = exynos4_timer_interrupts(np, int_type);
>  	if (ret)
> 

I tested it on Exynos5433-based TM2 board.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
