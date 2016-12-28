From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v8 1/8] soc: samsung: add exynos chipid driver support
Date: Wed, 28 Dec 2016 08:08:22 +0530
Message-ID: <CAGcde9G_JD3KFneicQQG=P+bSkuyrNh6X2oxdZ5LahwC=QFzwQ@mail.gmail.com>
References: <1481375323-29724-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20161227140255epcas1p1a2c2b50ede0e9b2378c8ac052b1617f6@epcas1p1.samsung.com>
 <1481375323-29724-2-git-send-email-pankaj.dubey@samsung.com> <1482850387.FvemkoIpaX@amdc3058>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34349 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750716AbcL1Cjn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Dec 2016 21:39:43 -0500
Received: by mail-lf0-f66.google.com with SMTP id d16so16524496lfb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Dec 2016 18:38:44 -0800 (PST)
In-Reply-To: <1482850387.FvemkoIpaX@amdc3058>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, geert+renesas@glider.be, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, "thomas.ab@samsung.com" <thomas.ab@samsung.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Hi Bartilomiej,

On 27 December 2016 at 19:32, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
> Hi,
>
> On Saturday, December 10, 2016 06:38:36 PM Pankaj Dubey wrote:
>> Exynos SoCs have Chipid, for identification of product IDs and SoC revisions.
>> This patch intends to provide initialization code for all these functionalities,
>> at the same time it provides some sysfs entries for accessing these information
>> to user-space.
>>
>> This driver uses existing binding for exynos-chipid.
>>
>> CC: Grant Likely <grant.likely@linaro.org>
>> CC: Rob Herring <robh+dt@kernel.org>
>> CC: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> [m.szyprowski: for suggestion and code snippet of product_id_to_soc_id]
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  drivers/soc/samsung/Kconfig         |   5 ++
>>  drivers/soc/samsung/Makefile        |   1 +
>>  drivers/soc/samsung/exynos-chipid.c | 116 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 122 insertions(+)
>>  create mode 100644 drivers/soc/samsung/exynos-chipid.c
>
> [...]
>
>> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
>> new file mode 100644
>> index 0000000..cf0128b
>> --- /dev/null
>> +++ b/drivers/soc/samsung/exynos-chipid.c
>
> [...]
>
>> +/**
>> + *  exynos_chipid_early_init: Early chipid initialization
>> + */
>> +int __init exynos_chipid_early_init(void)
>> +{
>> +     struct soc_device_attribute *soc_dev_attr;
>> +     struct soc_device *soc_dev;
>> +     struct device_node *root;
>> +     struct device_node *np;
>> +     void __iomem *exynos_chipid_base;
>> +     const struct of_device_id *match;
>> +     u32 product_id;
>> +     u32 revision;
>> +
>> +     np = of_find_matching_node_and_match(NULL,
>> +                     of_exynos_chipid_ids, &match);
>> +     if (!np)
>> +             return -ENODEV;
>> +
>> +     exynos_chipid_base = of_iomap(np, 0);
>
> of_node_put(np) is missing here.
>

OK.

>> +     if (!exynos_chipid_base)
>> +             return PTR_ERR(exynos_chipid_base);
>
> PTR_ERR use here is incorrect - of_iomap() returns valid pointer or
> NULL.  Please just return -NODEV on of_iomap() failure.
>

OK.
Thanks for review. I will address these issues in next version.

Thanks,
Pankaj Dubey

> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
