Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5912BC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 14:46:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 443F56125F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 14:46:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240959AbhJOOss (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 10:48:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:44582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240958AbhJOOsm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 10:48:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54A1161041;
        Fri, 15 Oct 2021 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634309195;
        bh=3rqKnpRjr651Olb4zi7MGlFgmDMm3p4CIUqSi8GmPjA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=l+h2xMPGwGNypcI9oEk5eFOtGOLhoS6M8iCz/TJy6hBzBK3StILT0tc19KiYuLN7r
         yiLOYmL5maNGjTj8A42nQ3wy2SJzP9fdulUtF5rN7RkLcd2M1ls/pkMlIC1b2wlwQM
         bqMZi3eIJCwtypRNj8azr53ykRUNWDxwl0MLqoNG5YQAojONESvHQIDE5k5qIcRPVJ
         m9CpPwfPqdF/u54za4BcNb48vMIgH+ZKnctSFd7VCo9NS/r7yGwyEm0sBDifyI+HfL
         dNPQ7AH0XvDxifD2zz65mIHDegLPSecaPt53q3+CD4106IWqjU3PVWds3qOsFxlcuS
         IcBjbHbvQmIwg==
Subject: Re: [PATCH] clk: samsung: remove __clk_lookup() usage
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <CGME20211015093935eucas1p2782d5f8263fd8843139f3e3e9c6caaa3@eucas1p2.samsung.com>
 <20211015093931.28086-1-m.szyprowski@samsung.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <df1a1db8-be5a-bb2e-f4ec-8128d59bd108@kernel.org>
Date:   Fri, 15 Oct 2021 16:46:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015093931.28086-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15.10.2021 11:39, Marek Szyprowski wrote:
> __clk_lookup() interface is obsolete, so remove it from the Samsung clock
> drivers. This has been achieved by getting rid of custom _get_rate()
> helper and replacing it with clk_hw_get_rate().
> 
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
> ---
> This patch is based on top of the "[RFT PATCH v4 0/2] clk: samsung: add
> common support for CPU clocks" patchset:
> https://lore.kernel.org/linux-samsung-soc/20211014195347.3635601-1-willmcvicker@google.com/
> 
> Tested on the following Exynos SoC based boards: 4210, 4412, 5250 and
> 5422. S3C2410, S3C64XX and S5PV210 are only compile-tested.

Thanks Marek for that refactoring, could you just split DT binding parts into
a separate patch?
