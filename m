Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB390C63777
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Nov 2020 10:10:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 592CF21D7E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Nov 2020 10:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEP2uQXP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgKWKKt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Nov 2020 05:10:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:35570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726306AbgKWKKt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Nov 2020 05:10:49 -0500
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D202A21741;
        Mon, 23 Nov 2020 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606126248;
        bh=uHWu3kIpV8Mbwk2+Qh1eukWUnX0uCe01/tG5Im6mE1M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=YEP2uQXPQhG9AVbcfvsR1J34jaPU+5ql7yAc31no4mPoiRDVHuv6oRBWLLArhOo6J
         l2oz6zMVgC4BzJi+sanNeyHtMW5RQOCvVZ2PSGUpRPrgkcyAJa7Ww7QHYM1k8Ow+7w
         WDmQZLLFszmzpXaGrCthsiRC6xX1DbUOfx6gBVz8=
Subject: Re: [PATCH] clk: samsung: allow compile testing of Exynos, S3C64xx
 and S5Pv210
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201119164509.754851-1-krzk@kernel.org>
 <f44c5f4f-bda4-a1c1-dc6a-dc31efa314c6@kernel.org>
 <20201122113425.GA6633@kozik-lap>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <e1d25f8d-5d33-3dc9-1af4-4afca7a8a967@kernel.org>
Date:   Mon, 23 Nov 2020 11:10:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201122113425.GA6633@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/22/20 12:34, Krzysztof Kozlowski wrote:
> On Fri, Nov 20, 2020 at 05:36:35PM +0100, Sylwester Nawrocki wrote:
>> On 11/19/20 17:45, Krzysztof Kozlowski wrote:
>>> So far all Exynos, S3C64xx and S5Pv210 clock units were selected by
>>> respective SOC/ARCH Kconfig option.  On a kernel built for selected
>>> SoCs, this allowed to build only limited set of matching clock drivers.
>>> However compile testing was not possible in such case as Makefile object
>>> depent on SOC/ARCH option.
>>
>> "objects depend" or "object depends" ?
> 
> "object depends"
> 
>>> Add separate Kconfig options for each of them to be able to compile
>>> test.
>>>
>>> Signed-off-by: Krzysztof Kozlowski<krzk@kernel.org>
>>
>> The patch look good to me, thanks.
>> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>
>> I guess it's best now to merge it through your tree as it depends on
>> patches already sent to arm-soc? Next time it might be better to use
>> immutable branches right away to keep the clk changes in the clk
>> maintainer's tree.
> 
> At that time I had only one clk patch so I did not put it on separate
> branch.
> 
> Anyway, this does not depend on the clkout patches and only minor patch
> adjustement is needed. Cherry-pick can solve it (you would need to apply
> on next/master and then cherry pick) or I can resend you one rebased on
> linus/master.
> 
> There should be no conflicts when merging later into next or linus.
> 
> I propose you should take it via clk tree.

Indeed, the conflict is minimal, I should have checked with git cherry-pick
once I found a branch where the patch applied cleanly. I have corrected
the typo an applied, thank you!

--
Regards,
Sylwester
