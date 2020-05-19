Return-Path: <SRS0=rJke=7B=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D303C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 May 2020 13:29:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73D3520829
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 May 2020 13:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589894998;
	bh=M3ARIf/NFyp7eqcSEzhpB4KX+ZS1knnVFu5lcM8/xMA=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=N8PfF8etbH91+mTfPNRdVFtRFVYJHlMFi7YS0hdJggbgY1ckzwaHQhfOysRJMSk36
	 KHGa+PrbZd64bx0Jbsfg5B9P8wrZma6M+DAAqG7IwK6Yae0JcuffInfVb/hgWHbC0h
	 Tp1ndpOC+yZsYxOYBpOp8htBWisb/6iCxm5uQ9r0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728929AbgESN36 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 May 2020 09:29:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:33702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727057AbgESN35 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 May 2020 09:29:57 -0400
Received: from [192.168.0.26] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F35C520825;
        Tue, 19 May 2020 13:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589894996;
        bh=M3ARIf/NFyp7eqcSEzhpB4KX+ZS1knnVFu5lcM8/xMA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GdjyogbRRTCXGuWvZ6F8xoGw6Jo4wcI6OZrBou9UkWxE8GRH+OCAjWLOTMdXLbd3Z
         nuK3ascFoDA/4C5vsWtOPcPevwRt29tlXjwHyrHuZTQJAKhCujIfqhA1B1p+YtG1Gp
         ayDC+kjLm8PD+fC/ds/bwMzSUXoitl8ussGsOX8I=
Subject: Re: [PATCH] clk: samsung: exynos5433: Add IGNORE_UNUSED flag to
 sclk_i2s1
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <CGME20200519102704eucas1p1e1169d593154c4e3c4dc0d35282d5b39@eucas1p1.samsung.com>
 <20200519102652.10219-1-m.szyprowski@samsung.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <f67db8c1-453b-4c70-67b9-59762ac34f64@kernel.org>
Date:   Tue, 19 May 2020 15:29:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519102652.10219-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 5/19/20 12:26, Marek Szyprowski wrote:
> Mark the SCLK clock for Exynos5433 I2S1 device with IGNORE_UNUSED flag to
> match its behaviour with SCLK clock for AUD_I2S (I2S0) device until
> a proper fix for Exynos I2S driver is ready.
> 
> This fixes the following synchronous abort issue revealed by the probe
> order change caused by the commit 93d2e4322aa ("of: platform: Batch fwnode
> parsing when adding all top level devices"):

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>


I will take a look an will see if we can get rid of these CLK_IGNORE_UNUSED
flags by modifying the I2S controller driver. Applying the patch for now.


> ---
>   drivers/clk/samsung/clk-exynos5433.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index ed159beab34e..a111fc29352c 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -1706,7 +1706,8 @@ static const struct samsung_gate_clock peric_gate_clks[] __initconst = {
>   	GATE(CLK_SCLK_PCM1, "sclk_pcm1", "sclk_pcm1_peric",
>   			ENABLE_SCLK_PERIC, 7, CLK_SET_RATE_PARENT, 0),
>   	GATE(CLK_SCLK_I2S1, "sclk_i2s1", "sclk_i2s1_peric",
> -			ENABLE_SCLK_PERIC, 6, CLK_SET_RATE_PARENT, 0),
> +			ENABLE_SCLK_PERIC, 6,
> +			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
>   	GATE(CLK_SCLK_SPI2, "sclk_spi2", "sclk_spi2_peric", ENABLE_SCLK_PERIC,
>   			5, CLK_SET_RATE_PARENT, 0),
>   	GATE(CLK_SCLK_SPI1, "sclk_spi1", "sclk_spi1_peric", ENABLE_SCLK_PERIC,

--
Regards,
Sylwester
