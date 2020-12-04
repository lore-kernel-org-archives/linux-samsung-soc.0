Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CF4C4361A
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 15:37:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15E2922C7E
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 15:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbgLDPhL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Dec 2020 10:37:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:39670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727570AbgLDPhL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 10:37:11 -0500
Subject: Re: [PATCH] [v2] clk: samsung: mark PM functions as __maybe_unused
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607096191;
        bh=/Cxi3igk0xF11OqK3oul234Dno+5ZCOdHZS2viwOIOE=;
        h=To:Cc:References:From:Date:In-Reply-To:From;
        b=I/VLYv/cgfPtmc/fZ6kYpUzmLWpev16erMeKmMPG70YgvA+Rqmus77UbFRD8LU1k2
         rxSsrNvDj/66Rj5rtEkVO+ucQmMsFNbwnYIsqDXVG1u4qJQUiEra15joe+Q6WCub+a
         HiEUuRn2QmuB7wc8MWXd6wsvLH30c1ZWxZSfh0Jjv4D3CtFmCkbkxB4JFpYs8mXQ5B
         lP7Vsw7OQlNkF4KzD4girI0KA8aWWxZeRBsTLJDp1fTpjY4q5RWOXepBrnf1DOwPMS
         pWkPi0szjUjk7852BYW5XOdEUVVJ5XKtvgG52bE8RO3t/dz0T452XB5Sqp6UOvU53o
         Q86+5ZEFstwgg==
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201204091616.4128366-1-arnd@kernel.org>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <72f6b613-b4c1-a570-d4cc-74540467280f@kernel.org>
Date:   Fri, 4 Dec 2020 16:36:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204091616.4128366-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/4/20 10:16, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The use of SIMPLE_DEV_PM_OPS() means that the suspend/resume
> functions are now unused when CONFIG_PM is disabled:
> 
> drivers/clk/samsung/clk-exynos-clkout.c:219:12: error: 'exynos_clkout_resume' defined but not used [-Werror=unused-function]
>    219 | static int exynos_clkout_resume(struct device *dev)
>        |            ^~~~~~~~~~~~~~~~~~~~
> drivers/clk/samsung/clk-exynos-clkout.c:210:12: error: 'exynos_clkout_suspend' defined but not used [-Werror=unused-function]
>    210 | static int exynos_clkout_suspend(struct device *dev)
>        |            ^~~~~~~~~~~~~~~~~~~~~
> 
> Mark them as __maybe_unused to shut up the otherwise harmless warning.
> 
> Fixes: 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to module driver")
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: add proper changelog text

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
