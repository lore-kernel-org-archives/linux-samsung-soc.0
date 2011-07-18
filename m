From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add support AFTR mode on EXYNOS4210
Date: Mon, 18 Jul 2011 16:13:31 +0900
Message-ID: <04a201cc451a$35b67d00$a1237700$%kim@samsung.com>
References: <1310118235-17543-1-git-send-email-jc.lee@samsung.com>
 <20110708181527.GN4812@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39333 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750745Ab1GRHNh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 03:13:37 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOI007HXPELMML0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 16:13:36 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOI00GXPPEOS0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 16:13:36 +0900 (KST)
In-reply-to: <20110708181527.GN4812@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Jaecheol Lee' <jc.lee@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Russell King - ARM Linux wrote:
> 
> On Fri, Jul 08, 2011 at 06:43:55PM +0900, Jaecheol Lee wrote:
> > This patch adds support AFTR(ARM OFF TOP RUNNING) mode in
> > cpuidle driver. L2 cache keeps their data in this mode.
> 
Hi Russell,

I received Jaecheol Lee's reply internally. Now his mail client has some
problem so I'm sending his comments...

> This conflicts with my suspend branch.  Please wait until after the
> merge window for this patch.
> 
OK, will check your patch in mainline after merging.

> > +void exynos4_cpu_lp(unsigned long arg)
> 
> Should be 'static int' now.
> 
OK.

> > +static int exynos4_enter_lowpower(struct cpuidle_device *dev,
> > +				  struct cpuidle_state *state)
> > +{
> > +	struct cpuidle_state *new_state = state;
> > +
> > +	/* This mode only can be entered when Core1 is offline */
> > +	if (cpu_online(1)) {
> 
> What if you had a four code exynos4 tomorrow?
> 
four core?

> Presumably you actually mean: "can only be entered when other CPUs are
> offline" so that should be:
> 	if (num_cpus_online() != 1) {
> 
OK, will address comments from you :)

> > +
> > +	l2cc_save[0] = __raw_readl(S5P_VA_L2CC + L2X0_PREFETCH_CTRL);
> > +	l2cc_save[1] = __raw_readl(S5P_VA_L2CC + L2X0_POWER_CTRL);
> > +	l2cc_save[2] = __raw_readl(S5P_VA_L2CC + L2X0_TAG_LATENCY_CTRL);
> > +	l2cc_save[3] = __raw_readl(S5P_VA_L2CC +
> L2X0_DATA_LATENCY_CTRL);
> > +	l2cc_save[4] = __raw_readl(S5P_VA_L2CC + L2X0_AUX_CTRL);
> > +
> > +	clean_dcache_area(&l2cc_save[0], 5 * sizeof(unsigned long));
> > +	outer_clean_range(virt_to_phys(&l2cc_save[0]),
> > +			  virt_to_phys(&l2cc_save[4] + sizeof(unsigned
long)));
> 
> Erm, this is bad news, using internal APIs for this, especially
> 'clean_dcache_area' which may well become a no-op on systems with
> TLBs which can read out of L1 cache...

Let me think about it again.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
