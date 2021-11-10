Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C4EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 10 Nov 2021 08:05:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3EF361152
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 10 Nov 2021 08:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhKJIIS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 10 Nov 2021 03:08:18 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59512
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229931AbhKJIIR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 03:08:17 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 774743F1F6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Nov 2021 08:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636531529;
        bh=6TCgaUiPF4La09b+Ec+Lpl19b+PHzqLrdJ1ei763Nyw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=s8/aT3kOphpESLmVOsdiYs3wCB86zEJlNgV0WeB0B4CIfxXCmA+JhwI9CqjfZiUeR
         +SfJSsrOOSKSwVEKDW/uVJ2lRyxZYhYwj4V98AhWvB0ooWF85xczyn8h5pu7YPOctf
         pA1gvB47s36jXD+Z0lNukBEczgt3C89iumBPghMJeT3ZIpI5rKvz8BxgW2Bh951YaC
         wvE1sbkvfzAEDOkyXfRNkuSPtVeLBzywxYEguXtDBvzfmvEHA2fUZrqT8qrT3iTl6v
         460AeIZITtGvUXZFq7GF+LgWMM51vm/GgW8KCiS2WjxQrqvqKAee2HUe86s5P5g4oz
         0vURIHtayYTzw==
Received: by mail-lf1-f72.google.com with SMTP id h40-20020a0565123ca800b00402514d959fso937318lfv.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Nov 2021 00:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6TCgaUiPF4La09b+Ec+Lpl19b+PHzqLrdJ1ei763Nyw=;
        b=S2ByTSkv/WnX+jCo/zej/jcdjsumuuqdErE+S0XqfAPY6Rj8kiSlOE1tif8VqUsv5w
         rjbCs6yVUAG7dVDAJi/ZTJGVu/toSszCOCZiHm8BWii3b2uyPkuOY6n+5xTLGD6zEYE7
         hA7k0UQCS1rLAvrlLl01a2Kd2JvbFrVv5u8bQP5OPl4TBbQq3QWT9QyZVP3w/uhJmZRP
         C+1XKnjYNp9eaaaL5d1zOX746rwmU1tKgoXjZiAV9XOX3hSSCk0JGP8ISOHWcGirLEom
         m2v77L22a+VR84Ecly4zQCk52sfzT1ThYpNF0m1JWqTF6S47Pvypk7rUqsAn2kNyHISY
         2iTQ==
X-Gm-Message-State: AOAM533EzoAJrN8czDCufIPDx+hkzhSoqlDgr4kLLr3HvhSKYWTQyNF5
        gKCDomzRYg+avTCH+BQxCMRW3Q2Q3qaG6YB+LQDnHL658mAckjLp5klcB5FpEsyewUQnw0QzCZl
        EMgUCZNsAl75bA64vCe/4t6GSyAbN6aiX4u0w1P9s5JQriCsb
X-Received: by 2002:a2e:a268:: with SMTP id k8mr14261044ljm.451.1636531528893;
        Wed, 10 Nov 2021 00:05:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylqFuKfrnfMruHmHwO1hSmBU1QGgVSCQ9hz7fqddvcA8xqLtwHzU5kLKIA2sLKbIvw1y5llw==
X-Received: by 2002:a2e:a268:: with SMTP id k8mr14261009ljm.451.1636531528593;
        Wed, 10 Nov 2021 00:05:28 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id p21sm1908747lfa.289.2021.11.10.00.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 00:05:28 -0800 (PST)
Message-ID: <b0357d21-00a1-715d-72d3-b8e65c83736d@canonical.com>
Date:   Wed, 10 Nov 2021 09:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/2] dt-bindings: clock: samsung: Document Exynos850
 CMU_CMGP
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
 <20211109164436.11098-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211109164436.11098-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/11/2021 17:44, Sam Protsenko wrote:
> CMU_CMGP generates USI and ADC clocks for BLK_ALIVE. In particular USI
> clocks are needed for HSI2C_3 and HSI2C_4 instances.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../clock/samsung,exynos850-clock.yaml        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
