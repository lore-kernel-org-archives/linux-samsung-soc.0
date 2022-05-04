Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099BEC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 18:12:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354735AbiEDSPq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 14:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377170AbiEDSOY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 14:14:24 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C2A8023D;
        Wed,  4 May 2022 10:33:11 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id x23so1663564pff.9;
        Wed, 04 May 2022 10:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VZNJXAt1Y0EFrqEApcXABj13w2ZVQdPKVefXXjLpFE4=;
        b=cEQ7g/7Qbagbw/Cpkdwl9T4ejoZG4dqIhYUea6kDr747hoAB/16Rsj5fjh2Dg6CaJk
         Hv6ak4tt0WXfR/2Mmrllm1mzV5+7s9134lEQh2uve2sODYebyOF/ciwQgI8/lhHt7cu6
         ocNdxE5kaz0uzXOtlGEyvlE7cKg0rs/koYaJ/XhBWADlj+C3MmxlerlhtduM/uYxZ6FV
         PpXd+HiCs1TjN9QRyzMH20uNDkRvkQPX1ff+7oi3vZSOGyPRhRM1al6xmUftoX0Bp/RB
         u37yIvNx4adFMQsrYx/G3nVEM0RA5vGJRSZLJFTCogdNzYVO9r0kyiXiLOTsVCPiy7Cc
         A4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VZNJXAt1Y0EFrqEApcXABj13w2ZVQdPKVefXXjLpFE4=;
        b=LNm2GjY1imCTMRMcZLMsbv59Z2tg12FOeic7tSr2nw2Imar+pBETrLJogP4mXhAOhf
         7zyihm0I/mDq4rmXq9SA2Nl31Rewy6l8fNvWjthZec6jAR7VVua4Ifn9MGSGYkKseo2F
         xhg2IYZxdV2aoSRJRv5yHi8rLs91Vn32obUBtvnSlhpjWr6oiMKdqJQ53Rmb39h1VHCq
         UOgGqa1c1kCpQsTDy6S/Lctg4nvRLzrUV6enXX/dd3M4FVC/pywn7h2Pc2uNxsokyb2w
         DllvNOQW9J37cC+1360qXRdjNgWzwe+NGjR3hFy7ylhZ+erRBsfbx3G38t43J4CqK6oq
         tXrQ==
X-Gm-Message-State: AOAM532AbrZtVXCg7uVkHQaYMbM++Ct0G1NHof0poBjAz1MX81/anfeT
        nomrwaOlOYmPREdyOHEq9po=
X-Google-Smtp-Source: ABdhPJzSOec8hW8EspXKKUiQ1zOXHr32JcKtBHHpaVPYTMuF2zFsQhIoUBy2ZodZ9ybIFZAZGHCDkQ==
X-Received: by 2002:a63:6841:0:b0:3c1:a611:793e with SMTP id d62-20020a636841000000b003c1a611793emr18509718pgc.249.1651685590179;
        Wed, 04 May 2022 10:33:10 -0700 (PDT)
Received: from [172.30.1.41] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id r11-20020a63204b000000b003aaf27b5ceasm14642072pgm.1.2022.05.04.10.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 10:33:09 -0700 (PDT)
Message-ID: <43b102b1-e6de-5b46-4c4c-04cf78ca2c05@gmail.com>
Date:   Thu, 5 May 2022 02:33:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 09/12] clk: samsung: exynosautov9: add cmu_peric1 clock
 support
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220504075154.58819-1-chanho61.park@samsung.com>
 <CGME20220504075004epcas2p3b7508eb948c6e17d3ece429b03540c65@epcas2p3.samsung.com>
 <20220504075154.58819-10-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220504075154.58819-10-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 5. 4. 16:51, Chanho Park wrote:
> Like CMU_PERIC0, this provides clocks for USI06 ~ USI11 and USI_I2C.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynosautov9.c | 254 +++++++++++++++++++++++++
>   1 file changed, 254 insertions(+)
> 

(snip)

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
