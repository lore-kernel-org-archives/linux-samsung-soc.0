Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60203C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 14:36:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 498006120D
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 14:36:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240522AbhJOOjB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 10:39:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:39344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240409AbhJOOil (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 10:38:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A519611C8;
        Fri, 15 Oct 2021 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634308595;
        bh=qiSxOHjVTjbYQll1RPDxZr+z5ma0kRqY3IsuLP+RIOs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Um4H778CxgGDe/VWH5/tv8c5ISYQ19U5AUSU2pbFLUi5SQTm9CjbZd8cOzZOCiiP6
         QDIDZUB4eBjzMMkegxwsI0cY4YEvWTw2//UqshWbJB/IdL8fEPbtGmjheqfkmJVbjG
         K+ZCUSJdrvk92w+lHVGE8EWs9RXUQ6FJsyfN2txLKnR3oUCou1jDI1lqe2kvgf3Bsl
         UWXU1grw+cXGh016BWVD3JcrFR0+KP+LXY6fLnvjtwAPkXAn8f3omvp+Al1qDYTup5
         HlqtGttgHeMxD2w8BR3sg5nKX0GlvuK/JW43pMBycvZLR2VMx7qgY/KewiMDRImIFn
         AXlfXKk/Z2Fcg==
Subject: Re: [PATCH v3 1/2] [RFT] clk: samsung: add support for CPU clocks
To:     Stephen Boyd <sboyd@kernel.org>,
        Will McVicker <willmcvicker@google.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Android Kernel <kernel-team@android.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20211013221021.3433704-1-willmcvicker@google.com>
 <20211013221021.3433704-2-willmcvicker@google.com>
 <163417617897.936110.4798836682696423903@swboyd.mtv.corp.google.com>
 <CABYd82a7G7jAOMr=yjpkG6sbH+g0-r36NKSBwVEDZeEthuTTLA@mail.gmail.com>
 <163424761868.1688384.7017177221097736499@swboyd.mtv.corp.google.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <e06cd125-cf18-9c2f-45c1-55be9c3f67b6@kernel.org>
Date:   Fri, 15 Oct 2021 16:36:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163424761868.1688384.7017177221097736499@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14.10.2021 23:40, Stephen Boyd wrote:
> Quoting Will McVicker (2021-10-14 12:35:57)
>> On Wed, Oct 13, 2021 at 6:49 PM Stephen Boyd <sboyd@kernel.org> wrote:
>>> Quoting Will McVicker (2021-10-13 15:10:19)
>>>> diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c

>>>
>>>> +               if (parent_clk)
>>>> +                       parent_clk_hw = __clk_get_hw(parent_clk);
>>>> +               alt_parent_clk = __clk_lookup(list->alt_parent_name);
>>>
>>> Can the DT binding be updated?
>>
>> Are you referring to removing alt_parent and just adding it as another
>> parent clock?
>>
> 
> I was wondering if this is an external clk that feeds into here or if it
> is all internal to the clk controller. It sounds like it's all internal
> to the clk controller? In which case a binding update isn't needed.

Yes, I double checked and the cpu parent clocks are always internal to
the clock provider. There is one exception where physically a parent clock
comes from other CMU (exynos5250), but in that case all CMUs are modeled
as a single clk provider anyway. Thus we don't need a binding update.
  

