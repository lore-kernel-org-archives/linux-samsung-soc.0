Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535A5C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 10 Nov 2021 08:06:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 333066112F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 10 Nov 2021 08:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhKJIJg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 10 Nov 2021 03:09:36 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:45470
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230022AbhKJIJf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 03:09:35 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 196203F1CE
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Nov 2021 08:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636531608;
        bh=TrlhY2eWu4+cSkNw8lOs81Dr4Hxgj5yITFqJv4cv7TU=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=UQs6Zk/V+zm9P4lsbnrzvo4r+W1wADgsZXpjByYlRugbeUPIAhejogxstNfed7CLH
         JGr6dp4ZkTri1Mp0RwXtP+nSYmqMaWvoc/n/yMMa+C2LX8mlYhNB8J0yGIp+EwQ+rD
         rh6vztkYtdZrtMzLUjAc4PwPsYTn/sChzEmLifAXj8YJ5jt2/GpBN3uW5ArwkbugT8
         Gh+Z+AbF9ai0jHL35yLlx6VCII2LyW6uF+NnAEiRcvcMyFz8SSIB4MPJkwq+8ZZKBr
         NS2dYEC8czZCEEA700mRO34iMYWc0b5kuA+AhTMbI1372+tRM420yyKiNk4o9UARmx
         tNiFD3BWNPdTA==
Received: by mail-lf1-f69.google.com with SMTP id f20-20020a0565123b1400b004035ad15d6eso923581lfv.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Nov 2021 00:06:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TrlhY2eWu4+cSkNw8lOs81Dr4Hxgj5yITFqJv4cv7TU=;
        b=ZB81dlqjiHYXSuFsBLzk5yVWtW+aWd2tF/LuxKz6jOOMf12qoM3iqjB+CRjg9FGclH
         CmSakcEK2KH6hZxjbJ0JztrypjS28HVULOYnQz3PB/wlCsF+ZOySbAfT7uodlslji5vO
         0VC69ng5pELqb7TZGwNLPf2c+5s196CpNhQMRPOtskdBEyxvAp+osOTOiywpMRPgv92H
         kiLVGYRcUDa84zC29mxnYmSm/Ei7uYALP/j82pP3x2cmHdevyYRi8Mni58UqC2oMwWXt
         mrxbXP8rLNiaGMiLxexCeqxpnz62/VIJNRGv7LxxcrRRDjuk4nlIHEI8NYvmJoN6Qsc9
         smzw==
X-Gm-Message-State: AOAM532wCv/TBnGlxhdrlBeVSR/jh59Aj+KNpQoP0wIvkKU8DvNR9kWm
        t1Ty9i5kRenXd4/HXZjOustK19lqGUSG42fofMA5FiAtW9UMlZgx29A7xApAkcwLmjyYi1Vstr6
        7kGVbSSuzfPdwC4n5Hlq0KaV4OkuUx3xKZPoBMdhPvnVkx7x7
X-Received: by 2002:a2e:b88e:: with SMTP id r14mr2676097ljp.365.1636531607307;
        Wed, 10 Nov 2021 00:06:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxygQ7lLd6IGWFDLK2jxYryXTNGiq86UGDABihGmOaLiGBN1o/WPY07PA4vF/suyqqiCxFLOg==
X-Received: by 2002:a2e:b88e:: with SMTP id r14mr2676079ljp.365.1636531607160;
        Wed, 10 Nov 2021 00:06:47 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id e11sm2200811ljj.99.2021.11.10.00.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 00:06:46 -0800 (PST)
Message-ID: <9073d9d4-4e67-446e-1c68-6b8954907d8e@canonical.com>
Date:   Wed, 10 Nov 2021 09:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/2] clk: samsung: exynos850: Implement CMU_CMGP domain
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20211109164436.11098-1-semen.protsenko@linaro.org>
 <20211109164436.11098-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211109164436.11098-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/11/2021 17:44, Sam Protsenko wrote:
> CMU_CMGP clock domain provides clocks for CMGP IP-core (Common GPIO).
> CMGP module incapsulates next blocks:
>   - 8 GPIO lines
>   - 1 GPADC
>   - 2 USI blocks, each can be configured to provide one of
>     UART/SPI/HSI2C serial interfaces
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos850.c   | 100 ++++++++++++++++++++++++++
>  include/dt-bindings/clock/exynos850.h |  17 +++++
>  2 files changed, 117 insertions(+)
> 

The header might need to be a separate patch, I think it was
preferred... anyway, I am fine with this approach as well:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
