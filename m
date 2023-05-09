Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE2DC7EE25
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 May 2023 17:43:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234702AbjEIRnF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 May 2023 13:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234670AbjEIRnA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 May 2023 13:43:00 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDA844BC
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 May 2023 10:42:56 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-965d73eb65fso936214766b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 May 2023 10:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683654174; x=1686246174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+6CqfpUOuhBdIMyw09BZEvQUMlZ2hFOGBcV2c6lnR3A=;
        b=AjEyzOVffRUiFWnLDBmNtDe/ucBYt/5khszFHw6tm/dbF0kF3yzZgDjNA7WDufb08B
         uzBy9ZyTRlDCm7YRIi8rcQWsUH7AaZCYDQUon7B1p9b+WAg86sk5zRyPGwCWdNiBR9vG
         4J6STzl4OmM1bvOBmyOdfigRKfVsoa9lpD4eoMDeM0qU6Y4VRnkyvVpjM6TXtGNz2Lzd
         38dlZmByEUfHcyaZ9bG1lwe8TP4cp7Mi4jn4eXkR9fSIuUclx8PW+Wo+m5XfQg8qmn/I
         tsOBOl/zE6tghsvD+kr1FZgTsDjA+hbYVRXl0yAt7YcEP0sU4rkwuoq8GntYvtDRB0AS
         JjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683654174; x=1686246174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6CqfpUOuhBdIMyw09BZEvQUMlZ2hFOGBcV2c6lnR3A=;
        b=jTWnRr+ATwDaM5Hs0FBgVlWAsL56nssj01aaA+e3TG9/hypXi8Jt6GEvZqjNIGlEUH
         mLQZBpuvOkLvJ98SMTilBk1sa7GA/lFUAKeFzJQkvk3wOJCNTAwgJs1t8LlMe3YeskCt
         9py6NUfBXKRhmswy9N3+qs30PfZ6Udn1nf3+GrlWsJIIYnLH9C7Hi49u8dXtWhfwLjRk
         TdRAIu+0SR5BoiydBoaVE+PEgO7Eq1YRx7r5lJlyme4I2deWkWKJuvgy3rLKPxQ4fp9X
         9OivKsrzhoudMv8D7+O2Gijf4Hz5JEuv6Oa5CikmshQUZ90ISSH0G07L0SHq1mACs737
         mqBg==
X-Gm-Message-State: AC+VfDzwmMHRoOJE3iDOOO94p8XtFP/6Po+Pr7YliD8z2Y2g2Wz6EzY7
        sxyWP+mgpSYWIIqw6cgptiuo0w==
X-Google-Smtp-Source: ACHHUZ5BzzC72uJ14K+MspznYU/rIVE1+W55VLdtM401cMlKeEaJ5ckngVP1kmYaHsBg4uUNYt4FlA==
X-Received: by 2002:a17:907:72cc:b0:969:9118:a98f with SMTP id du12-20020a17090772cc00b009699118a98fmr4852570ejc.10.1683654174473;
        Tue, 09 May 2023 10:42:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id 13-20020a170906300d00b009659cdb2f98sm1574510ejz.23.2023.05.09.10.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 10:42:53 -0700 (PDT)
Message-ID: <193f3489-4937-6d4a-2466-a67d335ac37c@linaro.org>
Date:   Tue, 9 May 2023 19:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 08/13] Revert "phy: Remove SOC_EXYNOS4212 dep. from
 PHY_EXYNOS4X12_USB"
Content-Language: en-US
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230501195525.6268-1-aweber.kernel@gmail.com>
 <20230501195525.6268-9-aweber.kernel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501195525.6268-9-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/05/2023 21:55, Artur Weber wrote:
> Support for the Exynos4212 SoC was originally dropped as there were
> no boards using it. We will be adding a device that uses it, so add
> it back.
> 
> This reverts commit fee7e1d50c6e6da1d99035181ba5a5c88f5bb526.

Subject:
phy: Revert "phy: Remove SOC_EXYNOS4212 dep. from PHY_EXYNOS4X12_USB"

I assume this will go via phy tree. If not, let me know.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

