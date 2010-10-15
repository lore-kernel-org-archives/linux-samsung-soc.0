From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 2/2] ARM: S5PV310: Add support GPIOlib
Date: Fri, 15 Oct 2010 10:57:34 +0900
Message-ID: <001901cb6c0c$579aa0f0$06cfe2d0$%kim@samsung.com>
References: <1286868876-3748-1-git-send-email-sbkim73@samsung.com>
 <1286868876-3748-3-git-send-email-sbkim73@samsung.com>
 <006501cb6b5f$f9bd29a0$ed377ce0$%kim@samsung.com>
 <00e201cb6bfb$38aaebc0$aa00c340$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34474 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753506Ab0JOB5Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Oct 2010 21:57:16 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAB004PV6RF6L70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Oct 2010 10:57:15 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAB00HRC6RFNA@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Oct 2010 10:57:15 +0900 (KST)
In-reply-to: <00e201cb6bfb$38aaebc0$aa00c340$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jongsun Han' <jongsun.han@samsung.com>, 'Sangbeom Kim' <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Jongpill Lee' <boyko.lee@samsung.com>, ben-linux@fluff.org

Jongsun Han wrote:
> 
> Sangbeom Kim wrote:
> > >
> > > From: Jongpill Lee <boyko.lee@samsung.com>
> > >
> > > This patch adds GPIOlib support for S5PV310 and S5PC210.
> > >
> > > Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> > > Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> > > ---
> > > NOTE:
> > > This patch used mapped VA IO as GPIO virtual address.
> > > because firstly other Samsung SoC's GPIO used same method.
> > > and I think that  it's better to keep the same method.
> > > And ioremap also can be used for it.
> > > But in the GPIO, there is no need to allocate VA area dynamically.
> > > because GPIO can be used in any drivers anytime so it can't iounmap
GPIO
> > > VA area.
> > >
> > Ok...
> >
> > (snip)
> >
> > >  #define MAX_COMBINER_NR		40
> > >
> > > +#define S5P_IRQ_EINT_BASE
> 	COMBINER_IRQ(MAX_COMBINER_NR, 0)
> > > +
> > > +#define S5P_EINT_BASE1		(S5P_IRQ_EINT_BASE + 0)
> > > +#define S5P_EINT_BASE2		(S5P_IRQ_EINT_BASE + 16)
> > > +
> >
> > Hmm...
> > If you want to add external interrupt, should be changed NR_IRQS too.
> >
> > Will apply with fixing NR_IRQS.
> >
> 
> It seems that S5P_IRQ_EINT_BASE has wrong definition.

I think...No!

> S5P_IRQ_EINT_BASE has to be COMBINER_IRQ(MAX_COMBINER_NR - 1, 0).
> 
Maybe you mean COMBINER_IRQ(MAX_COMBINER_NR - 1, 1)...because IRQ_EINT16_31
is COMBINER_IRQ(39, 0)
Anyway in my opinion, each COMBINER_GROUP(x) can has 8 combined interrupts
even though actually just used only 1.

Therefore, to use next COMBINER_GROUP, so that COMBINER_GROUP(39) can use 8
interrupts like others is better.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
