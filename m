Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE463C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 08:59:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D618E60527
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 08:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237138AbhIOJBA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 05:01:00 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:54300
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237169AbhIOJAy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 05:00:54 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 595E54026C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 08:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631696369;
        bh=39NyD7eSdjWRLG7akJoaBQq2vkbMMaThM/SwbRfMg/Y=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=kSUCDXOUbBSjJTliF3DNPHcJbV96qsvr+7LSkmX5/kweDMsOoSZQt9uJWMtsIe0EJ
         3EKmUur0EwMaRbDxTe4o2jdAzdxgQR2ppRiSnRbo1FKJnjr7KDXIzOmtGmqe2JSO2R
         z1nFdOfKL0webr3V0vUXafqXvlhlLzLlgqPnOPqT84dPeMu7XCpndWrUBoktN8xJ3j
         tXPjRAjdtbPADfxRvsCJd7DnM7Q5nuIhcfOBI8WKUDhS7pWUhjAUYtAvcVbVs6ltuy
         NureCTGO2INlMbdiXxIPqIUk5hHM7PVLDZCLaSpqYkeIhB0+V39mwqR8ufHIo1mTK6
         0W6+f2N0n0Iow==
Received: by mail-ej1-f72.google.com with SMTP id ne21-20020a1709077b95b029057eb61c6fdfso1121156ejc.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 01:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=39NyD7eSdjWRLG7akJoaBQq2vkbMMaThM/SwbRfMg/Y=;
        b=kKTASiAqUyM0Ie+EqrjSrzgEz6LmMkw1yDicGB57oXJLwXm9ZbYo6D/Vy+Hfa6AF9Y
         LsmeR64i6PaJHb61UO9vgUAAT3mQlUhaZA5a1yxysstqiT4ayPB7sVrUTtezWCzDlu20
         d37Z4LbLj4qDGKMy2ZIIuWeRO87pkPfHiSt86TMAjMZmQoBOpIaBboJxjdwH8kLbuSie
         qiXYxE22Gnhm90toaTghyfnndIPu60lMvwsbz4JDwCTY58VQ6tq3mDC8rhxYH3O2a2fU
         IP+l+woRd3qokpJnUE6TsnIIQ7YyMpjJ1pXsT6zVH9lJBwJx9rkcUap34LoKMm9Pb9zV
         HVnQ==
X-Gm-Message-State: AOAM533NifCWjyK+fkZ+9ta+SMlZ7ZK6tf6EwSZNGeIhCf6LDBKotKPZ
        EgqN+zcyRV6OuIzJcalHlh4sC6tBF0kzlaeewvpGMZHmVh3tkM1B5oFWel+5MqwZzzj2H8UZ84b
        kYGV7Sdoyk/58pBiuwKUPZtV0+IIDqz/1z3Le9gO1qFb1A3QT
X-Received: by 2002:a17:906:f15:: with SMTP id z21mr23428830eji.177.1631696368016;
        Wed, 15 Sep 2021 01:59:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymRnBWWR852OpGubXgrdOU89q9lNXSyAJz+ZILaji+sCwYZwgAvCN0PKGDsBRUEBEUCnD23A==
X-Received: by 2002:a17:906:f15:: with SMTP id z21mr23428808eji.177.1631696367855;
        Wed, 15 Sep 2021 01:59:27 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id f24sm6703253edc.40.2021.09.15.01.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 01:59:27 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-7-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 6/6] clk: samsung: Introduce Exynos850 clock driver
Message-ID: <3da75dbe-2f98-39db-c455-46adead7097b@canonical.com>
Date:   Wed, 15 Sep 2021 10:59:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-7-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/09/2021 17:56, Sam Protsenko wrote:
> This is the initial implementation adding only basic clocks like UART,
> MMC, I2C and corresponding parent clocks. Design is influenced by
> Exynos7 and Exynos5433 clock drivers.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/Makefile        |   1 +
>  drivers/clk/samsung/clk-exynos850.c | 700 ++++++++++++++++++++++++++++
>  2 files changed, 701 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos850.c
> 
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index 028b2e27a37e..c46cf11e4d0b 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
>  obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
>  obj-$(CONFIG_EXYNOS_CLKOUT)	+= clk-exynos-clkout.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
>  obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
>  obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
>  obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
> diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
> new file mode 100644
> index 000000000000..1028caa2102e
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos850.c
> @@ -0,0 +1,700 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021 Linaro Ltd.
> + * Author: Sam Protsenko <semen.protsenko@linaro.org>
> + *
> + * Common Clock Framework support for Exynos850 SoC.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +
> +#include <dt-bindings/clock/exynos850.h>
> +
> +#include "clk.h"
> +
> +/* Gate register bits */
> +#define GATE_MANUAL		BIT(20)
> +#define GATE_ENABLE_HWACG	BIT(28)
> +
> +/* Gate register offsets range */
> +#define GATE_OFF_START		0x2000
> +#define GATE_OFF_END		0x2fff
> +
> +/**
> + * exynos850_init_clocks - Set clocks initial configuration
> + * @np:			CMU device tree node with "reg" property (CMU addr)
> + * @reg_offs:		Register offsets array for clocks to init
> + * @reg_offs_len:	Number of register offsets in reg_offs array
> + *
> + * Set manual control mode for all gate clocks.
> + */
> +static void __init exynos850_init_clocks(struct device_node *np,
> +		const unsigned long *reg_offs, size_t reg_offs_len)
> +{
> +	const __be32 *regaddr_p;
> +	u64 regaddr;
> +	u32 base;
> +	size_t i;
> +
> +	/* Get the base address ("reg" property in dts) */
> +	regaddr_p = of_get_address(np, 0, NULL, NULL);
> +	if (!regaddr_p)
> +		panic("%s: failed to get reg regaddr\n", __func__);
> +
> +	regaddr = of_translate_address(np, regaddr_p);
> +	if (regaddr == OF_BAD_ADDR || !regaddr)
> +		panic("%s: bad reg regaddr\n", __func__);
> +
> +	base = (u32)regaddr;
> +
> +	for (i = 0; i < reg_offs_len; ++i) {
> +		void __iomem *reg;
> +		u32 val;
> +
> +		/* Modify only gate clock registers */
> +		if (reg_offs[i] < GATE_OFF_START || reg_offs[i] > GATE_OFF_END)
> +			continue;
> +
> +		reg = ioremap(base + reg_offs[i], 4);

You first translate the address to CPU physical address and then apply
offset. This should be equivalent to one of_iomap() of entire range and
iterate starting from the base pointer.  IOW, I don't get why you have
to map each register instead of mapping entire SFR/IO range?

> +		val = ioread32(reg);
> +		val |= GATE_MANUAL;
> +		val &= ~GATE_ENABLE_HWACG;
> +		iowrite32(val, reg);

All other drivers use readl/writel, so how about keeping it consistent?

Rest looks good but I did not verify the numbers :)

Best regards,
Krzysztof
