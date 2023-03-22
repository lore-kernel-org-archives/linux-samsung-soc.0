Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63978C6FD1C
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Mar 2023 17:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjCVRwW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Mar 2023 13:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbjCVRwV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Mar 2023 13:52:21 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1774D6702D
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Mar 2023 10:52:16 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id ek18so76305216edb.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Mar 2023 10:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679507534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wh4Z1xlqDztZUH1w7IbXNlkUYB0pflLL3OVprobSnZc=;
        b=WcgQoZMSV/a0eQ9pzfFJS6PJOkUq4BOxRnUsYi1tODvQhCM6XAVIzZ656d7dRAo45m
         jkaqVR41zmD3Evi/JdVzZeSvpsycq/g8HfPdXGdmzr9IHdZ4ZYUYgWDA35WIKSb8qs3K
         4GBwCIqYJvd3cfwJ5x7LEfjiVp+qyWH9wtr6wChbhNsNKvXjgYhh4zcK+vRgLQR26xTM
         vlUm34N7H5q/KUnatolWI/y9cmvYTiN/H/0GTnQrgx0ot2jx13y5wzrOogaDdd4VVVD4
         g0zGgYhpbxRwUZOUoELIh4LuhRgOf63m18hB+Av+4hLt4x54//xRNZQqSjygqbRAADne
         KPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679507534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wh4Z1xlqDztZUH1w7IbXNlkUYB0pflLL3OVprobSnZc=;
        b=cmsfs1nL8rQzsZLftxVxu7SyP9yzR51QiEnb8ic+5MTG9CMb2atZDfW3GHdcUTmnSB
         resmg01lvlZApM/T5pS3g491+8HvFq9R+G4JVEt9EunuxpLPFAlJDcJUglxPWu3zfSyt
         mk6pGnGpA3sGThzvC9yWTBG0gsitN15bO8A0nmtTUN6DbBw+oTSN33fn9ucGGaeaRga+
         DcxTJgvh0ichN0gsRM2F+39JU03yspAsxoi6cuR7OQVZONC5/P0JqHnV+GQPyRflCfPR
         sSowAqgpzHai0ihlCWCqbzBUHlB0mvSzkHbQbTdBhqcX0Tr0Xu6Mn8rcP3f4Bb1xId9N
         Oigg==
X-Gm-Message-State: AO0yUKXJLJu3xN9cHucIG6O1+cFNGPIAwBRvR1qOCNilYbKNh28D+NEK
        ezNk7Hxi/s9FHUr7f8Ys3irJ9V/30XL98BzPcZ0=
X-Google-Smtp-Source: AK7set/w/Af4r7ZkWY5/EYuLO7gRu4DNAGQ4mEA4NNMEcc/QIJ5nDOUWk6vdiJaM+ZJYjQJK7+8P1Q==
X-Received: by 2002:aa7:c053:0:b0:4fc:6475:d249 with SMTP id k19-20020aa7c053000000b004fc6475d249mr6466295edo.3.1679507534645;
        Wed, 22 Mar 2023 10:52:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id t22-20020a50d716000000b004af6163f845sm8115519edi.28.2023.03.22.10.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:52:14 -0700 (PDT)
Message-ID: <2087e394-afa6-f1c0-cfc1-df382b2d13d3@linaro.org>
Date:   Wed, 22 Mar 2023 18:52:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: clock: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20230322173549.3972106-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322173549.3972106-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/03/2023 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

