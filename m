From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v6 2/6] ARM: EXYNOS: Move cpufreq and cpuidle device
 registration to init_machine
Date: Tue, 08 Jul 2014 13:05:39 +0530
Message-ID: <000801cf9a7f$3896e150$a9c4a3f0$@samsung.com>
References: <1404705056-11965-1-git-send-email-pankaj.dubey@samsung.com>
 <1404705056-11965-3-git-send-email-pankaj.dubey@samsung.com>
 <53BB25B7.6000500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:25721 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750927AbaGHHeL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 03:34:11 -0400
In-reply-to: <53BB25B7.6000500@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, naushad@samsung.com, t.figa@samsung.com, joshi@samsung.com, vikas.sajjan@samsung.com, chow.kim@samsung.com

Hi Kukjin,

> 
> On 07/07/14 12:50, Pankaj Dubey wrote:
> > As exynos_cpuidle_init and exynos_cpufreq_init function have just one
> > lines of code for registering platform devices. We can move these
> > lines to exynos_dt_machine_init and delete exynos_cpuidle_init and
> > exynos_cpufreq_init function. This will help in reducing lines of code
> > in exynos.c, making it more cleaner.
> >
> > Suggested-by: Tomasz Figa<t.figa@samsung.com>
> > Signed-off-by: Pankaj Dubey<pankaj.dubey@samsung.com>
> > Reviewed-by: Tomasz Figa<t.figa@samsung.com>
> > ---
> >   arch/arm/mach-exynos/exynos.c |   20 ++++----------------
> >   1 file changed, 4 insertions(+), 16 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/exynos.c
> > b/arch/arm/mach-exynos/exynos.c index ff60b4c..47170eb 100644
> > --- a/arch/arm/mach-exynos/exynos.c
> > +++ b/arch/arm/mach-exynos/exynos.c
> > @@ -171,19 +171,6 @@ static struct platform_device exynos_cpuidle = {
> >   	.id                = -1,
> >   };
> >
> > -void __init exynos_cpuidle_init(void) -{
> > -	if (soc_is_exynos5440())
> > -		return;
> > -
> > -	platform_device_register(&exynos_cpuidle);
> > -}
> > -
> > -void __init exynos_cpufreq_init(void) -{
> > -	platform_device_register_simple("exynos-cpufreq", -1, NULL, 0);
> > -}
> > -
> >   void __iomem *sysram_base_addr;
> >   void __iomem *sysram_ns_base_addr;
> >
> > @@ -300,10 +287,11 @@ static void __init exynos_dt_machine_init(void)
> >   	if (!IS_ENABLED(CONFIG_SMP))
> >   		exynos_sysram_init();
> >
> > -	if (!of_machine_is_compatible("samsung,exynos5420"))
> > -		exynos_cpuidle_init();
> > +	if (!of_machine_is_compatible("samsung,exynos5420") ||
> > +			!of_machine_is_compatible("samsung,exynos5440"))
> > +		platform_device_register(&exynos_cpuidle);
> >
> > -	exynos_cpufreq_init();
> > +	platform_device_register_simple("exynos-cpufreq", -1, NULL, 0);
> >
> >   	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
> >   }
> 
> This cannot be applied in my tree now....
> 

May I know what the issue is? As I am able to rebase this patch on today's
kgene/for-next
and could not see any merge conflict. 
If you think I need to respin this patch please let me know.

Thanks,
Pankaj Dubey

> - Kukjin
