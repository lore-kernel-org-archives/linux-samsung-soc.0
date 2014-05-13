From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v5 2/5] ARM: EXYNOS: use generic exynos cpu power control
 functions
Date: Tue, 13 May 2014 11:28:52 +0900
Message-ID: <019c01cf6e53$14eab220$3ec01660$@samsung.com>
References: <1399307221-8659-1-git-send-email-a.kesavan@samsung.com>
 <1399307221-8659-3-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60891 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752278AbaEMC2z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 22:28:55 -0400
In-reply-to: <1399307221-8659-3-git-send-email-a.kesavan@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Abhilash Kesavan' <a.kesavan@samsung.com>, nicolas.pitre@linaro.org, Dave.Martin@arm.com, lorenzo.pieralisi@arm.com, daniel.lezcano@linaro.org, linux-arm-kernel@lists.infradead.org, t.figa@samsung.com, abrestic@chromium.org, thomas.ab@samsung.com, inderpal.s@samsung.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grant.likely@linaro.org, robh+dt@kernel.org, will.deacon@arm.com, arnd@arndb.de, kesavan.abhilash@gmail.com, linux-samsung-soc@vger.kernel.org, jhbird.choi@samsung.com, skon.hwang@samsung.com

Abhilash Kesavan wrote:
> 
> From: Leela Krishna Amudala <leela.krishna@linaro.org>
> 
> Use generic exynos cpu power control functions to power up/down
> and to know the status of the cpu.
> 
> Signed-off-by: Leela Krishna Amudala <leela.krishna@linaro.org>

Same as previous comment.

> ---
>  arch/arm/mach-exynos/platsmp.c |    9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-
> exynos/platsmp.c
> index 0aac032..d442a66 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -130,15 +130,12 @@ static int exynos_boot_secondary(unsigned int cpu,
> struct task_struct *idle)
>  	 */
>  	write_pen_release(phys_cpu);
> 
> -	if (!(__raw_readl(S5P_ARM_CORE1_STATUS) & S5P_CORE_LOCAL_PWR_EN)) {
> -		__raw_writel(S5P_CORE_LOCAL_PWR_EN,
> -			     S5P_ARM_CORE1_CONFIGURATION);
> -
> +	if (!exynos_cpu_power_state(cpu)) {
> +		exynos_cpu_powerup(cpu);
>  		timeout = 10;
> 
>  		/* wait max 10 ms until cpu1 is on */
> -		while ((__raw_readl(S5P_ARM_CORE1_STATUS)
> -			& S5P_CORE_LOCAL_PWR_EN) != S5P_CORE_LOCAL_PWR_EN) {
> +		while (exynos_cpu_power_state(cpu) != S5P_CORE_LOCAL_PWR_EN)
> {
>  			if (timeout-- == 0)
>  				break;
> 
> --

You may cleanup the definitions of 'S5P_ARM_CORE1_CONFIGURATION/STATUS' in
regs-pmu.h once hotplug.c uses the generic power control functions.

- Kukjin
