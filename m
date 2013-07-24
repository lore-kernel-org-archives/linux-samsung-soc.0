From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 1/1] ARM: EXYNOS: Cleanup common.h file
Date: Wed, 24 Jul 2013 12:13:42 +0900
Message-ID: <0dff01ce881b$cd21c500$67654f00$@org>
References: <1373533047-4509-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20950 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751215Ab3GXDNo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 23:13:44 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF00HGE7MVBCI0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 12:13:43 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Kukjin Kim wrote:
> 
> Sachin Kamat wrote:
> >
> > Remove unused declarations that got left behind subsequent to
> > making Exynos a DT-only platform.
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > ---
> >  arch/arm/mach-exynos/common.h |   41
-----------------------------------
> --
> > ----
> >  1 file changed, 41 deletions(-)
> >

[...]

> > -
> > -struct device_node;
> > -
> >  extern struct smp_operations exynos_smp_ops;
> >
> >  extern void exynos_cpu_die(unsigned int cpu);
> > --
> > 1.7.9.5
> 
> Looks good to me, applied into -cleanup.
> 
Just note, needed following additionally.

-struct device_node;
-void combiner_init(void __iomem *combiner_base, struct device_node *np,
-                       unsigned int max_nr, int irq_base);
-
 extern struct smp_operations exynos_smp_ops;

 extern void exynos_cpu_die(unsigned int cpu);

---

Thanks,
Kukjin
