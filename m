Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6652C43334
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Jun 2022 07:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiFXH7s (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Jun 2022 03:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiFXH7q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Jun 2022 03:59:46 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C2B6B8C1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Jun 2022 00:59:45 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id cf14so2284439edb.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Jun 2022 00:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=df4hTcrZotnifvBHPZxAZdqUw93jw7Dt3467JJNB40g=;
        b=oLSnu9e94vKdRXjQHDnvIcjxIN/kvSvWyBfbx/YeRiWoNNvvqp3IZYU/2xklU+PlD/
         EMjM10q6UU2bK/VxLvvOrrzekSpXNyFq1B7TD2SX5twDhg/X86z8OJ9Ype+idW0/EhUM
         fQrq6Xkp1zMs1EmCTaJeUpsPTavWW9wSQb8u9HzrPfKlRgAs7JsUbKvFuOotXtcOSumz
         a7wD9l4UI1Bq6vlWf1hqUIH+BuS9twZqomrRIHmT8+WlV+dDeXC/0ast1KS6KVTdcTLQ
         cE32tb2ZpWpDf8lrpeMmamyrPrbPwGZ7zHtpoDCDhoVSdlEVhOFV0opBfkyw027GkqXy
         CPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=df4hTcrZotnifvBHPZxAZdqUw93jw7Dt3467JJNB40g=;
        b=FVuOeGjgxejeSQyZNhoa8adOctOBRoF3ZCcNfCjqmjrIDefBzlnQgXzIMdAbIXxlt/
         D/Zik33UBWFkq0dLca2N/A3PIBXiwpeiS64EIaabB+kxXiv0DjiC+LCJ4OdGtvAdT4PX
         ya8QaY4L8gFwe7Ug5ZAYNug82GhNrqSQssTtkNaVwPDYe2SOOvyDx+7EfoLUmbdyGXMc
         jec2cNVLU5D/JFOw46FdqwsUrwLvYMQEGU6Ak+k9GF5dOmPi7Y7hHSpcftLxA+qjfXxz
         RYYQQCBoLhgspAd0wUwm/MIADaZ8xd9H5uhRLNNHVbjXGmSifZsMkH1iZhWFIpRuCRZF
         Qpbw==
X-Gm-Message-State: AJIora/J6K6W1/6gQiRoquwLOzagmIAp+Mc2LOcCUoClxsTn5Ocu9pxw
        y5abr3fHdN7ZLTxg7ew9So6XNw==
X-Google-Smtp-Source: AGRyM1svgmJ/GTyyqp4Dc5HIRGri5HppdA20rfEgzWNE9Vzoxh6xPtdys+apubLBTZCgcTVIifqS6g==
X-Received: by 2002:a05:6402:280b:b0:434:efd8:d9ae with SMTP id h11-20020a056402280b00b00434efd8d9aemr15633804ede.120.1656057584335;
        Fri, 24 Jun 2022 00:59:44 -0700 (PDT)
Received: from [192.168.0.233] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b21-20020a1709063f9500b006f3ef214dd9sm671371ejj.63.2022.06.24.00.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 00:59:43 -0700 (PDT)
Message-ID: <033af024-8acd-e536-0c24-ff30b12a581b@linaro.org>
Date:   Fri, 24 Jun 2022 09:59:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] clk: samsung: exynos7885: Correct "div4" clock
 parents
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     David Virag <virag.david003@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
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
 <2eda61c1-a076-3467-91bc-8c2e14f4f516@linaro.org>
In-Reply-To: <2eda61c1-a076-3467-91bc-8c2e14f4f516@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/05/2022 09:21, Krzysztof Kozlowski wrote:
> On 26/05/2022 07:58, David Virag wrote:
>> "div4" DIVs which divide PLLs by 4 are actually dividing "div2" DIVs by
>> 2 to achieve a by 4 division, thus their parents are the respective
>> "div2" DIVs. These DIVs were mistakenly set to have the PLLs as parents.
>> This leads to the kernel thinking "div4"s and everything under them run
>> at 2x the clock speed. Fix this.
>>
>> Fixes: 45bd8166a1d8 ("clk: samsung: Add initial Exynos7885 clock driver")
>> Signed-off-by: David Virag <virag.david003@gmail.com>
>> ---
>>  drivers/clk/samsung/clk-exynos7885.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)

Sylwester,

This goes to v5.20?

Best regards,
Krzysztof
