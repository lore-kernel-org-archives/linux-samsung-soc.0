Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BBDC4167B
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 15:28:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2B1C22B51
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 15:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730418AbgLDP2o (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Dec 2020 10:28:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:36608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728701AbgLDP2o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 10:28:44 -0500
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
Subject: [PATCH] [v2] clk: samsung: mark PM functions as __maybe_unused
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <3548618a-eb36-bf3a-d589-e06fd5f2111b@kernel.org>
Date:   Fri, 4 Dec 2020 16:27:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The use of SIMPLE_DEV_PM_OPS() means that the suspend/resume
functions are now unused when CONFIG_PM is disabled:

drivers/clk/samsung/clk-exynos-clkout.c:219:12: error: 
'exynos_clkout_resume' defined but not used [-Werror=unused-function]
   219 | static int exynos_clkout_resume(struct device *dev)
       |            ^~~~~~~~~~~~~~~~~~~~
drivers/clk/samsung/clk-exynos-clkout.c:210:12: error: 
'exynos_clkout_suspend' defined but not used [-Werror=unused-function]
   210 | static int exynos_clkout_suspend(struct device *dev)
       |            ^~~~~~~~~~~~~~~~~~~~~

Mark them as __maybe_unused to shut up the otherwise harmless warning.

Fixes: 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to module 
driver")
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: add proper changelog text

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
