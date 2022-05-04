Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E15C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 18:10:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376558AbiEDSNo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 14:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376851AbiEDSNY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 14:13:24 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86875B3E3;
        Wed,  4 May 2022 10:32:33 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id j70so1708603pge.1;
        Wed, 04 May 2022 10:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=khvC0zRUn2wcPSPLy3O9uWd+bcV26djjWwaFNXMuw78=;
        b=dTQxGlWJ3zHXjED6G5XuNyzMfCgMGQg1JW3Tf/OGgYwDOnJb6KTjERUTxgVfvpbeL/
         VdLoHyx+uWaJxt+fDp0aN5Ucs4UqL2KG8fOJGdFSMjMZZoCmuM+F5ui0tGrKNOQpQ5zy
         1iNN7sm5ATe601apZ0exS+MMCyoAw079bdehLD7imAH8cAgdktV1VMD8qoEGFKBwweGS
         3eSHzo0c2VSCq0cJAhiyL7zg6QUo88cEVZ0zsKRLk126OuuYNROjvUL4TKmbqe01/c3I
         H6f6tLAAnr6YkCcs+a9yaHiK+aJJO6DW4lpn6BBAMempOP9J9Ie2fMyVSQyRbuEOc7bJ
         EHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=khvC0zRUn2wcPSPLy3O9uWd+bcV26djjWwaFNXMuw78=;
        b=lCT+Dr1aO6YaxFnRdxxrquGma57WrY/DtYjQxqstan0g8l13W3eyMUA4X6B8Jf1duJ
         fPbXZlggGigfold4TkOdBCCXAIVqp1rzqEWc0nZsu3gHFLYgV/CsyNFGfPYJzfS4U7od
         9JhiQbVxeehVn5bfpdv66bwvAQq/lYF4aosvIuHQ1peEuoRuN+hxKAmVL9hjXntPS6R6
         YxWNdIfGcOTYwXWYrhlemNUWAIciSTR0zVcTV7RCRT+IV8TVwfn242iMzU3BseEzGZoe
         kQ+iLuB6Y+N/zLaucOBEdUKEfjxtDQHSCIkc3Ql/yiwq7tvAVjOevFsR23fJRImM/VpV
         aaKQ==
X-Gm-Message-State: AOAM53230gA9q8f71OYZeMHnkAMQId01CL7p1EO7wn55Dn8l8fhFxBGW
        X/ikyRmmRTFVKHo235ptUAOidLSRZ5Q=
X-Google-Smtp-Source: ABdhPJxjy/dBkwPO/uhVsZdW+AJmn8H0VJFt/Ax3M+mp3Alz5oeeiflyb/DxVmHqf5ZeSMcH9tGuhg==
X-Received: by 2002:a05:6a00:1943:b0:4cb:79c9:fa48 with SMTP id s3-20020a056a00194300b004cb79c9fa48mr22047983pfk.47.1651685552933;
        Wed, 04 May 2022 10:32:32 -0700 (PDT)
Received: from [172.30.1.41] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7810d000000b0050dc76281a5sm8454158pfi.127.2022.05.04.10.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 10:32:32 -0700 (PDT)
Message-ID: <b7dc2b85-ed13-e3fa-738e-ff1a757c141a@gmail.com>
Date:   Thu, 5 May 2022 02:32:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 03/12] clk: samsung: add top clock support for Exynos
 Auto v9 SoC
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
 <CGME20220504075003epcas2p1247f3e4d42e48f9459f80ad7d3e357ca@epcas2p1.samsung.com>
 <20220504075154.58819-4-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220504075154.58819-4-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 5. 4. 16:51, Chanho Park wrote:
> This adds support for CMU_TOP which generates clocks for all the
> function blocks such as CORE, FSYS0/1/2, PERIC0/1 and so on. For
> CMU_TOP, PLL_SHARED0,1,2,3 and 4 will be the sources of this block
> and they will generate bus clocks.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   drivers/clk/samsung/Makefile           |   1 +
>   drivers/clk/samsung/clk-exynosautov9.c | 958 +++++++++++++++++++++++++
>   2 files changed, 959 insertions(+)
>   create mode 100644 drivers/clk/samsung/clk-exynosautov9.c
> 

(snip)

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
