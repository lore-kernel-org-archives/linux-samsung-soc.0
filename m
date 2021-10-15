Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BD3C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 13:31:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DF96611C8
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 13:31:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236431AbhJONdp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 09:33:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:44576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239790AbhJONcp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 09:32:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E38AF611C3;
        Fri, 15 Oct 2021 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634304638;
        bh=z7ueMOjCBPjCvYvX1lLTsN485LfZnE3tVIRW+wrk2kI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=uiPj1KxYZsKxYALHTiadAD4Vn2UrvB3oL/0aC46D1mdqAuZCedgBqwtz9mo7Bj0LT
         538LMIk7wVE+K0sO4j1Z9x+5hR5vaRpBS+PAzVBNMqEVKkHBRfTTul2o+wNIm9ZyJp
         XLarNgJXZnOZyd7fGgg5vZ3x2Y0hkNdthXjZ3IxbNA/wEPNWdcGY5zyKROALLukdNF
         amQM1LtntPSiEBVaaR4gM+z8vGD2KlNbDpXU3HlW467OIDcYuCFtUSj/si8fJe1Ewd
         WawGxhmsqzkPgHj1RgYrw6ib5TZ+0tC/QQdyhD6nGno+a68SiAlTozoZoeYVbobAt7
         zzrrpcGPmJg5w==
Subject: Re: [PATCH v3 5/5] clk: samsung: Introduce Exynos850 clock driver
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <20211008154352.19519-1-semen.protsenko@linaro.org>
 <20211008154352.19519-6-semen.protsenko@linaro.org>
 <CAPLW+4n41GY_OszS=VgzgywVrD+epY1NTmwL1ghHZ=0DCYcbYQ@mail.gmail.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <a98f7f83-8478-aa38-7699-0a5dce44616d@kernel.org>
Date:   Fri, 15 Oct 2021 15:30:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4n41GY_OszS=VgzgywVrD+epY1NTmwL1ghHZ=0DCYcbYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Sam,

On 12.10.2021 10:14, Sam Protsenko wrote:
> Hi Sylwester,
> 
> On Fri, 8 Oct 2021 at 18:44, Sam Protsenko<semen.protsenko@linaro.org>  wrote:
>> This is the initial implementation adding only basic clocks like UART,
>> MMC, I2C and corresponding parent clocks. Design is influenced by
>> Exynos5433 clock driver.
[...]
>> Signed-off-by: Sam Protsenko<semen.protsenko@linaro.org>
>> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>
>> ---
> Can we also apply this one?

I think so, apologies for a bit excessive latency on my side. The patch looks
good to me, I have just applied it to clk-samsung tree. Thank you for your work
and good luck in upstreaming remaining parts of the exynos850 platform.
  

