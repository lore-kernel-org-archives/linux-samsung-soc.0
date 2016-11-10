From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/2] ARM: EXYNOS: Remove static mapping of SCU SFR
Date: Thu, 10 Nov 2016 18:46:06 +0200
Message-ID: <20161110164606.GA3613@kozik-lap>
References: <1478693755-11953-1-git-send-email-pankaj.dubey@samsung.com>
 <1478693755-11953-2-git-send-email-pankaj.dubey@samsung.com>
 <CGME20161110115456epcas2p4524185a083cd7173e354f46b94be9183@epcas2p4.samsung.com>
 <5066943.nydi3GQ3KP@wuerfel>
 <a43af947-6002-bc65-f73b-02d57a78d6cb@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34542 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935077AbcKJQqM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2016 11:46:12 -0500
Received: by mail-wm0-f67.google.com with SMTP id g23so4277325wme.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2016 08:46:11 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <a43af947-6002-bc65-f73b-02d57a78d6cb@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "pankaj.dubey" <pankaj.dubey@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene@kernel.org, thomas.ab@samsung.com, krzk@kernel.org, Russell King <rmk+kernel@armlinux.org.uk>

On Thu, Nov 10, 2016 at 06:07:54PM +0530, pankaj.dubey wrote:
> So if CONFIG_SMP is disable then there is no sense of exynos_scu_enable
> as well. So wow about using below patch?
> 
> --------------------------------------------------------
> 
> Subject: [PATCH] ARM: exynos: fix build fail due to exynos_scu_enable
> 
> Build failed if we disable CONFIG_SMP as shown below:

This is fine with me.

(...)

> Of-course your idea to move it in core SCU file is also good that we
> lots of duplication in different architecture can be avoided.
> 
> In that case I can think of following patch:
> 
> [PATCH] ARM: scu: use SCU device node to enable SCU
> 
> Many platforms are duplicating code for enabling SCU, lets add
> common code to enable SCU using SCU device node so the duplication in
> each platform can be avoided.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/include/asm/smp_scu.h |  2 ++
>  arch/arm/kernel/smp_scu.c      | 17 +++++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/arch/arm/include/asm/smp_scu.h b/arch/arm/include/asm/smp_scu.h
> index bfe163c..e5e2492 100644
> --- a/arch/arm/include/asm/smp_scu.h
> +++ b/arch/arm/include/asm/smp_scu.h
> @@ -38,8 +38,10 @@ static inline int scu_power_mode(void __iomem
> *scu_base, unsigned int mode)
>  #endif
> 
>  #if defined(CONFIG_SMP) && defined(CONFIG_HAVE_ARM_SCU)
> +int of_scu_enable(void);
>  void scu_enable(void __iomem *scu_base);
>  #else
> +static inline int of_scu_enable(void) {return 0;}
>  static inline void scu_enable(void __iomem *scu_base) {}
>  #endif
> 
> diff --git a/arch/arm/kernel/smp_scu.c b/arch/arm/kernel/smp_scu.c
> index 72f9241..7c16d16 100644
> --- a/arch/arm/kernel/smp_scu.c
> +++ b/arch/arm/kernel/smp_scu.c
> @@ -34,6 +34,23 @@ unsigned int __init scu_get_core_count(void __iomem
> *scu_base)
>  	return (ncores & 0x03) + 1;
>  }
> 
> +int of_scu_enable(void)
> +{
> +	struct device_node *np;
> +	void __iomem *scu_base;
> +
> +	np = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
> +	scu_base = of_iomap(np, 0);
> +	of_node_put(np);
> +	if (!scu_base) {
> +		pr_err("%s failed to map scu_base\n", __func__);
> +		return -ENOMEM;
> +	}
> +	scu_enable(scu_base);
> +	iounmap(scu_base);
> +	return 0;
> +}
> +
>  /*
>   * Enable the SCU
>   */
> -- 
> 
> 
> Followed by cleanup in various architecture where this piece of code is
> duplicated and all of them can call directly of_scu_enable()

This looks better to me.

> 
> 
> Please let me know which one you will prefer for fixing build issue.
> 
> @Krzysztof, please let me know if I need to resubmit SCU series again
> with fix or you will accept build fix patch on top of already taken patch.

The code is already in my next/soc branch and I prefer to avoid
rebasing/dropping commits so how about:
1. Creating a generic wrapper which arm-soc will apply,
2. Provide me a tag with it (by arm-soc folks),
3. Fix the Exynos !SMP build on top of the tag (by using generic
   approach).

Arnd,
Are you fine with this?

Best regards,
Krzysztof
