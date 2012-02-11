From: Huisung Kang <hs1218.kang@samsung.com>
Subject: RE: [PATCH] ARM: S5P: Can handle edge interrupt handler
Date: Sat, 11 Feb 2012 11:44:22 +0900
Message-ID: <017e01cce867$0f9859e0$2ec90da0$@samsung.com>
References: <017401cce7f4$4623f5a0$d26be0e0$@samsung.com>
 <1683433.XtZk95zyY3@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64298 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753131Ab2BKCoY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 21:44:24 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ700665JLT8U80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 11:44:23 +0900 (KST)
Received: from NOHS1218KAN01 ([12.23.118.150])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ700LL3JLYR670@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 11:44:22 +0900 (KST)
In-reply-to: <1683433.XtZk95zyY3@flatron>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, keyyoung.park@samsung.com

> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-owner@vger.kernel.org] On Behalf Of Tomasz
> Figa
> Sent: Saturday, February 11, 2012 5:02 AM
> To: Huisung Kang
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; kgene.kim@samsung.com;
> keyyoung.park@samsung.com
> Subject: Re: [PATCH] ARM: S5P: Can handle edge interrupt handler
> 
> I wonder if same thing wouldn't be also needed for s3c64xx.
> 
> Also please see my comments inline.
> 
> On Friday 10 of February 2012 22:02:42 Huisung Kang wrote:
> > From: KeyYoung Park <keyyoung.park@samsung.com>
> >
> > While wake up, if external interrupt uses handle_level_irq as
> > handle_irq (it actually uses edge type irq), That interrupt is missed.
> > So, if external uses edge type irq, it should use handle_edge_irq.
> >
> > Signed-off-by: KeyYoung Park <keyyoung.park@samsung.com>
> > Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
> > ---
> >  arch/arm/plat-s5p/irq-eint.c |    6 ++++++
> >  1 files changed, 6 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/plat-s5p/irq-eint.c
> > b/arch/arm/plat-s5p/irq-eint.c index c496b35..6ed395e 100644
> > --- a/arch/arm/plat-s5p/irq-eint.c
> > +++ b/arch/arm/plat-s5p/irq-eint.c
> > @@ -65,6 +65,7 @@ static int s5p_irq_eint_set_type(struct irq_data
> > *data, unsigned int type) int shift;
> >  	u32 ctrl, mask;
> >  	u32 newvalue = 0;
> > +	struct irq_desc *desc = irq_to_desc(data->irq);
> >
> >  	switch (type) {
> >  	case IRQ_TYPE_EDGE_RISING:
> > @@ -115,6 +116,11 @@ static int s5p_irq_eint_set_type(struct irq_data
> > *data, unsigned int type) else
> >  		printk(KERN_ERR "No such irq number %d", offs);
> >
> > +	if (type & IRQ_TYPE_EDGE_BOTH)
> > +		desc->handle_irq = handle_edge_irq;
> > +	else
> > +		desc->handle_irq = handle_level_irq;
> 
> Maybe it would be better to use __irq_set_handler_locked here instead of touching irq_desc directly?
Thanks for your review. I will send new patch.
> 
> > +
> >  	return 0;
> >  }
> 
> Regards,
> Tom
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in the body of a message to
> majordomo@vger.kernel.org More majordomo info at  http://vger.kernel.org/majordomo-info.html
