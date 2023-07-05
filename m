Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F0FEB64DA
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jul 2023 08:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbjGEIzK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jul 2023 04:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbjGEIzJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 04:55:09 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C51E47
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jul 2023 01:55:07 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9926623e367so744027266b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jul 2023 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688547306; x=1691139306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hdnXLK7qXLON81pPPrHpzO/9z7s+rm9QJ6FuVbRQdbs=;
        b=bQVOCTRLHSWl3pJ/aG3YOm3LoqJo7lD7UF8wSJdcUBzA8ywgE0ThA+Qi8SM1g3hvWj
         hhmd6nSlFhTugGouHtRnBPXyQcVhXkPtdxwGnvo0foz1ctz5ZYrwTeJncUn4iCMC1gV5
         BdZ4sp8EyYztinmdKrS2ISk7bcr6hh5CvbSmvU26Fves47jjy547Wpj0tUZdLpbTvRpu
         bl1CSqthUc3FXSifcMk8VMmy+3JmquUL/k58DZB251hag4i0v11hSaeNQtxzwIMcRfmA
         I8ui84qB/VmIOwh6ZEtRoCB27JUN72/+eT9MKwl00JxnKS+sCmOVm/R8N/5XPp292rRU
         +NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688547306; x=1691139306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hdnXLK7qXLON81pPPrHpzO/9z7s+rm9QJ6FuVbRQdbs=;
        b=ft2k3qSnXVgRh9PpHoTJJMmta664kBRo+lNye3zdCTy4GGJ60U4emaXCEhSjqg+4Em
         VAOZ6TxhqUAFjHXEEEL8QHSom2WK6YLoe0x8dbDqxcWEFJtDaVW0cPPqgt1i+GU9Pid4
         EQt1IJXSfnaeGpW2hI7Nel9Pg9XiuOa8AcZl2ZuFnAtpTZbEvg0v3niXOpzj6mHbVMh/
         aEnc3m2Rd1ltWH/TrzdI/2PQx1IgY/S37UzCbrcmc1vYUKQSpfSJQGTlRvnX9alL7AOp
         n76yRQfhT58R7cwF+9AoGaMlGVK/Kq+UPZcVxqKfUauaTjW6azHmtKt2gzXalM2zAOZE
         4tuw==
X-Gm-Message-State: ABy/qLbMN3v0NFc+qimIrvKK7zL5CY+9fwHDt8a8SM/BjO4k82nex/k2
        WyhLusDUv0KPtWsGlzUt9qYjJQ==
X-Google-Smtp-Source: APBJJlF18nZ62Q03EIuvQIs4j7WBKWQva+whWpxRMq7n8XPt8oxM94B6qxAs5mNE01oHizT5YtFx9g==
X-Received: by 2002:a17:906:3bd3:b0:982:870f:9e8f with SMTP id v19-20020a1709063bd300b00982870f9e8fmr10500224ejf.62.1688547306173;
        Wed, 05 Jul 2023 01:55:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id j13-20020aa7de8d000000b0051a2c7f5b0fsm13076264edv.88.2023.07.05.01.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 01:55:05 -0700 (PDT)
Message-ID: <e684d1bc-f2bd-3505-3d8d-cf108e2a1586@linaro.org>
Date:   Wed, 5 Jul 2023 10:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] watchdog: s3c2410: Fix potential deadlock on &wdt->lock
Content-Language: en-US
To:     Chengfeng Ye <dg573847474@gmail.com>
Cc:     alim.akhtar@samsung.com, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230628164759.67594-1-dg573847474@gmail.com>
 <b6d3a872-f32e-bfcd-b603-c08339737045@linaro.org>
 <CAAo+4rUzusAyyffkCvEq+wJQacqfrcTx-SviqXaTzPsqOkjB7w@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAo+4rUzusAyyffkCvEq+wJQacqfrcTx-SviqXaTzPsqOkjB7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/07/2023 18:10, Chengfeng Ye wrote:
> Hi, Krzysztof
> 
> Thanks for the reply.
> 
>> This interrupt is a threaded interrupt. Therefore the
>> s3c2410wdt_keepalive() will be called again from process thread. Are you
>> sure there is deadlock?
> 
> Is it really that s3c2410wdt_irq is a threaded interrupt? I could be wrong
> but I can
> see that the interrupt is registered via the following code. It is the
> third argument
> of devm_request_irq but not devm_request_threaded_irq or
> request_threaded_irq,
> as far as I know, it should be an interrupt handler for the interrupt line
> wdt_irq
> executed under irq context.
> 
> ret = devm_request_irq(dev, wdt_irq, s3c2410wdt_irq, 0, pdev->name, pdev);

Yes, you are right.

Best regards,
Krzysztof

