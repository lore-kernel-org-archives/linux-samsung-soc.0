Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BD5C00140
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 12 Aug 2022 08:47:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237609AbiHLIr2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 12 Aug 2022 04:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237603AbiHLIr1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 12 Aug 2022 04:47:27 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C480A8CEB
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Aug 2022 01:47:26 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id c17so467083lfb.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Aug 2022 01:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=wKN6M4QIFB9YzafE2xGwaTO0/e6+URKgqPrZCeBFSec=;
        b=jwoXwv9gl3TpgIn9F0jAEdWP6T+Jz8k7F932qtZNL46y4+p3KKZTgEOzdR9YB7+IAs
         wxWHGP1sO4ahr0CR+BLeNK+w9Kix1+Y9JzU6nzqkc66NCLfuor0bhawUgK0kLiPjp/zS
         kVs2z0MIU7h5D038tAkjVwbRHds7132+2asalI74BMIvG4AnYb60zD8e02g3jqu+rUfW
         zedJ1mpQNHQ+ui4JC4cMaPwwW/jKLXQqOGQaNo4v09zaNnDtNm7TXQoLjh8OZlHHL0LP
         voY3o4F22sGMhLF91UXBqRgNhMe9Flyj9MFoaIo9ZYePZL/CDsfJIzrJvMh747c70LJc
         ujnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=wKN6M4QIFB9YzafE2xGwaTO0/e6+URKgqPrZCeBFSec=;
        b=4HPq3BRYAHUOUbyN9igOXyrvMpuU3Knl4MY7iroeDeTdpw1lMjHN17OIb/k3DTeafC
         rerD3QVws0yI2/+cG8+OkgBuG7oStYovgL5LF3OCtkzOxwZCx5+oFbR+V2P7pJ+0ciay
         DyY2cNX0/OP12l5lEH3vVnlDDs9q+j1+cCgXzrWqn4iqhIZaORs+2kpqFM0HBAILAiPM
         F+EiuhXvyFR08ynMG3x+X3WWhhGzzx9BrHIFSEcEl2dMOxl3Nwdw65YbZtoMQbmje6+R
         M3znjfKfK+dPdAr5weCzWo1IQtvVWTipPvk+au8KbjcO1DyyF+GYUs9eanZ9PTLJtZ11
         K0Sg==
X-Gm-Message-State: ACgBeo1kXUJqx9Lxbo7rGVdojKDQT/bhM9RQ79UtxqOjv4g3OP/XSedk
        gaIJTQ4+0aInDrZN+P9iT5Tdzg==
X-Google-Smtp-Source: AA6agR5T5c35Mt3eXh9J4qVtmai3eKcCwCCuy2td0MfoO1IBZgZ+3EuQu4Q6B4f9v9L4/3XMbKMoZQ==
X-Received: by 2002:ac2:418a:0:b0:48b:aa2:1d9f with SMTP id z10-20020ac2418a000000b0048b0aa21d9fmr1050838lfh.195.1660294046075;
        Fri, 12 Aug 2022 01:47:26 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id b14-20020ac25e8e000000b0048b365176d9sm131255lfq.286.2022.08.12.01.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 01:47:25 -0700 (PDT)
Message-ID: <5664f423-5628-8d89-8def-621f27bfea83@linaro.org>
Date:   Fri, 12 Aug 2022 11:47:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 4/9] clk: samsung: exynos850: Style fixes
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220809113323.29965-1-semen.protsenko@linaro.org>
 <20220809113323.29965-5-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220809113323.29965-5-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/08/2022 14:33, Sam Protsenko wrote:
> Fix some typos in comments and do small coding style improvements.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - (none)
> 
>  drivers/clk/samsung/clk-exynos850.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
