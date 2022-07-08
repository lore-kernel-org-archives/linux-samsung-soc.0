Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3602C43334
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Jul 2022 13:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238104AbiGHNfL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Jul 2022 09:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237922AbiGHNfK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Jul 2022 09:35:10 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E72D1C131
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Jul 2022 06:35:08 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t19so35759265lfl.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Jul 2022 06:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PIWMjj4b5YbA95iQKtLRWWzbbV2WS/utZy9nG1S7rpA=;
        b=jGg0DF6XDZu/DPxb4/js0k+9Dbdm6f6hrv6vVO5pdHWA74MuuN8N3Xe4B+oAIJUAv7
         inAZnIcz9sFe0BtDSjlkO/wp4Zyd4yileMZxGEhL4Hugx3fR8Ae6VekUgdLLDSmbtE7R
         T25L2oU8lTfflMIFl7gyWYVwg7u7qiFnadrOyzMyUfZlpJkZ6lyXPbfohAHMDwO3Raqj
         gJrMC8He4ayv5iQ1PPbWE1UD7mN2xrYmvN+8tsjIA+6srCeE7SmzcuX9DEEhfksPsoDq
         X5qm8XOQSlOnLY3g1T2/XjZzuiPBH6fLttzYtrILVeE06q0p4ZTocoOj3aGwQQrWXEVi
         /tDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PIWMjj4b5YbA95iQKtLRWWzbbV2WS/utZy9nG1S7rpA=;
        b=xZGWp/ACOrK3PmhxpR15xF1SBWLyOHP9L4kaRyNdxzZBtuBzw6Y23y22YajEbi197h
         H74TykzNB0N3RgrHzU/b6xHfPyYry2WLqNDHZx6uvs/l6rZE/v6xSu7Y5GsFfSqfkI9J
         DY0BOQtFV3K5pEDJXJdJ6CmW5K8WYBALjDuySjh/daeSNIotENcxmUnv0v63C6IeJ6Nh
         vjFkWmXTVpj6MYMZZVZQo6ZzoLYkz7Gpaxie5GDDNfn/oXxZAKBwQ9njKbgYWjGQWv9I
         hfq3VidN8o81gM3kInA0LMxe390sTFfWEIkAqBVnO176tl1giuUoovmUdqHVy9Bx/A9C
         Iw5g==
X-Gm-Message-State: AJIora/oWcJLQYWGWV5m95H/qqD38mHnMa8QG9iETlQgfcIi1w4T2ZG3
        fwmZ6CKK0VuGkX3bXl6o/EQybvwyWHTfkRSnto32kA==
X-Google-Smtp-Source: AGRyM1u09XqLCsj6MLE9uVUKKS4KmeeYTF4xX23pX9GlNeyPuUvFR/e6v3VNYde0cfT+8psgj2xPVAU3viKgkjLwL4Q=
X-Received: by 2002:ac2:47f6:0:b0:488:b649:9f77 with SMTP id
 b22-20020ac247f6000000b00488b6499f77mr2556167lfp.559.1657287306626; Fri, 08
 Jul 2022 06:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220702213724.3949-1-semen.protsenko@linaro.org>
 <20220702213724.3949-3-semen.protsenko@linaro.org> <23357d34-4570-1309-6b6e-46055bdb8160@linaro.org>
In-Reply-To: <23357d34-4570-1309-6b6e-46055bdb8160@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 8 Jul 2022 16:34:55 +0300
Message-ID: <CAPLW+4=A7wTwH8a40hzDxn=4yT+jeMn2DX2WRyzxaX59hgbDnw@mail.gmail.com>
Subject: Re: [PATCH 2/4] iommu/exynos: Check if SysMMU v7 has VM registers
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

On Sun, 3 Jul 2022 at 22:10, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/07/2022 23:37, Sam Protsenko wrote:
> > SysMMU v7 can have Virtual Machine registers, which implement multiple
> > translation domains. The driver should know if it's true or not, as VM
> > registers shouldn't be accessed if not present. Read corresponding
> > capabilities register to obtain that info, and store it in driver data.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/iommu/exynos-iommu.c | 42 ++++++++++++++++++++++++++++++------
> >  1 file changed, 36 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> > index 28f8c8d93aa3..df6ddbebbe2b 100644
> > --- a/drivers/iommu/exynos-iommu.c
> > +++ b/drivers/iommu/exynos-iommu.c
> > @@ -135,6 +135,9 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
> >  #define CFG_SYSSEL   (1 << 22) /* System MMU 3.2 only */
> >  #define CFG_FLPDCACHE        (1 << 20) /* System MMU 3.2+ only */
> >
> > +#define CAPA0_CAPA1_EXIST            BIT(11)
> > +#define CAPA1_VCR_ENABLED            BIT(14)
> > +
> >  /* common registers */
> >  #define REG_MMU_CTRL         0x000
> >  #define REG_MMU_CFG          0x004
> > @@ -171,6 +174,10 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
> >  #define REG_V5_FAULT_AR_VA   0x070
> >  #define REG_V5_FAULT_AW_VA   0x080
> >
> > +/* v7.x registers */
> > +#define REG_V7_CAPA0         0x870
> > +#define REG_V7_CAPA1         0x874
> > +
> >  #define has_sysmmu(dev)              (dev_iommu_priv_get(dev) != NULL)
> >
> >  static struct device *dma_dev;
> > @@ -274,6 +281,9 @@ struct sysmmu_drvdata {
> >       unsigned int version;           /* our version */
> >
> >       struct iommu_device iommu;      /* IOMMU core handle */
> > +
> > +     /* v7 fields */
> > +     bool has_vcr;                   /* virtual machine control register */
> >  };
> >
> >  static struct exynos_iommu_domain *to_exynos_domain(struct iommu_domain *dom)
> > @@ -364,11 +374,7 @@ static void __sysmmu_disable_clocks(struct sysmmu_drvdata *data)
> >
> >  static void __sysmmu_get_version(struct sysmmu_drvdata *data)
> >  {
> > -     u32 ver;
> > -
> > -     __sysmmu_enable_clocks(data);
> > -
> > -     ver = readl(data->sfrbase + REG_MMU_VERSION);
> > +     const u32 ver = readl(data->sfrbase + REG_MMU_VERSION);
>
>
> No need for const for local, non-pointer variables. There is no benefit
> in preventing the modification and it is not a constant.
>

I'd say it's more a matter of taste, having "const" kinda disciplines
one. But I don't mind removing those bits, will do in v2.

> >
> >       /* controllers on some SoCs don't report proper version */
> >       if (ver == 0x80000001u)
> > @@ -378,6 +384,29 @@ static void __sysmmu_get_version(struct sysmmu_drvdata *data)
> >
> >       dev_dbg(data->sysmmu, "hardware version: %d.%d\n",
> >               MMU_MAJ_VER(data->version), MMU_MIN_VER(data->version));
> > +}
> > +
> > +static bool __sysmmu_has_capa1(struct sysmmu_drvdata *data)
> > +{
> > +     const u32 capa0 = readl(data->sfrbase + REG_V7_CAPA0);
>
> Same here and further.
>
>
> Best regards,
> Krzysztof
