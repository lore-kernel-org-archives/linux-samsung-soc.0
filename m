Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36258C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 20:25:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17D7160F9C
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 20:25:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhJIU1A (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Oct 2021 16:27:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:51404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229806AbhJIU07 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Oct 2021 16:26:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2F8360F6E;
        Sat,  9 Oct 2021 20:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633811102;
        bh=d+01LSE2G4B7F5/XtrWaFaDt4UeXHeAWwv79TeuwqsU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=hELJYZmCo9pdyOh2ZT72pmWE2JVXx07bY6qDt+j9FyK0P7s9qdFFGWSp/ZZc0w5ce
         UOy4pAroFcaYc2YwSTHidsmTB/wLalioef2fyGAFo+4G3fpL80QYEo/p1hIXc6YDom
         3lQN7qAG5NyLgKWBHD/K+m2D99/Ccpwhf1zSk9dTxa3Byokcwv5bF2nNY4KZVVCp/w
         7lJ8bK1mKWO4aVGZ15BHRDqsezk74zn1xLZ6Wh7fuXl2LDZGIo1KdJ9wg2S+oWl3V5
         H1qBCe7UKrPybxfvXAvn7efa8HXedcD/dzhkmTBHQWDf/Ta34LqUCPMXmk1bQ5Ku0H
         AdZ7od8LoJJWg==
Subject: Re: [PATCH v3 1/5] clk: samsung: clk-pll: Implement pll0822x PLL type
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
References: <20211008154352.19519-1-semen.protsenko@linaro.org>
 <20211008154352.19519-2-semen.protsenko@linaro.org>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <76d164d0-dc1a-5941-c66b-959e88e736d5@kernel.org>
Date:   Sat, 9 Oct 2021 22:24:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008154352.19519-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08.10.2021 17:43, Sam Protsenko wrote:
> pll0822x PLL is used in Exynos850 SoC for top-level integer PLLs. The
> code was derived from very similar pll35xx type, with next differences:
> 
> 1. Lock time for pll0822x is 150*P_DIV, when for pll35xx it's 270*P_DIV
> 2. It's not suggested in Exynos850 TRM that S_DIV change doesn't require
>     performing PLL lock procedure (which is done in pll35xx
>     implementation)
> 
> When defining pll0822x type, CON3 register offset should be provided as
> a "con" parameter of PLL() macro, like this:
> 
>      PLL(pll_0822x, 0, "fout_shared0_pll", "oscclk",
>          PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
>          exynos850_shared0_pll_rates),
> 
> To define PLL rates table, one can use PLL_35XX_RATE() macro, e.g.:
> 
>      PLL_35XX_RATE(26 * MHZ, 1600 * MHZ, 800, 13, 0)
> 
> as it's completely appropriate for pl0822x type and there is no sense in
> duplicating that.
> 
> If bit #1 (MANUAL_PLL_CTRL) is not set in CON1 register, it won't be
> possible to set new rate, with next error showing in kernel log:
> 
>      Could not lock PLL fout_shared1_pll
> 
> That can happen for example if bootloader clears that bit beforehand.
> PLL driver doesn't account for that, so if MANUAL_PLL_CTRL bit was
> cleared, it's assumed it was done for a reason and it shouldn't be
> possible to change that PLL's rate at all.
> 
> Signed-off-by: Sam Protsenko<semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>
> Acked-by: Chanwoo Choi<cw00.choi@samsung.com>

Applied, thanks.
