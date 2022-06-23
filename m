Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12072C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Jun 2022 12:25:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbiFWMZZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbiFWMZY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Jun 2022 08:25:24 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E7B34BB7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jun 2022 05:25:23 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id fd6so25504436edb.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jun 2022 05:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MZX8fvspGt+LtHf7gEGCk2W/SOrNo7rRR2lPEfFjYT4=;
        b=HRnHuDpUPpi75BV/4x+QAr71ZWTc6YBUanqHvk/hlPqG2B9hZ9GUCCllUSuTSSBWLP
         N1FbAzmsqFiL5HBeegRUHvT9uqty7wQvH5L1sZo8+Z6sbfIQ4dq7LEmTjtfq4RaRlwJi
         gtAlzb1rJoO4aqn4U7fqzo2L2hJFuXSi7NCSJEShYM5KDV3UmTr63pDwO/61AerH2eUx
         Yxm05O8xxZI3hixgEIS0QKQfqQ/Lw5i9zTXrMR3tG+MzYDZxCaikrLVkG/xCV17X/4Mt
         5E/k7V4zoAzWTKSdflKbL8whe4vnygRDptVx1LemRmonwavjA1MIDssjVZuNwf5PdZya
         ezdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MZX8fvspGt+LtHf7gEGCk2W/SOrNo7rRR2lPEfFjYT4=;
        b=GPhH1mHbPrRGiBuAMMaeUe/2rAz64rP21gu9u+KsBBKoBK59K5VyPWmMjesoNH4wcX
         z8qYXJvmRY9lO+QCvc2QZL05xGDizF6JDrW/esuc0yX3vhBO+4dkP+jwFXFgbDHi2nZe
         hEd1qDiqedzLW//YbZYIgcJGaxPY+xhjWO6+49/doWpsYw4KALL1vShK1JveZJtFvzFQ
         8J7kviyFxHl7N6DYqdQRrWdNfAzq4lk2N/z3htopQ0jqAjH2WVeUwUxCKNo86bwYGCDs
         A2Up46VQ01iFDXi3PUnD19MeD4IH1uVJxs8h9LqsxXaX+OxErI70jf5tirvhjvl94W86
         SOvg==
X-Gm-Message-State: AJIora82Rs+yyt/SEDkLpyrEs7FVP+G4heApkY24oqGSKoOwcl1HL+cv
        jfho+i0VnWuhAFP3cge4HrY/rbluTpD3557FNlRZcwkzsxHEIQ==
X-Google-Smtp-Source: AGRyM1ueoNAn/6UpZzXtWy0ZUh7onypqkpiS+P5CnmQom0So4UY6jwS0/RR6+03SjNQnbCnUydc3U6IYa25HrO1rd9I=
X-Received: by 2002:a05:6402:5192:b0:435:b3c3:af89 with SMTP id
 q18-20020a056402519200b00435b3c3af89mr8878880edd.390.1655987122261; Thu, 23
 Jun 2022 05:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20220623093641eucas1p11732bf2c875960f7a2bb1d6fe053bc81@eucas1p1.samsung.com>
 <20220623093629.32178-1-m.szyprowski@samsung.com>
In-Reply-To: <20220623093629.32178-1-m.szyprowski@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 23 Jun 2022 15:25:11 +0300
Message-ID: <CAPLW+4=RRsgizoV4yS2qGvUbiU011W-9J=OTQP6Xm4hMjYgVvQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/exynos: Make driver independent of the system page size
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On Thu, 23 Jun 2022 at 12:36, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> PAGE_{SIZE,SHIFT} macros depend on the configured kernel's page size, but
> the driver expects values calculated as for 4KB pages. Fix this.
>
> Reported-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

with one note: SPAGE_SIZE and SPAGE_ORDER could be used instead of
SZ_4K. But that's just a matter of taste, I'm ok with that as is,
hence R-b tag.

Thanks!

> Untested, because Exynos based boards I have doesn't boot with non-4KB
> page size for other reasons.
> ---
>  drivers/iommu/exynos-iommu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 71f2018e23fe..9c060505a46e 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -340,8 +340,7 @@ static void __sysmmu_set_ptbase(struct sysmmu_drvdata *data, phys_addr_t pgd)
>         if (MMU_MAJ_VER(data->version) < 5)
>                 writel(pgd, data->sfrbase + REG_PT_BASE_ADDR);
>         else
> -               writel(pgd >> PAGE_SHIFT,
> -                            data->sfrbase + REG_V5_PT_BASE_PFN);
> +               writel(pgd / SZ_4K, data->sfrbase + REG_V5_PT_BASE_PFN);
>
>         __sysmmu_tlb_invalidate(data);
>  }
> @@ -551,7 +550,7 @@ static void sysmmu_tlb_invalidate_entry(struct sysmmu_drvdata *data,
>                  * 64KB page can be one of 16 consecutive sets.
>                  */
>                 if (MMU_MAJ_VER(data->version) == 2)
> -                       num_inv = min_t(unsigned int, size / PAGE_SIZE, 64);
> +                       num_inv = min_t(unsigned int, size / SZ_4K, 64);
>
>                 if (sysmmu_block(data)) {
>                         __sysmmu_tlb_invalidate_entry(data, iova, num_inv);
> --
> 2.17.1
>
