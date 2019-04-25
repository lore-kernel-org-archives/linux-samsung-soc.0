From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] clocksource: exynos_mct: Increase priority over ARM
 arch timer
Date: Thu, 25 Apr 2019 08:29:56 +0200
Message-ID: <30b83273-5c79-5118-b4c7-ba1d93e1022e@samsung.com>
References: <CGME20190321082621eucas1p16d48ef152cd76edb7d46e8c773fa000e@eucas1p1.samsung.com>
        <20190321082608.21366-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321082608.21366-1-m.szyprowski@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi All

On 2019-03-21 09:26, Marek Szyprowski wrote:
> Exynos Multi-Core Timer driver (exynos_mct) must be started before ARM
> Architected Timers (arch_timer), because they both share some common
> hardware blocks (global system counter) and turning on MCT is needed
> to get ARM Architected Timer working properly. Increase MCT timer rating
> and hotplug priority over ARM Archictected timer driver to achieve that.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Thomas: could you comment or accept this change? Daniel said that he 
leaves this for you: https://patchwork.kernel.org/patch/10814921/#22486971

> ---
> v2: added comments about the relation to ARM arch timer
>      rebased onto v5.1-rc1
> v1: https://patchwork.kernel.org/patch/10814921/
> ---
>   drivers/clocksource/exynos_mct.c | 4 ++--
>   include/linux/cpuhotplug.h       | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 34bd250d46c6..6aa10cbc1d59 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -209,7 +209,7 @@ static void exynos4_frc_resume(struct clocksource *cs)
>   
>   static struct clocksource mct_frc = {
>   	.name		= "mct-frc",
> -	.rating		= 400,
> +	.rating		= 450,	/* use value higher than ARM arch timer */
>   	.read		= exynos4_frc_read,
>   	.mask		= CLOCKSOURCE_MASK(32),
>   	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
> @@ -464,7 +464,7 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
>   	evt->set_state_oneshot_stopped = set_state_shutdown;
>   	evt->tick_resume = set_state_shutdown;
>   	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
> -	evt->rating = 450;
> +	evt->rating = 500;	/* use value higher than ARM arch timer */
>   
>   	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
>   
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index e78281d07b70..53fb48de9589 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -115,10 +115,10 @@ enum cpuhp_state {
>   	CPUHP_AP_PERF_ARM_ACPI_STARTING,
>   	CPUHP_AP_PERF_ARM_STARTING,
>   	CPUHP_AP_ARM_L2X0_STARTING,
> +	CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
>   	CPUHP_AP_ARM_ARCH_TIMER_STARTING,
>   	CPUHP_AP_ARM_GLOBAL_TIMER_STARTING,
>   	CPUHP_AP_JCORE_TIMER_STARTING,
> -	CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
>   	CPUHP_AP_ARM_TWD_STARTING,
>   	CPUHP_AP_QCOM_TIMER_STARTING,
>   	CPUHP_AP_TEGRA_TIMER_STARTING,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
