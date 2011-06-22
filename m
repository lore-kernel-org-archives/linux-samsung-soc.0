From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 4/7] ARM: EXYNOS4: Support early wakeup while entering
	sleep mode
Date: Wed, 22 Jun 2011 15:57:15 +0100
Message-ID: <20110622145715.GS23234@n2100.arm.linux.org.uk>
References: <1308732405-16664-1-git-send-email-kgene.kim@samsung.com> <1308732405-16664-5-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:58147 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757939Ab1FVO51 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 10:57:27 -0400
Content-Disposition: inline
In-Reply-To: <1308732405-16664-5-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jaecheol Lee <jc.lee@samsung.com>, ben-linux@fluff.org

On Wed, Jun 22, 2011 at 05:46:42PM +0900, Kukjin Kim wrote:
> diff --git a/arch/arm/mach-exynos4/sleep.S b/arch/arm/mach-exynos4/sleep.S
> index 6b62425..d55d38c 100644
> --- a/arch/arm/mach-exynos4/sleep.S
> +++ b/arch/arm/mach-exynos4/sleep.S
> @@ -45,11 +45,20 @@ ENTRY(s3c_cpu_save)
>  	ldr	r3, =resume_with_mmu
>  	bl	cpu_suspend
>  
> -	ldr	r0, =pm_cpu_sleep
> -	ldr	r0, [ r0 ]
> -	mov	pc, r0
> +	bl	exynos4_cpu_suspend
> +
> +	/* Restore original sp */
> +	mov	r0, sp
> +	add	r0, r0, #4
> +	ldr	sp, [r0]
> +
> +	mov	r0, #0
> +	b	early_wakeup
>  
>  resume_with_mmu:
> +	mov	r0, #1
> +
> +early_wakeup:
>  	ldmfd	sp!, { r3 - r12, pc }

NAK.

If we want to return from cpu_suspend() stuff then we need to solve this
properly, as per my patch sent around 13th June to the hibernate thread.

Stop bodging stuff (like you have for the SCU stuff.) and start _talking_
to people if the code doesn't do what you need it to do.
