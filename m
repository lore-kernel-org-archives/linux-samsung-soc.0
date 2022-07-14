Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE60C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jul 2022 13:15:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238577AbiGNNPu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Jul 2022 09:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239480AbiGNNPs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Jul 2022 09:15:48 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3528253D37
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2022 06:15:46 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z25so2777061lfr.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2022 06:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y48E6PDFxhOGhAYVKqWlob2V1GffQky6+hara5tcdLo=;
        b=x9Hqw1BTgXzHKBiG2OLYcS2qRp7Sz3flmFvjdYEncU8GDBZQGFzRHDqWvl2GZEQzWs
         FsmPaPtuFGaiqKXQ0rgYuY1IJvGT9XHaKIiGie3uBqCYb5yZUxsGKCGerqVb/EDy2MQy
         BrkIPlpMjIIODx0OZIpPfuVTK/CPTmssfDzD87fRsv5/iF7Rkgzt3wvFTahxaqIGZ+wF
         b0LxvmpRxROYRG7PvrgPGM3wSIagrIcIKwRXmd8quwYVM2XgRpqq7+pGhei6aj5AEZ1a
         ZxtNyfAEF5Qg5TkVb401bU9vk1vAqt7Jy4UkztS6JIJpbx4jaxv5mhURfqXHgOZyi+xk
         gVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y48E6PDFxhOGhAYVKqWlob2V1GffQky6+hara5tcdLo=;
        b=p9f+zU2fM0PXkpojMbkUP7Z2jFSDZwdqt9BpJJT3sxqmI5SUOCnreXiEunMsexVML9
         yYnLs3ODOs1m5/nA2AvjT4ZsYRYM3vabJet5Wo9tguzyDLJoHUSteGP+dWgiebSyjSF1
         sgZG4FbNO9m3i8OUAvA0oi62u2CNphSK4SCF1gJZzg1T58zwQvWEauEnS9xOfL2f/Hd3
         Rn2jo0XwJOJBAShjpllxz3n7NHvoIezRmPnowm5aZueAVW9tXZlKgWrEVWdYDume7VuJ
         YWzQM8Wq0iqfvTeA3Un86hspiJrXo1WjK0/cpeXSDKxzO7cMVzGbD1ZcTGVcmMYjOg3z
         1O8Q==
X-Gm-Message-State: AJIora+s8oC8BaqHveSjieVnafw+H+BNymKU6qSXDJHfmTDx9lEsOakM
        Go3q2bt5IebMZ25AaFcIHyokxOPWlHFyhhr572L25A==
X-Google-Smtp-Source: AGRyM1umM56+JO1HV8nicFnjzJ1pyPk04eb7pywiBmEsbAuvhiuDTIjoJzE4r2MPwg7ysTsXe877jrrGJ/WnekYwUVQ=
X-Received: by 2002:a05:6512:139a:b0:48a:1a73:8adc with SMTP id
 p26-20020a056512139a00b0048a1a738adcmr1218415lfa.226.1657804544526; Thu, 14
 Jul 2022 06:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220710230603.13526-1-semen.protsenko@linaro.org>
 <20220710230603.13526-5-semen.protsenko@linaro.org> <4d198463-fedc-a5d9-6804-63c134da76e7@linaro.org>
In-Reply-To: <4d198463-fedc-a5d9-6804-63c134da76e7@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 14 Jul 2022 16:15:33 +0300
Message-ID: <CAPLW+4ktP0_W_OgjAoK3BXOFaEiXvP1qNGCc-iQyr2fNL1srug@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] iommu/exynos: Use lookup based approach to access registers
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 12 Jul 2022 at 19:52, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

[snip]

> > +static void sysmmu_write(struct sysmmu_drvdata *data, size_t idx, u32 val)
> > +{
> > +     writel(val, data->sfrbase + data->regs[idx]);
>
> Beside what Robin wrote, I also don't think these wrappers actually
> help, because you reverse arguments comparing to writel.
>
> How about having a per-variant structure with offsets and using it like:
>
> #define SYSMMU_REG(data, reg) ((data)->sfrbase + (data)->variant->reg)
> writel(CTRL_ENABLE, SYSMMU_REG(data, mmu_ctrl_reg))
>
> Would that be more readable?
>

Yes, this looks better for my taste too. I tend to get a tunnel vision
when working with downstream code for a while. But I noticed that that
approach is used sometimes as well, e.g. in
drivers/pinctrl/samsung/pinctrl-exynos-arm64.c (in struct
samsung_pin_bank_type). Anyway, I've reworked it exactly as you
suggested, will send v2 soon. Thanks!

>
> Best regards,
> Krzysztof
