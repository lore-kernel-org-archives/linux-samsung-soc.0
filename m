Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7AAEB64DA
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jul 2023 09:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjGSJFz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jul 2023 05:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbjGSJFh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 05:05:37 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A66719B2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 02:05:06 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-991ef0b464cso125894566b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 02:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689757496; x=1692349496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CG2i2gBdVgAobd7kSOtOhhY9985qKrdP4M4UxdNSfpA=;
        b=MOo4xwK0xHvBv6dWQDzKM4xZBpYxTg51VuIGMqgw+zOK983xACaLL8Theq51In9kck
         ZbW8lqvNI30+RT0Ho3lDWgtkFCQV/uc4m29yqrHATPsdeOui9ZS9gwJQju57qUIFvN/t
         chxhOdn/P3ssp0Cefy9C77tBxSrmVYaT5jAoKz+caAYFnznIBIeQdXPqv84zZI83jm4u
         vsO64A/nrPqAofMmncPSkmslDsGlx8pVeuGHZJcESevisX7PcQN1DB1v00rImbeHLdDb
         jretoz77IVDpgb5t3fvU1NgIzImTrM+iWcuM6hs7JmBeoKGYF/gVX7fHzUfEop8Wj9Cp
         Mr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689757496; x=1692349496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CG2i2gBdVgAobd7kSOtOhhY9985qKrdP4M4UxdNSfpA=;
        b=TcxxX3Z97UvMwKOl5kTddF3bWuvzJA3PL0Rish5fJkY6Fm73qIG5DmPdxmMCShaecO
         /wtmfKY1g/gpaI/XsjmIk3sJyXdawrk5xMQ+nKy+Wj5xbEEdj4xSE2Kr1p15+/5BYWFj
         XPwkrXeSY1irLxTenMCGwhyePdOPA+PpUOaHe6hZvynRBbv0xpltsvjS+/jlHS/7DE5l
         2YuRafKUeVWqiSODMyFC3+lcPQPW/MybwikUeHeJdJju8wUzr61BBzgOADOQDhPgqisz
         qZDdhGdIt5wr0HrdXt71dHk8QbVxGAbNoai9RMXtOUr+gDRENHUWe9A/AsQKka9++Kkn
         UH/w==
X-Gm-Message-State: ABy/qLbXG38LQTxn4f8gM2Jz6rr+k7/W2ZbDk5P8pIlW4MaO5FtATkHX
        YbGZ5ffFFKCPH8nG0KCIMeZzRA==
X-Google-Smtp-Source: APBJJlG2CdR7otElXbCSTvvIj4z8QCx0EPvoLVEcs45/igNTPlvZg67Tn6ceqy4lh0WKAf33sSeqQA==
X-Received: by 2002:a17:907:3ea0:b0:993:f9d8:9fd0 with SMTP id hs32-20020a1709073ea000b00993f9d89fd0mr1955000ejc.1.1689757495980;
        Wed, 19 Jul 2023 02:04:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id cw17-20020a170906c79100b00992b0745548sm2058618ejb.152.2023.07.19.02.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 02:04:55 -0700 (PDT)
Message-ID: <401692d5-14a9-51a2-6676-06449ec54d18@linaro.org>
Date:   Wed, 19 Jul 2023 11:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/7] ARM: dts: exynos: k3g: Add GPIO keys support
Content-Language: en-US
To:     Markuss Broks <markuss.broks@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230716220644.22158-1-markuss.broks@gmail.com>
 <20230716220644.22158-4-markuss.broks@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230716220644.22158-4-markuss.broks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/07/2023 00:05, Markuss Broks wrote:
> Add the four physical buttons support, volume buttons have
> external pull-up resistors.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5422-samsung-k3g.dts | 60 ++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 

Is it a duplicate? You know it cannot be then applied?

Best regards,
Krzysztof

