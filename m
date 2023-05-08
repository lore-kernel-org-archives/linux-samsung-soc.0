Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038F0C77B7F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 May 2023 17:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbjEHREi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 May 2023 13:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234166AbjEHREZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 May 2023 13:04:25 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A586F6A45
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 May 2023 10:04:23 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-956ff2399c9so903923666b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 May 2023 10:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683565462; x=1686157462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2cd1HKoe1xvHZvAaQyjCVVxtTdmPdHHIApQESUTdMA=;
        b=PgzQgJviuCoY/VSEKdyJmkIjv3LLFQa31PMU8KrfQVC33YfKagvGzrG6Yf4qyC3pO1
         /yHugDeIK2kbTBeWv61vYy5vFeSo8gkw51B2QHdCCK0oh/1XBm2COp1vk3v/s3eyBSNS
         iH1Dw2up9S5llqmcDEzGg/eody8zLGMVOhk3sbd2MnH4AVmlGQCJ4wcsoRi46FwFwJvs
         vR6/BgDvLTINdGYpF2XwyVg5nu2oBnRzKWEUrLHyW6+Bj1QteDBMwvaNA6k7eWubBQHU
         skyMOryO7pfwq3YqCGg+vbQnDJ2mhi/QRw8FfiFaHtjRVdRSXAGQVv/+oVyueOhmyDsq
         aECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683565462; x=1686157462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2cd1HKoe1xvHZvAaQyjCVVxtTdmPdHHIApQESUTdMA=;
        b=B4rK9HvguzNb8iJTIrdIokglzmFg02Cy5Mt/CNH2f6JqSt5OvgjeD0ueRa26I8v4cE
         aAte3NaUmpBEpDegebSy+8+Zt0fOXfU7oba4ntcXrY0LFh7bNduB2HC2/nTibUvgtz2T
         OqTd584005HxuP/5g6ugFKVc0OKiOiYkobbbcXr2L+/BJIuivySHp4rSib+a7N7owz0k
         pCFzfvh6BnejDvqEfEYZfOiA04jp/LUMVabbxCqwWZGksT20RS+0CI2anFunj8qBoVqB
         JkrkIK89dibrFY8p/lfhc+6Gu2MnzxCv00u0T3mgVe+FMC6m7YZ2TX6/1qxJqgvuzfSd
         P/9Q==
X-Gm-Message-State: AC+VfDy4yWlmbp7d92RbrpCpQvzrrjli45RPm7gsW4Jh+Sq2N8tRxKYV
        r68q39gmeUnRSm60RVBRfuC7Kw==
X-Google-Smtp-Source: ACHHUZ7W/UQrXAutwKs+cqlLFhoTiCfPqITKPtbKVlgL9z/ztRjbdxMbNWaNgOWyFrbaki6lXgGhpg==
X-Received: by 2002:a17:907:784:b0:94c:b183:bb6f with SMTP id xd4-20020a170907078400b0094cb183bb6fmr8444278ejb.18.1683565462225;
        Mon, 08 May 2023 10:04:22 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id lh2-20020a170906f8c200b00965b7bf6aa5sm206862ejb.52.2023.05.08.10.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 10:04:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/7] ARM: dts: exynos: Remove empty camera pinctrl configuration in Trats
Date:   Mon,  8 May 2023 19:04:14 +0200
Message-Id: <168356544396.281925.16991071694505725135.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207210020.677007-1-krzysztof.kozlowski@linaro.org>
References: <20230207210020.677007-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Tue, 07 Feb 2023 22:00:14 +0100, Krzysztof Kozlowski wrote:
> The camera's pinctrl configuration is simply empty and not effective.
> Remove it to fix dtbs_check warning:
> 
>   arch/arm/boot/dts/exynos4210-trats.dt.yaml: camera: pinctrl-0: True is not of type 'array'
> 
> 

Applied, thanks!

[1/7] ARM: dts: exynos: Remove empty camera pinctrl configuration in Trats
      https://git.kernel.org/krzk/linux/c/8a9e495b3a07e04a7d86d9c706a38e69863348ae

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
