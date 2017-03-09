From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] pinctrl: samsung: fix segfault when using external
 interrupts on s3c24xx
Date: Thu, 9 Mar 2017 08:42:59 +0200
Message-ID: <CAJKOXPdUQ8DSPR_4cDs8WyrV9Mmy6isncW72BNiTyiRb79qf7g@mail.gmail.com>
References: <1488489799-18136-1-git-send-email-sergio.prado@e-labworks.com>
 <20170304081504.unv6sihbmp76ynfy@kozik-lap> <20170306131516.GA6095@n1>
 <20170308163434.obhtg6fwmjwqv7jm@kozik-lap> <CA+Ln22FEYfO2EmvLKTRSHNFPpKSOw38vSDvg-nPv_j08cApqCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CA+Ln22FEYfO2EmvLKTRSHNFPpKSOw38vSDvg-nPv_j08cApqCw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Mar 9, 2017 at 7:56 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> 2017-03-09 1:34 GMT+09:00 Krzysztof Kozlowski <krzk@kernel.org>:
>> On Mon, Mar 06, 2017 at 09:15:16AM -0400, Sergio Prado wrote:
>>> Hi Krzysztof,
>>>
>>> > > This is a regression from commit 8b1bd11c1f8f529057369c5b3702d13fd24e2765.
>>> >
>>> > Checkpatch should complain here about commit format.
>>> >
>>> > >
>>> > > Tested on FriendlyARM mini2440.
>>> > >
>>> >
>>> > Please add:
>>> >   Fixes: 8b1bd11c1f8f ("pinctrl: samsung: Add the support the multiple IORESOURCE_MEM for one pin-bank")
>>> >   Cc: <stable@vger.kernel.org>
>>> >
>>>
>>> OK.
>>>
>>> > > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>>> > > ---
>>> > >  drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 4 ++--
>>> > >  1 file changed, 2 insertions(+), 2 deletions(-)
>>> > >
>>> > > diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
>>> > > index b82a003546ae..1b8d887796e8 100644
>>> > > --- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
>>> > > +++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
>>> > > @@ -356,8 +356,8 @@ static inline void s3c24xx_demux_eint(struct irq_desc *desc,
>>> > >  {
>>> > >   struct s3c24xx_eint_data *data = irq_desc_get_handler_data(desc);
>>> > >   struct irq_chip *chip = irq_desc_get_chip(desc);
>>> > > - struct irq_data *irqd = irq_desc_get_irq_data(desc);
>>> > > - struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
>>> > > + struct samsung_pinctrl_drv_data *d = data->drvdata;
>>> > > + struct samsung_pin_bank *bank = d->pin_banks;
>>> >
>>> > I think 'pin_banks' point to all banks of given controller not to the
>>> > currently accessed one.
>>>
>>> Understood. I think it worked in my tests because on s3c2440 all banks
>>> have the same eint base address.
>>>
>>> So what do you think is the best approach to solve this problem?
>>
>> Maybe you can get to this through:
>>         s3c24xx_eint_domain_data = s3c24xx_eint_data->domains[virq].host_data;
>>         s3c24xx_eint_domain_data->bank
>>
>> It is getting slightly more complicated...
>
> How about the suggestions I made in my reply from March 4 (JST)?

Yes, this also looks like solution. I am not sure how much you would
like to revert but wouldn't it create duplicated members in pinctrl
structures? One for Exynos and other for S3C?

Best regards,
Krzysztof
