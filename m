Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2975C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 10:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BAC2611AE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 10:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234245AbhJEKaw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Oct 2021 06:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234150AbhJEKao (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 06:30:44 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597EBC061749
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Oct 2021 03:28:54 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id i30so2372292vsj.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2021 03:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G0mA3IE5MZEisQTtgMG+oRXyhpY0P+ydyHuZ+OL6HWc=;
        b=dYz37AlljNPD9qLWQ97zbV27b0HY7ewVO3Uc3VbZE59qtLyIPZdAygLiP/L7L6ta2k
         7wo82cBeaU/yrZGMukOkPAJVQZ4pLBfEzhvWccizI4iAeqttaW9UJYaQFvD6X593YYIL
         UMVXewCTa3HMEhW+WMZqNwoGh2ccWd/n4Pm/RN1VTve0giAK9GGSd5+fNcnUwN7X/V9y
         AGJRlgKoL8TADZr1MKOpubWt6dNk1B3XRYOeE3CyYwjA1HnG55pgvOyQHGnDcbaDSd+t
         CsvLEOIzJa6coTyRT5lmDL0toEgb6nBTS2LPk6eoarcqHaj93J/x0NsS2JxXZdDhzVeK
         lPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G0mA3IE5MZEisQTtgMG+oRXyhpY0P+ydyHuZ+OL6HWc=;
        b=XlWeI8p38jcCnColzvrDn1DuDdaj5R1Fu8YYnx70tnnNXIGKEneUCDbPez6kPCa8HN
         G2LZO6tuWmhbflt++PHV0QjV+YN12yEcsrM1xt7J4c8soiIatvRXwzfRMkBx7ZkjsQHw
         MBNSx0kr/8OXdTq5xcFx5Sk6/4uoXmN5Za8XcQiOLakCZ6Lsi1HdoYU3TnCeJC9pOPrf
         VFQvLKV1AAMXWHeJY83ATPVTmv+gGR0QRtc6HiBaQYquUuHeodpecHLzXOyhfrIz+PU6
         yobcr42ouioene1yRPXTbJ30h967r/voG1zodZjcdzPNvcJ6044+FVkLn4mU1PuCJvv0
         VNBw==
X-Gm-Message-State: AOAM531pgsN0Ms6Dz5yKvsrZYPvWmxPpAjNMqE7Hg+WTduUx/MoKGU0O
        XPVgaSf4XMbwKMmaeukvtYelHciD0vIF29nZbXxkxw==
X-Google-Smtp-Source: ABdhPJxI3BjDXd7TUEnohF0PNs6zjgfdCxTBiFr0D8GdDdXVisMsIArQDHOLlS4VgiQB2aceby4tfN5qicUSqa2Bf2o=
X-Received: by 2002:a67:d289:: with SMTP id z9mr8432439vsi.39.1633429733158;
 Tue, 05 Oct 2021 03:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-5-semen.protsenko@linaro.org> <96e5587e-aca7-248e-6448-8edfc70784b7@gmail.com>
In-Reply-To: <96e5587e-aca7-248e-6448-8edfc70784b7@gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 5 Oct 2021 13:28:40 +0300
Message-ID: <CAPLW+4mEeh8Fo8kGHx+rB7nX7bDfaQRPGDotgPLTp4pm4rC0Cg@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: clock: Add bindings definitions for
 Exynos850 CMU
To:     Chanwoo Choi <cwchoi00@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 15 Sept 2021 at 19:37, Chanwoo Choi <cwchoi00@gmail.com> wrote:
>
> Hi,
>
> You don't add clock ids for the all defined clocks in clk-exynos850.c.
> I recommend that add all clock ids for the defined clocks if possible.
>
> If you want to change the parent clock of mux or change the clock rate
> of div rate for some clocks, you have to touch the files as following:
> - include/dt-bindings/clock/exynos850.h
> - drivers/clk/samsung/clk-exynos850.c
> - exynos850 dt files
>
> If you define the clock ids for all clocks added to this patchset,
> you can change the parent or rate by just editing the dt files.
>

Hi Chanwoo,

I see your point. But I have intentionally omitted some clock ids,
which can't be / shouldn't be used by consumers in device tree.
Actually I took that idea from clk-exynos7.c.

Krzysztof, Sylwester: can you please advice if all clock ids should be
defined, or only those that are going to be used in dts clk consumers?
I don't mind reworking the patch, just want to be sure which design
approach we want to follow.

Thanks!

> But, I have no strongly objection about just keeping this patch.
>
>
> On 21. 9. 15. =EC=98=A4=EC=A0=84 12:56, Sam Protsenko wrote:
> > Clock controller driver is designed to have separate instances for each
> > particular CMU. So clock IDs in this bindings header also start from 1
> > for each CMU.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >   include/dt-bindings/clock/exynos850.h | 72 ++++++++++++++++++++++++++=
+
> >   1 file changed, 72 insertions(+)
> >   create mode 100644 include/dt-bindings/clock/exynos850.h
> >
> > diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-binding=
s/clock/exynos850.h
> > new file mode 100644
> > index 000000000000..2f0a7f619627
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/exynos850.h
> > @@ -0,0 +1,72 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (C) 2021 Linaro Ltd.
> > + * Author: Sam Protsenko <semen.protsenko@linaro.org>
> > + *
> > + * Device Tree binding constants for Exynos850 clock controller.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_EXYNOS_850_H
> > +#define _DT_BINDINGS_CLOCK_EXYNOS_850_H
> > +
> > +/* CMU_TOP */
> > +#define DOUT_HSI_BUS                 1
> > +#define DOUT_HSI_MMC_CARD            2
> > +#define DOUT_HSI_USB20DRD            3
> > +#define DOUT_PERI_BUS                        4
> > +#define DOUT_PERI_UART                       5
> > +#define DOUT_PERI_IP                 6
> > +#define DOUT_CORE_BUS                        7
> > +#define DOUT_CORE_CCI                        8
> > +#define DOUT_CORE_MMC_EMBD           9
> > +#define DOUT_CORE_SSS                        10
> > +#define TOP_NR_CLK                   11
> > +
> > +/* CMU_HSI */
> > +#define GOUT_USB_RTC_CLK             1
> > +#define GOUT_USB_REF_CLK             2
> > +#define GOUT_USB_PHY_REF_CLK         3
> > +#define GOUT_USB_PHY_ACLK            4
> > +#define GOUT_USB_BUS_EARLY_CLK               5
> > +#define GOUT_GPIO_HSI_PCLK           6
> > +#define GOUT_MMC_CARD_ACLK           7
> > +#define GOUT_MMC_CARD_SDCLKIN                8
> > +#define GOUT_SYSREG_HSI_PCLK         9
> > +#define HSI_NR_CLK                   10
> > +
> > +/* CMU_PERI */
> > +#define GOUT_GPIO_PERI_PCLK          1
> > +#define GOUT_HSI2C0_IPCLK            2
> > +#define GOUT_HSI2C0_PCLK             3
> > +#define GOUT_HSI2C1_IPCLK            4
> > +#define GOUT_HSI2C1_PCLK             5
> > +#define GOUT_HSI2C2_IPCLK            6
> > +#define GOUT_HSI2C2_PCLK             7
> > +#define GOUT_I2C0_PCLK                       8
> > +#define GOUT_I2C1_PCLK                       9
> > +#define GOUT_I2C2_PCLK                       10
> > +#define GOUT_I2C3_PCLK                       11
> > +#define GOUT_I2C4_PCLK                       12
> > +#define GOUT_I2C5_PCLK                       13
> > +#define GOUT_I2C6_PCLK                       14
> > +#define GOUT_MCT_PCLK                        15
> > +#define GOUT_PWM_MOTOR_PCLK          16
> > +#define GOUT_SPI0_IPCLK                      17
> > +#define GOUT_SPI0_PCLK                       18
> > +#define GOUT_SYSREG_PERI_PCLK                19
> > +#define GOUT_UART_IPCLK                      20
> > +#define GOUT_UART_PCLK                       21
> > +#define GOUT_WDT0_PCLK                       22
> > +#define GOUT_WDT1_PCLK                       23
> > +#define PERI_NR_CLK                  24
> > +
> > +/* CMU_CORE */
> > +#define GOUT_CCI_ACLK                        1
> > +#define GOUT_GIC_CLK                 2
> > +#define GOUT_MMC_EMBD_ACLK           3
> > +#define GOUT_MMC_EMBD_SDCLKIN                4
> > +#define GOUT_SSS_ACLK                        5
> > +#define GOUT_SSS_PCLK                        6
> > +#define CORE_NR_CLK                  7
> > +
> > +#endif /* _DT_BINDINGS_CLOCK_EXYNOS_850_H */
> >
>
>
> --
> Best Regards,
> Samsung Electronics
> Chanwoo Choi
