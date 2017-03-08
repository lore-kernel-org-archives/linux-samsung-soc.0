From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] pinctrl: samsung: fix segfault when using external
 interrupts on s3c24xx
Date: Wed, 8 Mar 2017 18:34:34 +0200
Message-ID: <20170308163434.obhtg6fwmjwqv7jm@kozik-lap>
References: <1488489799-18136-1-git-send-email-sergio.prado@e-labworks.com>
 <20170304081504.unv6sihbmp76ynfy@kozik-lap>
 <20170306131516.GA6095@n1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:32909 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751906AbdCHQek (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2017 11:34:40 -0500
Content-Disposition: inline
In-Reply-To: <20170306131516.GA6095@n1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: kgene@kernel.org, javier@osg.samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 06, 2017 at 09:15:16AM -0400, Sergio Prado wrote:
> Hi Krzysztof,
> 
> > > This is a regression from commit 8b1bd11c1f8f529057369c5b3702d13fd24e2765.
> > 
> > Checkpatch should complain here about commit format.
> > 
> > > 
> > > Tested on FriendlyARM mini2440.
> > > 
> > 
> > Please add:
> >   Fixes: 8b1bd11c1f8f ("pinctrl: samsung: Add the support the multiple IORESOURCE_MEM for one pin-bank")
> >   Cc: <stable@vger.kernel.org>
> > 
> 
> OK.
> 
> > > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> > > ---
> > >  drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
> > > index b82a003546ae..1b8d887796e8 100644
> > > --- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
> > > +++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
> > > @@ -356,8 +356,8 @@ static inline void s3c24xx_demux_eint(struct irq_desc *desc,
> > >  {
> > >  	struct s3c24xx_eint_data *data = irq_desc_get_handler_data(desc);
> > >  	struct irq_chip *chip = irq_desc_get_chip(desc);
> > > -	struct irq_data *irqd = irq_desc_get_irq_data(desc);
> > > -	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
> > > +	struct samsung_pinctrl_drv_data *d = data->drvdata;
> > > +	struct samsung_pin_bank *bank = d->pin_banks;
> > 
> > I think 'pin_banks' point to all banks of given controller not to the
> > currently accessed one.
> 
> Understood. I think it worked in my tests because on s3c2440 all banks
> have the same eint base address.
> 
> So what do you think is the best approach to solve this problem?

Maybe you can get to this through:
	s3c24xx_eint_domain_data = s3c24xx_eint_data->domains[virq].host_data;
	s3c24xx_eint_domain_data->bank

It is getting slightly more complicated...

Best regards,
Krzysztof
