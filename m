Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D51C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 20:25:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8C1560EBC
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 20:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhJIU1m (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Oct 2021 16:27:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:51722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229806AbhJIU1m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Oct 2021 16:27:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C026360F6E;
        Sat,  9 Oct 2021 20:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633811145;
        bh=zS0yeVUP8m9txAW8KAxfN8wt1EwpnQ+NwpNQXlp2tkI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nqJObs9nvNFFzXXJQ1YcFC+vRzCd89gMvf6M88zvkpxHUBgBee/YRW1gDGzdkSG4C
         YJ5LOYjhMX/7NYD8gRb0/QUlihIjPXfdu8p4cEZCLqT8Q45wCcaOJNNke3ioAQpe32
         hblkZmR0lXD9bM0rKyf5W0nH2tTvoenouz8Hyz/AXW1XxNNYNHFwZNO9F2Soy+iNWq
         C8QbaR3oSBRfAs9k5rMyLrMfr4NBUAIG4/21dPh0lKRD+L8YZkStCHgXARGay1XJrn
         8C1Q8M0IdselMHcz+bnihpGswhY+EIFSS2Fi6/z9RV/ZY4RhtTDrqZI6G5LckRQdGs
         QDz0eBO0IMkog==
Subject: Re: [PATCH v3 2/5] clk: samsung: clk-pll: Implement pll0831x PLL type
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
 <20211008154352.19519-3-semen.protsenko@linaro.org>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <bf48d35c-1b45-a111-5509-d81f92dd15e9@kernel.org>
Date:   Sat, 9 Oct 2021 22:25:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008154352.19519-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08.10.2021 17:43, Sam Protsenko wrote:
> pll0831x PLL is used in Exynos850 SoC for top-level fractional PLLs. The
> code was derived from very similar pll36xx type, with next differences:
> 
> 1. Lock time for pll0831x is 500*P_DIV, when for pll36xx it's 3000*P_DIV
> 2. It's not suggested in Exynos850 TRM that S_DIV change doesn't require
>     performing PLL lock procedure (which is done in pll36xx
>     implementation)
> 3. The offset from PMS-values register to K-value register is 0x8 for
>     pll0831x, when for pll36xx it's 0x4
> 
> When defining pll0831x type, CON3 register offset should be provided as
> a "con" parameter of PLL() macro, like this:
> 
>      PLL(pll_0831x, 0, "fout_mmc_pll", "oscclk",
>          PLL_LOCKTIME_PLL_MMC, PLL_CON3_PLL_MMC, pll0831x_26mhz_tbl),
> 
> To define PLL rates table, one can use PLL_36XX_RATE() macro, e.g.:
> 
>      PLL_36XX_RATE(26 * MHZ, 799999877, 31, 1, 0, -15124)
> 
> as it's completely appropriate for pl0831x type and there is no sense in
> duplicating that.
> 
> If bit #1 (MANUAL_PLL_CTRL) is not set in CON1 register, it won't be
> possible to set new rate, with next error showing in kernel log:
> 
>      Could not lock PLL fout_mmc_pll
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
