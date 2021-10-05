Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CADC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 12:07:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3283D61166
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 12:07:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234499AbhJEMI6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Oct 2021 08:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233784AbhJEMI6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 08:08:58 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC92AC061749
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Oct 2021 05:07:07 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id y14so9412023vsm.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2021 05:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lD83FuXyo4Rd8RPUoclDBjywfkShCLbVEGQP8et9RdA=;
        b=hKikOG5IDhmF6NJFOqVeb0VuaR8rP2Ugg7wDlfnHoNKRRg8JMTnBbRNIgtXdsQWhdo
         nB+w7sIz1XpbQfcRJclH19JCDP6JRv1Ky60u5DpF05LzJZ9lFqyebUb8/IQtRtyg1xNN
         gEKSTl7MOR0HaJCP/ARXgZjGBZnrbuldsQYd88DrHsQvIx6SBzeI9CPhkWtfAeceIsPZ
         057zIf9cGeRjOW/VM+mOdso1O2uBENaM2WaCdLPvoB9KOFyF+sDgheUazzw6GF18uS93
         QLWyV6Ehvd+pfcOX7kO9KLAwb5ywYUwUQl0pDl3xyCNFWJyOAhOS3ED+A6O9pBd9f0sJ
         FBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lD83FuXyo4Rd8RPUoclDBjywfkShCLbVEGQP8et9RdA=;
        b=ZXPEuOPVrR90yy4AnVlSky+Tl+IBNePrbY9OGOarseV0fK8BmfcQi7o1K3l3Mf44rE
         6nAaJIZDDxHNrMbO/FuwQxZMrPgVcGki0T6dK+SW4HV3DmMV5LMQR1vxaomRI2KbeLsP
         ixGPX1UDWDHiH7DI9aZ428mzd5TXY4pFo8hd7fsepJodwv7l1mplnBawBFU50rOAUc66
         LAuNOc+HauYFwefR1VyXLiUDBqHyrlNBrOmGqXFOMIp11TbUU7TRXGC0Q42IV5nNbuLG
         b3M8sLYEOosbf3jbJURvr+H7v8k87XJ20D/xH4NJc6AcDiwgQEUM5pzAeUv+ukxauuWI
         1bmg==
X-Gm-Message-State: AOAM531QnnrdH1JILHMXUsFCNxGKZPXeuEvL0bCmDdysKo3Xlwtqgl9j
        CHPl/tmRDAkx4GaIsWCCFrs7El90RDHRnXF6mB+x+g==
X-Google-Smtp-Source: ABdhPJx3yNmMRnna6IuZi2wjjUunivgAB9HUxf0ytU7h8P5hgdhT/BSdk8MnPBSK6WNNJSgdthA0P2YwONYZ0TUL5D4=
X-Received: by 2002:a67:d91b:: with SMTP id t27mr9004281vsj.55.1633435627030;
 Tue, 05 Oct 2021 05:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com> <20210919093114.35987-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210919093114.35987-2-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 5 Oct 2021 15:06:55 +0300
Message-ID: <CAPLW+4mZuB426-M4_1CdiOvxBpOrHk57OeLmRY-KXs1p4QXmpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] soc: samsung: exynos-chipid: avoid soc_device_to_device()
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 19 Sept 2021 at 12:31, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> soc_device_to_device() seems to be discouraged [1] so remove it in favor
> of printing info message with platform device.  This will only change
> the prefix in theh info message from "soc soc0: " to "exynos-chipid
> 10000000.chipid:".
>
> [1] https://lore.kernel.org/lkml/20191111052741.GB3176397@kroah.com/
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/soc/samsung/exynos-chipid.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> index 5c1d0f97f766..dcd9a08ce706 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -104,8 +104,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, soc_dev);
>
> -       dev_info(soc_device_to_device(soc_dev),
> -                "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
> +       dev_info(&pdev->dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
>                  soc_dev_attr->soc_id, product_id, revision);
>
>         return 0;
> --
> 2.30.2
>
