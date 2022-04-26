Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17D9C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Apr 2022 18:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351701AbiDZSeU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Apr 2022 14:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351709AbiDZSeT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 14:34:19 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD771CFF5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Apr 2022 11:31:10 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z99so23403020ede.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Apr 2022 11:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VKC8XPJlcNCFiabfzRUjbIvQEbTuiGQyD4TWftjpgaw=;
        b=y8uP8WQR9Xwv9xFK5OwMM9teFu+FnFeOtAK3RIRMXP1D8Aw/JiRwOADDKNekuTPYe2
         O53g+xstGFxFXFkTDYTyGWkVZrVELo127DTIdnYe23jcto4FjuVqzndBA4PxhNPTw5as
         4Qe+kVcmKLogXzieBj3+y4pdFR8wI4PYbr1UJQkDugRVKIDbQkU7ErJfhqIhggEQl8/x
         Ugvu4qVgOV8zQYt+1vfQRUyrlAeBqFmssAiu1sQZT5/Bey6h+5FrqTkiJPRRToYELdhg
         Mb2svLJLnIVWEyJgF5TLB2bqL8xia6yYIs1/QpFFeCyj5+ZOZkDNRD+Khgo5bkWUhtTy
         nz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VKC8XPJlcNCFiabfzRUjbIvQEbTuiGQyD4TWftjpgaw=;
        b=6vh3ERPlVzqTvuudQus8JeHra1qJ7tmhThLsNS8GbpEGVJQbRgzUhmVe1A4OeObGql
         MFfX7hVRymzdqS4hAQy7lUishf4saEQf/K50jx4MrVEFPbHKYeBXTmtWXkQscvcK5rip
         TW8pQweP1MVjmguFu5CzRyl9X5qz7PlbENDUtGGXHVVHkkJzEYFmA2hh0LT/ukkTLz3E
         440P/uUYiPGOL+bw5e2Mo1OyJ9yATp32jSr9oVFVTNBLFF3Pp+kgsTN5Zt5iQtTN9l+L
         5jEl+Ty+yQfpKYFUgNQupfFtqc1j8Lj2HDtmsX5GvhUH0kbxAgxwa9YMXt28Es55nW5R
         lERg==
X-Gm-Message-State: AOAM530C5+lMj+PEcaNBt2J+TYCwLH545/3l5nJfbAyJmFUlNWUhLGzz
        z/l+ULRgEbPqAcgfqFvjs+5QuA==
X-Google-Smtp-Source: ABdhPJy8+F7Ugdd/PM47ZCM/rjQIjw1uj6RBLZ2FyOnjUrLtOLWSbh8KM966aI5K5T24fm7Jnd29mw==
X-Received: by 2002:a50:bae7:0:b0:425:c0fa:e0a7 with SMTP id x94-20020a50bae7000000b00425c0fae0a7mr23869480ede.104.1650997868901;
        Tue, 26 Apr 2022 11:31:08 -0700 (PDT)
Received: from [192.168.0.252] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e17-20020a170906505100b006f3beab8af8sm391941ejk.204.2022.04.26.11.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 11:31:08 -0700 (PDT)
Message-ID: <ec5a09fd-2308-b149-e5d5-12866cd9297b@linaro.org>
Date:   Tue, 26 Apr 2022 20:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] dt-bindings: eeprom/at24: Add samsung,s524ad0xd1
 compatible
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220426175938.2262966-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220426175938.2262966-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/04/2022 19:59, Rob Herring wrote:
> The samsung,s524ad0xd1 compatible is in use, but not documented. According
> to arch/arm/mach-s3c/mach-smdk6410.c, the samsung,s524ad0xd1 is compatible
> with the 24c128. As the schema requires a fallback compatible to the
> corresponding Atmel compatible, 'atmel,24c128' is added as a fallback.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Fix the example in samsung,s3c2410-i2c.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

There is still a DTS to fix. I assume you leave it for volunteers, so
I'll send a patch for it.


Best regards,
Krzysztof
