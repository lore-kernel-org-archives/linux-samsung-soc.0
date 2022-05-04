Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB0CC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 13:06:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350214AbiEDNJt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 09:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350202AbiEDNJb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 09:09:31 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFB72ED71;
        Wed,  4 May 2022 06:05:55 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id p8so1080442pfh.8;
        Wed, 04 May 2022 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UC5/T62VBrPR2OvWMU7yh7SKj/WV1x6G5gEe33Tp7mk=;
        b=jfvmZOqT1RCdG840AmSvi9BLfhWe0UsS6xUzfZZ21xHsl3Fg6lazuSiY2nD1/ALjfy
         LrUQjOvzD7MpFz3WGNuKOHFuO9m01r9vay7aMeR/ZLwHLPM7kEPOwzebfjfF3IJC9cpj
         ydQWn2kUWsegmxYjxBSAzLN2t0AlvAVyWPQ01GOjRq3Pxs2tVJFgwO2YbL4O9jG8dhXb
         7h776yMANyYVzwVHbrkqJhUvEHHYTGkJjtV6JXPHBNWUmz265r5DwzQgQX2GMACST339
         M9X1xaLS8u1ZqXexVat1fb0rrtLBRL+HFWjU1LUxZKW28ZoPXOVU2Yhc/kBHuHB6pza8
         vWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UC5/T62VBrPR2OvWMU7yh7SKj/WV1x6G5gEe33Tp7mk=;
        b=A301ElbueYK0JoXavguTVa8gAA01wLfvYn51UrrJa3G8328ebcTtTs41Irs9/6gcTt
         qd6wJzOohU9fk//rD5C9/aSAnsxFZhUeRKx5DairC77sT4g/6Sv1obvAgxwCvQPuDJYH
         N1Q6LnmaGy7AB0L4AywVoyYiyWD7+7qJQHsqptem6Npb1IdHGyGoqYaZc85mddy1H5+R
         wdp/FDRpricoM60lt3Zd1ywl7hxxVQHeOJZ56KcAWv/LKV4dAIzxhOEWkmlCDOpR7oh4
         onIPQmai1hqag9HCa/XqZnkiWQuWvF5gQcrZOOBoy0nVnblc4U18emQzDE68wvf0Kibz
         bi3g==
X-Gm-Message-State: AOAM532mUQR3JW5WHub0457Q8yTNv++akGqgNrvDz6T8T1fNlaceK1sM
        EHvFRSqkCif6WnnSJ1ilPCWEdvLjQDM=
X-Google-Smtp-Source: ABdhPJyvSN6lqx6iGE7zAkwNM/r5YaenoNFhG0ehHtfOvx/cwMQGX3Eytq2mAfYIF0TbYO02EzDDYQ==
X-Received: by 2002:a63:6808:0:b0:3c5:7405:1cd4 with SMTP id d8-20020a636808000000b003c574051cd4mr3436179pgc.444.1651669554978;
        Wed, 04 May 2022 06:05:54 -0700 (PDT)
Received: from [172.30.1.41] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id y6-20020aa78046000000b0050dc76281c9sm8153208pfm.163.2022.05.04.06.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 06:05:54 -0700 (PDT)
Message-ID: <c5532ab5-eaa5-e199-2c59-6ec58c9a8f55@gmail.com>
Date:   Wed, 4 May 2022 22:05:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: add clock binding
 definitions for Exynos Auto v9
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
 <CGME20220504075003epcas2p3708d1853dae290bc42cfacd318767c8d@epcas2p3.samsung.com>
 <20220504075154.58819-2-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220504075154.58819-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Chanho,

On 22. 5. 4. 16:51, Chanho Park wrote:
> Add device tree clock binding definitions for below CMU blocks.
> 
> - CMU_TOP
> - CMU_BUSMC
> - CMU_CORE
> - CMU_FYS2
> - CMU_PERIC0 / C1
> - CMU_PERIS
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   .../dt-bindings/clock/samsung,exynosautov9.h  | 299 ++++++++++++++++++
>   1 file changed, 299 insertions(+)
>   create mode 100644 include/dt-bindings/clock/samsung,exynosautov9.h
> 

(snip)

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
