From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V10 1/3] irq: Allow to pass the IRQF_TIMER flag with
 percpu irq request
Date: Wed, 17 May 2017 11:36:02 +0100
Message-ID: <20170517103602.GD14654@leverpostej>
References: <1494963880-16160-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:45686 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754110AbdEQKgq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 May 2017 06:36:46 -0400
Content-Disposition: inline
In-Reply-To: <1494963880-16160-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Vineet Gupta <vgupta@synopsys.com>, Marc Zyngier <marc.zyngier@arm.com>, Patrice Chotard <patrice.chotard@st.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Christoffer Dall <christoffer.dall@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>, Russell King <linux@armlinux.org.uk>, Carlo Caione <carlo@caione.org>, Richard Cochran <rcochran@linutronix.de>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, "open list:SYNOPSYS ARC ARCH..." <linux-snps-arc@lists.inf>

On Tue, May 16, 2017 at 09:44:32PM +0200, Daniel Lezcano wrote:
> In the next changes, we track when the interrupts occur in order to
> statistically compute when is supposed to happen the next interrupt.
> 
> In all the interruptions, it does not make sense to store the timer interrupt
> occurences and try to predict the next interrupt as when know the expiration
> time.
> 
> The request_irq() has a irq flags parameter and the timer drivers use it to
> pass the IRQF_TIMER flag, letting us know the interrupt is coming from a timer.
> Based on this flag, we can discard these interrupts when tracking them.
> 
> But, the API request_percpu_irq does not allow to pass a flag, hence specifying
> if the interrupt type is a timer.
> 
> Add a function request_percpu_irq_flags() where we can specify the flags. The
> request_percpu_irq() function is changed to be a wrapper to
> request_percpu_irq_flags() passing a zero flag parameter.
> 
> Change the timers using request_percpu_irq() to use request_percpu_irq_flags()
> instead with the IRQF_TIMER flag set.
> 
> For now, in order to prevent a misusage of this parameter, only the IRQF_TIMER
> flag (or zero) is a valid parameter to be passed to the
> request_percpu_irq_flags() function.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: Christoffer Dall <christoffer.dall@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Radim Krčmář <rkrcmar@redhat.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
> Changelog:
> 
>    V10:
> 	- Drop the change for arch arm virtual timer
> 	  https://lkml.org/lkml/2017/4/25/184
>    V9:
> 	- Clarified the patch description
> 	- Fixed EXPORT_SYMBOL_GPL(request_percpu_irq_flags)
> ---
>  arch/arm/kernel/smp_twd.c                |  3 ++-
>  drivers/clocksource/arc_timer.c          |  4 ++--
>  drivers/clocksource/arm_arch_timer.c     | 20 ++++++++++++--------
>  drivers/clocksource/arm_global_timer.c   |  4 ++--
>  drivers/clocksource/exynos_mct.c         |  7 ++++---
>  drivers/clocksource/qcom-timer.c         |  4 ++--
>  drivers/clocksource/time-armada-370-xp.c |  9 +++++----
>  drivers/clocksource/timer-nps.c          |  6 +++---
>  include/linux/interrupt.h                | 11 ++++++++++-
>  kernel/irq/manage.c                      | 15 ++++++++++-----
>  10 files changed, 52 insertions(+), 31 deletions(-)

As an aside, perhaps it would make more sense to move the
request_percpu_irq_flags() addition into a preparatory patch? That way
it's clearly separated from the mechanical clocksource changes, and it's
easy to see how it works.

Either way, for arm_arch_timer:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks,
Mark.

> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
> index 4bed671..22646b5 100644
> --- a/drivers/clocksource/arm_arch_timer.c
> +++ b/drivers/clocksource/arm_arch_timer.c
> @@ -980,25 +980,29 @@ static int __init arch_timer_register(void)
>  	ppi = arch_timer_ppi[arch_timer_uses_ppi];
>  	switch (arch_timer_uses_ppi) {
>  	case ARCH_TIMER_VIRT_PPI:
> -		err = request_percpu_irq(ppi, arch_timer_handler_virt,
> -					 "arch_timer", arch_timer_evt);
> +		err = request_percpu_irq_flags(ppi, arch_timer_handler_virt,
> +					       IRQF_TIMER, "arch_timer",
> +					       arch_timer_evt);
>  		break;
>  	case ARCH_TIMER_PHYS_SECURE_PPI:
>  	case ARCH_TIMER_PHYS_NONSECURE_PPI:
> -		err = request_percpu_irq(ppi, arch_timer_handler_phys,
> -					 "arch_timer", arch_timer_evt);
> +		err = request_percpu_irq_flags(ppi, arch_timer_handler_phys,
> +					       IRQF_TIMER, "arch_timer",
> +					       arch_timer_evt);
>  		if (!err && arch_timer_has_nonsecure_ppi()) {
>  			ppi = arch_timer_ppi[ARCH_TIMER_PHYS_NONSECURE_PPI];
> -			err = request_percpu_irq(ppi, arch_timer_handler_phys,
> -						 "arch_timer", arch_timer_evt);
> +			err = request_percpu_irq_flags(ppi, arch_timer_handler_phys,
> +						       IRQF_TIMER, "arch_timer",
> +						       arch_timer_evt);
>  			if (err)
>  				free_percpu_irq(arch_timer_ppi[ARCH_TIMER_PHYS_SECURE_PPI],
>  						arch_timer_evt);
>  		}
>  		break;
>  	case ARCH_TIMER_HYP_PPI:
> -		err = request_percpu_irq(ppi, arch_timer_handler_phys,
> -					 "arch_timer", arch_timer_evt);
> +		err = request_percpu_irq_flags(ppi, arch_timer_handler_phys,
> +					       IRQF_TIMER, "arch_timer",
> +					       arch_timer_evt);
>  		break;
>  	default:
>  		BUG();
