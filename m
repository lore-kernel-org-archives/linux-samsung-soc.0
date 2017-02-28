From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] pinctrl: samsung: Calculate GPIO base for
 pinctrl_add_gpio_range
Date: Tue, 28 Feb 2017 09:01:43 +0000
Message-ID: <20170228090143.GG2742@localhost.localdomain>
References: <20170223172313.GF2742@localhost.localdomain>
 <1487872490-27643-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <CA+Ln22FJ=Kg_HmfjhDst4fNeUoA8jh=QVsF-rUVeXgPrzunJ+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+Ln22FJ=Kg_HmfjhDst4fNeUoA8jh=QVsF-rUVeXgPrzunJ+w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 27, 2017 at 11:13:59AM +0900, Tomasz Figa wrote:
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > index ddc8d6b..864d8b4d 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -882,7 +882,7 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
> >                 pin_bank->grange.id = bank;
> >                 pin_bank->grange.pin_base = drvdata->pin_base
> >                                                 + pin_bank->pin_base;
> > -               pin_bank->grange.base = pin_bank->gpio_chip.base;
> > +               pin_bank->grange.base = pin_bank->grange.pin_base;
> 
> If we are not reading the base from the GPIO bank anymore, maybe it
> could make sense to actually make samsung_gpiolib_register() use
> bank->grange.base as gc->base? This way we would avoid explicitly
> numbering two times.
> 

Yeah no problem I can respin with that included.

Thanks,
Charles
