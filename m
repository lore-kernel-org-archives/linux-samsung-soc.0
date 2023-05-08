Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D59BC77B7F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 May 2023 17:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233639AbjEHREY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 May 2023 13:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232924AbjEHREX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 May 2023 13:04:23 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738006A44
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 May 2023 10:04:21 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9660af2499dso533832766b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 May 2023 10:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683565460; x=1686157460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ej8Cl/bF1nbl8GpZJTySPQPuwcgnmlo+jQKwUKSUvZA=;
        b=r7EPeqof4mBuU1WFZf0gDWum3vaTzAD3jWy0XpBhYtOwrVSehyQ1IsW42M/GYuCtCM
         8ptTkpxtzK+vbdJNS9hGM0A0QSVyulgUYxs02szmcYTrHB7rrSe3t7W8SJ10sWEN200C
         hEKUNJFY2co6NzuoBopGWFKL0Y30c1khNtyIH28EHPvTiAeXcU9JYjoTmrj7BE5eEuY6
         vLHGz6wFnQZozu1Yi1AnwUg/oC2OHOxih29v9fWxGzhvhSwBZ6jqOasjdeIPLaQ2g/NZ
         CMbAzoaxsN9nyP0vub/R4Ntsp/nXt6IHvyTLNzqTKoOX290dFlMRusWFyy3LzKzbxkEd
         lMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683565460; x=1686157460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ej8Cl/bF1nbl8GpZJTySPQPuwcgnmlo+jQKwUKSUvZA=;
        b=F0pIAgmGWYC4gBpQwmz2TOwKQV6YYzsZS9jz8VyK+tz0AF6gAqS06A/5XpbFVF/a88
         hJX0V9fcqKLHQdMmVT1uakHnpTDdvQ2Qiz+5YKZpX2tg/UW5YuqWqL5tjjpWq1Sl9JwG
         ujNIWf2E0M0ObHkpCIOT6Ef5Rn/pLx5sY9S9rctKorI9Nk9wplcvee7hJOb+7SFLMazY
         37DqewPfM2GwD0/GBiVIsxl6G0MEgzfIXxsHkjKRrFZmdL3vo7p/S29jQF8C3jPMSM1l
         gQHFXlgMvjHMsnS7UYSccidYIwidLM5EIZ02RyB0i7wGIapkki5Kt8CZ1BYk8HdNArpd
         y4Gw==
X-Gm-Message-State: AC+VfDzTVKeHExTkA8bw86qkN6kcvDNqCpJ0vr+/gbgKOvlfbfF0q+P5
        kC+16FLjbn5mQiQlNv67fvxl+A==
X-Google-Smtp-Source: ACHHUZ6BLPue72UTZn75Hs/6FfgBOYFsVsaf/MGizPvMiUFhBN09qKBGCiQfStnm00r6xbBhKrXACA==
X-Received: by 2002:a17:907:d86:b0:953:42c0:86e7 with SMTP id go6-20020a1709070d8600b0095342c086e7mr9202958ejc.4.1683565459829;
        Mon, 08 May 2023 10:04:19 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id lh2-20020a170906f8c200b00965b7bf6aa5sm206862ejb.52.2023.05.08.10.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 10:04:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: drop simple-bus from FIMC in Exynos4
Date:   Mon,  8 May 2023 19:04:12 +0200
Message-Id: <168356544396.281925.14615202661929229703.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207193254.550236-1-krzysztof.kozlowski@linaro.org>
References: <20230207193254.550236-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Tue, 07 Feb 2023 20:32:53 +0100, Krzysztof Kozlowski wrote:
> The FIMC camera node wrapper is not a bus, so using simple-bus fallback
> compatible just to instantiate its children nodes was never correct.
> Dropping simple-bus node fixes warnings:
> 
>   exynos4210-smdkv310.dtb: camera: $nodename:0: 'camera' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
> 
> The change is not backwards compatible and expects the FIMC driver to
> populate its children.
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: exynos: drop simple-bus from FIMC in Exynos4
      https://git.kernel.org/krzk/linux/c/a1ca56099819f4b2c52bfe23b7be13b0d53a2a4a
[2/2] ARM: dts: s5pv210: drop simple-bus from FIMC
      https://git.kernel.org/krzk/linux/c/0070e0fcc522aebe2461714074f7637cab70e688

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
