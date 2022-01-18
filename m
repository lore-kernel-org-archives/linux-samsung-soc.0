Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4793FC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:36:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348102AbiARSgF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:36:05 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:43672
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244655AbiARSgE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 13:36:04 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B9EFD4004F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 18:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642530963;
        bh=EE0Uqs2gxfZTLiuKZr5yQERb9YnbJAH824xo2Ga77Yc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=VWfKvjK7OKJPAj8wXfnlcMno1Ur/yOfoHW2lOoY8f6/+0PexDw8457E+qG32QP2Wo
         bEhLJLf18dgHkTSV4Dqq4KYWPbJ+mFaHPqmC+oDJElMVMtZDRklQatjNoOpZDhJKBe
         o9btZEtrSiedrXV1ddXgrejC7Z2qfKtv7QN8B+EhSRkiBkdSuzvY2WfRdpIs+Wm48E
         fMzB7LPV9yKFkQIWbvBMMJYKjMOkNxpJZ2Znx00w+Bj8Qg0vY6L5/tm4RAhzunSI+T
         IlKD3mphx8xZMkY4VvLK2OdgmT4xSw1fXm0zCIIi8Yd79G74uypwLpw/oEiPE3ocLt
         DdnvQu8Jc5Z/A==
Received: by mail-ed1-f69.google.com with SMTP id o10-20020a056402438a00b00403212b6b1aso4734279edc.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 10:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EE0Uqs2gxfZTLiuKZr5yQERb9YnbJAH824xo2Ga77Yc=;
        b=r5n3qCqCg3KBtT1Ql7lTc8DWHh1L2d6zMcKM0iFNYHaeOPIZcEi6kQzCTva0WhgQXW
         bscwjkjTw2OF03urhLpZBkrhIvsrxWj2+dCUxWGun+y9jWLFD1571S+mJgcK5RUcxqrI
         FePo7qTtI25Gpe0bcgqfyhlajKe0emiHU4T8U5jDTYxvEfnzUoacZNkln2/LqkAlvRSD
         Pc8ikj72t44rnJSdD+WmDxEYW7eIIPfqbDCrNo1PUU3WQuAWoUnpnQ4C1nZAUcZStkpN
         9cvfzXCeEl7GBc/YmQS79x4/2G/Ad3O9r7EkVbcWxIHrYu9Fs+0bJ8Ym1qArPkQ6xLCa
         hv9Q==
X-Gm-Message-State: AOAM532bjKkyE9unJKFY+BH2yIQrkODfejWGKaSEuBvOGehsE5kO2cnf
        QmWjqGuW+gJg0lfQeQQnf6DIuC5PiKUYK8nT1mW79BsW4wFUGwZtugLQXT2IR8wPRlpkldcXLk9
        JDlYJmesZtNd69chQGb9zsA9LFxMAR7JklhAEjGEL6sdHua73
X-Received: by 2002:a17:906:950d:: with SMTP id u13mr2606649ejx.153.1642530963212;
        Tue, 18 Jan 2022 10:36:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7fvH2EjM40W+CUN1OS0nmGVd/o0ku+wn5FGo24qFNppsdaH6JzDP3RNs1r7cpe3wn6aNXCg==
X-Received: by 2002:a17:906:950d:: with SMTP id u13mr2606629ejx.153.1642530963016;
        Tue, 18 Jan 2022 10:36:03 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id d7sm191717edt.74.2022.01.18.10.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:36:02 -0800 (PST)
Message-ID: <4606bf04-154f-97bb-9b8b-1103c6308004@canonical.com>
Date:   Tue, 18 Jan 2022 19:36:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 08/16] clk: samsung: fsd: Add cmu_imem block clock
 information
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Arjun K V <arjun.kv@samsung.com>,
        Tauseef Nomani <tauseef.n@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150045epcas5p4e54922758fb7922b1fd8de0995d2127e@epcas5p4.samsung.com>
 <20220118144851.69537-9-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-9-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> Adds cmu_imem clock related code, imem block contains IPs
> like WDT, DMA, TMU etc, these clocks are required for such
> IP function.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Arjun K V <arjun.kv@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Tauseef Nomani <tauseef.n@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-fsd.c | 283 ++++++++++++++++++++++++++++++++++
>  1 file changed, 283 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
