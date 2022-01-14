Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E03C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 14 Jan 2022 16:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243205AbiANQNs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 14 Jan 2022 11:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243190AbiANQNk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 11:13:40 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B60C06173F
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 08:13:39 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id m90so17822819uam.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 08:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qxkpv3eNiRdJcWaLuANiCoD4pI3qvbrsDdQYc45dZk8=;
        b=goCpoT6iIjZHX/StCqxQby/LS7loOLRpEO/Y1+Fj6M2kXs38lG7f13W8ikbjrmBMCB
         OnFyQXUuaTcCidVWULOBJLIvx/O/tI14Z/F4AqdGWKvBoErCdpyWjtBMdyDgcX26Jfur
         P7tevqaqFwc2lNh+GQupHifgTHk1QgJ0IulZyqJpHw93YdOpRSB30jRvKA//YtZrz3uy
         /rLzNvL+AP0sqJ3Gw46gtEEyJHSgy+hlpmuz9XhnzfG6TSHUx8NMiint7b7kMzgahLzi
         uyYTcPOibvNGpK23+DpgqR2j4PPmT16QhZWV9UBCLL4NKQuKJeBHXJ6hFknVvbMD9Vjx
         Z9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qxkpv3eNiRdJcWaLuANiCoD4pI3qvbrsDdQYc45dZk8=;
        b=QNRgKXoMbiKcbWxn2pZjSSaomX+aVqh8jZ0ogbXcGzUltkAFYKtPgxMhD6tU0ZF7Kv
         QSpGShgSN8567LmzBx/FfrbMvyWGW1W77huB717MzHzo258KngokQs/1SpaZa79YbIEn
         nNQoElc12ooKKA86UV56Hv9yl4pJ7y44pb02VL+Jb871IgCZ5gbr13dBRH1bxBDke+tG
         ECWih+s4StEq76+ogetLXy/RxO831rGYCYVQaI6nwY0j+lhM+aa0kHjy06dB1uQRd5z4
         uxoLK8MgsfMr+nvPMYMO8h+TIb11f0d2OlzGxsHg33EnR2nqsKIlI/+NAVJGbrizapj2
         tI1g==
X-Gm-Message-State: AOAM531OpZ29S6e95XKIgIayHRfsKf4uvKaNT8t0ZWjnK+//Pr5RsZMC
        jlv5INNCjqJFztgVn0KPUEQQgpBxLM+miHUbhjS6YdY8q6j9iQ==
X-Google-Smtp-Source: ABdhPJzWflgFRWJp52JXGQ6mFbqqIxK3ZZYuUMkUM0idCjp2RCLsqwd6kxDjkUeOcXkWzHUSz8ObECiekIGt+opAxuw=
X-Received: by 2002:ab0:13ee:: with SMTP id n43mr4421442uae.9.1642176818829;
 Fri, 14 Jan 2022 08:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20220112100046.68068-1-krzysztof.kozlowski@canonical.com> <20220112100046.68068-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220112100046.68068-5-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 14 Jan 2022 18:13:27 +0200
Message-ID: <CAPLW+4mRY7diuP8Ts_pnY6M0TeK9OmxPe+fh_K0YBBzvitRNbw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] spi: s3c64xx: allow controller-data to be optional
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 12 Jan 2022 at 12:00, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> The Samsung SoC SPI driver requires to provide controller-data node
> for each of SPI peripheral device nodes.  Make this controller-data node
> optional, so DTS could be simpler.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/spi/spi-s3c64xx.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 8755cd85e83c..769d958a2f86 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -796,16 +796,14 @@ static struct s3c64xx_spi_csinfo *s3c64xx_get_slave_ctrldata(
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       data_np = of_get_child_by_name(slave_np, "controller-data");
> -       if (!data_np) {
> -               dev_err(&spi->dev, "child node 'controller-data' not found\n");
> -               return ERR_PTR(-EINVAL);
> -       }
> -
>         cs = kzalloc(sizeof(*cs), GFP_KERNEL);
> -       if (!cs) {
> -               of_node_put(data_np);
> +       if (!cs)
>                 return ERR_PTR(-ENOMEM);
> +
> +       data_np = of_get_child_by_name(slave_np, "controller-data");
> +       if (!data_np) {
> +               dev_info(&spi->dev, "child node 'controller-data' not found, using defaults\n");
> +               return cs;
>         }
>
>         of_property_read_u32(data_np, "samsung,spi-feedback-delay", &fb_delay);
> --
> 2.32.0
>
