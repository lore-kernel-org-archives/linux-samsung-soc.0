Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B801AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Dec 2021 16:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238254AbhLOQLw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Dec 2021 11:11:52 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54288
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238366AbhLOQLv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 11:11:51 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EF0AA4068E
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Dec 2021 16:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639584709;
        bh=HEryT/59cwIP/SgJfqP9kYNmdFO5OiSXHgK40bkLxdM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=O0X4MFdfW9C0nCwVLfHaZBjMBz+yS0FwF5ARgxIANy1Jxaqto9ooU2VAMZmS6Ibaa
         02DSTgQ5ixGykP5PbiCokQpgczADv4u+qL//oR0dVTAOG1kMyPuxGqg2CsjfmchS1f
         QU49CwIgmshFW+hFQ8SUeX4AFT4Q49yYoazYJBUHU6pmR7fjR5RbUoi7bWGJ0CTh4F
         lIredh6VIAhol1EmXWkPwNp9qLpr5bJKuwIfpKq+mJuxTXYwgpYu5Bnpc7V0LaVh69
         waMNM+Hb4MU7iIJmmDxfzyS+GHOmKRToYPB8IhFrYeU2nLEJPX/8nOvH6CMZjVfAiy
         4X32xDBNuyDlw==
Received: by mail-lf1-f72.google.com with SMTP id e23-20020a196917000000b0041bcbb80798so9780011lfc.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Dec 2021 08:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HEryT/59cwIP/SgJfqP9kYNmdFO5OiSXHgK40bkLxdM=;
        b=xR+V8rJgVAOt3P9Lamq0Oe6BFHSZnJwQ6Z91CcvNmfk+8ZqUi5Hbg8AQCQMKtFefqW
         /uswW33whImRE4097+y7fxaapQd6T0kld2/VEDkdT3Y9/0sAK6X7tJXs50s3VHEwisE1
         RumFmgfLumSOwR54jZHBWlM5CnJICfUYvIMoyasxTgnNo+ftWw2ZKBsXH8Svj1hjSpJO
         ZllOodyethQ/KVLzYlhKuOM2u5H+y+04H+ybzAYe9bn5g89IjdRTXxL7qZ5Lx6hZEAbd
         4dRFAICgBfMVMVGQat8LROFTezOx76ZK8293RC/N3Y5OhOcmqYezUKbAvwwBKY+vM8+7
         6R4w==
X-Gm-Message-State: AOAM532wBTTRi4Kbuwz+1+gO9cLR9/QcgUOjDTnr3jcUD5LKXyKKv/Fh
        Wa3YLghTToIaEGc3YEWbMKQ6+noElEj2pIc8fFjqHv5VUAaxi1c76o651y3PBei3VQ2NizKxcT1
        PxlJWKDOeYqjwrfBfkiKImYt2ksFm9H9HzVNF+i2q2PPZo1Od
X-Received: by 2002:a05:6512:3fa:: with SMTP id n26mr10779806lfq.369.1639584709156;
        Wed, 15 Dec 2021 08:11:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1QHtNZSWhWsx7d0Gr+L7f/sF8couHjZyoyUMKUsr2/tG2om/weSyMTpr4+BviHq0uyXtW0w==
X-Received: by 2002:a05:6512:3fa:: with SMTP id n26mr10779784lfq.369.1639584708997;
        Wed, 15 Dec 2021 08:11:48 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m3sm522157lji.112.2021.12.15.08.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 08:11:48 -0800 (PST)
Message-ID: <6b5fd3fd-18cf-3b6d-934b-11a82cf404dd@canonical.com>
Date:   Wed, 15 Dec 2021 17:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/7] dt-bindings: clock: exynos850: Add bindings for
 Exynos850 sysreg clocks
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
 <20211215160906.17451-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211215160906.17451-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15/12/2021 17:09, Sam Protsenko wrote:
> System Register is used to configure system behavior, like USI protocol,
> etc. SYSREG clocks should be provided to corresponding syscon nodes, to
> make it possible to modify SYSREG registers.
> 
> While at it, add also missing PMU and GPIO clocks, which looks necessary
> and might be needed for corresponding Exynos850 features soon.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  include/dt-bindings/clock/exynos850.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
