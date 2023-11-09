Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A94C4167D
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Nov 2023 22:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbjKIWmd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Nov 2023 17:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbjKIWmd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Nov 2023 17:42:33 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5086C4206;
        Thu,  9 Nov 2023 14:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=nlxtm8iPjIlU6MpliGoSH8MTvH0ZUVGjRXOD+O+7QtQ=; b=2L4JpmeSdAm2UL2l6hsrZkpXgB
        ILdYhYoiutv77BSZkY7wr4cSyaoH3ZvCisq52HcdTdz6+YgcWUIuV9doQzOBKmIX6XUlqnd68+G/V
        EfHzJ/emt9tgkUOkgYROqzKc7RCazIrPBQptgsV5nf7VOU7MVgYwXbQ8JQ6ts+/ErCB7bha2Vnq8I
        4ScN3wcvdsWvqFTr7tQ7ufJe/tLk/SziJfXEwr5E7lLsGjGezB3Lju91HZ1eixAAUvZR+/FuSKBox
        m7rwiG0howk7jsghlneEqtMdBDD088WCIeJbgOBcYLr7GaiBc/edb9uxn3SMoiRxyNGJyI18QrMQj
        LUngoBqQ==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1r1DjJ-007Md1-0j;
        Thu, 09 Nov 2023 22:42:29 +0000
Message-ID: <cc37a0a9-8329-4b46-9349-e36844092e0b@infradead.org>
Date:   Thu, 9 Nov 2023 14:42:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: samsung: Improve kernel-doc comments
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231109190925.2066-1-semen.protsenko@linaro.org>
 <20231109190925.2066-2-semen.protsenko@linaro.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231109190925.2066-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



On 11/9/23 11:09, Sam Protsenko wrote:
> Unify and improve the style of kernel-doc comments in Samsung CCF
> framework. Resemble more idiomatic style described in [1] and commonly
> used throughout most of the kernel code.
> 
> [1] Documentation/doc-guide/kernel-doc.rst
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/clk-cpu.h |  30 +++----
>  drivers/clk/samsung/clk.h     | 158 ++++++++++++++++++----------------
>  2 files changed, 100 insertions(+), 88 deletions(-)
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

-- 
~Randy
