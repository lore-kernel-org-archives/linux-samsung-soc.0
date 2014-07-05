From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v5 1/5] ARM: EXYNOS: Add support for mapping PMU base
 address via DT
Date: Sat, 05 Jul 2014 12:01:19 +0530
Message-ID: <001b01cf981a$bd5dda90$38198fb0$@samsung.com>
References: <1403705032-14835-1-git-send-email-pankaj.dubey@samsung.com>
 <1403705032-14835-2-git-send-email-pankaj.dubey@samsung.com>
 <53B18C46.9010405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25575 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752164AbaGEGal (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 5 Jul 2014 02:30:41 -0400
In-reply-to: <53B18C46.9010405@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com

Hi Tomasz,

On Monday, June 30, 2014 Tomasz Figa wrote:
> 
> Hi Pankaj,
> 
> In general the patch seems quite nice, but please see few comments inline.
> 
> On 25.06.2014 16:03, Pankaj Dubey wrote:
> > Add support for mapping Samsung Power Management Unit (PMU) base
> > address from device tree.
> >
> > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > ---
> >  arch/arm/mach-exynos/common.h |    1 +
> >  arch/arm/mach-exynos/exynos.c |   45
> +++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 46 insertions(+)
> 
> [snip]
> 
> > +static void exynos_map_pmu(void)
> > +{
> > +	struct device_node *np = NULL;
> 
> nit: Unnecessary variable initialization.
>

OK, will correct it.
 
> > +
> > +	np = of_find_matching_node(NULL, exynos_dt_pmu_match);
> > +
> 
> nit: Unnecessary blank line.
> 

OK, will remove this.

> > +	if (!np) {
> > +		pr_err("Failed to find PMU node\n");
> > +		return;
> 
> Returning here probably doesn't make too much sense, especially when you
just panic
> if the mapping fails and you remove the static mapping in patch 2/5, so
backwards
> compatibility isn't provided anyway.
> 
> So something like this might be a better idea:
> 
> 	np = of_find_matching_node(NULL, exynos_dt_pmu_match);
> 	if (np)
> 		pmu_base_addr = of_iomap(np, 0);
> 
> 	if (!pmu_base_addr)
> 		panic("failed to find exynos pmu register\n");
> 

Yes, this will be better. I will modify this part.

> > +	}
> > +
> > +	pmu_base_addr = of_iomap(np, 0);
> > +
> > +	if (!pmu_base_addr)
> > +		panic("failed to find exynos pmu register\n"); }
> > +
> > +static void __init exynos_init_time(void) {
> > +	/* Nothing to do timer specific.
> > +	 * Since platsmp.c needs pmu base address by the time
> > +	 * DT is not unflatten so we can't use DT APIs before
> > +	 * init_time
> > +	 */
> > +	exynos_map_pmu();
> 
> Would moving this to .init_irq() callback work too? There are more things
happening
> in .init_time() so it seems more fragile and some platforms (e.g.
mach-tegra) do such
> platform-specific initialization in
> .init_irq() instead.
> 

I need to check this, if it works I will update as suggested.

> Best regards,
> Tomasz

Thanks,
Pankaj Dubey
