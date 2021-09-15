Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E5DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 18:05:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6089611C4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 18:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbhIOSGZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 14:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhIOSGY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 14:06:24 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA204C061574;
        Wed, 15 Sep 2021 11:05:05 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id w19-20020a17090aaf9300b00191e6d10a19so2830197pjq.1;
        Wed, 15 Sep 2021 11:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DxE8EI6WhqiyghdGlGjkLAEFX1mqHtojnuLJrvbLYKs=;
        b=SCThavKcAesRoxHcT4VLWrVNAE4P9Yljq3SVUCs6QXcKvhheMJ0hzl8hqdq+Co4f/5
         RvAczMnJr0dT8Yp0UCn8Ic86iroFVaVfDBNUJMszN4SmpR7n6tg2NL40U8zReRuVfnFp
         MJ30mtSI0B6J7Q2CqGqzbnawBQRzzDcrQDZOLd3oaA2K2+se7wgYXTqTx5QMba1CsVSe
         iIR6mG9fwvOMdQNXhQQFkfLJKsiqSAF1UrGNK/sm2e/l/iyz84MRcvq0OFvKhJ57PMYX
         NHIk+fQnanS/PKzyHeAIbdi0g3omTjq/8JhWVEIwmtQy2YrhtKQqvIA4soITxUXZ97HC
         p3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DxE8EI6WhqiyghdGlGjkLAEFX1mqHtojnuLJrvbLYKs=;
        b=rsTzJhaxVAgtqn9fxXTgFE5OGlnXxAKADrQ/7lHUlx+by/jrI8BAsKHOafaAu+tdgO
         qQaGwlCwYavsfoD6LOl5c10OxUCUZnD/+3iSpOQ+3x1bwkjRB0cePx9uvnXJv6gf5Ucb
         7r0L3zbIBM7krbHSr4sESeWfgCjAG7YH1H4kwes0gHUa6duJzI/XjFLK6VrbD5k855UD
         S+mrIvLf3E/PF+voRngHvoLvVNb+6DOhv3+nM3qSXeA6fraTUHtWKoM3L1deIdX1xXBK
         KpiidAi+HN/hFzbdGgaOb8grkuSQwVrAtf4fYYL7SGhmYKkgNMDj43JnuKGP7G+rkouI
         oeUQ==
X-Gm-Message-State: AOAM530nOk6g6aPFRCu+HsqS1GgOxqzENJ6ll/LV7snm2fMrELZJJyhS
        v8fakcwti+le5dY+ivCbg4DLRUpnBBg=
X-Google-Smtp-Source: ABdhPJzk0QV2W1kV2rLTWkY5sgEyWUoGS23+UUZBhU1p3YQXgoAtQNGtBcT/GaO5JQf4CqP9Pa4CoQ==
X-Received: by 2002:a17:90b:1e02:: with SMTP id pg2mr10072635pjb.114.1631729104802;
        Wed, 15 Sep 2021 11:05:04 -0700 (PDT)
Received: from [172.30.1.2] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id g4sm328064pjt.56.2021.09.15.11.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 11:05:04 -0700 (PDT)
Subject: Re: [PATCH 6/6] clk: samsung: Introduce Exynos850 clock driver
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
From:   Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <1428bfc4-520f-9af3-5255-b17308881243@gmail.com>
Date:   Thu, 16 Sep 2021 03:04:57 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-7-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Sam,

On 21. 9. 15. 오전 12:56, Sam Protsenko wrote:
> This is the initial implementation adding only basic clocks like UART,
> MMC, I2C and corresponding parent clocks. Design is influenced by
> Exynos7 and Exynos5433 clock drivers.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>   drivers/clk/samsung/Makefile        |   1 +
>   drivers/clk/samsung/clk-exynos850.c | 700 ++++++++++++++++++++++++++++
>   2 files changed, 701 insertions(+)
>   create mode 100644 drivers/clk/samsung/clk-exynos850.c
> 
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index 028b2e27a37e..c46cf11e4d0b 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
>   obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
>   obj-$(CONFIG_EXYNOS_CLKOUT)	+= clk-exynos-clkout.o
>   obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
>   obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
>   obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
>   obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
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
> +			continue; > +
> +		reg = ioremap(base + reg_offs[i], 4);
> +		val = ioread32(reg);
> +		val |= GATE_MANUAL;
> +		val &= ~GATE_ENABLE_HWACG;
> +		iowrite32(val, reg);
> +		iounmap(reg);

I understand your intention for disabling HWACG.
But, it is not good to execute ioreamp/iounmap for each clock gate
register. I think that we need to consider the more pretty method
to initialize the clock register before clock registration.

[snip]

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
