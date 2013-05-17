From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 6/6] pinctrl: exynos: Handle suspend/resume of GPIO EINT registers
Date: Fri, 17 May 2013 12:25:02 -0700
Message-ID: <CAD=FV=WKCeW=3BFnmnyXB70VCjXHGrzarXbj8cBfq4-ENA-Y2w@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<1368807872-2601-7-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:60785 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753725Ab3EQTZF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 15:25:05 -0400
Received: by mail-lb0-f180.google.com with SMTP id r10so1092517lbi.39
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 12:25:03 -0700 (PDT)
In-Reply-To: <1368807872-2601-7-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Tomasz,

On Fri, May 17, 2013 at 9:24 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> Some GPIO EINT control registers needs to be preserved across
> suspend/resume cycle. This patch extends the driver to take care of
> this.

I was confused why we didn't seem to need this on exynos5250-snow but
figured it out.  We only use interrupts on GPX lines which don't need
this code.  ...but on any exynos5250 boards that use one of the other
banks for interrupts you'd need it.  I tested by setting one of the
registers related to GPA0 and found that this code is indeed needed on
exynos5250.  :)

Just nits / optional comments below, so on exynos5250-snow (pinmux
backported to 3.8):

Tested-by: Doug Anderson <dianders@chromium.org>

Reviewed-by: Doug Anderson <dianders@chromium.org>


> @@ -229,6 +235,11 @@ static int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
>                         dev_err(dev, "gpio irq domain add failed\n");
>                         return -ENXIO;
>                 }
> +
> +               bank->soc_priv = devm_kzalloc(d->dev,
> +                       sizeof(struct exynos_eint_gpio_save), GFP_KERNEL);
> +               if (!bank->soc_priv)
> +                       return -ENOMEM;

Slight nit to add this before the call to irq_domain_add_linear().
demv() will handle freeing your memory but nothing will handle undoing
the irq_domain_add_linear() if you return an error.

>         }
>
>         return 0;
> @@ -528,6 +539,58 @@ static int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
>         return 0;
>  }
>
> +static void exynos_pinctrl_suspend_bank(
> +                               struct samsung_pinctrl_drv_data *drvdata,
> +                               struct samsung_pin_bank *bank)
> +{
> +       struct exynos_eint_gpio_save *save = bank->soc_priv;
> +       void __iomem *regs = drvdata->virt_base;
> +
> +       save->eint_con = readl(regs + EXYNOS_GPIO_ECON_OFFSET
> +                                               + bank->eint_offset);
> +       save->eint_fltcon0 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +                                               + 2 * bank->eint_offset);
> +       save->eint_fltcon1 = readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +                                               + 2 * bank->eint_offset + 4);

Optional: I wish there were debug statements to help debug, like:

pr_debug("%s: save     con %#010x\n", bank->name, save->eint_con);
pr_debug("%s: save fltcon0 %#010x\n", bank->name, save->eint_fltcon0);
pr_debug("%s: save fltcon1 %#010x\n", bank->name, save->eint_fltcon1);


> +}
> +
> +static void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
> +{
> +       struct samsung_pin_ctrl *ctrl = drvdata->ctrl;
> +       struct samsung_pin_bank *bank = ctrl->pin_banks;
> +       int i;
> +
> +       for (i = 0; i < ctrl->nr_banks; ++i, ++bank)
> +               if (bank->eint_type == EINT_TYPE_GPIO)
> +                       exynos_pinctrl_suspend_bank(drvdata, bank);
> +}
> +
> +static void exynos_pinctrl_resume_bank(
> +                               struct samsung_pinctrl_drv_data *drvdata,
> +                               struct samsung_pin_bank *bank)
> +{
> +       struct exynos_eint_gpio_save *save = bank->soc_priv;
> +       void __iomem *regs = drvdata->virt_base;
> +

Optional: debug statements:

pr_debug("%s:     con %#010x => %#010x\n", bank->name,
  readl(regs + EXYNOS_GPIO_ECON_OFFSET + bank->eint_offset),
  save->eint_con);
pr_debug("%s: fltcon0 %#010x => %#010x\n", bank->name,
  readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET + 2 * bank->eint_offset),
  save->eint_fltcon0);
pr_debug("%s: fltcon1 %#010x => %#010x\n", bank->name,
  readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET + 2 * bank->eint_offset + 4),
  save->eint_fltcon1);

-Doug
