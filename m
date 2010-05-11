From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] ARM: SAMSUNG: Remove static of S5P SoCs sysclass
Date: Tue, 11 May 2010 02:02:22 +0100
Message-ID: <20100511010222.GB26401@trinity.fluff.org>
References: <1273539397-13046-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:37497 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757406Ab0EKBCZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 May 2010 21:02:25 -0400
Content-Disposition: inline
In-Reply-To: <1273539397-13046-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, May 11, 2010 at 09:56:37AM +0900, Kukjin Kim wrote:
> This patch removes static of s5p6440_sysclass, s5p6442_sysclass,
> and s5pv210_sysclass for defintion as extern.

I assume that this is for some driver comming soon?
 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-s5p6440/cpu.c              |    2 +-
>  arch/arm/mach-s5p6442/cpu.c              |    2 +-
>  arch/arm/mach-s5pv210/cpu.c              |    2 +-
>  arch/arm/plat-samsung/include/plat/cpu.h |    3 +++
>  4 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-s5p6440/cpu.c b/arch/arm/mach-s5p6440/cpu.c
> index 1794131..ca3b320 100644
> --- a/arch/arm/mach-s5p6440/cpu.c
> +++ b/arch/arm/mach-s5p6440/cpu.c
> @@ -88,7 +88,7 @@ void __init s5p6440_init_irq(void)
>  	s5p_init_irq(vic, ARRAY_SIZE(vic));
>  }
>  
> -static struct sysdev_class s5p6440_sysclass = {
> +struct sysdev_class s5p6440_sysclass = {
>  	.name	= "s5p6440-core",
>  };
>  
> diff --git a/arch/arm/mach-s5p6442/cpu.c b/arch/arm/mach-s5p6442/cpu.c
> index bc2524d..a48fb55 100644
> --- a/arch/arm/mach-s5p6442/cpu.c
> +++ b/arch/arm/mach-s5p6442/cpu.c
> @@ -95,7 +95,7 @@ void __init s5p6442_init_irq(void)
>  	s5p_init_irq(vic, ARRAY_SIZE(vic));
>  }
>  
> -static struct sysdev_class s5p6442_sysclass = {
> +struct sysdev_class s5p6442_sysclass = {
>  	.name	= "s5p6442-core",
>  };
>  
> diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
> index 0e0f8fd..2b776eb 100644
> --- a/arch/arm/mach-s5pv210/cpu.c
> +++ b/arch/arm/mach-s5pv210/cpu.c
> @@ -100,7 +100,7 @@ void __init s5pv210_init_irq(void)
>  	s5p_init_irq(vic, ARRAY_SIZE(vic));
>  }
>  
> -static struct sysdev_class s5pv210_sysclass = {
> +struct sysdev_class s5pv210_sysclass = {
>  	.name	= "s5pv210-core",
>  };
>  
> diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
> index d316b4a..c54f318 100644
> --- a/arch/arm/plat-samsung/include/plat/cpu.h
> +++ b/arch/arm/plat-samsung/include/plat/cpu.h
> @@ -78,6 +78,9 @@ extern struct sysdev_class s3c2442_sysclass;
>  extern struct sysdev_class s3c2443_sysclass;
>  extern struct sysdev_class s3c6410_sysclass;
>  extern struct sysdev_class s3c64xx_sysclass;
> +extern struct sysdev_class s5p6440_sysclass;
> +extern struct sysdev_class s5p6442_sysclass;
> +extern struct sysdev_class s5pv210_sysclass;
>  
>  extern void (*s5pc1xx_idle)(void);
>  
> -- 
> 1.6.2.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
