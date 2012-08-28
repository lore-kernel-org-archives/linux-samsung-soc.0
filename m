From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/3] gpio: samsung: Add support for Exynos4x12 SoCs
Date: Tue, 28 Aug 2012 19:27:30 +0200
Message-ID: <42072476.sfX69hco6r@flatron>
References: <4648723.rWnut7F0uJ@amdc1227> <2265472.2J2KAQrYg1@amdc1227> <CAJuYYwR3tPhk=DHJVgk1E_MqWrwT+7_YdJOSjrYX=pF7_RFjpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:64339 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752041Ab2H1R1h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 13:27:37 -0400
Received: by bkwj10 with SMTP id j10so1772465bkw.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Aug 2012 10:27:36 -0700 (PDT)
In-Reply-To: <CAJuYYwR3tPhk=DHJVgk1E_MqWrwT+7_YdJOSjrYX=pF7_RFjpw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi,

Thanks for reviewing the patch.

On Tuesday 28 of August 2012 20:25:34 Thomas Abraham wrote:
> > +       }, {
> > +               .config = &samsung_gpio_cfgs[9],
> > +               .irq_base = IRQ_EINT(24),
> > +               .chip   = {
> > +                       .base   = EXYNOS4_GPX3(0),
> > +                       .ngpio  = EXYNOS4_GPIO_X3_NR,
> > +                       .label  = "GPX3",
> > +                       .to_irq = samsung_gpiolib_to_irq,
> > +               },
> > +       },
> > +};
> 
> I see that GPX0, GPX1, GPX2 and GPX3 bank instances are already part
> of mainline kernel. How is that this is being added here.

It seems like somehow GPXx are added to exynos4210_gpios_2 again and the 
already present part is used for exynos4x12_gpios_2. I guess that it's 
because of adding ".base   = (void *)0xC00" to GPX0, which might be an 
accidental mistake. I will recheck that.

> > +       }, {
> > +               .base   = (void *)0xC00,
> > 
> >                 .config = &samsung_gpio_cfgs[9],
> >                 .irq_base = IRQ_EINT(0),
> >                 .chip   = {
> > 
> > @@ -2370,9 +2619,7 @@ static struct samsung_gpio_chip exynos4_gpios_2[]
> > = {> 
> >                 },
> >         
> >         },
> >  
> >  };
> 
> There are no GPX banks instantiated here for 4x12. What is the reason for
> that?

See previous point. GPXx which have been part of exynos4_gpios_2 become 
part of exynos4210_gpios_2.

> > -#endif
> > 
> > -#ifdef CONFIG_ARCH_EXYNOS4
> > 
> >  static struct samsung_gpio_chip exynos4_gpios_3[] = {
> >  
> >         {
> >         
> >                 .chip   = {
> > 
> > @@ -2727,12 +2974,15 @@ static __init void
> > exynos_gpiolib_attach_ofnode(struct samsung_gpio_chip *chip,
> What is the limitation in adding support for GPVx as well for 4x12 ?

I'm not sure, I might have simply overlooked GPVx. I will recheck that 
tomorrow.

Best regards,
--
Tomasz Figa
