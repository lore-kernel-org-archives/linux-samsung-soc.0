From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V2 RESEND] gpio: samsung: use pr_* instead of printk
Date: Wed, 17 Oct 2012 10:49:10 +0900
Message-ID: <002701cdac09$9a3b67c0$ceb23740$%han@samsung.com>
References: <008901cdab77$d2538800$76fa9800$%han@samsung.com>
 <CACRpkdbBuiae=+AXfAEargz0cJEDxa0-yVETw0zpNt_pOkuF4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CACRpkdbBuiae=+AXfAEargz0cJEDxa0-yVETw0zpNt_pOkuF4g@mail.gmail.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 'Ryan Mallon' <rmallon@gmail.com>, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, October 17, 2012 2:33 AM Linus Walleij wrote:
> 
> On Tue, Oct 16, 2012 at 10:25 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> 
> >  int samsung_gpio_setpull_updown(struct samsung_gpio_chip *chip,
> >                                 unsigned int off, samsung_gpio_pull_t pull)
> >  {
> > @@ -599,7 +593,7 @@ static int samsung_gpiolib_4bit_input(struct gpio_chip *chip,
> >         con &= ~(0xf << con_4bit_shift(offset));
> >         __raw_writel(con, base + GPIOCON_OFF);
> >
> > -       gpio_dbg("%s: %p: CON now %08lx\n", __func__, base, con);
> > +       pr_debug("%s: %p: CON now %08lx\n", __func__, base, con);
> 
> Does your struct gpio_chip provide a valid dev pointer so you can use:
> 
> dev_dbg(chip->dev, "%s: %p: CON now %08lx\n", __func__, base, con);
> 
> In that case use the dev_* print macros everywhere instead.
> 

No, a valid dev pointer is not provided yet.
After a valid dev pointer is available, I will change
pr_debug to dev_dbg.

Best regards,
Jingoo Han

> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
