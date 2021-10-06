Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A462C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 12:51:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 144AE6105A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 12:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbhJFMw4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 08:52:56 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:49742
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238624AbhJFMwz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 08:52:55 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2F46B3FFED
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 12:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633524662;
        bh=PKetBUdtpr3Hr2NvlRZBfrIHbbw2Nu4lIQoW/4WvUOo=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Svd9pryXxDVJYvcJSYqUW1YKh0tvYZiQX59c9x+FiJnN2OOwmbPVFelcVTx5glzcw
         Jzvt7nopG3GAT6F86+fjJonQBIIhZlOJ4uwez73I0UNGq5jTPdPb78l8DyQykfiWcp
         kudsTkYKb8HFjht69qHvanh+03nch8hhW+QK/+mvQhJxj1M6L7wwi2bFwaih0I5bTJ
         xHqgjUt4gDia8CeWkXUR4QHvKrE4T700vsoQJxhMqe1CUrYP6fc9DczvD0UeDRAloQ
         iX1FtxTs9CKKeQHFbLRPxDoehi3XM62in7/QbokfoUg++Hi8lGJ3MbKxJSM83t5qmQ
         8/2/vZX+uBAEQ==
Received: by mail-lf1-f71.google.com with SMTP id bi16-20020a0565120e9000b003fd56ef5a94so828066lfb.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 05:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PKetBUdtpr3Hr2NvlRZBfrIHbbw2Nu4lIQoW/4WvUOo=;
        b=Y1eePL4lwj8k3z/eXoC3MPGetH3GCu0AqOSZuZIOIKA9zbM265KDyLm85CkjsyPU5B
         QH1tXMQ3HXbfcLxxoIRyOlfnCD92/C29+IpLd/5XodsiFG3DiODROocc/296Lh8ivj8z
         urnDwifxsa5zOU8ZzZ0refQr7cD9iGGqot+tdRwWEauELYLjunA/xRpDDfuOuyNQWDtx
         J20gjwJNd0eRTtjoTSrOJfPm3wjyj/aCPalS7GHs33Okxy35y7SY92Ezj1e80iNkmKbo
         3JXtpfw6hz3s+WZZI3CV/CSnIM6UnWjxDvLLQm4lODQQDVD9k9kcovDEQN5o72LELJBg
         EAsA==
X-Gm-Message-State: AOAM532kw8UDfSEefTzy/6ePCq2x2tRxoQ66xyl7EPTXyBFJZHi1wsJR
        PFOQUcx56GMOAI8Pw4+Z5SEgzzL01bkmu/0m7T3LD+AkfzAGB4b1i1K02ZYP9frOeSshfclqk+C
        HabKc3CbQDGfJrpVDr7sGsuKo78zqUwkWVy9KFsaJi019Dfa8
X-Received: by 2002:ac2:50d3:: with SMTP id h19mr9138103lfm.63.1633524661205;
        Wed, 06 Oct 2021 05:51:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYQXpRfbdij+G/IdEjueEdrmnNAVv9YGwPu64Trw30ig3vpNtjLztb74XfXOnojeuZlsz62w==
X-Received: by 2002:ac2:50d3:: with SMTP id h19mr9138078lfm.63.1633524661042;
        Wed, 06 Oct 2021 05:51:01 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q1sm2261481lfg.18.2021.10.06.05.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 05:51:00 -0700 (PDT)
Subject: Re: [PATCH 6/6] clk: samsung: Introduce Exynos850 clock driver
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-7-semen.protsenko@linaro.org>
 <3da75dbe-2f98-39db-c455-46adead7097b@canonical.com>
 <CAPLW+4k+1x+qwJJWth7=KwsF_Q2+n5LDA8Q+63M-bxXDO=4bZg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <826fa28d-05a9-4a1c-a69b-70fc50e26e24@canonical.com>
Date:   Wed, 6 Oct 2021 14:50:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4k+1x+qwJJWth7=KwsF_Q2+n5LDA8Q+63M-bxXDO=4bZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/10/2021 13:29, Sam Protsenko wrote:
> On Wed, 15 Sept 2021 at 11:59, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
> 
>>> +             val = ioread32(reg);
>>> +             val |= GATE_MANUAL;
>>> +             val &= ~GATE_ENABLE_HWACG;
>>> +             iowrite32(val, reg);
>>
>> All other drivers use readl/writel, so how about keeping it consistent?
>>
> 
> Ok. Though io* variants looks better to me (API names consistent with
> ioremap/iounmap) :)

The io* variants are for PCI I/O and I/O port. Since we know this is
MMIO, all drivers use regular readX/writeX, so let's keep it the same.

Best regards,
Krzysztof
