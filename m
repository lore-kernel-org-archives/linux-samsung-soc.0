Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD088C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 06:54:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADC1B61053
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 06:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhJHG4G (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 02:56:06 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37386
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229830AbhJHG4D (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 02:56:03 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 65C423FFF3
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 06:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633676048;
        bh=GzAsfw+44Z5vzhTZ3GQSMcWRLagf3VBGwBS3+Mbp+44=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=C3gM/GnLFi07klZyllII5/doGa5QnsWQUgK+8xRO4dysD4rk6+RGGJJHY3/ZbIe1c
         5reJ0/qJ+KdLYVePEQ0Lwtv4xprg7ramY//q04PeGNBK4RdSehlDeOhWB8eMIUrUN4
         gS5xqtNyplBeifDqOQOVLECkXlJTfofRU4J4Me0K/Q+fapPhpWzAHzdGCUz3SdlIxf
         D0++mGHukEnvZECzASJ7RdHaNaQeXU6z7QPes/EBU4SWS9ZwR63akgt0Ts0OweENBD
         EO7Y+EqOqaYTa7r1/EJVyYDFkEYdVaXSgwxShN/+MLMzwwkbxYC89bPamLkQhkKLzg
         JTYq/2pJpy+oQ==
Received: by mail-wr1-f69.google.com with SMTP id a10-20020a5d508a000000b00160723ce588so6508611wrt.23
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Oct 2021 23:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GzAsfw+44Z5vzhTZ3GQSMcWRLagf3VBGwBS3+Mbp+44=;
        b=p7nBC1w8EEL6FbX9N+TMsFjjx88AlrQGVTrBO3ewgTWckeSGhFE/Tp2n+JqfwICNqL
         wzRBk66eBdIA6bLG8upY//YrjrVdv6CSLBsoz6F4m95xXiCcGBtJyM8//Eiv/lG3H9+t
         VX2HO2RQ5uB5dGJO3pn0ovEuXzeKQU5uDU5YWzkV0UkgANr1+c+l840xlaQ7rhn8POko
         /+aX2vwMFK2eeLHwQc0N8dNr9XChI2wlEcsn9TycsswVP/8at5ZbpeDfJOPUJzJK0mqn
         E7ti5g6ai18NMOlv/oeuT6CtjcPG2SsxD1ZZIO2XHOu14EOTgIZs3ZdaA+mujPp85ucl
         ga5g==
X-Gm-Message-State: AOAM5329V8CIfVtPpZZN47BMEaXf9UqqrTF/vGJIFT0SaLJCc4F7Lvzd
        NwcaS/abquFRXUuGgZubgjHL8RfeDo8yiruC2J2GlqZjQKEQjYngwe0ub5sT/cXXB7vuu+rsseD
        pcBqn1esdk3IIe9E1xjQsAL77msrmb9i4B/s4LFS4sUbAwHtz
X-Received: by 2002:a05:600c:2dc1:: with SMTP id e1mr1477059wmh.135.1633676047832;
        Thu, 07 Oct 2021 23:54:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqeeNc6w4Ue4OtgS7IDAUtZN0lHS8tIs9VLPRGW4CO4SeHQocJELma3rw9dEEcK1afpOxqJQ==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id e1mr1477033wmh.135.1633676047668;
        Thu, 07 Oct 2021 23:54:07 -0700 (PDT)
Received: from [192.168.1.24] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id z6sm2166012wmp.1.2021.10.07.23.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 23:54:07 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] clk: samsung: Introduce Exynos850 clock driver
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
References: <20211007194113.10507-1-semen.protsenko@linaro.org>
 <20211007194113.10507-6-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7e255da8-cb4c-6960-a68e-3d9c0399f51c@canonical.com>
Date:   Fri, 8 Oct 2021 08:54:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007194113.10507-6-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/10/2021 21:41, Sam Protsenko wrote:
> This is the initial implementation adding only basic clocks like UART,
> MMC, I2C and corresponding parent clocks. Design is influenced by
> Exynos5433 clock driver.
> 
> Bus clock is enabled by default (in probe function) for all CMUs except
> CMU_TOP, the reasoning is as follows. By default if bus clock has no
> users its "enable count" value is 0. It might be actually running if
> it's already enabled in bootloader, but then in some cases it can be
> disabled by mistake. For example, such case was observed when
> dw_mci_probe() enabled the bus clock, then failed to do something and
> disabled that bus clock on error path. After that, even the attempt to
> read the 'clk_summary' file in DebugFS freezed forever, as CMU bus clock
> ended up being disabled and it wasn't possible to access CMU registers
> anymore.
> 
> To avoid such cases, CMU driver must increment the ref count for that
> bus clock by running clk_prepare_enable(). There is already existing
> '.clk_name' field in struct samsung_cmu_info, exactly for that reason.
> It was added in commit 523d3de41f02 ("clk: samsung: exynos5433: Add
> support for runtime PM"), with next mentioning in commit message:
> 
>   > Also for each CMU there is one special parent clock, which has to be
>   > enabled all the time when any access to CMU registers is being done.
> 
> But that clock is actually only enabled in Exynos5433 clock driver right
> now. So the same code is added to exynos850_cmu_probe() function,
> As was described above, it might be helpful not only for PM reasons, but
> also to prevent possible erroneous clock gating on error paths.
> 
> Another way to workaround that issue would be to use CLOCK_IS_CRITICAL
> flag for corresponding gate clocks. But that might be not very good
> design decision, as we might still want to disable that bus clock, e.g.
> on PM suspend.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Used of_iomap() for the whole CMU range instead of ioremap() in
>     exynos850_init_clocks()
>   - Used readl/writel functions in exynos850_init_clocks() for consistency
>     with other drivers
>   - Added all clock ids
>   - Added CMU_DPU
>   - Implemented platform_driver for all Power Domain capable CMUs
>   - Moved bus clock enablement code here to probe function
>   - Used clk_get() instead of __clk_lookup()
> 
>  drivers/clk/samsung/Makefile        |   1 +
>  drivers/clk/samsung/clk-exynos850.c | 835 ++++++++++++++++++++++++++++
>  2 files changed, 836 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos850.c
> 

Thanks for the changes, awesome work, I appreciate it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
