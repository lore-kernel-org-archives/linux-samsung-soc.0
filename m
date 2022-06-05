Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA43C43334
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  5 Jun 2022 16:07:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351137AbiFEQHK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 5 Jun 2022 12:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350632AbiFEQHJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Jun 2022 12:07:09 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0512F5
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jun 2022 09:07:07 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id gl15so10851462ejb.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jun 2022 09:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xCX7O8NhzvosQ50yk3GTkKJIoOozPRyC9OGxboOSoUY=;
        b=XRB/B2HvcnHjpSY8mhPrsMez/FqrID+PhNvQkXoB5lRndHTYAU1PBfj7pM/igUW7tc
         L1z9Z8yFXxAYjUeWmDalrSqltwk+GC+RfdUPdqnQ/e/XxW6A2t/oap45lGOJ/R/pc29U
         OUXNgoiA5adWZxC69J5vl0X4j+1jgrDrXfxuKWL4TAPiObXDElGXbZy4eWoltwIYxKby
         LtB2vcKbt4On/6Rko4XecEdJPKfmqOAVUdJcjtOjskWUhKkzCbnzlaG8is/yXk40xSr4
         ndlPxW0t6ksAdvFda9e8NIV/IoT1tTPq5tHOiQL+OaLUdYyt6p0+w2obfSHXx8q0+UnM
         NNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xCX7O8NhzvosQ50yk3GTkKJIoOozPRyC9OGxboOSoUY=;
        b=NO/TbgxZ2xGvzqg9d8YMqtFUjBMVhH6/XA2V/55wYfIeloXk03qIt1AqcJMlI1DwHN
         9CKDkSFX9l7IxhAAUeqiRfKCHhO5ed9+/EOm3JW2SzE6VKqRFWFcrO7n6wIgtkfw/PtS
         dPOgMP8BYESaIZ52lsVfsAuugoQWdTBP3a0ZNsTng0OOYu3cZ02enqZv7uZHrDJskQAQ
         REaKLLwcLxDCUuawM0Glr5tK0KezmLnic77fVG8oPKvJ4guKrzn1c/05J4WXeNaKHHio
         FruwSBDOl8dxeEL49ZJtIO8TLlDR/kORGqbKosU6wKC9U/tuORxTRhZ3WSPMKAglVgI2
         HhUg==
X-Gm-Message-State: AOAM530hyY4OGzvoRWkUGHeTNCZrrDxsZXZ/+SgjHfS3Es/7uwhK5Ldj
        P/4qNqMpjnsNsn6sxOdnLQ+xyg==
X-Google-Smtp-Source: ABdhPJzyB4vzVySmjCZzv2QY4cQpaKl2NPICl1GkzNdQ+5tqZ247Q0nUN0lnrmIliVTKFleNxN6Kpg==
X-Received: by 2002:a17:907:7f0b:b0:6ff:4502:9c2f with SMTP id qf11-20020a1709077f0b00b006ff45029c2fmr18228155ejc.532.1654445225579;
        Sun, 05 Jun 2022 09:07:05 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lk24-20020a170906cb1800b006fa84a0af2asm5394921ejb.16.2022.06.05.09.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jun 2022 09:07:05 -0700 (PDT)
Message-ID: <6ac8c5c7-8d53-7bdb-2a1f-b49f95231c73@linaro.org>
Date:   Sun, 5 Jun 2022 18:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 8/8] dt-bindings: pinctrl: samsung: deprecate header
 with register constants
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Chanho Park <chanho61.park@samsung.com>,
        Linus Walleij <linus.wallej@linaro.org>
References: <20220605160508.134075-1-krzysztof.kozlowski@linaro.org>
 <20220605160508.134075-9-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220605160508.134075-9-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/06/2022 18:05, Krzysztof Kozlowski wrote:
> For convenience (less code duplication, some meaning added to raw
> number), the pin controller pin configuration register values
> were defined in the bindings header.  These are not some IDs or other
> abstraction layer but raw numbers used in the registers
> 
> These constants do not fit the purpose of bindings.  They do not provide
> any abstraction, any hardware and driver independent ID.  With minor
> exceptions, the Linux drivers actually do not use the bindings header at
> all.
> 
> All of the constants were moved already to headers local to DTS
> (residing in DTS directory) and to Samsung pinctrl driver (where
> applicable), so remove any references to the bindings header and add a
> warning tha tit is deprecated.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Chanho Park <chanho61.park@samsung.com>
> Reviewed-by: Linus Walleij <linus.wallej@linaro.org>

This needs fixup in address             ^^^^.

Best regards,
Krzysztof
