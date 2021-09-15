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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A0EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 08:26:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F163E61209
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 08:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236807AbhIOI1d (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 04:27:33 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52818
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236764AbhIOI1b (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 04:27:31 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7DE2E4026B
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 08:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631694372;
        bh=ptvhp8j3x8Ftji47LhZR4Wys0W2gMYnRB4nsbyxXHrA=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=tt97McV3CNwd9gQWbhWPHhhW4EdYssy+2vWQzdYhBa25SsvCiWWV0ufSH8nz0VrE3
         pLBh931Z/lgaADT5UDb4YVCZelpO2Ka01cTaoaB5qudICLJ/pvUKYpesV5hCG3XLjN
         Vu0NSw3ZYhubINFOj9RzCPUEdcSOVnckmFiysZx5pSZNKrKiOR0kU6c6hg3+PAGuyj
         Vgjj6qyqaiN3qmA4iCwpfsuyK1do3FlR9yVmcUJyjzRkQjlC5Mfe4Tijpmo6Cf1Ktr
         8CKkjxLouao/5ll90TU2VnLHraVYXOKfW+wACcTw5L/aPo73JNx6/Stb0agV+a72uj
         1FW4euRxaL2gA==
Received: by mail-ed1-f69.google.com with SMTP id o18-20020a056402439200b003d2b11eb0a9so1133131edc.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 01:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ptvhp8j3x8Ftji47LhZR4Wys0W2gMYnRB4nsbyxXHrA=;
        b=guAscts6mSeMPIm2iLJFv4+podBBBnpgtkxPVRbnQvE/84yxLA+6k127PMGcME9mRk
         fjRwSMb84litNNjm8MSjrkPAXZKXDpguAwZ/dp2a7iqiPYu7uwtn8kaPkNlUYiInWiWV
         e/grMkNjaiFvmkVUdhy+ruGTBS9rJ94lepYp65DM3ZQ9OgqRsQJ5fxq7cueK8buWknYL
         mNnlDozLzB4z57sw+GRDnWZcdqXoOrxaZ+3dsPH8tnHPUA+ZUBa9A1wLFwRz6n4F8gAr
         hMO4ANU3mOKbh36ZMwei2nN9cZUISoo2Siv1BGcXIqJDLgoooZixfpevMyg9/HD679YA
         qWpg==
X-Gm-Message-State: AOAM533qiV3VywaxhKEb1gWWmMf52tWRRkjIC8ZlbhiclO7GIGRlryoS
        vZXaz5rsVWNZXCJkBhdpEyY6nmNGPKkp1KJIaKZ5DKuHdYeIFxV9sOnYtOK21J5RwC8k2xgN8te
        J8l1jjuPAurXLVFaGJ/bjsarQP3TVtzpEeYONJytHwOEydsxJ
X-Received: by 2002:a17:906:72d0:: with SMTP id m16mr23559524ejl.282.1631694370557;
        Wed, 15 Sep 2021 01:26:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy40iZHAYHG7of77gqMHSsEjCU0O3RP/sEGAl+pwIJiNsr9dTKA2Dzu3UElI7w7k0XRmYtnuw==
X-Received: by 2002:a17:906:72d0:: with SMTP id m16mr23559504ejl.282.1631694370363;
        Wed, 15 Sep 2021 01:26:10 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id a12sm2689234eje.27.2021.09.15.01.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 01:26:09 -0700 (PDT)
Subject: Re: [PATCH 3/6] clk: samsung: clk-pll: Implement pll0831x PLL type
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
 <20210914155607.14122-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4a6e73bb-617d-d849-d64a-7f0de46ea03b@canonical.com>
Date:   Wed, 15 Sep 2021 10:26:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/09/2021 17:56, Sam Protsenko wrote:
> pll0831x PLL is used in Exynos850 SoC for top-level fractional PLLs. The
> code was derived from very similar pll36xx type, with next differences:
> 
> 1. Lock time for pll0831x is 500*P_DIV, when for pll36xx it's 3000*P_DIV
> 2. It's not suggested in Exynos850 TRM that S_DIV change doesn't require
>    performing PLL lock procedure (which is done in pll36xx
>    implementation)
> 3. The offset from PMS-values register to K-value register is 0x8 for
>    pll0831x, when for pll36xx it's 0x4
> 
> When defining pll0831x type, CON3 register offset should be provided as
> a "con" parameter of PLL() macro, like this:
> 
>     PLL(pll_0831x, 0, "fout_mmc_pll", "oscclk",
>         PLL_LOCKTIME_PLL_MMC, PLL_CON3_PLL_MMC, pll0831x_26mhz_tbl),
> 
> To define PLL rates table, one can use PLL_36XX_RATE() macro, e.g.:
> 
>     PLL_36XX_RATE(26 * MHZ, 799999877, 31, 1, 0, -15124)
> 
> as it's completely appropriate for pl0831x type and there is no sense in
> duplicating that.
> 
> If bit #1 (MANUAL_PLL_CTRL) is not set in CON1 register, it won't be
> possible to set new rate, with next error showing in kernel log:
> 
>     Could not lock PLL fout_mmc_pll
> 
> That can happen for example if bootloader clears that bit beforehand.
> PLL driver doesn't account for that, so if MANUAL_PLL_CTRL bit was
> cleared, it's assumed it was done for a reason and it shouldn't be
> possible to change that PLL's rate at all.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/clk-pll.c | 105 ++++++++++++++++++++++++++++++++++
>  drivers/clk/samsung/clk-pll.h |   1 +
>  2 files changed, 106 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
