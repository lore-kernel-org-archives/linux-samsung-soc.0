Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425A2C4332D
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Feb 2021 15:20:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E9F364EA0
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Feb 2021 15:20:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhBAPT4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 1 Feb 2021 10:19:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:39904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230192AbhBAPTW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Feb 2021 10:19:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7ADC764E97;
        Mon,  1 Feb 2021 15:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612192720;
        bh=M6Pq1vR46oimtjF7/euCfQOikq+Mmgpo47GOSu/7s0A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dbv1bOGZdMDmoS0j+W9Kb7EwQBky5Bhf7NxF4bXaWR8ntocEFL5D0VF4TaVLKM6SP
         D7vi5UL7r8Da82ln3jbF24Wkdxlbn8IeRbMdNUjKqJiLTH9zqEFjsDr24fyu61XIR+
         Q4F8kOTm0AL5aPJHq/atgSEFftUh98dtdJu9LYK2gtNK+bsaetyP/EIKco4wF5cfuP
         OMgm/xQq0tbYAiXVzZprYn4ZUvvPdQjUwCF3a4Sy5mVxS4HFix6uNHVcFIfOHqoNBM
         Nf+BhYKCZEf2kJkrulEmBdTDuRYu89wXJR2nMhh4E13sYFiDVc3+LcEqGhZHbp4Ioh
         ZRNMO2AwWDeZg==
Subject: Re: [PATCH v3] clk: exynos7: Keep aclk_fsys1_200 enabled
To:     =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org,
        linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com,
        linux-kernel@vger.kernel.org, cw00.choi@samsung.com,
        s.nawrocki@samsung.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210131170428.3290-1-pawel.mikolaj.chmiel@gmail.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <273b996a-8551-8383-5f9d-61ff5bd9663c@kernel.org>
Date:   Mon, 1 Feb 2021 16:18:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210131170428.3290-1-pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/31/21 18:04, Paweł Chmiel wrote:
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
> ---
> Changes from v2:
>    - Avoid __clk_lookup() call when enabling clock
> Changes from v1:
>    - Instead of marking clock as critical, enable it manually in driver.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
