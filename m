Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC9AC43334
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Jul 2022 13:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237590AbiGHNSr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Jul 2022 09:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237238AbiGHNSr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Jul 2022 09:18:47 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2691183B8
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Jul 2022 06:18:45 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id n15so25882972ljg.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Jul 2022 06:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Yam3y0DcCFqvtPSG9KOweCqxMOCqoZ/tVs5qs0X19I=;
        b=kQj86bjG5zvMHEWhoxQWhFXTOUb15TA7YqDTqLA361xfX3dMGb3sA66mMwl6cGu1Cp
         6Q867H9s0YhApBd6xEXsnrThqvBSoz4fZBP7GLTRSaQ2QnK2HHIHWLF7Bkz+/ibQrGx9
         WmOhWen94YFgjXDgtkMpIKy7LhOV3xpqHo7pF7uXoOeJux9kYLux8b8Da6NFvugnft3J
         7IDixkpvl3CYYIAi1v+2agBHTgmcIGWQ7LyOylWYDH605GAIKDf+ueY84GGCLvQA03zg
         h7ZrE3ctcGYV6khkrm9AlNVaQcIRWiW0Aabx9L/vnPGrhtaV+DOamJDJZOY0RVy/mPqT
         Q1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Yam3y0DcCFqvtPSG9KOweCqxMOCqoZ/tVs5qs0X19I=;
        b=iQIhELvKFdquTQENQa6ZE+g7Gq+GGGmT+IoPLc90sTLgCPJY7DuHLt2JH5N3p/KmyK
         9iikAhc9MsDH/QQXMXpriJR0g+Z3LQw6eOr6kIXQOhoz6uqtx/Riruf01+/GFcyqa5ih
         LsULSdnhhHEusRBdj7Wb8iSTnZuC3gI2kH+REaQzlyGMF5qm50F0b4MYYQagjJ63sxxu
         6aNWSJwyeZgYP2ib33ZHa/9ZjLpaFbvrkBXFG3j13cVjV9IgRPKjMU2TXY8PQ9noe9G3
         GpA4HHv4AiG8jN0uxHLAfYbdyIQqd0sbxur2f/uaQoHoq6859OzuZgIbo5wSWg26Hhxn
         T6GQ==
X-Gm-Message-State: AJIora9sHB+KduubG9MYXdYtf9L8EP9u9buBwrYS4Im5LmgGCcxGiNAc
        ZNRg8e5LSFN5oanR2qfL4pxin4wUb9I/pi3dUpBopg==
X-Google-Smtp-Source: AGRyM1uIshwbshScAbeRQz3UVgzvkjmr6Hms69W47MrzRQoRsZF9RKD+toMCTMaHHbdrVf4EyhuKSDLC3CiVAnM6wtg=
X-Received: by 2002:a2e:a413:0:b0:25d:4844:9d65 with SMTP id
 p19-20020a2ea413000000b0025d48449d65mr1997343ljn.169.1657286324182; Fri, 08
 Jul 2022 06:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220702213724.3949-1-semen.protsenko@linaro.org>
 <20220702213724.3949-2-semen.protsenko@linaro.org> <9afb1e98-706f-ed61-892c-e3cc321364b4@linaro.org>
In-Reply-To: <9afb1e98-706f-ed61-892c-e3cc321364b4@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 8 Jul 2022 16:18:32 +0300
Message-ID: <CAPLW+4kfrHOb8utzynhB=2KLDQu-NC08UYpAVjpg__NQSeSQyg@mail.gmail.com>
Subject: Re: [PATCH 1/4] iommu/exynos: Set correct dma mask for SysMMU v5+
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        iommu@lists.linux-foundation.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 3 Jul 2022 at 21:50, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/07/2022 23:37, Sam Protsenko wrote:
> > SysMMU v5+ supports 36 bit physical address space. Set corresponding DMA
> > mask to avoid falling back to SWTLBIO usage in dma_map_single() because
> > of failed dma_capable() check.
> >
> > The original code for this fix was suggested by Marek.
> >
> > Originally-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> This is some tip specific tag, I don't think checkpatch allows it.
> Either use suggesgted-by or co-developed-by + SoB.
>

Yes, checkpatch is swearing at that line, though I encountered that
tag mentioning somewhere in Documentation. Will rework it in v2.

> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/iommu/exynos-iommu.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> > index 71f2018e23fe..28f8c8d93aa3 100644
> > --- a/drivers/iommu/exynos-iommu.c
> > +++ b/drivers/iommu/exynos-iommu.c
> > @@ -647,6 +647,14 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
> >               }
> >       }
> >
> > +     if (MMU_MAJ_VER(data->version) >= 5) {
> > +             ret = dma_set_mask(dev, DMA_BIT_MASK(36));
> > +             if (ret) {
> > +                     dev_err(dev, "Unable to set DMA mask: %d\n", ret);
>
> Missing cleanup: iommu_device_unregister
> and probably also: iommu_device_sysfs_remove
>

Right. Also the correct cleanup should be added for failing
iommu_device_register() case, above of the quoted code. Will do that
in v2, thanks.

Another thing is that "remove" method is missing. But guess I'll get
to it later, when adding modularization support for this driver.

> > +                     return ret;
> > +             }
> > +     }
> > +
> >       /*
> >        * use the first registered sysmmu device for performing
> >        * dma mapping operations on iommu page tables (cpu cache flush)
>
>
> Best regards,
> Krzysztof
