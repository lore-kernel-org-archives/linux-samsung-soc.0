Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE63C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 11:35:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D486B610E7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 11:35:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhJNLhK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 07:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbhJNLhK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 07:37:10 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A280C061753
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 04:35:05 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id i15so10693538uap.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 04:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fgNi17SO2wHIzJ3GMyl4mipupXKnAZkfBwgNfpacaAc=;
        b=PYQwiPjI//K6gkmkJBVsBz+WxUClxAnjcvOjoYVCs4oeNBCsgTz2CysPdjzk811G/4
         6LJLDu3i9CSqWdvOf0k25sbtdyr53wZzBJ6fwUkL/toLSRamBH9iiYdjx2YO91m62vhm
         phsoxtaSOI4p4Tx1TUl4eBoar9rWTFtxM+YaWDNGFZ/+KBhaPydO0zr9+mMFRfPjcWlN
         Mp2AwF03q2AS2w6x27DO6tbV8eZFGkUOqtIRMK8RBOB1FGR4wpjTwFIA4JOnKWYyUGPB
         CW8atvIkILr3iNTYor4rbwjU2shEdNvDQIbsehdmU3NwLtF7LKmirB7fVSes5S9TMPm5
         XV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fgNi17SO2wHIzJ3GMyl4mipupXKnAZkfBwgNfpacaAc=;
        b=k5vhTADEa6hcpRNTtNNK7/HQMnu+BWQF9lRMCC7cqgpGFunaXfAhSPTLV/QCsEx+yU
         K1VrrA+HOrGic06B36oT4x3eDlXUxmYjwZoMWLhGkId1kNCO229nu3g1efC6kvA4m+mp
         rfNwVkg2HchBJN79rekOufwC6hft1RSqyqP0mUR+VseQwX5gauZoVH88NlvlNhvcBrUG
         9HXn5wijANkeOLIs52XKyqXsR09hAjcMG+iUf8WewURtlPQ2Me8DPSfrbX10VodzgF3J
         sG3knJRgRYbi4JdS+9URZ0it33o9IRx0icp94BlWnNvpqX6mNz61yGiDDPfvemwuokb/
         6axw==
X-Gm-Message-State: AOAM532oKjRzBH2srFov28WVWe/Cp5czYj2hioI1nFqe/itqOIuildus
        QjVwxnoOAY3HJl1343EUk7vjayCEQgIxY6zKupvHcw==
X-Google-Smtp-Source: ABdhPJwvm0rv7twQz34e7yAJd8Clz2FDQJ38NXNP/AgmkmEYYQ5g5LKu8qXJAh/vrn/kY+rE4JLLEs7hJKymb3P/KSg=
X-Received: by 2002:a67:d289:: with SMTP id z9mr5897898vsi.39.1634211304359;
 Thu, 14 Oct 2021 04:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211013202110.31701-1-semen.protsenko@linaro.org> <1cd31098-ba9d-f2e3-e34c-5bada00a2696@canonical.com>
In-Reply-To: <1cd31098-ba9d-f2e3-e34c-5bada00a2696@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 14 Oct 2021 14:34:52 +0300
Message-ID: <CAPLW+4mtSnt8dCCtSeu-yNTR0F5ZO-hdjFjyGChi=tTWQQt85Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] soc: samsung: exynos-chipid: Pass revision reg offsets
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 14 Oct 2021 at 10:11, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 13/10/2021 22:21, Sam Protsenko wrote:
> > Old Exynos SoCs have both Product ID and Revision ID in one single
> > register, while new SoCs tend to have two separate registers for those
> > IDs. Implement handling of both cases by passing Revision ID register
> > offsets in driver data.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/soc/samsung/exynos-chipid.c       | 67 +++++++++++++++++++----
> >  include/linux/soc/samsung/exynos-chipid.h |  6 +-
> >  2 files changed, 58 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> > index 5c1d0f97f766..7837331fb753 100644
> > --- a/drivers/soc/samsung/exynos-chipid.c
> > +++ b/drivers/soc/samsung/exynos-chipid.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/errno.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  #include <linux/slab.h>
> > @@ -24,6 +25,17 @@
> >
> >  #include "exynos-asv.h"
> >
> > +struct exynos_chipid_variant {
> > +     unsigned int rev_reg;           /* revision register offset */
> > +     unsigned int main_rev_shift;    /* main revision offset in rev_reg */
> > +     unsigned int sub_rev_shift;     /* sub revision offset in rev_reg */
> > +};
> > +
> > +struct exynos_chipid_info {
> > +     u32 product_id;
> > +     u32 revision;
> > +};
> > +
> >  static const struct exynos_soc_id {
> >       const char *name;
> >       unsigned int id;
> > @@ -49,31 +61,55 @@ static const char *product_id_to_soc_id(unsigned int product_id)
> >       int i;
> >
> >       for (i = 0; i < ARRAY_SIZE(soc_ids); i++)
> > -             if ((product_id & EXYNOS_MASK) == soc_ids[i].id)
> > +             if (product_id == soc_ids[i].id)
> >                       return soc_ids[i].name;
> >       return NULL;
> >  }
> >
> > +static int exynos_chipid_get_chipid_info(struct regmap *regmap,
> > +             const struct exynos_chipid_variant *data,
> > +             struct exynos_chipid_info *soc_info)
> > +{
> > +     int ret;
> > +     unsigned int val, main_rev, sub_rev;
> > +
> > +     ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &val);
> > +     if (ret < 0)
> > +             return ret;
> > +     soc_info->product_id = val & EXYNOS_MASK;
> > +
> > +     ret = regmap_read(regmap, data->rev_reg, &val);
>
> Isn't this the same register as EXYNOS_CHIPID_REG_PRO_ID?
>

It is for Exynos4210, but it's not for Exynos850 (see PATCH 3/3), as
it's described in the commit message. I tried to keep this code
unified for all SoCs.

> > +     if (ret < 0)
> > +             return ret;
> > +     main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> > +     sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> > +     soc_info->revision = (main_rev << EXYNOS_REV_PART_SHIFT) | sub_rev;
> > +
> > +     return 0;
> > +}
> > +
> >  static int exynos_chipid_probe(struct platform_device *pdev)
> >  {
> > +     const struct exynos_chipid_variant *drv_data;
> > +     struct exynos_chipid_info soc_info;
> >       struct soc_device_attribute *soc_dev_attr;
> >       struct soc_device *soc_dev;
> >       struct device_node *root;
> >       struct regmap *regmap;
> > -     u32 product_id;
> > -     u32 revision;
> >       int ret;
> >
> > +     drv_data = of_device_get_match_data(&pdev->dev);
> > +     if (!drv_data)
> > +             return -EINVAL;
> > +
> >       regmap = device_node_to_regmap(pdev->dev.of_node);
> >       if (IS_ERR(regmap))
> >               return PTR_ERR(regmap);
> >
> > -     ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &product_id);
> > +     ret = exynos_chipid_get_chipid_info(regmap, drv_data, &soc_info);
> >       if (ret < 0)
> >               return ret;
> >
> > -     revision = product_id & EXYNOS_REV_MASK;
> > -
> >       soc_dev_attr = devm_kzalloc(&pdev->dev, sizeof(*soc_dev_attr),
> >                                   GFP_KERNEL);
> >       if (!soc_dev_attr)
> > @@ -86,8 +122,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
> >       of_node_put(root);
> >
> >       soc_dev_attr->revision = devm_kasprintf(&pdev->dev, GFP_KERNEL,
> > -                                             "%x", revision);
> > -     soc_dev_attr->soc_id = product_id_to_soc_id(product_id);
> > +                                             "%x", soc_info.revision);
> > +     soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
> >       if (!soc_dev_attr->soc_id) {
> >               pr_err("Unknown SoC\n");
> >               return -ENODEV;
> > @@ -106,7 +142,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
> >
> >       dev_info(soc_device_to_device(soc_dev),
> >                "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
> > -              soc_dev_attr->soc_id, product_id, revision);
> > +              soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
> >
> >       return 0;
> >
> > @@ -125,9 +161,18 @@ static int exynos_chipid_remove(struct platform_device *pdev)
> >       return 0;
> >  }
> >
> > +static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
> > +     .rev_reg        = 0x0,
> > +     .main_rev_shift = 0,
> > +     .sub_rev_shift  = 4,
>
> The code does not look correct here. Subrev is at 0:3 bits, mainrev is
> at 4:7.
>

Right. I was confused by those existing macros:

    #define EXYNOS_SUBREV_MASK        (0xf << 4)
    #define EXYNOS_MAINREV_MASK        (0xf << 0)

Those were probably wrong the whole time? Anyway, now I've found
Exynos4412 User Manual and checked it there -- you are right about
offsets. Will fix in v3.

> Did you test it that it produces same result? Looks not - I gave it a
> try and got wrong revision.
>

I only have Exynos850 based board, and that has 0x0 in Revision ID
register. But for v3 I'll try to emulate register value in the code
and make sure that the read value does not change with patch applied.

>
> Best regards,
> Krzysztof
