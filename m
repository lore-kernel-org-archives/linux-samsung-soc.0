Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A8CC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 07:36:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63997208D5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 07:36:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgKMHgq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Nov 2020 02:36:46 -0500
Received: from mail-ej1-f66.google.com ([209.85.218.66]:42074 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgKMHgp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 02:36:45 -0500
Received: by mail-ej1-f66.google.com with SMTP id i19so11895462ejx.9;
        Thu, 12 Nov 2020 23:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lF9F6ulOL21hYHmYnWk/iPK3JjbD1z5cgjWscdLc7o4=;
        b=Eec7C07MBXFS3dMJFBQq7cQrtn8GYCFk45NMjZVjfEhw5oqcM2ruBZ9BFVBTSmfcUa
         2ApRrXXvtnBkvfPFR57iDORMCwpwAul7i7LfCXKBV2nxD2c+GAEuFHV/BTh4JySg1i4T
         /xzRnADOdb/xsno42NBYiIpiBc4zqAQloiBj2sZRq+SY3hTCRx3r4p253kqX37gewPl/
         JGp6njHx1d1IfGiLdd1vAO24rEZkeVXNE0X/lYXrCgTBUN1E/wryY0PCZcmy/hUkAQt0
         Y8+2NIfaRpDR4z4y7O6zhnneiyNnA8c/Mdx0pBZOCQcvfD2s5y84coZOsFQOif3mFM6E
         iT8w==
X-Gm-Message-State: AOAM5312rO7MwgQ7J3/+0dzAHP+03m6VyDQZn8hv8dnUzj6LtFuNQTq1
        MbPfH12Do17/DsSi95Mfxa8=
X-Google-Smtp-Source: ABdhPJyGD5+mmTulDLlgvMkt/TG2cliCNiLEJPvGahMPDQz8KN2r1/II3OoM9LERzf2d1xWkKiHUuw==
X-Received: by 2002:a17:906:934d:: with SMTP id p13mr693013ejw.245.1605253003489;
        Thu, 12 Nov 2020 23:36:43 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id t21sm3154426edy.39.2020.11.12.23.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 23:36:42 -0800 (PST)
Date:   Fri, 13 Nov 2020 08:36:41 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     linux-clk@vger.kernel.org, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, m.szyprowski@samsung.com, sboyd@kernel.org,
        mturquette@baylibre.com, b.zolnierkie@samsung.com,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4] clk: samsung: Prevent potential endless loop in the
 PLL set_rate ops
Message-ID: <20201113073641.GA4405@kozik-lap>
References: <CGME20201110193254eucas1p22e954946d03c07995c73a019e5593ba0@eucas1p2.samsung.com>
 <20201110193226.20681-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201110193226.20681-1-s.nawrocki@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 10, 2020 at 08:32:26PM +0100, Sylwester Nawrocki wrote:
> The PLL status polling loops in the set_rate callbacks of some PLLs
> have no timeout detection and may become endless loops when something
> goes wrong with the PLL.
> 
> For some PLLs there is already the ktime API based timeout detection,
> but it will not work in all conditions when .set_rate gets called.
> In particular, before the clocksource is initialized or when the
> timekeeping is suspended.
> 
> This patch adds a common helper with the PLL status bit polling and
> timeout detection. For conditions where the timekeeping API should not
> be used a simple readl_relaxed/cpu_relax() busy loop is added with the
> iterations limit derived from measurements of readl_relaxed() execution
> time for various PLL types and Exynos SoCs variants.
> 
> Actual PLL lock time depends on the P divider value, the VCO frequency
> and a constant PLL type specific LOCK_FACTOR and can be calculated as
> 
>  lock_time = Pdiv * LOCK_FACTOR / VCO_freq
> 
> For the ktime API use cases a common timeout value of 20 ms is applied
> for all the PLLs with an assumption that maximum possible value of Pdiv
> is 64, maximum possible LOCK_FACTOR value is 3000 and minimum VCO
> frequency is 24 MHz.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> I'm not sure whether we actually need to implement precise timeouts,
> likely the simple busy loop case would be enough. AFAIK the PLL
> failures happen very rarely, mostly in early code development stage
> for given platform.
> 
> Changes since v3:
>  - dropped udelay() from the PLL status bit polling loop as it didn't
>    work on arm64 at early boot time, before timekeeping was initialized,
>  - use the timekeeping API in cases when it is already initialized and
>    not suspended,
>  - use samsung_pll_lock_wait() also in samsung_pll3xxx_enable() function,
>    now all potential endless loops are removed.
> ---
>  drivers/clk/samsung/clk-pll.c | 147 ++++++++++++++++++++----------------------
>  1 file changed, 71 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index ac70ad7..cefb57e 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -8,14 +8,17 @@
>  
>  #include <linux/errno.h>
>  #include <linux/hrtimer.h>
> +#include <linux/iopoll.h>
>  #include <linux/delay.h>
>  #include <linux/slab.h>
> +#include <linux/timekeeping.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include "clk.h"
>  #include "clk-pll.h"
>  
> -#define PLL_TIMEOUT_MS		10
> +#define PLL_TIMEOUT_US		20000U
> +#define PLL_TIMEOUT_LOOPS	1000000U
>  
>  struct samsung_clk_pll {
>  	struct clk_hw		hw;
> @@ -63,6 +66,53 @@ static long samsung_pll_round_rate(struct clk_hw *hw,
>  	return rate_table[i - 1].rate;
>  }
>  
> +static bool __early_timeout = true;

Drop the __ prefix and maybe use "pll_early_timeout".
This looks like __ro_after_init.

Best regards,
Krzysztof
