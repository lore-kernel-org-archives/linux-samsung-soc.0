Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F72C7618E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Mar 2023 19:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjCPTUZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Mar 2023 15:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjCPTUY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 15:20:24 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E533C1F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Mar 2023 12:20:18 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id j13so2684273pjd.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Mar 2023 12:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678994417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D3DngfJ3+Jb+3rKFdF51yVgT8GLTxx/0WtoHGrYOK1k=;
        b=zfwerBpAdS3zSJ44bJ99Y0rz4LuLh0oPOLPB+eR0zCuSSbt8oMo6hsVuaAVeTJkUPx
         MmVxan9XAmsTWM3cqE2jbsxqHC7cS2SF2WK9F4mGo0GRuaOfvNmKjY1mGbibmNy5uB9p
         Ei3r/z8zGNan5/U7qLKXhLEgOyOQ2KRnhh/iitd7ARsf33UF/IYNRR9ArUNEMalFjhEv
         +L/14MWkVXB8+wiXQXPNvpt/a9YcJjb0nWyDBo4V5wAo86PU2NpPWu19MO35EyzNJQHJ
         txszql05rTp3dfvenpV97esWpaDCiOgI6iBAIc7rONQz7hWQGLeRZ2YnGMESG+UE3UbK
         SZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678994417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3DngfJ3+Jb+3rKFdF51yVgT8GLTxx/0WtoHGrYOK1k=;
        b=KhsHCinAF3a8kmDyID5p39ex703EcJv3/fcBCf5IJTIJmg6haiRRCoiPuTFHIT5giW
         xhzjkM23P4QX6dGeSGSaHHNSJ9+UtUGMYDSL82flPM0r5yOUS2wecdnTScixolkKfex0
         twIXAONIqN1U5LCCKoCk/FMdWGKd5i+digds1B//JyRuJ2ay/Ule0qluJmXyB/4SaiVV
         On2q9hR8W1uY+aEoEFDaIpgg8ntRYnzSnr8G6FcCsDQftb9mhXhhQbuO0MccGkpaqkfK
         A9siLiqzfNOmqQjgCPGtu5r29Bp3xA+CpvnBb1Bw7f0osfph2wunvKCmFBjsFd8vBALW
         OKPg==
X-Gm-Message-State: AO0yUKUwGKYuEYzo49hIvn9fjNl/05vvo8RZwZ09LfIDdKPIwoSeBi01
        cVTO/kIAPEVXdKLk8NHxjRzrpyp+OZMRVS5MPWt1UA==
X-Google-Smtp-Source: AK7set/QWfJoNWbRURvvrXPm+tab7bYhozsILCCqfPBN7Fcsggqaff5TiE2vRnY/IvIinOSMMSHiiJEXPEUSM5EaUAk=
X-Received: by 2002:a17:90a:cf:b0:23e:fad0:dda1 with SMTP id
 v15-20020a17090a00cf00b0023efad0dda1mr1555415pjd.1.1678994417218; Thu, 16 Mar
 2023 12:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230315232523eucas1p2565ef5954e3b5b451803c6200c8bce32@eucas1p2.samsung.com>
 <20230315232514.1046589-1-m.szyprowski@samsung.com>
In-Reply-To: <20230315232514.1046589-1-m.szyprowski@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 16 Mar 2023 14:20:06 -0500
Message-ID: <CAPLW+4kjyPfHxbwwtP7pkO3NjeJqU6moLS=c8ftdsT1JK7zqHg@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/exynos: Fix set_platform_dma_ops() callback
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 15 Mar 2023 at 18:25, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> There are some subtle differences between release_device() and
> set_platform_dma_ops() callbacks, so separate those two callbacks. Device
> links should be removed only in release_device(), because they were
> created in probe_device() on purpose and they are needed for proper
> Exynos IOMMU driver operation. While fixing this, remove the conditional
> code as it is not really needed.
>
> Reported-by: Jason Gunthorpe <jgg@ziepe.ca>
> Fixes: 189d496b48b1 ("iommu/exynos: Add missing set_platform_dma_ops callback")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> v2:
> - keep set_platform_dma_ops only on ARM 32bit
>
> Some more background why set_platform_dma_ops is needed on ARM 32bit is
> available here:
> https://lore.kernel.org/all/9a12fcac-c347-5d81-acef-1124c50d0c37@arm.com/
> ---
>  drivers/iommu/exynos-iommu.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 483aaaeb6dae..1abd187c6075 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -1415,23 +1415,26 @@ static struct iommu_device *exynos_iommu_probe_device(struct device *dev)
>         return &data->iommu;
>  }
>
> -static void exynos_iommu_release_device(struct device *dev)
> +static void exynos_iommu_set_platform_dma(struct device *dev)
>  {
>         struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
> -       struct sysmmu_drvdata *data;
>
>         if (owner->domain) {
>                 struct iommu_group *group = iommu_group_get(dev);
>
>                 if (group) {
> -#ifndef CONFIG_ARM
> -                       WARN_ON(owner->domain !=
> -                               iommu_group_default_domain(group));
> -#endif
>                         exynos_iommu_detach_device(owner->domain, dev);
>                         iommu_group_put(group);
>                 }
>         }
> +}
> +
> +static void exynos_iommu_release_device(struct device *dev)
> +{
> +       struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
> +       struct sysmmu_drvdata *data;
> +
> +       exynos_iommu_set_platform_dma(dev);
>
>         list_for_each_entry(data, &owner->controllers, owner_node)
>                 device_link_del(data->link);
> @@ -1479,7 +1482,7 @@ static const struct iommu_ops exynos_iommu_ops = {
>         .domain_alloc = exynos_iommu_domain_alloc,
>         .device_group = generic_device_group,
>  #ifdef CONFIG_ARM
> -       .set_platform_dma_ops = exynos_iommu_release_device,
> +       .set_platform_dma_ops = exynos_iommu_set_platform_dma,
>  #endif
>         .probe_device = exynos_iommu_probe_device,
>         .release_device = exynos_iommu_release_device,
> --
> 2.34.1
>
