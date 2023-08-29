Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FA5C83F17
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Aug 2023 09:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233029AbjH2J5R (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 29 Aug 2023 05:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235074AbjH2J4z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Aug 2023 05:56:55 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30CF5CF9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Aug 2023 02:56:26 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso411594066b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Aug 2023 02:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693302971; x=1693907771;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Jps0qXeyPLdx+b5De4g4xbuY+7aT5vkCHcXrjuUV+Y=;
        b=OKuqNU9MpyPIJHFWbNDDPELOreMyC3nGbzUQuvwWmKtrIcg8RHDNkDWzmbrmnnFmT6
         DyQw4klN3ZaAualjzdSAmsWqsbpECq9vKBR7YPoHvvAfuejn7q5T+sd+RsZqBu5ae35Z
         z8GsJ+WzEPtVzeU++j8rnM4CobDrMKOgRgHaOS1ShOspnbDF9MEZUJ/pgPQxLRgtXEwk
         88ANIHmf1xT28cdC47Thv18zt1doh1SeJLWtNn6A+f+V7KWzfP3awOAJoIyCfwuDhZVu
         SB3ME+oDJn9FlwIAJSIeOAmsUoahcY9niLlOaTRdrPk9iUa8DQviJKZqBVQHOBR0X16f
         ImgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693302971; x=1693907771;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Jps0qXeyPLdx+b5De4g4xbuY+7aT5vkCHcXrjuUV+Y=;
        b=ZljJWuK4QbBU9bScn46WFO0R2OcMNiOHUPfh7CQGtisBdVyyD4r/hzNX2cdaVkeIRz
         wai8CKRd3ucvb8VbwCc6zCuBIAtkTYALqXpPps6190DiMKjOc2CHjWiMiQctQ6cKwBMU
         a5kPdGg1qp1XHUeKox1pZIjF3mZU5e4+1u1C7o2G+JEoPiSrluH/9XHAfR3WbayGoLVZ
         wce34g+Mjzx8JA3LLTuME4xJo9c0lkjYzUxrnKip+5gbBiwcKn2Pr+K+UnMleY2i/+B4
         DZ68zc+NOXEvRq5igBKtAEQZRuQchBBAOFmEDtEWUH5xmPNBbIwxkz3yl77H8Y5hIg/k
         JivQ==
X-Gm-Message-State: AOJu0Yy3deqOUCdcAVw3sCtX0dVCBzF0n12yL/5xeUE4NekXL+ePNFHi
        77OZtEwKC+1CxsiyzrPcz4S+pg==
X-Google-Smtp-Source: AGHT+IEjhxFak4PhQe3Tgs47lEQYmobKxofGOlrRmfYW9HU2F55i2HVmIX6rN/v0yjl1q+ycOMRmMw==
X-Received: by 2002:a17:906:2091:b0:9a2:ecd:d962 with SMTP id 17-20020a170906209100b009a20ecdd962mr9825131ejq.4.1693302970981;
        Tue, 29 Aug 2023 02:56:10 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id h25-20020a1709063b5900b0099cc3c7ace2sm5878362ejf.140.2023.08.29.02.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 02:56:10 -0700 (PDT)
Message-ID: <a3b9ff0f-fff9-9439-5ec9-95a4de9bdfaa@linaro.org>
Date:   Tue, 29 Aug 2023 11:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 04/11] thermal: exynos: remove fine-grained clk management
Content-Language: en-US
To:     Mateusz Majewski <m.majewski2@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20230829091853.626011-1-m.majewski2@samsung.com>
 <CGME20230829092412eucas1p2b79a6f90b9077a3a5486845b7e68bbc6@eucas1p2.samsung.com>
 <20230829091853.626011-5-m.majewski2@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829091853.626011-5-m.majewski2@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29/08/2023 11:18, Mateusz Majewski wrote:
> This clock only controls the register operations. The gain in power
> efficiency is therefore quite dubious, while there is price of added
> complexity that is important to get right (as a register operation might
> outright hang the CPU if the clock is not enabled).

So once it is done right, this stops being argument. The benefit is to
keep this clock disabled most of the time, which now we lost.

I don't find this patch correct approach.

Best regards,
Krzysztof

