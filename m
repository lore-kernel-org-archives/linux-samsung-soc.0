Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D68C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 14 Jan 2022 16:39:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243475AbiANQj1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 14 Jan 2022 11:39:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243472AbiANQjZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 11:39:25 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F1BC06173F
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 08:39:25 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id y4so17917596uad.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 08:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TB9rYYWA3RApYigUmdeDs7Nca9Nz3elgch2NBvZeOg0=;
        b=j5kYZtWic5x9+6IfULEPREXK9iQOEZYgqqSp7rnA+0/szMDEk1papPfzOyMRUM/gsI
         Xllf07dgl7ZXTQPAoEcIN8l+DfX/W8W7DYHHjaxIUAkrgQIRdFdeGV5awXOD7kODdh31
         cnVsTZ8AfcWbnOyXO27A6BOUriLw9nXYpUrf5anxD2NDnvz8PumlTe0iXaiX3CsTTN7v
         923umi1sTD5OaPdkOis+mJ1urd6AYUMuFK5+GhsMUXECPkpPBbYceX28FYuKle+oDpEe
         IzsK3ZzkB3Y9ZmE5yZT1oEOqtJ1u6G3rEYSb7EsdHKSpLnB3/6B1/Ksj7ZzXdvm1IkhL
         uf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TB9rYYWA3RApYigUmdeDs7Nca9Nz3elgch2NBvZeOg0=;
        b=daU9lS9kUL4/7mKNhStgi3MhowFs5NyJiRcOIeZqpYY1PtX7oOeonii6vr5WZzKn/V
         LNz9EzuQOh/lJT2GV06s84ULue0PCA8Hmb5quBk6M894Coip3/GOAWF5rwcHq0rkEgby
         haxzwBr9JRsWYTBGswCftkZc0cDPp3ZUz71bTvsI+1fQATlzIQZ9fVpjHph1bwXBWQ9b
         byfulnESu47xWcIp9VA6B/6dMRU8eZSYi9Oj4V70Hfop09xkNDtNKPezISzyhTsnSWMU
         7ELfNB+aR+KnaoRsiHs8JTnnJ3notGBDQ2rNsWv5GHqr+L54OS0TkKh/GSKnOGz0nU/3
         u58Q==
X-Gm-Message-State: AOAM530dOfvi+8YnlzxYSBUEV7GcRM/n69RaDh9pqeEBQDTTof3gvmqv
        QDQmYRK5QOBbkQVvewWlw0xH6BonjtqC6F499PKlbA==
X-Google-Smtp-Source: ABdhPJxbgJnPkI9Tq2dgW1Q5XbXJ8e/r8vZnzrtBuMqFg0KMsO4wZ60iX5gYpy2VvwwP+v1QEaq/YykPn3ntOjBBxh8=
X-Received: by 2002:a05:6102:94c:: with SMTP id a12mr4531319vsi.86.1642178364582;
 Fri, 14 Jan 2022 08:39:24 -0800 (PST)
MIME-Version: 1.0
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com> <20220111201722.327219-20-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220111201722.327219-20-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 14 Jan 2022 18:39:13 +0200
Message-ID: <CAPLW+4k3Pypn6t-hHVtxg216oj=LMtchdRtsJmKBANN639oRgQ@mail.gmail.com>
Subject: Re: [PATCH v2 26/28] pinctrl: samsung: add support for Exynos850 and
 ExynosAutov9 wake-ups
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 11 Jan 2022 at 22:18, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> It seems that newer ARMv8 Exynos SoC like Exynos850 and
> ExynosAutov9 have differences of their pin controller node capable of
> external wake-up interrupts:
> 1. No multiplexed external wake-up interrupt, only direct,
> 2. More than one pin controller capable of external wake-up interrupts.
>
> Add support for dedicated Exynos850 and ExynosAutov9 compatibles.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/pinctrl/samsung/pinctrl-exynos.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
> index 0489c899b401..a158d587814e 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -465,6 +465,10 @@ static const struct of_device_id exynos_wkup_irq_ids[] = {
>                         .data = &exynos4210_wkup_irq_chip },
>         { .compatible = "samsung,exynos7-wakeup-eint",
>                         .data = &exynos7_wkup_irq_chip },
> +       { .compatible = "samsung,exynos850-wakeup-eint",
> +                       .data = &exynos7_wkup_irq_chip },
> +       { .compatible = "samsung,exynosautov9-wakeup-eint",
> +                       .data = &exynos7_wkup_irq_chip },
>         { }
>  };
>
> --
> 2.32.0
>
