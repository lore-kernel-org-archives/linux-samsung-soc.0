Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE825C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 11:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbiF2LN0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 07:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231379AbiF2LNZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 07:13:25 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02C42657F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 04:13:24 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id d2so20131367ejy.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WTJzaDemVNa9GYFB/sPvmJvxvrpUgdWnsJ/tNPCGDvI=;
        b=vYTJfO9pcIBdilCwjej+17FriFRXXILl/9U5HAxSf9Sg1OQTL2U0W7KOjUpeg5dzkA
         ebX/b5msKkNZ/rXK4DJUrcLdCM/LIcKKAQEcEA9lzVTbpasbvL761Ga5hBbsoz50UTPV
         T/FyXiqQJLfNeGHWzask1bkSyU/aZr24FoezFcpXqTt+a1F+WkeR+//UxrjS7ugsnoQh
         Aa/iQ7elkxvyDlhZzOwSnbkqy22H+OZf7S3x4J/XLJQtpBQgGd1J1xJxnX05Yfs6VL5B
         ETFjbgrTaBZFPlGdDAdZvl8oCA/dTMr/P38Gfx/lZsjilUdG0y9I0VYG36Mk4ZPzuOxb
         pDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WTJzaDemVNa9GYFB/sPvmJvxvrpUgdWnsJ/tNPCGDvI=;
        b=ShyY1bBxIi2xSgP+vJO0onyXiftoDK2a2+YlgW/6vRwfexmSX1b64xL2evidF1BRCQ
         8tgag3vIgdf4pusF1KOptfzODHLIygFurCe9L6sLXDlxupW7S1QI/IEWowl5OG5Rxdzs
         w7xhAz7dfNwYmd/o9A2OQC/PidhDw+PIWmsStbzHGhhXDD9FIMxMPaJtK9cmZvmqLG1x
         4hPe6/C2xnPKXjifTeQQnQgytbOnXAzavyS2pqg6O2Edm8kz8wc1z11gzkdQYY9LeP1x
         X2NvMl0jtgbxKtpCXXxDw1El8yqb+YU5CFRAuZUywce5z1sgIvLKNFeWZEOQfcbWkUv8
         tNDA==
X-Gm-Message-State: AJIora9hiv8h5uVeQeTVAWL4ZESuvzxoOz2jWOYjmzSbQnp1yXe6Og0n
        f3208FphVD7WWv8YFs+SBq/zFSZbLklhbQ==
X-Google-Smtp-Source: AGRyM1uW38gvajhhxsuhUb91ole75s+h/dmDc/2trxOPZMZLAK6PPPdZmiJVFjWfLKR3uiRlamReMw==
X-Received: by 2002:a17:906:58d5:b0:722:fc0b:305a with SMTP id e21-20020a17090658d500b00722fc0b305amr2707332ejs.251.1656501203540;
        Wed, 29 Jun 2022 04:13:23 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ci3-20020a170906c34300b00722ea7a7aeesm7576041ejb.51.2022.06.29.04.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 04:13:22 -0700 (PDT)
Message-ID: <e2d6a3ee-e0d4-07d8-d74a-d06b3e917fd6@linaro.org>
Date:   Wed, 29 Jun 2022 13:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/4] spi: s3c64xx: support custom value of internal
 clock divider
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220629102304.65712-1-chanho61.park@samsung.com>
 <CGME20220629102527epcas2p42e99f44d529d215623bd0e12a082d1dd@epcas2p4.samsung.com>
 <20220629102304.65712-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629102304.65712-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29/06/2022 12:23, Chanho Park wrote:
> Modern exynos SoCs such as Exynos Auto v9 have different internal clock
> divider, for example "4". To support this internal value, this adds
> clk_div of the s3c64xx_spi_port_config and assign "2" as the default
> value to existing s3c64xx_spi_port_config.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
