From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2] clocksource: exynos_mct: Increase priority over ARM
 arch timer
Date: Thu, 21 Mar 2019 21:30:08 +0900
Message-ID: <af0dfbcb-4a9c-7d41-b08d-994d3a57604e@samsung.com>
References: <CGME20190321082621eucas1p16d48ef152cd76edb7d46e8c773fa000e@eucas1p1.samsung.com>
        <20190321082608.21366-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321082608.21366-1-m.szyprowski@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Marek,

On 19. 3. 21. 오후 5:26, Marek Szyprowski wrote:
> Exynos Multi-Core Timer driver (exynos_mct) must be started before ARM
> Architected Timers (arch_timer), because they both share some common
> hardware blocks (global system counter) and turning on MCT is needed
> to get ARM Architected Timer working properly. Increase MCT timer rating
> and hotplug priority over ARM Archictected timer driver to achieve that.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
> v2: added comments about the relation to ARM arch timer
>     rebased onto v5.1-rc1
> v1: https://patchwork.kernel.org/patch/10814921/
> ---
>  drivers/clocksource/exynos_mct.c | 4 ++--
>  include/linux/cpuhotplug.h       | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 34bd250d46c6..6aa10cbc1d59 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -209,7 +209,7 @@ static void exynos4_frc_resume(struct clocksource *cs)
>  
>  static struct clocksource mct_frc = {
>  	.name		= "mct-frc",
> -	.rating		= 400,
> +	.rating		= 450,	/* use value higher than ARM arch timer */
>  	.read		= exynos4_frc_read,
>  	.mask		= CLOCKSOURCE_MASK(32),
>  	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
> @@ -464,7 +464,7 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
>  	evt->set_state_oneshot_stopped = set_state_shutdown;
>  	evt->tick_resume = set_state_shutdown;
>  	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
> -	evt->rating = 450;
> +	evt->rating = 500;	/* use value higher than ARM arch timer */
>  
>  	exynos4_mct_write(TICK_BASE_CNT, mevt->base + MCT_L_TCNTB_OFFSET);
>  
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index e78281d07b70..53fb48de9589 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -115,10 +115,10 @@ enum cpuhp_state {
>  	CPUHP_AP_PERF_ARM_ACPI_STARTING,
>  	CPUHP_AP_PERF_ARM_STARTING,
>  	CPUHP_AP_ARM_L2X0_STARTING,
> +	CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
>  	CPUHP_AP_ARM_ARCH_TIMER_STARTING,
>  	CPUHP_AP_ARM_GLOBAL_TIMER_STARTING,
>  	CPUHP_AP_JCORE_TIMER_STARTING,
> -	CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING,
>  	CPUHP_AP_ARM_TWD_STARTING,
>  	CPUHP_AP_QCOM_TIMER_STARTING,
>  	CPUHP_AP_TEGRA_TIMER_STARTING,
> 

As the cover-letter, the arch-timer of Exynos SoC
used the h/w block of MCT. I agree.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
