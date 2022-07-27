Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DB1C04A68
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 13:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233187AbiG0NzL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 09:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbiG0NzK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 09:55:10 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713D533E37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 06:55:05 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id w15so19184449lft.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 06:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sdiNy+K85E6T6Q5Cx2+M4h0HkFCwZdyqW9o88JSTZPk=;
        b=ouwOadP/hMPQTv7thHahdc2e7AKPdNrRyZIzuSCyE6KR79AcLZ1PgpjXmT9MMsFFe+
         1zA+2ZTzeceEo5I43eLCqk2H6A2UNkkIWR1Ep1nEs2pSVxW15D9AJtlMxSubnfRudbeL
         oh3nDontOF+AHAGff/Yfw9dGU+wytr6YSTkhz8ZAqI2ceTI3z6o6Ti+NKFXZA9LtRIw3
         cOAFYT4cGMahOlgmJmmquCa03KI5Bu0PEFQ9bXriZjGWS3+bC84X2IYQAC4pJ30/IASp
         XiqU9TEEtOyhGcOEcVk+G36+de7briY0Ic0XEgACqvi9cyLvpPbAMwAG0U6qVJe8dzz4
         acjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sdiNy+K85E6T6Q5Cx2+M4h0HkFCwZdyqW9o88JSTZPk=;
        b=VuCSndL3Ty53PaxO008JTA6KUhAhJR52wEpfT4mp2zOD8TqN4SuqYKVPG7ufhdn8/n
         tqTbmtIArQgSxIzuQysbAPxKcMOsraevsHwEkO9Gc3bW1/utsYOmZBNefMZzzjD7wXEK
         O0Ij18mP6hLFnRtLRGKxx8TEsxQmFQBX0LyHdfqRYm3bmKXcWgcIE+fVmUgIgu056RrB
         sNy4Grq7qY/9WmEa3ZxOxU1Pz0RREal3N3B2szAWOeHIm77eReZnHUQvARwHaffUGxR4
         LREAF26LSfR1xoR5SuYwiQ20oegyxpq501ah2Bd6vRmgG/CrVnz8GsS4dhrKpFUBnFYZ
         pw8A==
X-Gm-Message-State: AJIora+KJkmYyLV+hxv1m+Qn4bgxP48TxCo2awPVcYB5LpDwwpvRvxWT
        jjfKHMp7ajw/yDr5yQ/hDRO2gRAFEoRvayrXdXUnuQ==
X-Google-Smtp-Source: AGRyM1sNAQoXPZGQGR853MTNOGh+Bg6eDRkS0Wih4mISvpT8XTjJxWzxG6yZi37ackDpTTd4Ki6S1sp/2dZXQtCrhIQ=
X-Received: by 2002:a05:6512:1320:b0:488:8fcc:e196 with SMTP id
 x32-20020a056512132000b004888fcce196mr8068316lfu.602.1658930103636; Wed, 27
 Jul 2022 06:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220727013349.3056826-1-saravanak@google.com>
In-Reply-To: <20220727013349.3056826-1-saravanak@google.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 27 Jul 2022 16:54:52 +0300
Message-ID: <CAPLW+4kwcE3itHaJZUt23_EUdbb3emXbfrcAjXvhm10d53oFCg@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: samsung: Finish initializing the gpios before
 registering them
To:     Saravana Kannan <saravanak@google.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 27 Jul 2022 at 04:33, Saravana Kannan <saravanak@google.com> wrote:
>
> As soon as a gpio is registered, it should be usable by a consumer. So,
> do all the initialization before registering the gpios. Without this
> change, a consumer can request a GPIO IRQ and have the gpio to IRQ
> mapping fail.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/pinctrl/samsung/pinctrl-samsung.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 26d309d2516d..a302b38a63a8 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1168,15 +1168,15 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err_put_banks;
>
> -       ret = samsung_gpiolib_register(pdev, drvdata);
> -       if (ret)
> -               goto err_unregister;
> -
>         if (ctrl->eint_gpio_init)
>                 ctrl->eint_gpio_init(drvdata);
>         if (ctrl->eint_wkup_init)
>                 ctrl->eint_wkup_init(drvdata);
>
> +       ret = samsung_gpiolib_register(pdev, drvdata);
> +       if (ret)
> +               goto err_unregister;
> +
>         platform_set_drvdata(pdev, drvdata);
>
>         return 0;
> --
> 2.37.1.359.gd136c6c3e2-goog
>
