Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C424C83F16
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 26 Aug 2023 18:11:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbjHZSKn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 26 Aug 2023 14:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjHZSKZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 26 Aug 2023 14:10:25 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A0010F9
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Aug 2023 11:10:21 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso2723309a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Aug 2023 11:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693073420; x=1693678220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4QiagJfRx5PmjGMtP0dUi7DvNIVha/t7dHrhZvI83zo=;
        b=WsSgNBrqrlOgtnKRSmIfPV2pbGKqfKX1GCK0whPtAztjTVsT9PPs8OSoQxSvtsQJdF
         D5Ndk9sTCcE4q9tyc77eUdIr2fBshZGlNcx2yrwpIRoSa5lIcr5zPKfu4Y1JzN+ViqUZ
         1u359VPuql8fwxk3ebKBBU0lbyZ9VGWRruygvtu68RJjPWwa1MsUGw8XAGe5Ldpqdnss
         9Ji0wJJhYWa+b91DpYAPLpnJO4GvlfTzPA7vBd3t9DJBizJqxuqR6WweN51WddUOEmGC
         4Dm69tTgQpazyJ4CZNrryqIoUL0JIA0f8z+Acnw5snEqsp2PD/+IascZAwPD50xwewTz
         pndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693073420; x=1693678220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4QiagJfRx5PmjGMtP0dUi7DvNIVha/t7dHrhZvI83zo=;
        b=C+uWX/SYIYw7OK9MJk3tkoaS7acGckGpNsCdS4yXeLorztQdxM/Kw3fAdIiw09aVzz
         DCTlmyjwpP9Sx/wtfRPcw2+0ft0wA8LrRel1pnstJxnqnIA5vCEaxDHWrpestiKga6Qk
         p3345VwUy7jkeZCZ7VRGtecI/cB5O6RN0Rm8W+naazMsDAcaoqExrZoRce17kySH6dVy
         lktPxgljB59+dqUMmGyxYJBYRFgR/07ayqMKQypLeZnPI5ZLtW36USTHbgXavauAg8tV
         YrZhu5Y1LyGaqIONH++xdbayNdnp6zH2KRV7JrLValCtTfCW6cmbmpLFY4k0d0QaqrsX
         ySsQ==
X-Gm-Message-State: AOJu0Yxrwqo2iiNsGW+S5VFN9AgpqNkM128ctaaDBUurmk7KlaIlMkSH
        MgnZkuw1PZQ4fMErvCb2nG0kZw==
X-Google-Smtp-Source: AGHT+IEFWoVX8d9z28lL17g6Z+qe5o8zR28N7GoXPVvbRQc4gaGzV9XT5uFIFnm8ML7Ge9ve5Sb9tQ==
X-Received: by 2002:a17:906:1090:b0:99b:c8db:d92f with SMTP id u16-20020a170906109000b0099bc8dbd92fmr17059997eju.69.1693073420226;
        Sat, 26 Aug 2023 11:10:20 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906361600b00982cfe1fe5dsm2452697ejb.65.2023.08.26.11.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 11:10:19 -0700 (PDT)
Message-ID: <6fd3a9ab-667d-934b-f1c2-03776be93d4d@linaro.org>
Date:   Sat, 26 Aug 2023 20:10:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 0/2] arm64: dts: exynos: Enable USB for E850-96 board
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        JaeHun Jung <jh0801.jung@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230825215445.28309-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825215445.28309-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/08/2023 23:54, Sam Protsenko wrote:
> This patch series enables USB gadget, USB host and Ethernet support for
> E850-96 board. The most major change was done in USB PHY driver, as the
> register layout of PHY block in Exynos850 is very different from
> Exynos5 one.
> 
> Changes in v2:

Thank you for the patch. Looks good.
It is too late in the cycle for me to pick it up. I will take it after
the merge window.

Best regards,
Krzysztof

