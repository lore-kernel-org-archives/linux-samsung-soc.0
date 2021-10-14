Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0433EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 12:03:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E263B610CB
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 12:03:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhJNMF3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 08:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbhJNMF3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 08:05:29 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF57C061753
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 05:03:24 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id f3so10724436uap.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 05:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xj8F02qjcFD/OxSetCAdaTkDEAtmLez+FikCwyhAwDU=;
        b=wDuxotBJb/+zjFdczEvupCmne7rv44CGr+5h2R+lYo61eRnWC1EAFn4i83sh7rX3yZ
         V7movBmXIEybpOfvKxfcSoZM8s14aImiaK7T3CM4LFAYoTOvpo9Fq+Dbxg0LaVidfIEc
         syPvFsSscgM8cio8XTjfXekbVyjDl48TLNGTfIjxsAz31lohV6wmra9eHwb2EWPXW6Od
         Geemk7JVSfF/jcS/y1qenTMLStW4vUfQieVQRye+fj955TP8JnxYCYaWTWyRe0IKqKao
         L/1z7qJIutgRw049kdC3st4vuqfMF6eKVR8K7iQHy+xIu1rW5Nn/ulpWSThbRjyd8s5+
         21yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xj8F02qjcFD/OxSetCAdaTkDEAtmLez+FikCwyhAwDU=;
        b=ABB4QTd3WfAb5jxtu6hauBzZaI/Dq/zVb4tIbDtt7m1M6gwjjmW3yRGmgGHDclfk5e
         S/eFPCuqzDbU9p7gjnREkLuDYhIN/3GxuMLzKpr1rBO+J7AOZrAA4jR5+DoTx1QAYs3Y
         0twggjJhd1QUEshT7W+aIlvbRvZzmfWwE3mw19LXUAvmBsf0L8hl42zMhcKdZYnyLE2D
         cOtaBUuB7PaJDK0Yug2ok9yzFSBLtvc7nvX+6HEAGpeMpbHEfoJ/HaHcjdrK8cBYI8c4
         V0PzT05WguOd81lSJXa05Jkbi2I/U6KP08U1LDRAoZgVgL2NvDsFD4czlkZ+YqfuDHtz
         mTTA==
X-Gm-Message-State: AOAM533SQV2/gte8KUgdemTCAQkmi0Gl5PrsHm0NufQm8ZB6eUDc5Axr
        488dZ9ztZwU7Wav7oDbOf/VcpJbm2ipQki6CfzS60g==
X-Google-Smtp-Source: ABdhPJzHijD+itIOq2W8t2VGEzSHHYo+kmu+BRme0KVWMgeqDnez3zG+NfeqpChgpcbIfgjaiTFhUF0zLPjzU25556s=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr6179623vsh.30.1634213003678;
 Thu, 14 Oct 2021 05:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211013202110.31701-1-semen.protsenko@linaro.org>
 <1cd31098-ba9d-f2e3-e34c-5bada00a2696@canonical.com> <CAPLW+4mtSnt8dCCtSeu-yNTR0F5ZO-hdjFjyGChi=tTWQQt85Q@mail.gmail.com>
 <dd61666c-fd1a-c152-9423-9dc6718b1626@canonical.com>
In-Reply-To: <dd61666c-fd1a-c152-9423-9dc6718b1626@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 14 Oct 2021 15:03:12 +0300
Message-ID: <CAPLW+4mA64Q8t07tJ_Yi9=AHmGe2NixEmCaMP-Lj65D2TNBt+w@mail.gmail.com>
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

On Thu, 14 Oct 2021 at 14:48, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 14/10/2021 13:34, Sam Protsenko wrote:
> > On Thu, 14 Oct 2021 at 10:11, Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >>
> >> On 13/10/2021 22:21, Sam Protsenko wrote:
> >>> Old Exynos SoCs have both Product ID and Revision ID in one single
> >>> register, while new SoCs tend to have two separate registers for those
> >>> IDs. Implement handling of both cases by passing Revision ID register
> >>> offsets in driver data.
> >>>
> >>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>> ---
> >>>  drivers/soc/samsung/exynos-chipid.c       | 67 +++++++++++++++++++----
> >>>  include/linux/soc/samsung/exynos-chipid.h |  6 +-
> >>>  2 files changed, 58 insertions(+), 15 deletions(-)
> >>>
> >>> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
> >>> index 5c1d0f97f766..7837331fb753 100644
> >>> --- a/drivers/soc/samsung/exynos-chipid.c
> >>> +++ b/drivers/soc/samsung/exynos-chipid.c
> >>> @@ -16,6 +16,7 @@
> >>>  #include <linux/errno.h>
> >>>  #include <linux/mfd/syscon.h>
> >>>  #include <linux/of.h>
> >>> +#include <linux/of_device.h>
> >>>  #include <linux/platform_device.h>
> >>>  #include <linux/regmap.h>
> >>>  #include <linux/slab.h>
> >>> @@ -24,6 +25,17 @@
> >>>
> >>>  #include "exynos-asv.h"
> >>>
> >>> +struct exynos_chipid_variant {
> >>> +     unsigned int rev_reg;           /* revision register offset */
> >>> +     unsigned int main_rev_shift;    /* main revision offset in rev_reg */
> >>> +     unsigned int sub_rev_shift;     /* sub revision offset in rev_reg */
> >>> +};
> >>> +
> >>> +struct exynos_chipid_info {
> >>> +     u32 product_id;
> >>> +     u32 revision;
> >>> +};
> >>> +
> >>>  static const struct exynos_soc_id {
> >>>       const char *name;
> >>>       unsigned int id;
> >>> @@ -49,31 +61,55 @@ static const char *product_id_to_soc_id(unsigned int product_id)
> >>>       int i;
> >>>
> >>>       for (i = 0; i < ARRAY_SIZE(soc_ids); i++)
> >>> -             if ((product_id & EXYNOS_MASK) == soc_ids[i].id)
> >>> +             if (product_id == soc_ids[i].id)
> >>>                       return soc_ids[i].name;
> >>>       return NULL;
> >>>  }
> >>>
> >>> +static int exynos_chipid_get_chipid_info(struct regmap *regmap,
> >>> +             const struct exynos_chipid_variant *data,
> >>> +             struct exynos_chipid_info *soc_info)
> >>> +{
> >>> +     int ret;
> >>> +     unsigned int val, main_rev, sub_rev;
> >>> +
> >>> +     ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &val);
> >>> +     if (ret < 0)
> >>> +             return ret;
> >>> +     soc_info->product_id = val & EXYNOS_MASK;
> >>> +
> >>> +     ret = regmap_read(regmap, data->rev_reg, &val);
> >>
> >> Isn't this the same register as EXYNOS_CHIPID_REG_PRO_ID?
> >>
> >
> > It is for Exynos4210, but it's not for Exynos850 (see PATCH 3/3), as
> > it's described in the commit message. I tried to keep this code
> > unified for all SoCs.
>
> Yeah, but for Exynos4210 you read the same register twice. It's
> confusing. Read only once. You could compare the offsets and skip second
> read.
>

Thanks, will do in v3.

> >
> >>> +     if (ret < 0)
> >>> +             return ret;
> >>> +     main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
> >>> +     sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
> >>> +     soc_info->revision = (main_rev << EXYNOS_REV_PART_SHIFT) | sub_rev;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>>  static int exynos_chipid_probe(struct platform_device *pdev)
> >>>  {
> >>> +     const struct exynos_chipid_variant *drv_data;
> >>> +     struct exynos_chipid_info soc_info;
> >>>       struct soc_device_attribute *soc_dev_attr;
> >>>       struct soc_device *soc_dev;
> >>>       struct device_node *root;
> >>>       struct regmap *regmap;
> >>> -     u32 product_id;
> >>> -     u32 revision;
> >>>       int ret;
> >>>
> >>> +     drv_data = of_device_get_match_data(&pdev->dev);
> >>> +     if (!drv_data)
> >>> +             return -EINVAL;
> >>> +
> >>>       regmap = device_node_to_regmap(pdev->dev.of_node);
> >>>       if (IS_ERR(regmap))
> >>>               return PTR_ERR(regmap);
> >>>
> >>> -     ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &product_id);
> >>> +     ret = exynos_chipid_get_chipid_info(regmap, drv_data, &soc_info);
> >>>       if (ret < 0)
> >>>               return ret;
> >>>
> >>> -     revision = product_id & EXYNOS_REV_MASK;
> >>> -
> >>>       soc_dev_attr = devm_kzalloc(&pdev->dev, sizeof(*soc_dev_attr),
> >>>                                   GFP_KERNEL);
> >>>       if (!soc_dev_attr)
> >>> @@ -86,8 +122,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
> >>>       of_node_put(root);
> >>>
> >>>       soc_dev_attr->revision = devm_kasprintf(&pdev->dev, GFP_KERNEL,
> >>> -                                             "%x", revision);
> >>> -     soc_dev_attr->soc_id = product_id_to_soc_id(product_id);
> >>> +                                             "%x", soc_info.revision);
> >>> +     soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
> >>>       if (!soc_dev_attr->soc_id) {
> >>>               pr_err("Unknown SoC\n");
> >>>               return -ENODEV;
> >>> @@ -106,7 +142,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
> >>>
> >>>       dev_info(soc_device_to_device(soc_dev),
> >>>                "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
> >>> -              soc_dev_attr->soc_id, product_id, revision);
> >>> +              soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
> >>>
> >>>       return 0;
> >>>
> >>> @@ -125,9 +161,18 @@ static int exynos_chipid_remove(struct platform_device *pdev)
> >>>       return 0;
> >>>  }
> >>>
> >>> +static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
> >>> +     .rev_reg        = 0x0,
> >>> +     .main_rev_shift = 0,
> >>> +     .sub_rev_shift  = 4,
> >>
> >> The code does not look correct here. Subrev is at 0:3 bits, mainrev is
> >> at 4:7.
> >>
> >
> > Right. I was confused by those existing macros:
> >
> >     #define EXYNOS_SUBREV_MASK        (0xf << 4)
> >     #define EXYNOS_MAINREV_MASK        (0xf << 0)
> >
> > Those were probably wrong the whole time? Anyway, now I've found
> > Exynos4412 User Manual and checked it there -- you are right about
> > offsets. Will fix in v3.
>
> They were not used, I think.
>
> >
> >> Did you test it that it produces same result? Looks not - I gave it a
> >> try and got wrong revision.
> >>
> >
> > I only have Exynos850 based board, and that has 0x0 in Revision ID
> > register. But for v3 I'll try to emulate register value in the code
> > and make sure that the read value does not change with patch applied.
>
> You should get one of Odroid boards to test it. The MC1 is fairly cheap.
>

Will do, I see how it can be useful for further work. For this series,
I'm pretty sure I can test all cases by emulating the read register
values. Would it be enough? Also, if you have some time, I'd ask you
to check v3 on your board.

> Best regards,
> Krzysztof
