From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 1/2] ARM: exynos4: Fix build error due to 'gic_bank_offset'
 undeclared
Date: Thu, 01 Dec 2011 16:39:42 +0000
Message-ID: <4ED7ADCE.8040609@arm.com>
References: <1322753070.11611.0.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:44328 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755251Ab1LAQjr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 11:39:47 -0500
In-Reply-To: <1322753070.11611.0.camel@phoenix>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Axel Lin <axel.lin@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 01/12/11 15:24, Axel Lin wrote:
> Fix below build error:
>   CC      arch/arm/mach-exynos/cpu.o
> arch/arm/mach-exynos/cpu.c: In function 'exynos4_init_irq':
> arch/arm/mach-exynos/cpu.c:245: error: 'gic_bank_offset' undeclared (first use in this function)
> arch/arm/mach-exynos/cpu.c:245: error: (Each undeclared identifier is reported only once
> arch/arm/mach-exynos/cpu.c:245: error: for each function it appears in.)
> arch/arm/mach-exynos/cpu.c:243: warning: unused variable 'bank_offset'
> make[1]: *** [arch/arm/mach-exynos/cpu.o] Error 1
> make: *** [arch/arm/mach-exynos] Error 2
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Arghhh... My bad. Thanks for fixing that.

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

> ---
>  arch/arm/mach-exynos/cpu.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/cpu.c b/arch/arm/mach-exynos/cpu.c
> index fed62f4..c7cb462 100644
> --- a/arch/arm/mach-exynos/cpu.c
> +++ b/arch/arm/mach-exynos/cpu.c
> @@ -240,7 +240,7 @@ static const struct of_device_id exynos4_dt_irq_match[] = {
>  void __init exynos4_init_irq(void)
>  {
>  	int irq;
> -	unsigned int bank_offset;
> +	unsigned int gic_bank_offset;
>  
>  	gic_bank_offset = soc_is_exynos4412() ? 0x4000 : 0x8000;
>  


-- 
Jazz is not dead. It just smells funny...
