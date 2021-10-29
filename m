Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BECC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 07:56:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BE6461157
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 07:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbhJ2H6d (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 29 Oct 2021 03:58:33 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51656
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232284AbhJ2H6c (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Oct 2021 03:58:32 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CEC793F1AA
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635494161;
        bh=LyyBRaeBvGMAnLsFN/eJuaykDGWSSKpKnsQjNh6rDIk=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=GyCZ7ZC60+Km16be+ADFcNX4LoEhwUoHYI4LEml4EyWvmRXzWjn/z90KbO04iZJfM
         lWNILUoqaDGRhWFrZSkSg6ACt5542NM8e6hIPmoW6xybhsUIdsEn8ZjGWs0vEH/tLf
         ZtiJRPsAPaWkTVOTIkrWqEiFDLb+NOtZcB/kMk4dDK0/4iGlwmLFDRAfE7a1k9hTrz
         hzKRz8iWtzu1pAjhVoFCxBVvBsc/LwJWOvF1LHG7iRRtZmH4h1Fkgq64Li2tipjaRC
         Gv0AwR+09QpfxAwMu4jXXeveZsYxfjI8+27yC+r6AQeu9sosve4p/tIlfp1yedTtPc
         Q0mO1uBbPJ1XQ==
Received: by mail-lf1-f69.google.com with SMTP id i1-20020a056512318100b003ffd4e89eb9so3198716lfe.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 00:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LyyBRaeBvGMAnLsFN/eJuaykDGWSSKpKnsQjNh6rDIk=;
        b=xgVnN2vROAg4CIi3chJEpjRNUKKn8fyg8ukrro9fueZ6Unl4rGEXxi003a4Z2u80KE
         9UV2V8AhyNWl5GXqhAbsv3daUerPEYqnvdN0+F1JJA9y8MOcLZ1CG6S8/6UgXL8HTt+X
         RG0LWTx5xq1FOeBzL34P5uAPPfy2PpSNvkSTNV7+dYKFWC6RIj4OoFrufrPie8xcrPau
         bHWGDU/MEeFqqqA5LhBlWKrChweDrMU7vdtwbzYHQgv5jZdTavSVlf5WMSP97YTX14zg
         3VHmLJsvoGL7d5EwTktXzEkj9mqv3SX9OopH3Ut8edMmbNbeQKWr1JaO/MVRa45lETpf
         5Xuw==
X-Gm-Message-State: AOAM530Qj3GlfoBVeDykD2FaQ9GSstGrm2fhlfCP12+gQwyEKPPXqvMq
        L5Ej77T2gmfhpoCYYpSHTnaSoPA1lcvVSlEfsxVpLULpexy4rzRxjk4eviM1TJvD6mHVw4B38nQ
        73pR0iPFgloNVEVZp33Dq+pEWWAlIKo4jXTBw8zex0WuXJkV7
X-Received: by 2002:a05:651c:88d:: with SMTP id d13mr9891265ljq.399.1635494160930;
        Fri, 29 Oct 2021 00:56:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjD+ZyZDA5TH1MYDJvmel7PgaO0VMDmzw3+uqvozcCuzMQMxxuuiC2S7FaeIi+F7wLIc61Fw==
X-Received: by 2002:a05:651c:88d:: with SMTP id d13mr9891235ljq.399.1635494160646;
        Fri, 29 Oct 2021 00:56:00 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id o1sm533211lfk.159.2021.10.29.00.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 00:56:00 -0700 (PDT)
Subject: Re: [PATCH 1/7] dt-bindings: watchdog: Require samsung,syscon-phandle
 for Exynos7
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <99f7e45d-7c27-1ad9-edf5-a5075e8e323b@canonical.com>
Date:   Fri, 29 Oct 2021 09:55:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028183527.3050-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/10/2021 20:35, Sam Protsenko wrote:
> Exynos7 watchdog driver is clearly indicating that its dts node must
> define syscon phandle property. That was probably forgotten, so add it.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Fixes: 2b9366b66967 ("watchdog: s3c2410_wdt: Add support for Watchdog
device on Exynos7")

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
