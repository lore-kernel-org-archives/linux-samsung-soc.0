From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFT 1/2] pinctrl: samsung: Fix NULL pointer exception on
 external interrupts on S3C24xx
Date: Thu, 15 Jun 2017 17:28:36 +0200
Message-ID: <20170615152836.j6y4k4ydkterifii@kozik-lap>
References: <20170614131828.28683-1-krzk@kernel.org>
 <44ca46f9-0607-d750-4f26-eab717518fd9@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <44ca46f9-0607-d750-4f26-eab717518fd9@163.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Yao Lihua <ylhuajnu@163.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Prado <sergio.prado@e-labworks.com>, stable@vger.kernel.org, Donglin Peng <dolinux.peng@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jun 15, 2017 at 10:42:30PM +0800, Yao Lihua wrote:
> Hi Krzysztof,
> 
> Another Oops on S3C6410.

(...)

 > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > index f542642eed8d..a25c3ffae25c 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1013,6 +1013,11 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
> >   		bank->eint_base = virt_base[0];
> >   		bank->pctl_base = virt_base[bdata->pctl_res_idx];
> >   	}
> > +	/*
> > +	 * For legacy platforms which need to access IO memory through
> > +	 * samsung_pinctrl_drv_data:
> > +	 */
> > +	d->virt_base = virt_base[bdata->pctl_res_idx];
> > 
>     for (i = 0; i < ctrl->nr_banks; ++i, ++bdata, ++bank) {
>         ......
>     }
>     /*
>      * For legacy platforms which need to access IO memory through
>      * samsung_pinctrl_drv_data:
>      */
>     d->virt_base = virt_base[bdata->pctl_res_idx];
>                                                     ^
>                                                      **bdata** is invalid here.

Ah, of course, apparently it worked in my case by coincidence. Thanks
for spotting this.


Best regards,
Krzysztof

