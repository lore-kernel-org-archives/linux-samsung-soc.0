From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] i2c: s3c2410: add optional pin configuration using
 pinctrl interface
Date: Mon, 10 Sep 2012 22:02:41 +0200
Message-ID: <CACRpkdZ7kjfDQ-CNCcCv5fQwSqMez6sKSMUMLB=0Aviboiz=2g@mail.gmail.com>
References: <1346923381-14144-1-git-send-email-thomas.abraham@linaro.org>
	<1346923381-14144-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:48956 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751741Ab2IJUCm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Sep 2012 16:02:42 -0400
Received: by weyx8 with SMTP id x8so1525314wey.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Sep 2012 13:02:41 -0700 (PDT)
In-Reply-To: <1346923381-14144-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, dong.aisheng@linaro.org, swarren@wwwdotorg.org, kgene.kim@samsung.com, patches@linaro.org, w.sang@pengutronix.de, ben-linux@fluff.org

On Thu, Sep 6, 2012 at 11:23 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> Add optional support for i2c bus pin configuration using pinctrl interface
>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
(...)
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
(...)
> -       else
> -               if (s3c24xx_i2c_parse_dt_gpio(i2c))
> +       } else if (!IS_ERR_OR_NULL(i2c->pctrl) &&
> +                       !IS_ERR_OR_NULL(i2c->pctrl_state)) {

You don't need to check i2c->pctrl here, just check i2c->pctrl_state.

If i2c->pctrl failed the other one will be null too, anyway.
(Or the struct isn't kzalloc:ed properly... which I assume.)

> +               if (pinctrl_select_state(i2c->pctrl, i2c->pctrl_state)) {
> +                       dev_err(i2c->dev, "failed to configure io-pins\n");
> +                       return -ENXIO;
> +               }
> +       } else if (s3c24xx_i2c_parse_dt_gpio(i2c)) {
>                         return -EINVAL;
> +       }
>
>         /* write slave address */
>
> @@ -1013,6 +1022,10 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>         i2c->adap.algo_data = i2c;
>         i2c->adap.dev.parent = &pdev->dev;
>
> +       i2c->pctrl = devm_pinctrl_get(i2c->dev);
> +       if (!IS_ERR_OR_NULL(i2c->pctrl))
> +               i2c->pctrl_state = pinctrl_lookup_state(i2c->pctrl, "default");
> +

If all you do is select the default state (later, in the init function)
the use devm_pinctrl_get_select_default() and be done
with it.

In any case do not open code the string "default", use
PINCTRL_STATE_DEFAULT which defines to that string.

Yours,
Linus Walleij
