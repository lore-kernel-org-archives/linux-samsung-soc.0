From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: S5P: Can handle edge interrupt handler
Date: Fri, 10 Feb 2012 21:01:48 +0100
Message-ID: <1683433.XtZk95zyY3@flatron>
References: <017401cce7f4$4623f5a0$d26be0e0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:64030 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754167Ab2BJUCD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 15:02:03 -0500
Received: by eaah12 with SMTP id h12so1042602eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Feb 2012 12:02:02 -0800 (PST)
In-Reply-To: <017401cce7f4$4623f5a0$d26be0e0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Huisung Kang <hs1218.kang@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, keyyoung.park@samsung.com

I wonder if same thing wouldn't be also needed for s3c64xx.

Also please see my comments inline.

On Friday 10 of February 2012 22:02:42 Huisung Kang wrote:
> From: KeyYoung Park <keyyoung.park@samsung.com>
> 
> While wake up, if external interrupt uses handle_level_irq
> as handle_irq (it actually uses edge type irq), That interrupt is missed.
> So, if external uses edge type irq, it should use handle_edge_irq.
> 
> Signed-off-by: KeyYoung Park <keyyoung.park@samsung.com>
> Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
> ---
>  arch/arm/plat-s5p/irq-eint.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-s5p/irq-eint.c b/arch/arm/plat-s5p/irq-eint.c
> index c496b35..6ed395e 100644
> --- a/arch/arm/plat-s5p/irq-eint.c
> +++ b/arch/arm/plat-s5p/irq-eint.c
> @@ -65,6 +65,7 @@ static int s5p_irq_eint_set_type(struct irq_data *data,
> unsigned int type) int shift;
>  	u32 ctrl, mask;
>  	u32 newvalue = 0;
> +	struct irq_desc *desc = irq_to_desc(data->irq);
> 
>  	switch (type) {
>  	case IRQ_TYPE_EDGE_RISING:
> @@ -115,6 +116,11 @@ static int s5p_irq_eint_set_type(struct irq_data
> *data, unsigned int type) else
>  		printk(KERN_ERR "No such irq number %d", offs);
> 
> +	if (type & IRQ_TYPE_EDGE_BOTH)
> +		desc->handle_irq = handle_edge_irq;
> +	else
> +		desc->handle_irq = handle_level_irq;

Maybe it would be better to use __irq_set_handler_locked here instead of 
touching irq_desc directly?

> +
>  	return 0;
>  }

Regards,
Tom
