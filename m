Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7062DC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 20 Nov 2021 12:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237355AbhKTM3F (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 20 Nov 2021 07:29:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:36002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230381AbhKTM3F (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 20 Nov 2021 07:29:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74BD8608FB;
        Sat, 20 Nov 2021 12:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637411162;
        bh=+Cg/ChDv6w5RRzS8L9XSBzK3sY88urlsvhE0zaxTxuU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nHsmtUhjGeKMj9pXOjZ1asOeLgF1aXppH3EQHq4rk0GN3MBceYJQ+9ygU9zNQjZMP
         2ueYS2TYcp93LQGg4O5FdpjTrqBS5+2BnhSpD19sfC7I6x62lzfwlp0jDDVxXKBh/O
         vQDfO0RLbFqZU1tcZKdH6X3Ywf5rBHM1MQER4rTVQhyz7/TxiXw9gvW1VVAo0ftNq6
         QkJFTJ0ak5sQOMlvlb5QzTpTFB20+UwgwlrhdhHc459GqFFSQSOqixb8ReDVWzWcJi
         CGQioupS5AJUAB7JGGPhAjpvFre8WQ69dgqSv3lJqydYQXpNmt7dFM3JAoe6K5BuDI
         Y6M7Yx0dkjcAw==
Subject: Re: [PATCH v2 2/2] clk: samsung: exynos850: Implement CMU_APM domain
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
References: <20211022224556.18742-1-semen.protsenko@linaro.org>
 <20211022224556.18742-2-semen.protsenko@linaro.org>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <81df1c60-36b7-7b42-3bc8-2c3c7cc02c33@kernel.org>
Date:   Sat, 20 Nov 2021 13:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211022224556.18742-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23.10.2021 00:45, Sam Protsenko wrote:
> CMU_APM clock domain provides clocks for APM IP-core (Active Power
> Management). According to Exynos850 TRM, CMU_APM generates I3C, Mailbox,
> Speedy, Timer, WDT, RTC and PMU clocks for BLK_ALIVE.
> 
> This patch adds next clocks:
>    - bus clocks in CMU_TOP needed for CMU_APM
>    - all internal CMU_APM clocks
>    - leaf clocks for I3C, Speedy and RTC IP-cores
>    - bus clocks for CMU_CMGP and CMU_CHUB
> 
> CMU_APM doesn't belong to Power Domains, but platform driver is used for
> its registration to keep its bus clock always running. Otherwise rtc-s3c
> driver disables that clock and system freezes.
> 
> Signed-off-by: Sam Protsenko<semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>
> ---
> Changes in v2:
>    - Reworked clock IDs to be contiguous (don't break ABI)
>    - Added R-b tag by Krzysztof Kozlowski
> 
>   drivers/clk/samsung/clk-exynos850.c   | 142 +++++++++++++++++++++++++-

>   include/dt-bindings/clock/exynos850.h |  29 +++++-

Looks good, could you just resend with the DT binding header changes moved
to the first patch?

Regards,
Sylwester
