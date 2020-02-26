Return-Path: <SRS0=uzqe=4O=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10775C4BA0B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Feb 2020 12:00:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7D5724656
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Feb 2020 12:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582718428;
	bh=Lclb0eH80v4u1g56pysWLfOwuGpVeARd8AovsC1TdI0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=mqikWwGSw6hn7OZCSA9U3ehcGORiQL91oJnWKWNASdQ1H0HlBNVUzTeaJeHEifaT2
	 tmumvom54QOQeWM0RH6/tt217qOqXJKNJWDayGN+cOSFGxMt1GKFvpw6UDZT5fF9A3
	 Wdfv7Y7CNoOBwHZIlyJMwmkjRTRuyxNUJjtnZ4kw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgBZMA2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 Feb 2020 07:00:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:58386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbgBZMA2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 07:00:28 -0500
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F44324685
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2020 12:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582718427;
        bh=Lclb0eH80v4u1g56pysWLfOwuGpVeARd8AovsC1TdI0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jQ8h3U0jIhT99eGQBn9hk/2Iw7ZaCqRLCXNHtc1hpRdj62SoNyfT6kk7Nk8VxYRnk
         L4UmDMtjqWZFuLnMX5M6iNUb0xVPe6iwkdYR8uB4q3HW/4Ztq5EDp8pD9nrnfLmi9H
         Y+LFid+ArBR8644RWZH1QBtOhvRwr0BZhjoql64E=
Received: by mail-lj1-f178.google.com with SMTP id q23so2793896ljm.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2020 04:00:27 -0800 (PST)
X-Gm-Message-State: APjAAAX1dLoZlI/lgmu5R+xD3zAdi62m9aFj7eOznf+xp30vNYg9CcWI
        DKXsKyqbLvpq80vLhaxQ9TysqcGe/5YsbEQuPXE=
X-Google-Smtp-Source: APXvYqzLuH/y8h7tr6V7z1tXstBeYwFNMDWsa5vqeSxWdJeFfvmg8GAopYhFDRKEbrOZRb+7TJxkMX9L5sGVP8AX3yk=
X-Received: by 2002:a2e:88c5:: with SMTP id a5mr2891153ljk.201.1582718425607;
 Wed, 26 Feb 2020 04:00:25 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200226101131eucas1p2a30aae3cfb0df9aa36c4ddc34f513874@eucas1p2.samsung.com>
 <20200226101119.16578-1-m.szyprowski@samsung.com>
In-Reply-To: <20200226101119.16578-1-m.szyprowski@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 26 Feb 2020 13:00:14 +0100
X-Gmail-Original-Message-ID: <CAJKOXPeCj8UABGiGdvaqwa42kizHLqfrKvHZ5CDOaS1eyiY9Dg@mail.gmail.com>
Message-ID: <CAJKOXPeCj8UABGiGdvaqwa42kizHLqfrKvHZ5CDOaS1eyiY9Dg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: dsi: silence warning about regulators during
 deferred probe
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 26 Feb 2020 at 11:11, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Don't confuse user with meaningless warning about failure in getting
> regulators in case of deferred probe.

You are doing actually more than you explained here. You fixed
inaccurate error code (EPROBE_DEFER) being returned in case of
failures of getting regulators.

This change makes sense but commit message looks too innocent.

Best regards,
Krzysztof

>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 08a8ce3f499c..a85365c56d4d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1773,8 +1773,9 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(dsi->supplies),
>                                       dsi->supplies);
>         if (ret) {
> -               dev_info(dev, "failed to get regulators: %d\n", ret);
> -               return -EPROBE_DEFER;
> +               if (ret != -EPROBE_DEFER)
> +                       dev_info(dev, "failed to get regulators: %d\n", ret);
> +               return ret;
>         }
>
>         dsi->clks = devm_kcalloc(dev,
> --
> 2.17.1
>
