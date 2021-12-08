Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CE6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Dec 2021 08:50:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhLHIx6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Dec 2021 03:53:58 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:45778
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229748AbhLHIx5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 03:53:57 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1F39C3F1C0
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Dec 2021 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638953425;
        bh=R8HBwd4TyGLCA760Ss3CKjibTlYQFYE0uO0PD5BwZvw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=TK0WCa9J9IFlY7mzQvHVgfMZXFEnQ54MInc2YbNefqh0iGz+VidrMOTxFuhBB1hd2
         uQPjtEFcjyU6qb08brxPtkMYTUSSCMxRJ/X+hTaZz1Ia1pUE8ZYpcP1ki7YEWQ4z/E
         al2ry8hDQMK84PCKznnRFQWCfXWedb4BH5a5SnSKIsDgTJsQczkQ44mRLIHVHBidxk
         OTjOZa2RQQoh7uP6NPmd3nBCofroaFuXBQYss9960rC4UAvsKV1XBe6SNOZiczNEXl
         nRGWV8/lHglkGGgXdBFz4jn+PINV7UxuCaMOJhqqHJjxm5/e9K/T3pjq7pFzjE2PcS
         hCTvdEHZFegAw==
Received: by mail-lf1-f69.google.com with SMTP id c40-20020a05651223a800b004018e2f2512so812841lfv.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Dec 2021 00:50:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R8HBwd4TyGLCA760Ss3CKjibTlYQFYE0uO0PD5BwZvw=;
        b=CwzMoMYmaDGZ26ljGkJT33/0+5BHSOoREGXpNsvZlvYIs0DCzfTq6h9RncvCeYq1xY
         bLTRHXVkB+B+b9NWTpeA1tx/jrtYlX4Q//2j5GDK5c/4lecHkjdYC/07K0f1ZfVX5X+T
         YC7WkNtFo1UZIlTPgWp18e+DxiCKSjmqvijXY3UuP+Tg1g8/LubQPr9sG1SpHM23efjZ
         QpDOuNefzPugSBW8LXmMRXm5v5kC2Xs0BdX9DztqXia+Gq8vr2gmHp3qystR8uhetv5g
         1l/7OT4BGhUTt9ngq/s5jn40Gw4ad8z1MWqyi3P6ZN5cLDAPf9geclbgylpAWxMOgZnz
         8NpA==
X-Gm-Message-State: AOAM5332MBjZVX5DV95jnvvEYj6KJrmhF/puwcm9JgLfL538clTDZfbs
        HkyMdL154MgQRR4J7OCvwQv/nXVqLJQyXLZKByOS1ysradz772w/n74GjtTXB3cwv+J3nSHtjWN
        Wq6soEjjp4lBgABRHcn8PjRgFXkRsDmFovgQ0e1O83YTNLwZ9
X-Received: by 2002:a05:651c:1788:: with SMTP id bn8mr47211494ljb.521.1638953424522;
        Wed, 08 Dec 2021 00:50:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzfdCt+FdQcXzsA+ZSP+aXR+YS39/y+RSedwOythLdxan/1Eq+7ijqqQmxhwnxOGZyrtJWww==
X-Received: by 2002:a05:651c:1788:: with SMTP id bn8mr47211452ljb.521.1638953424236;
        Wed, 08 Dec 2021 00:50:24 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id k14sm207087ljk.57.2021.12.08.00.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 00:50:23 -0800 (PST)
Message-ID: <b7f5a30c-4148-32d8-39b2-2ba8bb64635a@canonical.com>
Date:   Wed, 8 Dec 2021 09:50:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 5/7] clk: samsung: clk-pll: Add support for pll1417x
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        David Virag <virag.david003@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211206153124.427102-1-virag.david003@gmail.com>
 <20211206153124.427102-6-virag.david003@gmail.com>
 <CAPLW+4kSDHUsvHo0njykTTRGqaAehRt6MXdJF73OzR47avOm9Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4kSDHUsvHo0njykTTRGqaAehRt6MXdJF73OzR47avOm9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/12/2021 20:00, Sam Protsenko wrote:
> On Mon, 6 Dec 2021 at 17:32, David Virag <virag.david003@gmail.com> wrote:
>>
>> pll1417x is used in Exynos7885 SoC for top-level integer PLLs.
>> It is similar enough to pll0822x that practically the same code can
>> handle both. The difference that's to be noted is that when defining a
>> pl1417x PLL, the "con" parameter of the PLL macro should be set to the
>> CON1 register instead of CON3, like this:
>>
>>     PLL(pll_1417x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
>>         PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
>>         NULL),
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Signed-off-by: David Virag <virag.david003@gmail.com>
>> ---
>> Changes in v2:
>>   - Nothing
>>
>> Changes in v3:
>>   - Nothing
>>
>> Changes in v4:
>>   - Added R-b tag by Krzysztof Kozlowski
>>
>>  drivers/clk/samsung/clk-pll.c | 1 +
>>  drivers/clk/samsung/clk-pll.h | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
>> index 83d1b03647db..70cdc87f714e 100644
>> --- a/drivers/clk/samsung/clk-pll.c
>> +++ b/drivers/clk/samsung/clk-pll.c
>> @@ -1476,6 +1476,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>>                 else
>>                         init.ops = &samsung_pll35xx_clk_ops;
>>                 break;
>> +       case pll_1417x:
> 
> I wonder why this switch have a bunch of fall through cases, but none
> marked with "fallthrough;" line, and both checkpatch and "make" turn
> blind eye on that? Anyway, I guess it's ok as is, just an observation.
> 

I think the fallthrough is needed for non-obvious cases where one case
has some code and misses a break. Something like:

switch () {
case a:
case b:
case c:
    foobar();
}

is obvious/explicit and does not need fallthrough.

Best regards,
Krzysztof
