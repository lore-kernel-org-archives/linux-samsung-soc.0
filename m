Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006A3C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 May 2022 07:21:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241525AbiEZHVc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 May 2022 03:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236623AbiEZHVc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 May 2022 03:21:32 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B3A4BBB2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 May 2022 00:21:30 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id gi33so1401891ejc.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 May 2022 00:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hc5WJxpCJDyVBDEvY69Dh9h8QnuVZ+60jKtLKAF2hwA=;
        b=NY5j1qQZ3zuQBRuvXBwy3T9uIZGJL4d8Rkl/5QM6aWBuym9SQBTCtvDlmbVhzkohv4
         i3tm4naS6sehS+t4500dvC7cVuqK7UroqrRb/nELHpJDgttNXVWjFIoAvmPUZ/kYkqh5
         hqVh5AaM1CM82qmtM4mnF5w3iK88pPIhSPCn3DiSPR8bcnUbYMr1KgO2sEYQaB4TVdgq
         yfnmb58z8XZblOHEMP7rPTBEQDXKUFl5Hoqa9b9Oo0g3FvVZI8n7UYID6jRhs2k+8IOw
         RNOOapYsDOqm2Bz3eoG4dKMcZXTfvkTfYt8iSdbpXiiTlfahVFSdRnCclye7prVpIljX
         GOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hc5WJxpCJDyVBDEvY69Dh9h8QnuVZ+60jKtLKAF2hwA=;
        b=DCdUPXhixPWcW5HFOBPfXx+icSXNPqo/WPquoyGsMPgUuDANCDKUcpIP+K+oIogK9w
         Ou9PXqcg2Drs1V8rSi6lpiGIegogzQUnIQTba67fFutSVfnMhPe3B1t0gYIQC6SVSl72
         EnKn5eafa7IB14isVMPABAZWeXPGXypLbkCKqTPEZhnj7AYPjtyYNhILkRQtY5yCTYya
         rFsennIbkyD+BHE2TBhr5Kz8Eb1JmZ80eBam/a9kK1t35Xfi8pPU4PjIX7QZ8fkBz4kv
         qeWx0jVpJX/DZViniRkK9xi2gYHM6p+1sP+4vH0EVSBjl/3lX2J6LfxmK0OPX0XD3Ilz
         mWhA==
X-Gm-Message-State: AOAM530EoRb/ZXkmCUDXftxhHC38mENs9Het07LjrcXr0mebl9yJr9Hx
        TeRmZaEqrYiT9k/ssYFS2npxpw==
X-Google-Smtp-Source: ABdhPJxzN00DjmF4ZI4mQycshnN5aJuXx97ZwlJCev/twfdd8ygK3/+eZU2fZQbnzmVyrh0uAy5D0A==
X-Received: by 2002:a17:907:6d99:b0:6fe:c1c3:feea with SMTP id sb25-20020a1709076d9900b006fec1c3feeamr21831935ejc.89.1653549688973;
        Thu, 26 May 2022 00:21:28 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o19-20020a170906775300b006f3ef214e24sm243866ejn.138.2022.05.26.00.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 00:21:28 -0700 (PDT)
Message-ID: <2eda61c1-a076-3467-91bc-8c2e14f4f516@linaro.org>
Date:   Thu, 26 May 2022 09:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] clk: samsung: exynos7885: Correct "div4" clock
 parents
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20220526055840.45209-1-virag.david003@gmail.com>
 <20220526055840.45209-2-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526055840.45209-2-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/05/2022 07:58, David Virag wrote:
> "div4" DIVs which divide PLLs by 4 are actually dividing "div2" DIVs by
> 2 to achieve a by 4 division, thus their parents are the respective
> "div2" DIVs. These DIVs were mistakenly set to have the PLLs as parents.
> This leads to the kernel thinking "div4"s and everything under them run
> at 2x the clock speed. Fix this.
> 
> Fixes: 45bd8166a1d8 ("clk: samsung: Add initial Exynos7885 clock driver")
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos7885.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
