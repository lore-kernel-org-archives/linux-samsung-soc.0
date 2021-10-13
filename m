Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF97C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Oct 2021 18:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EA71610EA
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Oct 2021 18:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236975AbhJMSt7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 Oct 2021 14:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236782AbhJMSt6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 14:49:58 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D066C061749
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2021 11:47:55 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id h19so6510142uax.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2021 11:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BPdx51HLhI11HArGS1VOToC12vt9boCyZfmyE8AUMrY=;
        b=mKsATYIxxTzZn/e9ngGNBe7FtahJOkf9YcbmoIiL5UCUn9tKU49eK6irgxYYCsvOuP
         qDHksHiwtIA6gH2mpt7sSSlR36jEIHuOdHSPKPmvGseuC7PT+KfVf66lQzPs+VoBUu2y
         fnLtaiTvpmzz7Zb35mVCb/5RGZI0M/POEfhwim+/QywZvOdNw5lZvVBaRrRq8bWkkjW5
         tfJNveWzv7vi5FSOD/edJWxAqPoeOHXDFoWYk0PLvSNi78O3VVYfMBIOGfud2ICog+6x
         HvNuegoTFGEb3NQGyutduaHc/MPeGeiv5pZbMpgOs/yuA7WR3ufaUFcmyXqhBYCaQlbv
         6TTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BPdx51HLhI11HArGS1VOToC12vt9boCyZfmyE8AUMrY=;
        b=KCWv7SRbeenkUor/TI50OLnlLs7iw7/PruORcYw2KOeNdgZB74LxF65plS8x6JhhIG
         +Fo9KmvzYTlzf6ZZB8mOiHeSvBrUkH/cDHJ+Lo0egs0qgK0c0pQR2C4H+eXL4HrAqS4E
         NfMyArAstRCE0Hwj3AjiRAAB0beFAQ/tMidGq7rBSCrodsvlWaGZljszugJbYKW0sqe0
         U6begGV5tIgpQfWHXUALXvREZfDmXdClMy3j7SxcjpMAbmm35VNtsHkyKLpjYag5Myd8
         r5pcuCqqZP9D7mJFUwXuudskYd+DuBA0skKQnXJqpGt0j+TBZ5qipl8dp/bI5QbOmbmr
         zbcw==
X-Gm-Message-State: AOAM5309qyRxF9KYI1y1WC3ri9OBGVw1WLsu0mqIW/doL38+yVDfhk2H
        u1GMzPj/Xin79D0jQFdKwPqgHyqJstFG+exvLOyPXA==
X-Google-Smtp-Source: ABdhPJyjftAWbjcnFvSUtye4sK5pBI7qz6TSUqJkXVUyAiOX4vkm4U0Mi4LdzkeaMgphkvsgGlM86z7voBl00H4U/Y8=
X-Received: by 2002:a67:d91b:: with SMTP id t27mr1040145vsj.55.1634150874139;
 Wed, 13 Oct 2021 11:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211012171624.14338-1-semen.protsenko@linaro.org> <677711d4-61d6-1bb8-f638-c4911ef5e1cb@canonical.com>
In-Reply-To: <677711d4-61d6-1bb8-f638-c4911ef5e1cb@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 13 Oct 2021 21:47:42 +0300
Message-ID: <CAPLW+4mX-YN=2BgW1F5HEUS79Y97WKPTX-uwkBF0NVwKfThzjQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: samsung: exynos-chipid: Pass revision reg offsets
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

On Wed, 13 Oct 2021 at 19:04, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 12/10/2021 19:16, Sam Protsenko wrote:
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
> > index 5c1d0f97f766..1264a18aef97 100644
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
> > +     unsigned int main_rev_bit;      /* main revision offset */
>
> I understand it is offset of a bit within register, so how about:
>
> unsigned int main_rev_shift;    /* main revision offset within rev_reg
> unsigned int sub_rev_shift;     /* sub revision offset within rev_reg */
>
> > +     unsigned int sub_rev_bit;       /* sub revision offset */
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
> > +     if (ret < 0)
> > +             return ret;
> > +     main_rev = (val >> data->main_rev_bit) & EXYNOS_REV_PART_LEN;
> > +     sub_rev = (val >> data->sub_rev_bit) & EXYNOS_REV_PART_LEN;
> > +     soc_info->revision = (main_rev << EXYNOS_REV_PART_OFF) | sub_rev;
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
> > +     .main_rev_bit   = 0,
> > +     .sub_rev_bit    = 4,
> > +};
> > +
> >  static const struct of_device_id exynos_chipid_of_device_ids[] = {
> > -     { .compatible = "samsung,exynos4210-chipid" },
> > -     {}
> > +     {
> > +             .compatible     = "samsung,exynos4210-chipid",
> > +             .data           = &exynos4210_chipid_drv_data,
> > +     },
> > +     { }
> >  };
> >
> >  static struct platform_driver exynos_chipid_driver = {
> > diff --git a/include/linux/soc/samsung/exynos-chipid.h b/include/linux/soc/samsung/exynos-chipid.h
> > index 8bca6763f99c..5270725ba408 100644
> > --- a/include/linux/soc/samsung/exynos-chipid.h
> > +++ b/include/linux/soc/samsung/exynos-chipid.h
> > @@ -9,10 +9,8 @@
> >  #define __LINUX_SOC_EXYNOS_CHIPID_H
> >
> >  #define EXYNOS_CHIPID_REG_PRO_ID     0x00
> > -#define EXYNOS_SUBREV_MASK           (0xf << 4)
> > -#define EXYNOS_MAINREV_MASK          (0xf << 0)
> > -#define EXYNOS_REV_MASK                      (EXYNOS_SUBREV_MASK | \
> > -                                      EXYNOS_MAINREV_MASK)
> > +#define EXYNOS_REV_PART_LEN          0xf
>
> EXYNOS_REV_PART_MASK
>
> > +#define EXYNOS_REV_PART_OFF          4
>
> define EXYNOS_REV_PART_SHIFT
>

Thanks, I'll fix everything you mentioned in v2.

Btw, I forgot to provide an explanation on user interface changes I
made. Those are ok from my POV, but you might disagree:

1. EXYNOS_MASK is now applied to product_id when assigning it. The
only side effect is that dev_info() in probe() will print a bit
different info. Hope it's fine. The code looks better this way, as we
clearly differentiate SoC ID and Revision ID from the very beginning.

2. "revision" sysfs node will now show the revision in this form:
"(main_rev << 4) | sub_rev". Before this patch it was "(sub_rev << 4)
| main_rev". It has to do with internal register representation: on
older Exynos SoCs it has the latter form, on newer SoCs -- the former.
For consistency I want to keep it in the same form for all platforms.
I decided to go with approach implemented in downstream Samsung
kernel, though it of course changes the output on older SoCs. Possible
design options are:

    (a) Use "(sub_rev << 4) | main_rev" form instead for all SoCs. It
would preserve "revision" node output on older SoCs. On newer SoCs it
will be rotated form w.r.t. internal register representation, and it
won't be consistent with downstream implementation (not that we should
care about that much)
    (b) Use "(sub_rev << 4) | main_rev" form for old SoCs and
"(main_rev << 4) | sub_rev" for for new SoCs. That will clutter the
logic for sure, making it not very elegant.
    (c) Keep it as is (as I already implemented that in this patch).
Changes "revision" node output, but I'm not sure if we should care
about that, user space shouldn't probably rely on that data anyway

Please let me know if you think the current design is ok, or you want
me to change that.

> >  #define EXYNOS_MASK                  0xfffff000
> >
> >  #define EXYNOS_CHIPID_REG_PKG_ID     0x04
> >
>
>
> Best regards,
> Krzysztof
