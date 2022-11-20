Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5440C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 20 Nov 2022 11:22:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiKTLWg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 20 Nov 2022 06:22:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiKTLWf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Nov 2022 06:22:35 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D1F2BEE
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Nov 2022 03:22:34 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id t10so11799467ljj.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Nov 2022 03:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufoSlXchpv3+JWv90+bHohtuyaEesYE37/HIrF+TV84=;
        b=ziHd7IrY7/y9j2KB4jF8XNyQzzz85uTKo0fy9g6BYsK5OcIaENGpaQfbNiXGXD/f2Z
         SvKNp+I6eiHHlW0e2IecxyL/1ErjYldkSfoZ/MzRoCMalF9+ojARYjckmIM/0i/eYbo0
         qoUQ5LdqrkgYMonInRD453rlhN2wYx/aJExRCDLXKexhlSKr6BdR51HVSwe8rww+uXqC
         VWtYw02VKUGjSnwzSD727hsAl93yWcuZP2phfcYvB5Lwn8S9KTme5qL63mQG3LWU6kfA
         5sI5kF1prMf860HSGk6u+nkBiBRm4ol+ND4WWEzYjOXipaSeLGaIgKjN5K/wKqaV+vRg
         ySfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufoSlXchpv3+JWv90+bHohtuyaEesYE37/HIrF+TV84=;
        b=LLalZWkrdKspkqquQVIBlo1DV/P4mWy7Kny9evMNMeBoDUO1cV7lOOO4CzMB0llZw4
         f4+RRHR7gQe/SYMZwQKjTlkeZWEmsaxSd3nevXjQG0Fg2bIVkCsn9HPvpRyFifkxQUUG
         knZ37kTqj42OHYlYImj7khmAbPdI8hqQY0mzLyMesiti3LRliZCb6Qxwr1J0P6007Sr/
         OA1QmXldoT0GN8FXY8LEzo3Wt7J0OFJOrGA34u2SL6USAJ5A4m4AzrCOlLR2oilYFA5m
         /HAlR2vVo9kN0m2gmv7I/xrLqoPe3JeSnWVfT+Q7Z+Hn11SRf6fkZHnwuElI/LQABVZg
         mkEQ==
X-Gm-Message-State: ANoB5pkj1v8wgMA42LbBdLUX6rAkVNPQX4peUj47w4Dt1D0gRl2bVyP+
        0D9KMIwEDR5Dcy2qfsjXHZVNpQ+PiTHwrO5a
X-Google-Smtp-Source: AA0mqf7lr/kWHjScfpUNbE9IGMgO50C8GEWxPIFLJo3Yran5pebBBM8zljWoA7jLKUAOBo/dozmTiQ==
X-Received: by 2002:a2e:9c51:0:b0:277:e8e:8d90 with SMTP id t17-20020a2e9c51000000b002770e8e8d90mr4680122ljj.243.1668943352426;
        Sun, 20 Nov 2022 03:22:32 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o17-20020ac24e91000000b00492dc29be7bsm1504431lfr.227.2022.11.20.03.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 03:22:32 -0800 (PST)
Message-ID: <b759a3e7-7a45-3dc9-14ba-8b01da798f10@linaro.org>
Date:   Sun, 20 Nov 2022 12:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] ARM: s3c: Fix a build error after the s3c24xx dma driver
 was removed
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        dmaengine@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        kernel@pengutronix.de
References: <20221021203329.4143397-14-arnd@kernel.org>
 <20221118215401.505480-1-u.kleine-koenig@pengutronix.de>
 <f0425349-d965-0a40-0672-27dfbe45eb44@linaro.org>
In-Reply-To: <f0425349-d965-0a40-0672-27dfbe45eb44@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/11/2022 11:31, Krzysztof Kozlowski wrote:
> On 18/11/2022 22:54, Uwe Kleine-König wrote:
>> The linux/platform_data/dma-s3c24xx.h header file was removed. It didn't
>> declare or define any symbol needed in devs.c though, so the #include
>> can just be dropped.
>>
>> Fixes: cccc46ae3623 ("dmaengine: remove s3c24xx driver")
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
> 
> The file was not removed... or it should not have been yet. The s3c24xx
> dma driver removal should be part of Arnd series taken via SoC ARM.

Also: I don't think the fix is correct. The header was used in mach-s3c,
so removing the header should still cause broken build.

It also fails in other places:

arch/arm/mach-s3c/s3c24xx.c:21:10: fatal error:
linux/platform_data/dma-s3c24xx.h: No such file or directory
   21 | #include <linux/platform_data/dma-s3c24xx.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.

I think that commit should be just dropped instead.

Best regards,
Krzysztof

