From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC PATCH 3/4] ARM: EXYNOS4: Add support AFTR mode cpuidle
	state on EXYNOS4210
Date: Sun, 21 Aug 2011 18:18:51 +0100
Message-ID: <20110821171851.GG28546@n2100.arm.linux.org.uk>
References: <1313759340-31319-1-git-send-email-amit.kachhap@linaro.org> <1313759400-31347-3-git-send-email-amit.kachhap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:44150 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752092Ab1HURTC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Aug 2011 13:19:02 -0400
Content-Disposition: inline
In-Reply-To: <1313759400-31347-3-git-send-email-amit.kachhap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On Fri, Aug 19, 2011 at 06:39:59PM +0530, Amit Daniel Kachhap wrote:
> +ENTRY(exynos4_enter_lp)
> +	stmfd	sp!, { r3 - r12, lr }
> +
> +	adr	r0, sleep_save_misc
> +
> +	mrc	p15, 0, r2, c15, c0, 0	@ read power control register
> +	str	r2, [r0], #4
> +
> +	mrc	p15, 0, r2, c15, c0, 1	@ read diagnostic register
> +	str	r2, [r0], #4
> +
> +	ldr	r3, =resume_with_mmu
> +	bl	cpu_suspend
> +
> +	mov	r0, sp
> +	bl	exynos4_cpu_lp
> +
> +	/* Restore original sp */
> +	mov	r0, sp
> +	add	r0, r0, #4
> +	ldr	sp, [r0]
> +
> +	mov	r0, #0
> +	b	early_wakeup

This is based upon old kernel code.  Clearly hasn't been tested with
anything later than 3.0.
