Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67530C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 11:29:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C0B961019
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 11:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234070AbhJELbV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Oct 2021 07:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhJELbV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 07:31:21 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28BF1C06174E
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Oct 2021 04:29:31 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id y141so7579166vsy.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2021 04:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qrwVEpJ/XUV+QEVqljOLbqlOPVjiAMub2FCrReehyZ0=;
        b=EtZVHaj1566XTX+XZxTLu03OPVlLOfH87kfxFbq6q+vFS4QEcN7Uc5pwF/fTrJv6nN
         6ul7qnrRt+GG95hjfUMgj4ziYGpdbkmjVmIFTrOoQxr3VN/bl1jMVchwAbIG3YmytP/O
         O0XyYvWbt+xSHbFdnt+mp40cF1/FeTCXpZuuAEaDbzvDauWGb0ULsJMfEO69thQ+va3b
         7ZaEE9J2jN82hb1qMiJQrjgeAXI/2oS9xL1iA5knxYRh3rnwO4QiL0vMo2bcu5wDJmDi
         tMfnvdWQM/a6ZITSFZEDtq4pSOsptHin4o4DKT1UdSThjpF2hJd+AzmMntfEcGkBu9Kq
         2p1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qrwVEpJ/XUV+QEVqljOLbqlOPVjiAMub2FCrReehyZ0=;
        b=vvaT4uNpbA16e+9QIDuGvv4/g1sCWyNWNS4q+/ZBZymHhWKd5mmh5Ew4d8kQXAp7l2
         WVuGI99wbnsO0kXUtVwjG1zFJmiKFoWlvzo9jY4jiw3dAdwEtBvcSWOGlzfgRryiJ0+4
         SMzmkrEx6URORlgUr2NF/Yl6x8ddTO/qmbK1Yom5JU7gor4Me3LlVA5nZcqO08/S/HZ6
         YKVbHNvUwcMpZwn31gpcx/zceGw1sdU3IhKzRI1wNzrFcKspk+rbxxsRh2yWaUTfUX1l
         urXKtVNpCctqk12eaF5lZH5iqrjfRAFDTNhvXnwiJ4VrnTrF/C8C7ycjhRxXln1OkrcH
         Bf+w==
X-Gm-Message-State: AOAM530thZdxDhSaOszKcUdVdVE6vzCobiSfHG3XWaBvsGwsjkpkxVRY
        wDmjuaIY1svalRiz561TJvXZ1raWcMa2TPXuV8Tnqg==
X-Google-Smtp-Source: ABdhPJxWO2wC1vuvfjjdVx5I/11lIUzUVp9XBbjqaVxFcNcK45Nh/CVj6P9EBlHICIY5XsnysjshS2LW5Fdj1mDHucs=
X-Received: by 2002:a67:d91b:: with SMTP id t27mr8774428vsj.55.1633433370114;
 Tue, 05 Oct 2021 04:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-7-semen.protsenko@linaro.org> <3da75dbe-2f98-39db-c455-46adead7097b@canonical.com>
In-Reply-To: <3da75dbe-2f98-39db-c455-46adead7097b@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 5 Oct 2021 14:29:18 +0300
Message-ID: <CAPLW+4k+1x+qwJJWth7=KwsF_Q2+n5LDA8Q+63M-bxXDO=4bZg@mail.gmail.com>
Subject: Re: [PATCH 6/6] clk: samsung: Introduce Exynos850 clock driver
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 15 Sept 2021 at 11:59, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 14/09/2021 17:56, Sam Protsenko wrote:
> > This is the initial implementation adding only basic clocks like UART,
> > MMC, I2C and corresponding parent clocks. Design is influenced by
> > Exynos7 and Exynos5433 clock drivers.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/clk/samsung/Makefile        |   1 +
> >  drivers/clk/samsung/clk-exynos850.c | 700 ++++++++++++++++++++++++++++
> >  2 files changed, 701 insertions(+)
> >  create mode 100644 drivers/clk/samsung/clk-exynos850.c
> >
> > diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> > index 028b2e27a37e..c46cf11e4d0b 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > @@ -17,6 +17,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)       += clk-exynos5433.o
> >  obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
> >  obj-$(CONFIG_EXYNOS_CLKOUT)  += clk-exynos-clkout.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        += clk-exynos7.o
> > +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        += clk-exynos850.o
> >  obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
> >  obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
> >  obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
> > diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
> > new file mode 100644
> > index 000000000000..1028caa2102e
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-exynos850.c
> > @@ -0,0 +1,700 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2021 Linaro Ltd.
> > + * Author: Sam Protsenko <semen.protsenko@linaro.org>
> > + *
> > + * Common Clock Framework support for Exynos850 SoC.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +
> > +#include <dt-bindings/clock/exynos850.h>
> > +
> > +#include "clk.h"
> > +
> > +/* Gate register bits */
> > +#define GATE_MANUAL          BIT(20)
> > +#define GATE_ENABLE_HWACG    BIT(28)
> > +
> > +/* Gate register offsets range */
> > +#define GATE_OFF_START               0x2000
> > +#define GATE_OFF_END         0x2fff
> > +
> > +/**
> > + * exynos850_init_clocks - Set clocks initial configuration
> > + * @np:                      CMU device tree node with "reg" property (CMU addr)
> > + * @reg_offs:                Register offsets array for clocks to init
> > + * @reg_offs_len:    Number of register offsets in reg_offs array
> > + *
> > + * Set manual control mode for all gate clocks.
> > + */
> > +static void __init exynos850_init_clocks(struct device_node *np,
> > +             const unsigned long *reg_offs, size_t reg_offs_len)
> > +{
> > +     const __be32 *regaddr_p;
> > +     u64 regaddr;
> > +     u32 base;
> > +     size_t i;
> > +
> > +     /* Get the base address ("reg" property in dts) */
> > +     regaddr_p = of_get_address(np, 0, NULL, NULL);
> > +     if (!regaddr_p)
> > +             panic("%s: failed to get reg regaddr\n", __func__);
> > +
> > +     regaddr = of_translate_address(np, regaddr_p);
> > +     if (regaddr == OF_BAD_ADDR || !regaddr)
> > +             panic("%s: bad reg regaddr\n", __func__);
> > +
> > +     base = (u32)regaddr;
> > +
> > +     for (i = 0; i < reg_offs_len; ++i) {
> > +             void __iomem *reg;
> > +             u32 val;
> > +
> > +             /* Modify only gate clock registers */
> > +             if (reg_offs[i] < GATE_OFF_START || reg_offs[i] > GATE_OFF_END)
> > +                     continue;
> > +
> > +             reg = ioremap(base + reg_offs[i], 4);
>
> You first translate the address to CPU physical address and then apply
> offset. This should be equivalent to one of_iomap() of entire range and
> iterate starting from the base pointer.  IOW, I don't get why you have
> to map each register instead of mapping entire SFR/IO range?
>

Thanks, will do in v2.

> > +             val = ioread32(reg);
> > +             val |= GATE_MANUAL;
> > +             val &= ~GATE_ENABLE_HWACG;
> > +             iowrite32(val, reg);
>
> All other drivers use readl/writel, so how about keeping it consistent?
>

Ok. Though io* variants looks better to me (API names consistent with
ioremap/iounmap) :)

> Rest looks good but I did not verify the numbers :)
>
> Best regards,
> Krzysztof
