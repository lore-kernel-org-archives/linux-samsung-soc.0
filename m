Return-Path: <SRS0=uz1o=D6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594EAC388F9
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 11:42:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 069DD20EDD
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 23 Oct 2020 11:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603453352;
	bh=wS/X3ln10wqe8Ba/FDfOxDqc+VBkiXalNXlIqq6K46w=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=bvfpoW1+nkqWPxhSnKwdrvwAozn+GeLAt7bYDGr2OgTUolo4fcngh1aVzfhmPxbLb
	 Z19FNwFXqUsa5T+FjpJy+hS4Zks3PbysGUW4+bACaJu7gkkYglhl4WNZ8lFFFlc+qE
	 gJboHAw0gcdpiNQw+tA13X7rWY3VW5S36XdLyfyk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463162AbgJWLma (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 23 Oct 2020 07:42:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:44740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S463160AbgJWLma (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 07:42:30 -0400
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D714221F9;
        Fri, 23 Oct 2020 11:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603453349;
        bh=wS/X3ln10wqe8Ba/FDfOxDqc+VBkiXalNXlIqq6K46w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=tTXF469B7fw/ODbqFlQBiV2EwedvGT/CD6gIzFwHtR+JlvDo+Z4JJa6+dlyt5Zn2p
         HhtEBK2jQg55UpKvv1K0R8ijngTWDW48FxGQGpc/EKThX00WwxwDEzJaCODBZOYtbz
         PE1bUDZCLzTwcRbnwaI5t/uoSUad/8odM5MVI09w=
Subject: Re: [PATCH 2/2] clk: samsung: exynos-clkout: convert to module driver
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20201001165646.32279-1-krzk@kernel.org>
 <20201001165646.32279-3-krzk@kernel.org>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <d84ea240-5bb7-1b77-b287-c2bcca971201@kernel.org>
Date:   Fri, 23 Oct 2020 13:42:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001165646.32279-3-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/1/20 18:56, Krzysztof Kozlowski wrote:
> The Exynos clkout driver depends on board input clock (typically XXTI or
> XUSBXTI), however on Exynos4 boards these clocks were modeled as part of
> SoC clocks (Exynos4 clocks driver).  Obviously this is not proper, but
> correcting it would break DT backward compatibility.
> 
> Both drivers - clkout and Exynos4 clocks - register the clock providers
> with CLK_OF_DECLARE/OF_DECLARE_1 so their order is fragile (in the
> Makefile clkout is behind Exynos4 clock).  It will work only if the
> Exynos4 clock driver comes up before clkout.
> 
> A change in DTS adding input clock reference to Exynos4 clocks input
> PLL, see reverted commit eaf2d2f6895d ("ARM: dts: exynos: add input
> clock to CMU in Exynos4412 Odroid"), caused probe reorder: the clkout
> appeared before Exynos4 clock provider.  Since clkout depends on Exynos4
> clocks and does not support deferred probe, this did not work and caused
> later failure of usb3503 USB hub probe which needs clkout:
> 
>      [    5.007442] usb3503 0-0008: unable to request refclk (-517)
> 
> The Exynos clkout driver is not a critical/core clock so there is
> actually no problem in instantiating it later, as a regular module.
> This removes specific probe ordering and adds support for probe
> deferral.


The patch looks good to me, I have tested it on Trats2, where CLKOUT
provides master clock for the audio codec.

Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

With the debug print removed feel free to apply it through your tree.
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

--
Regards,
Sylwester
