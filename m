Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E62C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Nov 2022 12:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbiKDMfr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Nov 2022 08:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbiKDMfq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 08:35:46 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D760DFB1
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Nov 2022 05:35:45 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id i3so4391810pfc.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Nov 2022 05:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XmHWBzkFc1HZLdjc09N9sBj4wfV1fOFy/5vly2ZMJ+Y=;
        b=zEGeHTmJIeiiNvuFaqGoFZ6ykmIRDi7DrEVII0EvXL8kuBBgIt9dMJE/psaaZFcwAz
         rmRnctHhTcG9Xl2LplFFCuwIiTgoyG23Tx1BSgOPxrwOpBeG422dMQZzY7Cd8zHxllpb
         HzT2/ipcIR8g3v4LIIIfM6s0BfJvKLr0RrYMjL+x1nkUBMff5gfCCya+rtXJFKs4Kv+K
         lyBBN9jr3d51VJ/LOD4/ipaqQmH3f3YXCh4CZc1Fo9D4cs4PD340nJHq4XbiYdRhZDHt
         /YURcHur9G++52KzbuzHQCINsRiKsOuA8jDU4sqozbV4g7i4JWtxEdMBPZkVKGigk+qt
         7IQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmHWBzkFc1HZLdjc09N9sBj4wfV1fOFy/5vly2ZMJ+Y=;
        b=0bDbZic4/sZR74f2jHRz12+H540YQw3K4wvjI8O4uaOBtdsx9+B03Bnoa8BXJumY6x
         Bc+SSY8UCYVlnFBSFiwZ1HBIb/RoN8UCR0OhiWVzXsJpCquzLyuNoZUk4ugIphvLkMrb
         WArs21t8gPqUy1U3umE6SSY6HwlCZCWklsa4AK4HBfUsmU00vkAOvR/ZAVdcdfRHB6EN
         MEsSkgbNj5AK7Sk3/1CzZ5yLQwRGu3ia3HEojmTdPz/aVVn+AdY24ydD1QgoburdRJeY
         PCcI4XTsUYw/gIN9odZcUFY7/UXDWrmveDf41GGg9fco9KBGtLwGGKPwmroSK4MTuhbd
         kBmQ==
X-Gm-Message-State: ACrzQf07AbB1WUK6PNdnl/GREZRaTyInpMsiwJUY49yHKP2xzndJ+Qv+
        8sYUxpHnJbWIS/Kzho5zIcVwilLdfUZG+IB4aT5tyw==
X-Google-Smtp-Source: AMsMyM5FP6kjPUHON0jIZjKmjvMcb3493eZWSI/GiYlfrgvrTcywVNgR0SeFWpT5S3kbElJOhpnFmgs7iiLy5NUPenk=
X-Received: by 2002:a63:2c8b:0:b0:41c:5f9e:a1d6 with SMTP id
 s133-20020a632c8b000000b0041c5f9ea1d6mr30079380pgs.601.1667565345057; Fri, 04
 Nov 2022 05:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20221104115521eucas1p2ef149555574e8f6cbd1bb3df0bdbbb20@eucas1p2.samsung.com>
 <20221104115511.28256-1-m.szyprowski@samsung.com>
In-Reply-To: <20221104115511.28256-1-m.szyprowski@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 4 Nov 2022 13:35:33 +0100
Message-ID: <CAPLW+4=EZeWpRiaqf2xQzqTUGqn2sAB6Xj0m_CGuaVAsqpJocA@mail.gmail.com>
Subject: Re: [PATCH] iommu/exynos: Fix driver initialization sequence
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 4 Nov 2022 at 12:55, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Registering SYSMMU platform driver might directly trigger initializing
> IOMMU domains and performing initial mappings. That time all common
> resources for the SYSMMU driver must be already allocated, so move
> platform driver registration to the end of exynos_iommu_init() function.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Please let me know if you want me to rebase my patches on top of this one.

>  drivers/iommu/exynos-iommu.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 45fd4850bacb..85a6a775aea5 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -1432,12 +1432,6 @@ static int __init exynos_iommu_init(void)
>                 return -ENOMEM;
>         }
>
> -       ret = platform_driver_register(&exynos_sysmmu_driver);
> -       if (ret) {
> -               pr_err("%s: Failed to register driver\n", __func__);
> -               goto err_reg_driver;
> -       }
> -
>         zero_lv2_table = kmem_cache_zalloc(lv2table_kmem_cache, GFP_KERNEL);
>         if (zero_lv2_table == NULL) {
>                 pr_err("%s: Failed to allocate zero level2 page table\n",
> @@ -1446,10 +1440,16 @@ static int __init exynos_iommu_init(void)
>                 goto err_zero_lv2;
>         }
>
> +       ret = platform_driver_register(&exynos_sysmmu_driver);
> +       if (ret) {
> +               pr_err("%s: Failed to register driver\n", __func__);
> +               goto err_reg_driver;
> +       }
> +
>         return 0;
> -err_zero_lv2:
> -       platform_driver_unregister(&exynos_sysmmu_driver);
>  err_reg_driver:
> +       platform_driver_unregister(&exynos_sysmmu_driver);
> +err_zero_lv2:
>         kmem_cache_destroy(lv2table_kmem_cache);
>         return ret;
>  }
> --
> 2.17.1
>
