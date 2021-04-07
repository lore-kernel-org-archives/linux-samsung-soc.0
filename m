Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF11C43461
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Apr 2021 10:04:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CA5261382
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Apr 2021 10:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240191AbhDGKEc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Apr 2021 06:04:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:39484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350508AbhDGKDx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 06:03:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 062EF6139C;
        Wed,  7 Apr 2021 10:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617789824;
        bh=U2Q8yQRaIx4QiUDT92JbWKR5p2N8Pmme+7zcvnbeJJ0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=D2H4UEtHja2iIv2loa+fuuitQ959MN2FGakHGD8VX07eZKsavECG1occPJR8NZ+iw
         syCag3ZhloduOHJ+yp6Le+QJENnSEuMZqR5GbzOES4ZpFa42BJgZbhbEnRrAuqnWar
         EVGT8td4AqmWmQqfnuY4wOdlnLFki+xiAvxvxKlS1mesefU/1v0wUgcdRY0bh4SIsZ
         n7Yv0VJpeH4MZw32BL2wIBGrHRG/Kw4LPc6QlePUA2WjVRCIqHb1+bpS6iVGM2H6sB
         moflSRRRevnPCGjCAOAwOqW112u/0PAHVJOdUV8SSOd/jHlT3TOoAnV++GhUKmduTT
         Nec2+miWZIEUg==
Subject: Re: [PATCH] clk: exynos7: Mark aclk_fsys1_200 as critical
To:     =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     s.nawrocki@samsung.com, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kgene@kernel.org, krzk@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
References: <20201024154346.9589-1-pawel.mikolaj.chmiel@gmail.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <53be0d9d-a64a-9108-85f0-40ac360757c4@kernel.org>
Date:   Wed, 7 Apr 2021 12:03:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20201024154346.9589-1-pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 24.10.2020 17:43, Paweł Chmiel wrote:
> This clock must be always enabled to allow access to any registers in
> fsys1 CMU. Until proper solution based on runtime PM is applied
> (similar to what was done for Exynos5433), mark that clock as critical
> so it won't be disabled.
> 
> It was observed on Samsung Galaxy S6 device (based on Exynos7420), where
> UFS module is probed before pmic used to power that device.
> In this case defer probe was happening and that clock was disabled by
> UFS driver, causing whole boot to hang on next CMU access.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>   drivers/clk/samsung/clk-exynos7.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
> index c1ff715e960c..1048d83f097b 100644
> --- a/drivers/clk/samsung/clk-exynos7.c
> +++ b/drivers/clk/samsung/clk-exynos7.c
> @@ -538,7 +538,8 @@ static const struct samsung_gate_clock top1_gate_clks[] __initconst = {
>   		ENABLE_ACLK_TOP13, 28, CLK_SET_RATE_PARENT |
>   		CLK_IS_CRITICAL, 0),

As this patch can be backported up to the commit that introduced regression
I have applied it instead of your v3, with a comment as below.

+       /*
+        * This clock is required for the CMU_FSYS1 registers access, keep it
+        * enabled permanently until proper runtime PM support is added.
+        */

>   	GATE(CLK_ACLK_FSYS1_200, "aclk_fsys1_200", "dout_aclk_fsys1_200",
> -		ENABLE_ACLK_TOP13, 24, CLK_SET_RATE_PARENT, 0),
> +		ENABLE_ACLK_TOP13, 24, CLK_SET_RATE_PARENT |
> +		CLK_IS_CRITICAL, 0),
>   
>   	GATE(CLK_SCLK_PHY_FSYS1_26M, "sclk_phy_fsys1_26m",
>   		"dout_sclk_phy_fsys1_26m", ENABLE_SCLK_TOP1_FSYS11,
  
--
Regards,
Sylwester
