Return-Path: <SRS0=H6Ng=EP=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07781C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 12:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6522207BC
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604925796;
	bh=mdCQiXxd9t13NKXB/BYRJOOlnXCt3idWsu2zuWDVwmU=;
	h=Subject:From:To:Cc:References:Date:In-Reply-To:List-ID:From;
	b=RlEwW2/z8VLfujD6SNQm/zLPco2G4WT4qQCN7ZiTaKitGS5TFk0kgbQMLcPIDAlT0
	 lTjmwkyTRIZv0XLW5ZsKO/ATYtJyJw9XwpA6u7yMPYtuiOAJSnu02FD2e4kdY1Mli4
	 b0uZ0Bt0qqTSoIfAK6rDRFCpYsuM02v/KiQHvtQY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729445AbgKIMnN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Nov 2020 07:43:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:48036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726956AbgKIMnN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 07:43:13 -0500
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1D3920659;
        Mon,  9 Nov 2020 12:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604925793;
        bh=mdCQiXxd9t13NKXB/BYRJOOlnXCt3idWsu2zuWDVwmU=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=qR2i3eUADy9Vg/23HK4wX1PX6H8vRpsPo48OCWCIaW+t+PCFHaB4jzbRkpuUcUSzD
         y3wW26/lJl5c2XVFxXKUmHYrp/YKTzdKTgGutDRrGGeFzZ34LjBL77ozcxNHa2Ab6v
         iUnSyykQLr5Pql4btXDRdIbPYaLGEjUOd7ZIrGOo=
Subject: Re: [PATCH v2] clk: exynos7: Keep aclk_fsys1_200 enabled
From:   Sylwester Nawrocki <snawrocki@kernel.org>
To:     =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     kgene@kernel.org, krzk@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20201107121456.25562-1-pawel.mikolaj.chmiel@gmail.com>
 <a2fdef20-9c0d-ee59-bc2f-411391f4f58b@kernel.org>
Message-ID: <42957109-931e-31ca-7273-55fd42fc0fd1@kernel.org>
Date:   Mon, 9 Nov 2020 13:43:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a2fdef20-9c0d-ee59-bc2f-411391f4f58b@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/9/20 13:32, Sylwester Nawrocki wrote:
> -------------8<----------------
> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
> index 87ee1ba..9ecf498 100644
> --- a/drivers/clk/samsung/clk-exynos7.c
> +++ b/drivers/clk/samsung/clk-exynos7.c
> @@ -570,7 +570,15 @@ static const struct samsung_cmu_info top1_cmu_info __initconst = {
>   
>   static void __init exynos7_clk_top1_init(struct device_node *np)
>   {
> -       samsung_cmu_register_one(np, &top1_cmu_info);
> +       struct samsung_clk_provider *ctx;
> +       struct clk_hw **hws;
> +
> +       ctx = samsung_cmu_register_one(np, &top1_cmu_info);
> +       if (!ctx)
> +               return;
> +       hws = ctx->clk_data.hws;
> +
> +       clk_prepare_enable(hws[CLK_ACLK_FSYS1_200]);

Of course it was supposed to be:

  clk_prepare_enable(hws[CLK_ACLK_FSYS1_200]->clk);

>   }
>   
>   CLK_OF_DECLARE(exynos7_clk_top1, "samsung,exynos7-clock-top1",
> -------------8<----------------
