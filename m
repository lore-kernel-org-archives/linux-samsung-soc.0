Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8ACAC6FA8E
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Mar 2023 06:26:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjCFG0m (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Mar 2023 01:26:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjCFG0l (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 01:26:41 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5A1EB78
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Mar 2023 22:26:40 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id u9so34092502edd.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Mar 2023 22:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678083999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2EVWs3pTg/fWY1PZtABlXR6f2sNu/d27mccEdhWh7U=;
        b=c2B/lU6CRWGnrc5QdLUOzoB5rfafH2gCgrW5YIvUTBtsNX+/RsnYuGL/hOKA/oONey
         xORE5C+oDdsUeHmt847wbHn51SnBdX0iOX6t3dGOSeZi9cjmGJMKKGMvKXKqFnnyLqgl
         w4/rygv7dmvuUfGaQZd84YvLI9zRQ7Mcp3gKJAPHa+441ISzHQAT2rVhS43PHwIqWDRK
         hFuXIhyGO8iBJxJUng8GxFFpqLJk3ZUE3FNLvHKYgbBSx1UokpPhzhKL4hl3Q1TjBtPs
         Z03ycgEiOVyEnxzlSjOgVDEnjcFYqRWxXfRsxUky5ESdJDfQJ8Gts1UxdV5eciZ94fdQ
         pBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678083999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2EVWs3pTg/fWY1PZtABlXR6f2sNu/d27mccEdhWh7U=;
        b=o1PYTj+u/gs6loZ43+Fp5z87Muf5SnIqqOkqmffUhVd5gxiuEEcrXMSmZ+kDAmbl5o
         9GcxUdZ6LNNF45s9ZC8emrrHbPH1j/9vYxz9cUm180KwCUMl96gNO4vlps0iTLzK8Zct
         W635KCGytXgR2tx5CFp53bus/KuMNtOUSWBgHxKX45qj7EDJ383N9V0uJh6H5Fm8wUt4
         GTpOwFcb47Q/x79NwwIDctb2tZJkBZMxMpGnSbV75W2Vx5Sqye6N6wsZIZUb1k1WAnE1
         BfZTnhyGu92VeQStDmDfQmCO3A55/fyMFOA0Ny0694HRpIXanphXrRohXF03yx2/fb6l
         MXoA==
X-Gm-Message-State: AO0yUKWAThcJkYH7M6Le5KXvuFRh7LUyyP0WuRn0gJvxQGYZzHBbp/ZO
        OqWYZgQGPu2Ek52+L3jAx2T3+w==
X-Google-Smtp-Source: AK7set8n0rli9ksDBadVCoR2Qgpw1GH9WCld0Ejgjbj5d0mwffklxq/8uct/NXu8bhNw4ZCqxqvpUw==
X-Received: by 2002:a17:907:7da6:b0:888:b764:54e5 with SMTP id oz38-20020a1709077da600b00888b76454e5mr12048360ejc.71.1678083998999;
        Sun, 05 Mar 2023 22:26:38 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:d85d:5a4b:9830:fcfe? ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
        by smtp.gmail.com with ESMTPSA id t30-20020a50ab5e000000b004ad601533a3sm4629001edc.55.2023.03.05.22.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 22:26:38 -0800 (PST)
Message-ID: <422b00ec-1ef4-95e3-db49-672da29e6e24@linaro.org>
Date:   Mon, 6 Mar 2023 07:26:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] spi: s3c64xx: add no_cs description
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Andi Shyti <andi@etezian.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <CGME20230306015413epcas2p371356e4008af6978cdadb5b859d8be2a@epcas2p3.samsung.com>
 <20230306014239.80570-1-jaewon02.kim@samsung.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230306014239.80570-1-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/03/2023 02:42, Jaewon Kim wrote:
> This patch adds missing variable no_cs descriptions.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

