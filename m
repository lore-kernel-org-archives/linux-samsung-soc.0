Return-Path: <SRS0=V4sZ=4Q=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEDCC3F2D2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 10:06:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4025246A0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 10:06:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=verdurent-com.20150623.gappssmtp.com header.i=@verdurent-com.20150623.gappssmtp.com header.b="PzeYbRw+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgB1KGe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Feb 2020 05:06:34 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:43010 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgB1KGe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 05:06:34 -0500
Received: by mail-vs1-f66.google.com with SMTP id 7so1564240vsr.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Feb 2020 02:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=InyvFyZ/5bxCUOynjC6lpv2Fa6LG6T5vC6/2VR0weU4=;
        b=PzeYbRw+1d4tOTIvVmv8WOwZUT7ugbzZaN4HN095qyoN60ncxY+KxLJ8CGXgVLtywZ
         PzRRzd/Boh5BxVT39etHcbM/GVLwHGA/pQu/6qYEnkTyIFJat3gpBDHil+GfSjDlw+Ay
         aoJJq++pc+C1M/2qjZU5snzG5JOccINZQy1w8m0FAiQIZ7OJQgxFofSAIQ33bRVM1A7u
         BnHntdL/PwHIRGerTeue8Og1XlpoAC1B6ugfIIdOT0+QjYRp6nZwJBAjg5h9CJnqFGqZ
         1OM8YHno56hD+I5HrsNOFAw6k/r+dvKDG4Ns9huXjUdfzR2u3lBvDX5S2RHQ825XsXLb
         OwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=InyvFyZ/5bxCUOynjC6lpv2Fa6LG6T5vC6/2VR0weU4=;
        b=t5LhKY78Z91RWgFnPZGB/bHV0h/gwHOnm3pEwmCBCQkXd/ctLsimOVMqjS/9H986Rg
         jnpVSE6F9KJ6OCl4B1QOGZCuTBIzNhyfAPsQWihLpFWUB5LCJuP8d4kJeg9L+bCF4qby
         cES3yWRh7xMbiVlWNZe5x6JGgky+Vzk0yTP6OU1LLOFVV28v64XsrqrQ+PyLjtoNAg+e
         44e2DVQVsMXse3pAUJ1965pqPjqFrSJWnVgKohQTB7BaqhxLxhD0z5zqVWc9EwJtVoB/
         81vZw7qqibEfjaks1ENtI6yGvR+epcwbpBmtbITO+fVFq6oHBkpY6lSnzhPGvKFsIHMG
         2GJA==
X-Gm-Message-State: ANhLgQ1A6q4GzNCJ/SjmC465sveXJihoaSukadsQSkYBnJ4AX0oIURPE
        1ejdgl2AABgl6WgA7D2299mdDMJGSb2YHrxAfPINFg==
X-Google-Smtp-Source: ADFU+vuZA1XQ4xbgMSEaWxgfM1zO76KhScqpXifMj+FzO5W8iDdZrT7Cbt3IZqF0CejkSumiQMSUNEHOKy8Pgn+JJ6Q=
X-Received: by 2002:a05:6102:535:: with SMTP id m21mr1937391vsa.95.1582884391664;
 Fri, 28 Feb 2020 02:06:31 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200228092342eucas1p1ead44fbfd9ab57c02ffa588ca9acb97a@eucas1p1.samsung.com>
 <20200228092331.21548-1-m.szyprowski@samsung.com>
In-Reply-To: <20200228092331.21548-1-m.szyprowski@samsung.com>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Fri, 28 Feb 2020 15:36:20 +0530
Message-ID: <CAHLCerN7aV82NTAoPT-ukNBJifySqSxfRogXP6ByMmJiV6nuCA@mail.gmail.com>
Subject: Re: [PATCH] thermal: exynos: Silence warning during deferred probe
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux PM list <linux-pm@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Feb 28, 2020 at 2:53 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Don't confuse user with meaningless warning about the failure of
> registering sensors in case of deferred probe.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  drivers/thermal/samsung/exynos_tmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index fd4a17812f33..e9a90bc23b11 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -1094,7 +1094,9 @@ static int exynos_tmu_probe(struct platform_device *pdev)
>                                                     &exynos_sensor_ops);
>         if (IS_ERR(data->tzd)) {
>                 ret = PTR_ERR(data->tzd);
> -               dev_err(&pdev->dev, "Failed to register sensor: %d\n", ret);
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(&pdev->dev, "Failed to register sensor: %d\n",
> +                               ret);
>                 goto err_sclk;
>         }
>
> --
> 2.17.1
>
