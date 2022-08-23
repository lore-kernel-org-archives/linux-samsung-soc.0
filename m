Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6A2C32774
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Aug 2022 07:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240287AbiHWHgJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 23 Aug 2022 03:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239869AbiHWHgI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 03:36:08 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B9C63F36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2022 00:36:07 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id z20so12725930ljq.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2022 00:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=1WnyUrxG3+0D+bkCR+RrfEDpgP7RPyFSX27GTaFeZvk=;
        b=J8QF/2ADbBqtCL//z4PO+FlWzzjjCC3uog8Q0A/NRZElFKcSmcg60oaMNCIyZlgWok
         5jZ+pFWF+HntgNVLAfIgZFZA/2bdla1bKjncJDycPiF1BSyFVNOdQGQWuhXMBGdYn+jG
         UoCzokxv3mCqZO9byqaSLH0JDzacuQ2E6WIbHIHv6v+3iHszy7afLGT4wn0mq/w0sO17
         lJP6A4wY86VXBPCG+ucGCaJUCCCVpntwjhZK1rEZjINCgFM0RB5VesC3LdLTHcrf+ff7
         cpzF0S+SA6k2rCbjnWMU4C/4PG1NNrKnaxHH0dcT2ce68VFkbM0rVg32q+TdjBlKZ1CC
         /BGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=1WnyUrxG3+0D+bkCR+RrfEDpgP7RPyFSX27GTaFeZvk=;
        b=XZ37vyqrWgFIpC1fLgSx/fQprUZ3b7yX6lWUnu5l/0WQlt8Ce89hhdY1quyHEeGX5n
         Vonb/JVY8qG/NYwRSp/PhIb55/HHp1uY4QWClCjO7nN1F8VZLx7LNyUp2a7rdllygZ0O
         pEhCQpUGUJqZBpJwp00+zVq1KAuff7wALgjqKomfRhc/P846YYSm4QM9IOAj1Caaq+gL
         ZtgZxO+I7Gkv+RM/QmukJ0l3s238LsePdEqmJNhqM8kqWaH1SxYbWk3HvA4z8nka0c93
         CnXBPHgyMC9ZN9SQ6RwMyZu+ZXLc4sRErDEi0iFcDr7toy1ae6UZVUvqrIvvFtzi7Cp3
         G1Yg==
X-Gm-Message-State: ACgBeo2bccqzlc/KhtdImhFaS069Edm8WqM+dIGhNWHLoCGZ74nhwesp
        zMW1NoZG+rq8KHQv/sxsuqBHdA==
X-Google-Smtp-Source: AA6agR4dszY23uh+Budd60dsBsxWTmMmGjIGTRp7z+9LCFbLyuA24rj7/BK9THdfr4Z8DZFjD6Ajfw==
X-Received: by 2002:a05:651c:a04:b0:25e:7523:20b2 with SMTP id k4-20020a05651c0a0400b0025e752320b2mr6290283ljq.424.1661240165622;
        Tue, 23 Aug 2022 00:36:05 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id d13-20020a05651c01cd00b0025e6e1c836dsm2210966ljn.126.2022.08.23.00.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 00:36:04 -0700 (PDT)
Message-ID: <6b5730d7-997e-518b-e0dd-2a20045242c1@linaro.org>
Date:   Tue, 23 Aug 2022 10:36:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] clk: samsung: MAINTAINERS: add Krzysztof Kozlowski
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20220823073154.359090-1-krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823073154.359090-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/08/2022 10:31, Krzysztof Kozlowski wrote:
> Add Krzysztof Kozlowski (already Samsung SoC maintainer) as Samsung SoC
> clock maintainer to handle the patches.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Agreed with Sylwester who is recently busy. Let me handle some patches
> as I already handle rest of Samsung SoC.
> 
> I plan to send pulls the same way Sylwester did - to Stephen.


Hi Sam and Chanho,

Please accept our apologies for any delays in handling the patches.

I went through archives and grabbed few remaining Samsung clk patchsets:
1. bindings:
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=for-v6.0/samsung-clk-dt-bindings

2. clk:
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=next/clk

3. and DTS via my regular branches.

Everything should pop-up in next linux-next.

If something is still missing/pending/lost, please kindly resend.

Also thanks for your upstream Samsung contributions!

Best regards,
Krzysztof
