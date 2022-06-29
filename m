Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25B0C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 09:19:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbiF2JTc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 05:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbiF2JTb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 05:19:31 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52BCA369E1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 02:19:30 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id e2so21327351edv.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 02:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=owp2sKpOvZLelw+J7uoupyFiJ/5VI7r+UIGpCWr6KDM=;
        b=Ja32fG6hA1Xk14bswf5jxwDw5I3IUOyEzphOyI0UMmMNSH5k4HmoGffQJpVnExxUL9
         B6B+/dk2yvniR2xiZrxGikeCOS1+ThIaKFWX6N6YuaWFHin1mnkfYMj78Vq4FhNF/Laj
         Jn6t1UahZZU/KGHy4lc53aGrQodz01a01rjb4WXyC7gOCuuvjZwE4PzXWWg9yM+Mm9wX
         eX+VKEUAYVwLNzzo/mUTJvksmaWpBAN9iqSQ8PLigMhFDdDnrmALTeWiTut7kiccXoPK
         5LStDVl22Jsv+i6sn+W9m7rUQWkdSWNZtZaOBWIAR4hmRmLTOUjtI+8vNvG+fgazkyB4
         a8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=owp2sKpOvZLelw+J7uoupyFiJ/5VI7r+UIGpCWr6KDM=;
        b=DX0Nb+055+q/DN0BgCSuZOJfBvXellpePMqs51ydSmTqZa2Y3bmUZ8vFI/+kZaJlUJ
         t5e0HJPzfLSK44d3H1c2rry81DfsebNEqi0PaUBs6QSF+SSLaF0rQfNMYpe3PO7Gjykb
         GHD3EuyiWft+rlDS8auTegGhep7JLLJEF/ijdpJNI/YMLFtiNcFVbIThtRBmNWTHsz68
         R3wrbLmwaMOC/r9usL/pFpBieE+DoneNB1JuUbDajOkRnnID3jOILxmTZEjFtuUgHWyR
         gpFdhuu/carprGpnMUZ7i1amTsiFznfqopE8UR0nyqo0T1liwmCAL3dhUGc65lz1J2Ss
         xywQ==
X-Gm-Message-State: AJIora8qDDnxR0UlsWvWGxvBbokca+3fF9arspaNs2fc0ftrYVi8k8aJ
        0Y3NAg9ewuUOiX8S+5xO7mj/Zw==
X-Google-Smtp-Source: AGRyM1uKnAZkB/DxDxKRkat8hrZpbm+OcAgU7aRZNF9rRAEBkxOgdV6PlFEgHSSa3ylaKpJ+5+Xafg==
X-Received: by 2002:a05:6402:520c:b0:435:af40:8dc6 with SMTP id s12-20020a056402520c00b00435af408dc6mr2907592edd.343.1656494368874;
        Wed, 29 Jun 2022 02:19:28 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e19-20020a1709061e9300b00726f520bba0sm1093923ejj.216.2022.06.29.02.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 02:19:28 -0700 (PDT)
Message-ID: <218135d6-b9f8-d1e8-453f-d7715387ff32@linaro.org>
Date:   Wed, 29 Jun 2022 11:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 4/4] spi: s3c64xx: add spi port configuration for
 Exynos Auto v9 SoC
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220628044222.152794-1-chanho61.park@samsung.com>
 <CGME20220628044432epcas2p2e2b4c0d52f11c0bf543c537e819224bc@epcas2p2.samsung.com>
 <20220628044222.152794-5-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220628044222.152794-5-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/06/2022 06:42, Chanho Park wrote:
> Add exynosautov9 spi port configuration. It supports up to 12 spis so
> MAX_SPI_PORTS should be increased from 6 to 12.
> It has DIV_4 as the default internal clock divider and an internal
> loopback mode to run a loopback test.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/spi/spi-s3c64xx.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
