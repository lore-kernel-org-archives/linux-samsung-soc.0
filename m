Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820FFC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 19 Sep 2021 17:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BB78611C3
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 19 Sep 2021 17:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbhISReS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 19 Sep 2021 13:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhISReP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 19 Sep 2021 13:34:15 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874C5C061574;
        Sun, 19 Sep 2021 10:32:50 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id d11so12162383ilc.8;
        Sun, 19 Sep 2021 10:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Gbr6qUKWHVKiXPdk5V4pk0xSy2NBQ/5pmcHqgFNJHo=;
        b=AXOm5AdXPt/dNYXBz0ZQmUVAkNTQysRL+nzDPvs+OfsKKjeW8e7zcwbLtMKOJgBqwk
         Sd/HH4Lj60j5HOcrUXyycsW53ObpyAMuKQtekdws7y1dshwkTOZhaYtdBeeEKjQzx0fX
         BaZlbeBn/8FMR0kPDjr8LukGKNuy1vaVsypjh7VaVhWUGj4rhpKiu3TOvfLfigQQAKJu
         aXL1sl41FtbDTO7QCjyzbSK7VR8PRz3esnq7ovQFfEqdXl2gW16MCvRdgvu1pSOQeIvM
         Kc/9nzw5jraMY6ERb/dRgJLsdd6qHrU0E2zp6EFZrQkuhPEITgpWcNxAvKqowHvQCurH
         88Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Gbr6qUKWHVKiXPdk5V4pk0xSy2NBQ/5pmcHqgFNJHo=;
        b=R1ijs+G3+BFZ51Lz84F+WRK4DrnutqJsdiwRA3y+QFd3Ewluc2CN+XRG4gzXYYKsuo
         DdvRy/6x3HqdO/kkf9sIIAJTrEhs25IPwo636RI/Sa1U4cGx1FUIjTEiD/qgHOO4UEKF
         wHXjxKSOW8rbPkzFnvWk1f6QtwLdJ7s7nq3B04222ujYRS3d2rrkCREJ8sjLmS32WQwx
         kaiRlMyO+X3gk+OF5DLGhCCrYW5zqslUipqlQsRVuYuACTQjVcAV+ZjmgzmjwcphTDKN
         9o4BxahjAdXOIAzX3Srs92KZYpsOAO7/c7sR8yUaMLqNxRc6P5PJ6uaJteN+S2qXW8y3
         yZfg==
X-Gm-Message-State: AOAM533BPSEwbeoB/RAWGUfNTbgt6V8Rl2mwuvPnuv/5P59gts0sp411
        yQB9c2Yv37oCWtn6BRBTYC5WxK03KqAix4wecOc=
X-Google-Smtp-Source: ABdhPJxP1B+9Kdk+qN58zeHUOx+M9WqXgfLUyibiCfebby9oMAIQOYaggirngAIT5qDJstvUfMfpsim8DJBqG28QhtM=
X-Received: by 2002:a05:6e02:1bed:: with SMTP id y13mr5594036ilv.249.1632072769987;
 Sun, 19 Sep 2021 10:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com>
From:   Alim Akhtar <alim.akhtar@gmail.com>
Date:   Sun, 19 Sep 2021 23:02:14 +0530
Message-ID: <CAGOxZ50i6URzUQ7o7V4m7MR=2TqSeD6qx5fQaQDs+5nEq4fa2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] soc: samsung: exynos-chipid: be a module!
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
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

Hello Krzysztof

On Sun, Sep 19, 2021 at 6:28 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Hi,
>
> Changes since v1
> ================
> 1. Drop patch 1/2 - exporting soc_device_to_device
> 2. Add new patches: 1/3 and 3/3.
>
> Question
> ========
>
> A question - what is the convention for naming modules: underscores '_' or
> hyphens '-'?
>
> The C-unit file already uses a hyphen "exynos-chipid.c", so I could
> create a module named:
> 1. exynos_chipid
> 2. soc-exynos-chipid
> 3. exynos-chip-id
>
> The Linux device name is "exynos-chipid".
>
> Best regards,
> Krzysztof
>
>
> Krzysztof Kozlowski (3):
>   soc: samsung: exynos-chipid: avoid soc_device_to_device()
>   soc: samsung: exynos-chipid: convert to a module
>   soc: samsung: exynos-chipid: do not enforce built-in
>
>  arch/arm/mach-exynos/Kconfig         |  1 -
>  drivers/soc/samsung/Kconfig          |  4 +++-
>  drivers/soc/samsung/Makefile         |  3 ++-
>  drivers/soc/samsung/exynos-chipid.c  | 14 +++++++++++---
>  drivers/soc/samsung/exynos5422-asv.c |  1 +
>  5 files changed, 17 insertions(+), 6 deletions(-)
>
Thanks for the patches. For this series
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Also tested on exynos7 based platform, so
Tested-by: Alim Akhtar <alim.akhtar@samsung.com>

> --
> 2.30.2
>


-- 
Regards,
Alim
