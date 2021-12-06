Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F8AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Dec 2021 08:14:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239051AbhLFISS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Dec 2021 03:18:18 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37366
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239038AbhLFISR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 03:18:17 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9FB4F3F1F0
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Dec 2021 08:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638778488;
        bh=pebEk52luhXLxxTpaPgvP+uRufHrkPklQ9wpre0mi+M=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=nydmt4/uaXJc+VwDDwjKB8YypX4n/9pnCNpWSE/jpYa+fJjicxN/h2GnLq0RT8d4M
         ktndhs8CWaIuPwKaG1YfzAf0laP2pQ57fd95986zQNDNOYc3v2RWo6NuQS2+CvZHBR
         HClcZb3rD8k2SWliYuknpfCWESOvFwhm6hneENIOJIOP8F1k7vQlL1BfcYIC+/QdxX
         iHaCZOzqfWDGtlSG9raeFFoHEgPlOpjQ+fp5wCh9fkzRwh6LtXvAwuAFnu99yK8Row
         94Vz5zbcbZ3EIsyA+G1gCdHRS1LTDwFSkjQNwd8cqeWRRw5LNmKUd5tUPEs+4RZFik
         WaWLZFJQYTsFw==
Received: by mail-lf1-f70.google.com with SMTP id d2-20020a0565123d0200b0040370d0d2fbso3527924lfv.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Dec 2021 00:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pebEk52luhXLxxTpaPgvP+uRufHrkPklQ9wpre0mi+M=;
        b=nzkH+Kg5uVArJacljwITTTb3x81oR29Z7Dutvww2comrxOvNNvEPvFfbnqC5WXkb6c
         xATq/+3bxUR5NUEfNqokZvwJU6w/TcaUL/os7JDims+w+mX2QN9dSlUvYDiT91lgdqwM
         8XS9Ao34UxyC5VkIy99HPpktEVbBvZEuYkiuT4pW4Z3aAhUmol7e+r65RxWrkTx5hkxm
         TtzsoUAaq2q6QIvuBuTzX4SIS57PGD64UU9H7xAjEmOG1L57ZxkcqX9PRCqcoZwkZJHq
         PXo7pQmwsZtoxwCHPwAmF6hFekv7zzF5KvXxklTYpD05ktDjVwj5VAJSsI5A+BPuP3AG
         LYBg==
X-Gm-Message-State: AOAM532XE9zQpBVkR0rxJGTVX0ltYiaWqhm9ZHQ0lVqGJBcOLDqIOpKm
        nmgdp7O6AhkHJwjNEBdOhzX+e/sKwisW3V9SKQ1IvM7sbfI0OTn0N8OXsfw1GZ3CNDthW+tD1gQ
        zKpONDX6RhWhUjfk3TFxRVBYR0Jx/hBnr0eCcBUQxAo9NK73r
X-Received: by 2002:a2e:a588:: with SMTP id m8mr35295103ljp.23.1638778487779;
        Mon, 06 Dec 2021 00:14:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkjdsS8wT/1ZgOCaXlM/8RKnbGXhyADVHCYLU0NDvaCjZdFze4Gc4WES2nff3DeILprgXWeg==
X-Received: by 2002:a2e:a588:: with SMTP id m8mr35295075ljp.23.1638778487585;
        Mon, 06 Dec 2021 00:14:47 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bd28sm1253823ljb.134.2021.12.06.00.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 00:14:47 -0800 (PST)
Message-ID: <c7d6f119-55b5-cda7-13dc-f6f61a7fdb59@canonical.com>
Date:   Mon, 6 Dec 2021 09:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 6/7] clk: samsung: Add initial Exynos7885 clock driver
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211205230804.202292-1-virag.david003@gmail.com>
 <20211205230804.202292-7-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211205230804.202292-7-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/12/2021 00:08, David Virag wrote:
> This is an initial implementation adding basic clocks, such as UART,
> USI, I2C, WDT, ect. and their parent clocks. It is heavily based on the
> Exynos850 clock driver at 'drivers/clk/samsung/clk-exynos850.c' which
> was made by Sam Protsenko, thus the copyright and author lines were
> kept.
> 
> Bus clocks are enabled by default as well to avoid hangs while trying to
> access CMU registers.
> 
> Only the parts of CMU_TOP needed for CMU_CORE and CMU_PERI, a bit of
> CMU_CORE, and most of CMU_PERI is implemented as of now.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - Use shared code between Exynos850 and 7885 clock drivers
>   - As the code that was from the Exynos850 clock driver was moved to
>     clk-exynos-arm64.c and what remains is mostly SoC specific data,
>     move the Linaro copyright and Sam Protsenko author lines there.
> 
> Changes in v3:
>   - Nothing
> 
>  drivers/clk/samsung/Makefile         |   1 +
>  drivers/clk/samsung/clk-exynos7885.c | 593 +++++++++++++++++++++++++++
>  2 files changed, 594 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos7885.c
> 
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index 901e6333c5f0..0df74916a895 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
>  obj-$(CONFIG_EXYNOS_CLKOUT)	+= clk-exynos-clkout.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos-arm64.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7885.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
>  obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
>  obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
> diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
> new file mode 100644
> index 000000000000..0b3a28800e76
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos7885.c
> @@ -0,0 +1,591 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021 Dávid Virág <virag.david003@gmail.com>
> + * Author: Dávid Virág <virag.david003@gmail.com>
> + *
> + * Common Clock Framework support for Exynos7885 SoC.
> + */
> +
> +#include <linux/of_device.h>
> +#include <dt-bindings/clock/exynos7885.h>
> +
> +#include "clk-exynos-arm64.h"

Similarly to your previous patch - you need headers for every explicitly
used symbol/function etc.

Best regards,
Krzysztof
