Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BECC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Nov 2021 16:25:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238480AbhKUQ2b (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Nov 2021 11:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238477AbhKUQ2b (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 11:28:31 -0500
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F01C06173E
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:25:26 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id b17so31773938uas.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lyWVrwoC5gH3Towkzk80K7hVwLuSw7kjiF0rQebdy+8=;
        b=gTYBxDOoMtEHSvOHP4PPRHLfeh7NFe0mU90SdM91np1JWQDSoFwyqKF+iwyK4W+kTO
         yUkM/gzcXk0w8D/LyOYg6fJz4wR6bmVMTdfpmkj2ZDdQvSUKYU5EVxmK8cdctqq1LWdA
         +W8SLVEYdFCQGlyijJfo822IGP+P/WXfcPfuWNAv49nGwhJsKNFtLk8QRNbZ4aDD1qH/
         Y3GcMyegoFgcMlvej+P3iYEd8NA82EnNj4qi//76aCWnaRMz9JHPtZnaBMU7iQmq2VW3
         yuuQ6epti1GKQ70j8w1NPQz2Vc+o1iyz4aWlmy5kIAunb3xI2qaItbnjv6fvsagHLOSb
         1TfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lyWVrwoC5gH3Towkzk80K7hVwLuSw7kjiF0rQebdy+8=;
        b=bW+8Atj5XUmJgT+rO9OXecmPIZCZMAuwUha2ilSktj1VR9D9+2U61ooVktPjQDl2HE
         tm7SIhfNnBaChBwlYXBaCnemEzxqd3hY4poOFrk7vnC6AmUnaN//i/TdVdDHXYkISVaS
         MKVY1+NUpZ1S4F4cYX4n+yJ3nBvMdIbX5CtfMWRDpn4WqxQ5ajY5tI6DN3Z1kMQrXkOM
         +vreJ03Hml7b06Ez804vm9+1xXsVlKDigUaFBD0bkhOaG2IsmbJ2Lpwc55jbW4GYkEMB
         fW93Ocy6zl69LeqxtjbgHXRyB7tTVD+9mA98SxJkcJ+LdRd/eSmYHdgK+N0BiN4NV2T9
         mPoQ==
X-Gm-Message-State: AOAM533GEWws4WLPP3Yv7np+xnsRz0XWuflHvSf751UF3x9qi0KKZMt5
        YZyC3+822WVnbYa82XHRQjCRNQJy4YabBjuEaRO38IWNoZcO3A==
X-Google-Smtp-Source: ABdhPJyOCVZWZ9dT1IZQS+yhLWWTW8zTyfIHH1f+CrFME+pLCGJh1pGLyOvJJcDLXeeBhraFl79zuExeBHpFFoUmHe0=
X-Received: by 2002:a05:6102:ac3:: with SMTP id m3mr104759337vsh.1.1637511925245;
 Sun, 21 Nov 2021 08:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-13-semen.protsenko@linaro.org> <2c0e5b23-92c5-70c9-3460-e9748f8a869e@roeck-us.net>
In-Reply-To: <2c0e5b23-92c5-70c9-3460-e9748f8a869e@roeck-us.net>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sun, 21 Nov 2021 18:25:13 +0200
Message-ID: <CAPLW+4mJYBhrYo58oF7hYXi+5Nt2ROvqDXB_=zezJsuExW6oBA@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] watchdog: s3c2410: Add Exynos850 support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 20 Nov 2021 at 22:29, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/7/21 12:29 PM, Sam Protsenko wrote:
> > Exynos850 is a bit different from SoCs already supported in WDT driver:
> >    - AUTOMATIC_WDT_RESET_DISABLE register is removed, so its value is
> >      always 0; .disable_auto_reset callback is not set for that reason
> >    - MASK_WDT_RESET_REQUEST register is replaced with
> >      CLUSTERx_NONCPU_IN_EN register; instead of masking (disabling) WDT
> >      reset interrupt it's now enabled with the same value; .mask_reset
> >      callback is reused for that functionality though
> >    - To make WDT functional, WDT counter needs to be enabled in
> >      CLUSTERx_NONCPU_OUT register; it's done using .enable_counter
> >      callback
> >
> > Also Exynos850 has two CPU clusters, each has its own dedicated WDT
> > instance. Different PMU registers and bits are used for each cluster. So
> > driver data is now modified in probe, adding needed info depending on
> > cluster index passed from device tree.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > Changes in v3:
> >    - Renamed "samsung,index" property to more descriptive
> >      "samsung,cluster-index"
> >    - Used pre-defined and completely set driver data for cluster0 and
> >      cluster1
> >
> > Changes in v2:
> >    - Used single compatible for Exynos850, populating missing driver data
> >      in probe
> >    - Added "index" property to specify CPU cluster index
> >
> >   drivers/watchdog/s3c2410_wdt.c | 62 +++++++++++++++++++++++++++++++++-
> >   1 file changed, 61 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> > index 96aa5d9c6ed4..1456201f27de 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -56,6 +56,13 @@
> >   #define EXYNOS5_RST_STAT_REG_OFFSET         0x0404
> >   #define EXYNOS5_WDT_DISABLE_REG_OFFSET              0x0408
> >   #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET   0x040c
> > +#define EXYNOS850_CLUSTER0_NONCPU_OUT                0x1220
> > +#define EXYNOS850_CLUSTER0_NONCPU_INT_EN     0x1244
> > +#define EXYNOS850_CLUSTER1_NONCPU_OUT                0x1620
> > +#define EXYNOS850_CLUSTER1_NONCPU_INT_EN     0x1644
> > +
> > +#define EXYNOS850_CLUSTER0_WDTRESET_BIT              24
> > +#define EXYNOS850_CLUSTER1_WDTRESET_BIT              23
> >
> >   /**
> >    * Quirk flags for different Samsung watchdog IP-cores.
> > @@ -205,6 +212,30 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
> >                 QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
> >   };
> >
> > +static const struct s3c2410_wdt_variant drv_data_exynos850_cl0 = {
> > +     .mask_reset_reg = EXYNOS850_CLUSTER0_NONCPU_INT_EN,
> > +     .mask_bit = 2,
> > +     .mask_reset_inv = true,
> > +     .rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> > +     .rst_stat_bit = EXYNOS850_CLUSTER0_WDTRESET_BIT,
> > +     .cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
> > +     .cnt_en_bit = 7,
> > +     .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> > +               QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> > +};
> > +
> > +static const struct s3c2410_wdt_variant drv_data_exynos850_cl1 = {
> > +     .mask_reset_reg = EXYNOS850_CLUSTER1_NONCPU_INT_EN,
> > +     .mask_bit = 2,
> > +     .mask_reset_inv = true,
> > +     .rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> > +     .rst_stat_bit = EXYNOS850_CLUSTER1_WDTRESET_BIT,
> > +     .cnt_en_reg = EXYNOS850_CLUSTER1_NONCPU_OUT,
> > +     .cnt_en_bit = 7,
> > +     .quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
> > +               QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> > +};
> > +
> >   static const struct of_device_id s3c2410_wdt_match[] = {
> >       { .compatible = "samsung,s3c2410-wdt",
> >         .data = &drv_data_s3c2410 },
> > @@ -216,6 +247,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
> >         .data = &drv_data_exynos5420 },
> >       { .compatible = "samsung,exynos7-wdt",
> >         .data = &drv_data_exynos7 },
> > +     { .compatible = "samsung,exynos850-wdt",
> > +       .data = &drv_data_exynos850_cl0 },
> >       {},
> >   };
> >   MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> > @@ -587,14 +620,38 @@ static inline const struct s3c2410_wdt_variant *
> >   s3c2410_get_wdt_drv_data(struct platform_device *pdev)
> >   {
> >       const struct s3c2410_wdt_variant *variant;
> > +     struct device *dev = &pdev->dev;
> >
> > -     variant = of_device_get_match_data(&pdev->dev);
> > +     variant = of_device_get_match_data(dev);
> >       if (!variant) {
> >               /* Device matched by platform_device_id */
> >               variant = (struct s3c2410_wdt_variant *)
> >                          platform_get_device_id(pdev)->driver_data;
> >       }
> >
> > +     /* Choose Exynos850 driver data w.r.t. cluster index */
> > +     if (variant == &drv_data_exynos850_cl0) {
>
> 0-day has a point here. drv_data_exynos850_cl0 is declared inside a CONFIG_OF
> conditional, causing compile failure if CONFIG_OF is not enabled.
>
> Please fix and resubmit.
>

Right. I missed that this driver has also platform device table. Will
send v4 soon.

> Guenter
