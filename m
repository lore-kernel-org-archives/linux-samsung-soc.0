Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6980FC4167B
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 09:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236529AbiCGJYL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 04:24:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237249AbiCGJXg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 04:23:36 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E6866AE9
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 01:22:12 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id u10so20500789wra.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 01:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TzLMm8d5/5RhTE3DYDsmUp6D8X8Ydwg5/r6Fi48udB8=;
        b=QgeD1W69kNSsFj6i3XGdU7D+hth1glWGCqT4P7Vm0wMB4RPSONn5E/Iwpqq7CO0qbt
         BHq4ZYSB3XEASxpnrq2urNEdVYZt7F0JaYDdV+dZ5n11Ab055gxPWK2WTZgWKWadI4YJ
         XsB3konkMeFniH33UHxIECdGh6R0l89qgA2pERzu8DTW+y5VOXwOqJayevO9VLfYrxWZ
         utuhocvMHNQ17tIUFL/30DyxhZcJ/2tddzKOb5pvY9frgDRNZY8Bd2j3lncNsL94VvQv
         Bt6ewUUVH/jDC1hx/Pl7O9mOimjwGYnLRnJQeB+VQZstjvfC7VnFr+42bsyu+I4vd0rp
         QiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TzLMm8d5/5RhTE3DYDsmUp6D8X8Ydwg5/r6Fi48udB8=;
        b=QZUNfdCU+Mo4lXwDfkaATP8isnlATAGuElzVQM1WryMFlUNA55qZOfHKqFfCwEhxBA
         b5eb5WP+RWVmladwv0s6F8FeRGDsBH6FShgNtPY5cvm6nuPCDf/XSqlqnqkCpyLh2gxX
         VRo6iT3FDyvSTjqReswPE4zG3QExpz2iJRMumwsB18jcEdMOS4qLjpWcI1JYjXMfzMVM
         d3P833mKT/NQsqAirThUbtx/JlckeVX5yHaAZg68rUV9T5Wglik4E5clrcj0wOTrxsmK
         Sz7WROkR8etvmivdB5mIp/Fi/GQ+o0CYwPuMH+p33Q9831rovnecZs0px7+0n+siW9Cd
         Falg==
X-Gm-Message-State: AOAM533A+JDi+PZXFQur/W7inWj8CE+rhOji8xsXGBWHOtreXR51TM7A
        mLJc/pWsQ+aovRzttmpyQa0mYi4gMXEPxw==
X-Google-Smtp-Source: ABdhPJz4EFu0SE80BY7+ikiCREJ1pMzmlDCfMLmycAfsArDTW2sXSNoBB0FYUyjw+lidQB23WvmTpg==
X-Received: by 2002:adf:f150:0:b0:1f0:6925:722 with SMTP id y16-20020adff150000000b001f069250722mr7237824wro.465.1646644930760;
        Mon, 07 Mar 2022 01:22:10 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdd52000000b001f04e9f215fsm10449523wrm.53.2022.03.07.01.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 01:22:10 -0800 (PST)
Date:   Mon, 7 Mar 2022 09:22:08 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v6 3/4] mfd: dt-bindings: google,cros-ec: fix indentation
 in example
Message-ID: <YiXOwFvDIvrB0t2E@google.com>
References: <20220124082347.32747-1-krzysztof.kozlowski@canonical.com>
 <20220124082347.32747-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124082347.32747-4-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 24 Jan 2022, Krzysztof Kozlowski wrote:

> Correct level of indentation in the example.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
