Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2810DC433E6
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Feb 2021 14:46:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D67EC64E7C
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Feb 2021 14:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbhBIOqy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Feb 2021 09:46:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:39958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230043AbhBIOqw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Feb 2021 09:46:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CDBB64EA6;
        Tue,  9 Feb 2021 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612881971;
        bh=4Khf3jf8NRBguYJQd4Zc23JbAoBPvE26k4AHm6gfAG0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=tfqnO+myZB8yGpVwF6eslagnVOOyx/sOF3oklhELMwZoV8pnflECBlZt9e/ID4fA4
         urskZC+3joYri7bFpHyuxB0VbRwZfZqzs4f/ULh4OG3mRjBLcEYiOZiHOSLtBd2LL3
         mLVXDYX3VNOJ1xb84yB1ut86GbAuMw+ccMry+QIA3Kls7OZLsvL8sw9DXg2X/RHPBl
         Wa6N7rdaSdGyu9N8W5oDpYRKtRqeJNsu4xxmCbwsoUlsB4L85pPQHamn1HNGihFXgl
         SffSOrXQJa8isDzPFn/L6hHczow1gzNN0+GlkiCkQiBqw8AAaOD/0U2cOm31EkNjX3
         p0HhEpgxCgv2g==
Subject: Re: [PATCH v3] clk: exynos7: Keep aclk_fsys1_200 enabled
To:     Stephen Boyd <sboyd@kernel.org>, pawel.mikolaj.chmiel@gmail.com,
        mturquette@baylibre.com
Cc:     kgene@kernel.org, krzk@kernel.org,
        linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com,
        linux-kernel@vger.kernel.org, cw00.choi@samsung.com,
        s.nawrocki@samsung.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210131170428.3290-1-pawel.mikolaj.chmiel@gmail.com>
 <161285690197.418021.15554726449883492168@swboyd.mtv.corp.google.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <fa918113-c20b-1867-7c32-b30fd09e185e@kernel.org>
Date:   Tue, 9 Feb 2021 15:46:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <161285690197.418021.15554726449883492168@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09.02.2021 08:48, Stephen Boyd wrote:
> Quoting (2021-01-31 09:04:28)
>> This clock must be always enabled to allow access to any registers in
>> fsys1 CMU. Until proper solution based on runtime PM is applied
>> (similar to what was done for Exynos5433), fix this by calling
>> clk_prepare_enable() directly from clock provider driver.
>>
>> It was observed on Samsung Galaxy S6 device (based on Exynos7420), where
>> UFS module is probed before pmic used to power that device.
>> In this case defer probe was happening and that clock was disabled by
>> UFS driver, causing whole boot to hang on next CMU access.
>>
> 
> Does this need a Fixes tag?
 
That would be

Fixes: 753195a749a6 ("clk: samsung: exynos7: Correct CMU_FSYS1 clocks names")

i.e. commit that introduced definition of the clock. But the fix cannot be 
backported that far as build fails with an error:

drivers/clk/samsung/clk-exynos7.c: In function ‘exynos7_clk_top1_init’:
drivers/clk/samsung/clk-exynos7.c:554:21: error: ‘struct clk_onecell_data’ has no member named ‘hws’
  554 |  hws = ctx->clk_data.hws;

It could only by backported up to:
ecb1f1f7311f ("clk: samsung: Convert common drivers to the new clk_hw API")

We need a different patch to fix it properly in stable kernels.
And dts for board this bugfix patch was prepared is not upstream yet.
    

