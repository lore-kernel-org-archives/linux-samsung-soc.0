Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438DBC64EC4
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Mar 2023 23:48:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjCFXsL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Mar 2023 18:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjCFXsK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 18:48:10 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D152ED7A
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 15:48:08 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id s17so6622593pgv.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 15:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678146488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h3kkgg9fvW84t4TwLFt0X1S06pfPd/zAbyRMZdL/mL8=;
        b=aANztpaAr4HagG84ZHDlR9fWP07UAofgO/cRUUbIzExKpx5u2uLQJID6cHtCUpScjP
         Qq7WwEOVZsQzp/yUDYTCSrYIm102wDb8xU18xDo5KiZTb6GdVlIAfj0GUr1FEtg/JO2i
         HBx+zE78JUcenfWTVTY+BUAGXHR/YehXkQP24Br+US1apjvAD1HoTAWtdtfttxMCULmV
         RWHFGqIa2Y0GApYO/mPpgP/qxnI8Hp2oIicVp5DKlhuB/Q7cXlcOStws94DWhOC5Agd0
         UOw04TlA5PCE3WIbx5gDGgIcKadkD7XyDsmj2/j8orbQMWZIB6t0lTtIIM1gQgqg4wsr
         vVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678146488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3kkgg9fvW84t4TwLFt0X1S06pfPd/zAbyRMZdL/mL8=;
        b=ZfbrMf56xQsPujH8Ec448wCUTsx6WAz8ekFkHHbsicCiB9JC1JUga0Epe+8zUUMtKZ
         CJzHpC3kZwK5yJ8nUQUuBiYk+8HWnAEf7el6u5cTdBPuOvMlXy5MauDmC31mLOjm1g5C
         VtSO/Ms6z401TgGhU6ta7hghb6n1SnWgX2hVmmsqisJc3RmxCDhdOk9pM7SgdSUn39WB
         8S+Ek/vcpFeIOJgz9J8glaAPMWp2hyOvPkQoATmoixxqnlxm7Fen1rKQmtcMKKKmbmmC
         SXu8G1RO4c/bJ69k+ubco+KKmR76UoSWrDxMNd3Vh/yIlKubdVJDY/mVuCOacaI/iFzJ
         Wy+w==
X-Gm-Message-State: AO0yUKXNaA85g/JFGAxSjopgRBrq/52PN4mVu3sxRE68Au14yr9aFN9d
        dajF5dlCKYNep4hyacjSC7be0DWCGFbexyNyEDe/1A==
X-Google-Smtp-Source: AK7set+vAfWX9ZIid0tGfwy4xAfCKD4BGmpA0o9O7v4ol+4wj+rB16NMXMXewUOK31R/IlO+jqnFcWsHoaCcgk8QyHA=
X-Received: by 2002:a62:ce49:0:b0:5a8:ac30:80bf with SMTP id
 y70-20020a62ce49000000b005a8ac3080bfmr5501983pfg.6.1678146487961; Mon, 06 Mar
 2023 15:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20230223041938.22732-1-semen.protsenko@linaro.org>
 <20230223041938.22732-6-semen.protsenko@linaro.org> <7cbc24bf-6920-c75f-effc-fd9d827ca324@linaro.org>
In-Reply-To: <7cbc24bf-6920-c75f-effc-fd9d827ca324@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 6 Mar 2023 17:47:56 -0600
Message-ID: <CAPLW+4md2BTVecTfNx0ATG4LXy-Q+4Bgb7z8GGizv4aBJ8od_g@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] clk: samsung: Extract parent clock enabling to
 common function
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 6 Mar 2023 at 08:35, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 23/02/2023 05:19, Sam Protsenko wrote:
> > Extract parent clock enabling from exynos_arm64_register_cmu() to
> > dedicated function.
> >
> > Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > Changes in v3:
> >   - Rebased on top of latest soc/for-next tree
> >   - Added Marek's Acked-by tag
> >
> > Changes in v2:
> >   - Rebased on top of latest soc/for-next tree
> >   - Improved English in kernel doc comment
> >   - Added clk_prepare_enable() return value check
> >   - Added exynos_arm64_enable_bus_clk() check in
> >     exynos_arm64_register_cmu()
> >   - Changed the commit message to reflect code changes
> >
> >  drivers/clk/samsung/clk-exynos-arm64.c | 51 ++++++++++++++++++--------
> >  1 file changed, 35 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
> > index b921b9a1134a..2aa3f0a5644e 100644
> > --- a/drivers/clk/samsung/clk-exynos-arm64.c
> > +++ b/drivers/clk/samsung/clk-exynos-arm64.c
> > @@ -56,6 +56,37 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
> >       iounmap(reg_base);
> >  }
> >
> > +/**
> > + * exynos_arm64_enable_bus_clk - Enable parent clock of specified CMU
> > + *
> > + * @dev:     Device object; may be NULL if this function is not being
> > + *           called from platform driver probe function
> > + * @np:              CMU device tree node
> > + * @cmu:     CMU data
> > + *
> > + * Keep CMU parent clock running (needed for CMU registers access).
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +static int __init exynos_arm64_enable_bus_clk(struct device *dev,
> > +             struct device_node *np, const struct samsung_cmu_info *cmu)
> > +{
> > +     struct clk *parent_clk;
> > +
> > +     if (!cmu->clk_name)
> > +             return 0;
> > +
> > +     if (dev)
> > +             parent_clk = clk_get(dev, cmu->clk_name);
> > +     else
> > +             parent_clk = of_clk_get_by_name(np, cmu->clk_name);
> > +
> > +     if (IS_ERR(parent_clk))
> > +             return PTR_ERR(parent_clk);
> > +
> > +     return clk_prepare_enable(parent_clk);
> > +}
> > +
> >  /**
> >   * exynos_arm64_register_cmu - Register specified Exynos CMU domain
> >   * @dev:     Device object; may be NULL if this function is not being
> > @@ -72,23 +103,11 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
> >  void __init exynos_arm64_register_cmu(struct device *dev,
> >               struct device_node *np, const struct samsung_cmu_info *cmu)
> >  {
> > -     /* Keep CMU parent clock running (needed for CMU registers access) */
> > -     if (cmu->clk_name) {
> > -             struct clk *parent_clk;
> > -
> > -             if (dev)
> > -                     parent_clk = clk_get(dev, cmu->clk_name);
> > -             else
> > -                     parent_clk = of_clk_get_by_name(np, cmu->clk_name);
> > -
> > -             if (IS_ERR(parent_clk)) {
> > -                     pr_err("%s: could not find bus clock %s; err = %ld\n",
> > -                            __func__, cmu->clk_name, PTR_ERR(parent_clk));
> > -             } else {
> > -                     clk_prepare_enable(parent_clk);
> > -             }
> > -     }
> > +     int err;
> >
> > +     err = exynos_arm64_enable_bus_clk(dev, np, cmu);
> > +     if (err)
> > +             panic("%s: could not enable bus clock\n", __func__);
>
> The error handling is changed and not equivalent. I would say that we
> could still try to boot even if this failed, so kernel should not panic.
> Maybe the parent clock is enabled by bootloader.
>

Agreed, I've probably overlooked that one when making all the
refactoring. The same stands for the patch #6. Will rework and send
out those two separately soon, as the rest of patches you already
applied.

Thanks!

> Best regards,
> Krzysztof
>
