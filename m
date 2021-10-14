Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBE6C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 07:16:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B68BB61152
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 07:16:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhJNHSE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 03:18:04 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:41694
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229910AbhJNHSB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 03:18:01 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B76143FFE0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 07:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634195756;
        bh=MFCZExNFJETkLFI94dPqm30bHOqjLeoq6Vpk7ELBaDQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=EaoNsHhuBKEAZ+oTA6VPnfhwHIGYFfHeh8Fdb84SwKJpGilRPr8ef6exSVhTBjyBy
         EDv9/OxFLCon8HJim101zS1xUqWaRDzPhVjG4UmhAW4QW+SA8dR+6crbi/cQG8DTNF
         OLaXKKn1aI7oxwGrkYjzNn3peN0KhCVhWGATAw0ePSkg9ArqrHw3wYgVkjaL5fkb34
         PV8MrBA2CCsJWAsHujla57CjZs7XZ7ii2mTnnqvcNTPya6vYie0l8Wpwelc0wzKfvL
         OXVOiV3foA1SIBUfLlL7of7FLvJrJ6SIR3dFvQoAj9Jl/EqUw/urq4Po1wNEEJdSfw
         iYFwVlwJ4QeWg==
Received: by mail-lf1-f69.google.com with SMTP id f17-20020a0565123b1100b003fda40b659aso3690124lfv.23
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 00:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MFCZExNFJETkLFI94dPqm30bHOqjLeoq6Vpk7ELBaDQ=;
        b=wItfEHjOKnq03XS2GazMET12Nu8xg4gklu4R0nfzqilIdah9VcWwjBJaAgSWivnRDq
         nTRF0Pp0yjwDMljP+g5vOio1ecen+49bHADMo6MGIUqFv8FFMzxGspLU1XFLpvObp+Fy
         ka1ZrutM58s9+xxopH2yUk6dbtCBni6UN/4QSZMbKgAr4b+pLOuwMnsPYLUjIAOSjV8r
         HtkGopQNJsHPirN2XI3wmqxYSEmyI9Ie2iY2U1a7ej8hqh7Yia9fAYXYEBbc63tzj9Zf
         GT/YFOXDbq9Mzmur0C2nYy1JgJGU+R4399bqfQVQlc6ee1E88VL/8l9zArHkLAlOd1Or
         OLQA==
X-Gm-Message-State: AOAM530pyeTY0lnNIF6E8bfN93fCeofIHmq4gKMlvwFrafXUEtdyazss
        GETo97L9MdzwOR8B2gkDAItKuzEvRFCNqJOgMM3dbDSJj3u1GH1+TJVUbQhiDzAIgv/yMWgs8sy
        cTDQF062njNZjNoNEXz7+aVVEi+4AouJ9YcqVOKUtjXzVA4uG
X-Received: by 2002:a05:6512:32a9:: with SMTP id q9mr3368117lfe.58.1634195756208;
        Thu, 14 Oct 2021 00:15:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+eKLFsqJPOhCkqC8DpoRCUJhKIzFLYXiXPwRTeH2qO48mtsxYXeTgWDm98kvFYsbf0p2E8g==
X-Received: by 2002:a05:6512:32a9:: with SMTP id q9mr3368092lfe.58.1634195755936;
        Thu, 14 Oct 2021 00:15:55 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id i7sm151427lfl.38.2021.10.14.00.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 00:15:55 -0700 (PDT)
Subject: Re: [PATCH 1/3] soc: samsung: exynos-chipid: Pass revision reg
 offsets
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211012171624.14338-1-semen.protsenko@linaro.org>
 <677711d4-61d6-1bb8-f638-c4911ef5e1cb@canonical.com>
 <CAPLW+4mX-YN=2BgW1F5HEUS79Y97WKPTX-uwkBF0NVwKfThzjQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <818a73a0-5a66-7b77-ae3a-ce97df0303b6@canonical.com>
Date:   Thu, 14 Oct 2021 09:15:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4mX-YN=2BgW1F5HEUS79Y97WKPTX-uwkBF0NVwKfThzjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/10/2021 20:47, Sam Protsenko wrote:
> On Wed, 13 Oct 2021 at 19:04, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 12/10/2021 19:16, Sam Protsenko wrote:
>>> Old Exynos SoCs have both Product ID and Revision ID in one single
>>> register, while new SoCs tend to have two separate registers for those
>>> IDs. Implement handling of both cases by passing Revision ID register
>>> offsets in driver data.
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>>  drivers/soc/samsung/exynos-chipid.c       | 67 +++++++++++++++++++----
>>>  include/linux/soc/samsung/exynos-chipid.h |  6 +-
>>>  2 files changed, 58 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
>>> index 5c1d0f97f766..1264a18aef97 100644
>>> --- a/drivers/soc/samsung/exynos-chipid.c
>>> +++ b/drivers/soc/samsung/exynos-chipid.c
>>> @@ -16,6 +16,7 @@
>>>  #include <linux/errno.h>
>>>  #include <linux/mfd/syscon.h>
>>>  #include <linux/of.h>
>>> +#include <linux/of_device.h>
>>>  #include <linux/platform_device.h>
>>>  #include <linux/regmap.h>
>>>  #include <linux/slab.h>
>>> @@ -24,6 +25,17 @@
>>>
>>>  #include "exynos-asv.h"
>>>
>>> +struct exynos_chipid_variant {
>>> +     unsigned int rev_reg;           /* revision register offset */
>>> +     unsigned int main_rev_bit;      /* main revision offset */
>>
>> I understand it is offset of a bit within register, so how about:
>>
>> unsigned int main_rev_shift;    /* main revision offset within rev_reg
>> unsigned int sub_rev_shift;     /* sub revision offset within rev_reg */
>>
>>> +     unsigned int sub_rev_bit;       /* sub revision offset */
>>> +};
>>> +
>>> +struct exynos_chipid_info {
>>> +     u32 product_id;
>>> +     u32 revision;
>>> +};
>>> +
>>>  static const struct exynos_soc_id {
>>>       const char *name;
>>>       unsigned int id;
>>> @@ -49,31 +61,55 @@ static const char *product_id_to_soc_id(unsigned int product_id)
>>>       int i;
>>>
>>>       for (i = 0; i < ARRAY_SIZE(soc_ids); i++)
>>> -             if ((product_id & EXYNOS_MASK) == soc_ids[i].id)
>>> +             if (product_id == soc_ids[i].id)
>>>                       return soc_ids[i].name;
>>>       return NULL;
>>>  }
>>>
>>> +static int exynos_chipid_get_chipid_info(struct regmap *regmap,
>>> +             const struct exynos_chipid_variant *data,
>>> +             struct exynos_chipid_info *soc_info)
>>> +{
>>> +     int ret;
>>> +     unsigned int val, main_rev, sub_rev;
>>> +
>>> +     ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &val);
>>> +     if (ret < 0)
>>> +             return ret;
>>> +     soc_info->product_id = val & EXYNOS_MASK;
>>> +
>>> +     ret = regmap_read(regmap, data->rev_reg, &val);
>>> +     if (ret < 0)
>>> +             return ret;
>>> +     main_rev = (val >> data->main_rev_bit) & EXYNOS_REV_PART_LEN;
>>> +     sub_rev = (val >> data->sub_rev_bit) & EXYNOS_REV_PART_LEN;
>>> +     soc_info->revision = (main_rev << EXYNOS_REV_PART_OFF) | sub_rev;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>  static int exynos_chipid_probe(struct platform_device *pdev)
>>>  {
>>> +     const struct exynos_chipid_variant *drv_data;
>>> +     struct exynos_chipid_info soc_info;
>>>       struct soc_device_attribute *soc_dev_attr;
>>>       struct soc_device *soc_dev;
>>>       struct device_node *root;
>>>       struct regmap *regmap;
>>> -     u32 product_id;
>>> -     u32 revision;
>>>       int ret;
>>>
>>> +     drv_data = of_device_get_match_data(&pdev->dev);
>>> +     if (!drv_data)
>>> +             return -EINVAL;
>>> +
>>>       regmap = device_node_to_regmap(pdev->dev.of_node);
>>>       if (IS_ERR(regmap))
>>>               return PTR_ERR(regmap);
>>>
>>> -     ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &product_id);
>>> +     ret = exynos_chipid_get_chipid_info(regmap, drv_data, &soc_info);
>>>       if (ret < 0)
>>>               return ret;
>>>
>>> -     revision = product_id & EXYNOS_REV_MASK;
>>> -
>>>       soc_dev_attr = devm_kzalloc(&pdev->dev, sizeof(*soc_dev_attr),
>>>                                   GFP_KERNEL);
>>>       if (!soc_dev_attr)
>>> @@ -86,8 +122,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
>>>       of_node_put(root);
>>>
>>>       soc_dev_attr->revision = devm_kasprintf(&pdev->dev, GFP_KERNEL,
>>> -                                             "%x", revision);
>>> -     soc_dev_attr->soc_id = product_id_to_soc_id(product_id);
>>> +                                             "%x", soc_info.revision);
>>> +     soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
>>>       if (!soc_dev_attr->soc_id) {
>>>               pr_err("Unknown SoC\n");
>>>               return -ENODEV;
>>> @@ -106,7 +142,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
>>>
>>>       dev_info(soc_device_to_device(soc_dev),
>>>                "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
>>> -              soc_dev_attr->soc_id, product_id, revision);
>>> +              soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
>>>
>>>       return 0;
>>>
>>> @@ -125,9 +161,18 @@ static int exynos_chipid_remove(struct platform_device *pdev)
>>>       return 0;
>>>  }
>>>
>>> +static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
>>> +     .rev_reg        = 0x0,
>>> +     .main_rev_bit   = 0,
>>> +     .sub_rev_bit    = 4,
>>> +};
>>> +
>>>  static const struct of_device_id exynos_chipid_of_device_ids[] = {
>>> -     { .compatible = "samsung,exynos4210-chipid" },
>>> -     {}
>>> +     {
>>> +             .compatible     = "samsung,exynos4210-chipid",
>>> +             .data           = &exynos4210_chipid_drv_data,
>>> +     },
>>> +     { }
>>>  };
>>>
>>>  static struct platform_driver exynos_chipid_driver = {
>>> diff --git a/include/linux/soc/samsung/exynos-chipid.h b/include/linux/soc/samsung/exynos-chipid.h
>>> index 8bca6763f99c..5270725ba408 100644
>>> --- a/include/linux/soc/samsung/exynos-chipid.h
>>> +++ b/include/linux/soc/samsung/exynos-chipid.h
>>> @@ -9,10 +9,8 @@
>>>  #define __LINUX_SOC_EXYNOS_CHIPID_H
>>>
>>>  #define EXYNOS_CHIPID_REG_PRO_ID     0x00
>>> -#define EXYNOS_SUBREV_MASK           (0xf << 4)
>>> -#define EXYNOS_MAINREV_MASK          (0xf << 0)
>>> -#define EXYNOS_REV_MASK                      (EXYNOS_SUBREV_MASK | \
>>> -                                      EXYNOS_MAINREV_MASK)
>>> +#define EXYNOS_REV_PART_LEN          0xf
>>
>> EXYNOS_REV_PART_MASK
>>
>>> +#define EXYNOS_REV_PART_OFF          4
>>
>> define EXYNOS_REV_PART_SHIFT
>>
> 
> Thanks, I'll fix everything you mentioned in v2.
> 
> Btw, I forgot to provide an explanation on user interface changes I
> made. Those are ok from my POV, but you might disagree:
> 
> 1. EXYNOS_MASK is now applied to product_id when assigning it. The
> only side effect is that dev_info() in probe() will print a bit
> different info. Hope it's fine. The code looks better this way, as we
> clearly differentiate SoC ID and Revision ID from the very beginning.

That's fine.

> 
> 2. "revision" sysfs node will now show the revision in this form:
> "(main_rev << 4) | sub_rev". Before this patch it was "(sub_rev << 4)
> | main_rev". It has to do with internal register representation: on
> older Exynos SoCs it has the latter form, on newer SoCs -- the former.
> For consistency I want to keep it in the same form for all platforms.
> I decided to go with approach implemented in downstream Samsung
> kernel, though it of course changes the output on older SoCs. Possible
> design options are:

I miss the point. Regardless of representation in register - whether
main_rev is shifted or sub_rev - you should always print it the same
way. Currently it was printed "(main_rev << 4) | sub_rev" and it should
not be changed.

> 
>     (a) Use "(sub_rev << 4) | main_rev" form instead for all SoCs. It
> would preserve "revision" node output on older SoCs. On newer SoCs it
> will be rotated form w.r.t. internal register representation, and it
> won't be consistent with downstream implementation (not that we should
> care about that much)
>     (b) Use "(sub_rev << 4) | main_rev" form for old SoCs and
> "(main_rev << 4) | sub_rev" for for new SoCs. That will clutter the
> logic for sure, making it not very elegant.
>     (c) Keep it as is (as I already implemented that in this patch).
> Changes "revision" node output, but I'm not sure if we should care
> about that, user space shouldn't probably rely on that data anyway

Should be always printed as "(main_rev << 4) | sub_rev" regardless how
it is written in register. That's how it works so far.

Best regards,
Krzysztof
