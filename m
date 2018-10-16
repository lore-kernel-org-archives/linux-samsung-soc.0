From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 4/6] clocksource: Change CPU hotplug priority of
 exynos_mct driver
Date: Tue, 16 Oct 2018 09:59:22 +0900
Message-ID: <5BC537EA.9000700@samsung.com>
References: <20181015123112.9379-1-m.szyprowski@samsung.com>
        <CGME20181015123136eucas1p2f7d4ae86ba3547b891749b01514cd335@eucas1p2.samsung.com>
        <20181015123112.9379-5-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20181015123112.9379-5-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 2018년 10월 15일 21:31, Marek Szyprowski wrote:
> Exynos Multi-Core Timer driver (exynos_mct) must be started before
> ARM Architected Timers (arch_timer), because both timers share common
> hardware block and turning on MCT is needed to get ARM Architected
> Timer working properly.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  include/linux/cpuhotplug.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index caf40ad0bbc6..5d9e4a6ea299 100644
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
>  	CPUHP_AP_ARMADA_TIMER_STARTING,
> 

On Exynos SoC, ARM architecture timer shares the block of Exynos MCT timer.
For using arch_timer, Exynos MCT timer should be initialized before arch_timer.
I agree about this.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
