From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 5/7] ARM: EXYNOS4: Add support external GIC
Date: Thu, 13 Oct 2011 12:09:28 +0100
Message-ID: <20111013110928.GT21648@n2100.arm.linux.org.uk>
References: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com> <1308555258-4322-6-git-send-email-chaos.youn@samsung.com> <4E8C61C4.9090709@arm.com> <00ec01cc83f1$81f84430$85e8cc90$%kim@samsung.com> <4E8D645D.4020601@arm.com> <4E8ECA1B.5010005@arm.com> <20111007151646.GA2398@mudshark.cambridge.arm.com> <4E92ECD1.2010303@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:34412 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751495Ab1JMLJn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Oct 2011 07:09:43 -0400
Content-Disposition: inline
In-Reply-To: <4E92ECD1.2010303@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 'Arnd Bergmann' <arnd@arndb.de>, "ben-linux@fluff.org" <ben-linux@fluff.org>, 'Changhwan Youn' <chaos.youn@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Oct 10, 2011 at 02:02:09PM +0100, Marc Zyngier wrote:
> On 07/10/11 16:16, Will Deacon wrote:
> > On Fri, Oct 07, 2011 at 10:44:59AM +0100, Marc Zyngier wrote:
> >> +static void __cpuinit exynos4_secondary_init(unsigned int cpu)
> >>  {
> >>  	void __iomem *dist_base = S5P_VA_GIC_DIST +
> >> -				(gic_bank_offset * smp_processor_id());
> >> +				(gic_bank_offset * cpu_logical_map(cpu));
> > 
> > Again, I'm deeply suspicious of this code :) Is there not a common memory
> > alias for the distributor across all of the CPUs?
> 
> Kukjin, could you please comment on the presence of a common memory
> region for the distributor? This seem quite odd...

It's not odd when you consider that there's per-CPU registers within the
GIC distributor as well (for the first 32 GIC IRQs) as the per-CPU GIC
CPU interfaces.
