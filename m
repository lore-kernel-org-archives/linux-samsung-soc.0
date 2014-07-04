From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: [PATCH 2/6] pinctrl: samsung: Handle GPIO request and free using
 pinctrl helpers
Date: Fri, 4 Jul 2014 15:11:39 +0530
Message-ID: <CAK5sBcFHFg7u-40NVovp9D2ro=MnQbOyiP6MtMss2PJmByR4iQ@mail.gmail.com>
References: <1404315664-3174-1-git-send-email-t.figa@samsung.com>
	<1404315664-3174-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:51005 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbaGDJlk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 05:41:40 -0400
Received: by mail-lb0-f177.google.com with SMTP id u10so970579lbd.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Jul 2014 02:41:39 -0700 (PDT)
In-Reply-To: <1404315664-3174-3-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Doug Anderson <dianders@chromium.org>

Hi Tomasz,

On Wed, Jul 2, 2014 at 9:11 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> This patch adds .request() and .free() operations to gpio_chip of
> pinctrl-samsung driver, which call pinctrl request and free helpers to
> request and free pinctrl pin along with GPIO pin.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  drivers/pinctrl/pinctrl-samsung.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
> index 779c8bc..6e099d6 100644
> --- a/drivers/pinctrl/pinctrl-samsung.c
> +++ b/drivers/pinctrl/pinctrl-samsung.c
> @@ -779,7 +779,8 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
>                 pin_bank = &drvdata->ctrl->pin_banks[bank];
>                 pin_bank->grange.name = pin_bank->name;
>                 pin_bank->grange.id = bank;
> -               pin_bank->grange.pin_base = pin_bank->pin_base;
> +               pin_bank->grange.pin_base = drvdata->ctrl->base
> +                                               + pin_bank->pin_base;

Is this a fix?

-- 
Regards,
Sachin.
