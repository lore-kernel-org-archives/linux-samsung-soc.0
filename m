Return-Path: <SRS0=H6Ng=EP=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82152C4741F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 12:32:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2687220897
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604925136;
	bh=xD1oVhpxy1NLKxoXSzadSdGS+a3oYue/kDkyBweDa6w=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=ul9ueMaJGfhlvbq5mO9oKAqBjetYpoomwgJIiESe4qy8rc+KXdz5LIULw9j1lnAsS
	 JyNwbJCM/mggjAiqk2UYjPSjcCsuGGNnGCE7/0iPbnAH0tRENNaVwtvQG3wwWEkGQa
	 thwciSdLCYQZghnmma60aEZE/AoFoooMukquAw+8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729247AbgKIMcP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Nov 2020 07:32:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:44798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727303AbgKIMcP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 07:32:15 -0500
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1205420659;
        Mon,  9 Nov 2020 12:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604925134;
        bh=xD1oVhpxy1NLKxoXSzadSdGS+a3oYue/kDkyBweDa6w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BEBCpXG/VD80TCYRYk4cS0E1mV+zyWlfdfaZoL//2/5hjvMnE07BkvQIHNxm2K0M/
         M3dhhP4VHmm6Rkotf4pR0hK4UDm893o6GpAqzAoYj6jRGCIRhSptH3Ths8aES034lq
         vo6+CzC13V36DnedVCEoiWlhZuIeEcO+aeU8UxYo=
Subject: Re: [PATCH v2] clk: exynos7: Keep aclk_fsys1_200 enabled
To:     =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     kgene@kernel.org, krzk@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20201107121456.25562-1-pawel.mikolaj.chmiel@gmail.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <a2fdef20-9c0d-ee59-bc2f-411391f4f58b@kernel.org>
Date:   Mon, 9 Nov 2020 13:32:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201107121456.25562-1-pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Paweł,

On 11/7/20 13:14, Paweł Chmiel wrote:
> This clock must be always enabled to allow access to any registers in
> fsys1 CMU. Until proper solution based on runtime PM is applied
> (similar to what was done for Exynos5433), fix this by calling
> clk_prepare_enable() directly from clock provider driver.
> 
> It was observed on Samsung Galaxy S6 device (based on Exynos7420), where
> UFS module is probed before pmic used to power that device.
> In this case defer probe was happening and that clock was disabled by
> UFS driver, causing whole boot to hang on next CMU access.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>

> --- a/drivers/clk/samsung/clk-exynos7.c
> +++ b/drivers/clk/samsung/clk-exynos7.c

> @@ -571,6 +572,10 @@ static const struct samsung_cmu_info top1_cmu_info __initconst = {
>   static void __init exynos7_clk_top1_init(struct device_node *np)
>   {
>   	samsung_cmu_register_one(np, &top1_cmu_info);
> +	/*
> +	 * Keep top FSYS1 aclk enabled permanently. It's required for CMU register access.
> +	 */
> +	clk_prepare_enable(__clk_lookup("aclk_fsys1_200"));

Thanks for the patch. Could you rework it to avoid the __clk_lookup() call?
I.e. could you change it to something along the lines of:

-------------8<----------------
diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 87ee1ba..9ecf498 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -570,7 +570,15 @@ static const struct samsung_cmu_info top1_cmu_info __initconst = {
 
 static void __init exynos7_clk_top1_init(struct device_node *np)
 {
-       samsung_cmu_register_one(np, &top1_cmu_info);
+       struct samsung_clk_provider *ctx;
+       struct clk_hw **hws;
+
+       ctx = samsung_cmu_register_one(np, &top1_cmu_info);
+       if (!ctx)
+               return;
+       hws = ctx->clk_data.hws;
+
+       clk_prepare_enable(hws[CLK_ACLK_FSYS1_200]);
 }
 
 CLK_OF_DECLARE(exynos7_clk_top1, "samsung,exynos7-clock-top1",
-------------8<----------------
?

--
Regards,
Sylwester


