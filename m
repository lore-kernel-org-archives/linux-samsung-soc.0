From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: EXYNOS: Cleanup common.h file
Date: Wed, 24 Jul 2013 16:31:05 +0900
Message-ID: <0e7c01ce883f$c1edafe0$45c90fa0$%kim@samsung.com>
References: <1373533047-4509-1-git-send-email-sachin.kamat@linaro.org>
 <0dff01ce881b$cd21c500$67654f00$@org>
 <CAK9yfHzMyfprmtGkDxwbQcYUXueCTPYVZDU_uM=oMudAiaoC_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31593 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751828Ab3GXHbI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 03:31:08 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF009MIJJUGPO0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 16:31:06 +0900 (KST)
In-reply-to: <CAK9yfHzMyfprmtGkDxwbQcYUXueCTPYVZDU_uM=oMudAiaoC_w@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Kukjin Kim' <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

Sachin Kamat wrote:
> 
> On 24 July 2013 08:43, Kukjin Kim <kgene@kernel.org> wrote:
> > Kukjin Kim wrote:
> >>
> >> Sachin Kamat wrote:
> >> >
> >> > Remove unused declarations that got left behind subsequent to
> >> > making Exynos a DT-only platform.
> >> >
> >> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> > ---
> >> >  arch/arm/mach-exynos/common.h |   41
> > -----------------------------------
> >> --
> >> > ----
> >> >  1 file changed, 41 deletions(-)
> >> >
> >
> > [...]
> >
> >> > -
> >> > -struct device_node;
> >> > -
> >> >  extern struct smp_operations exynos_smp_ops;
> >> >
> >> >  extern void exynos_cpu_die(unsigned int cpu);
> >> > --
> >> > 1.7.9.5
> >>
> >> Looks good to me, applied into -cleanup.
> >>
> > Just note, needed following additionally.
> >
> > -struct device_node;
> > -void combiner_init(void __iomem *combiner_base, struct device_node *np,
> > -                       unsigned int max_nr, int irq_base);
> > -
> 
> There is already a patch to clean that up [1] submitted earlier as
> part of combiner cleanup series.
> Please apply that first or squash it into this one.
> 
> [1] https://lkml.org/lkml/2013/6/26/296
> 
Already did when I applied.

Thanks, Kukjin
