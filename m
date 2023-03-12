Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D13C6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 17:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjCLRDn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 13:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbjCLRDi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 13:03:38 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10295212AF
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:03:31 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id s11so39736516edy.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678640609;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sb23CZmLMpQIKautcfOtvCOr/nEk73NUljHh8CGjn+8=;
        b=vojrjS4nvWtK4Bwi52nMdMjmrkLHtZzOnVt5bQ8mjdaCgdTbH/54VnLn1/031Uxj9f
         lBtKmykmp0ZF1DG2YuNi/RSdi1CO+W7RWWYNcoECvBo0mMLGlkbvwQv+nXUQ6TIuFqdw
         +9ES/hlmMdauDGNP/sjHBPL3IktSZM4/X177HWYxI5IQ0SPky78q+RTQmN+QlDMrqq8v
         7Y04/ZxoSa7iDUJA7qmo8t4S8jyjzZOxmxgI4zW2Ph4kmc3t8mmxQ1XMPw23jYl/oJHH
         FQIAtxxzNmVvsYnt8kZfI1zcBbGRJbuALegL31VBFe6Mm4AMmySuprASR0Y1iimCuMAb
         Sztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678640609;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sb23CZmLMpQIKautcfOtvCOr/nEk73NUljHh8CGjn+8=;
        b=y8KL0idx0r0RkgAf1OOCAGP5dMbhMG6I6FgM2zsuWUhNwsjZNR7hihFTEtAFL7remc
         q9fCgmLJogm8iqtVFAox3USFwof0k+EvJOCpvvrlruFv4F7WKO1t3KheY6LmI/gD+7O2
         K9M750GGC8urdNmVyR7kYoT9d+WDgBltWKfqrYxYOcmXbxEZXjMTniroAVKh8FdCj8M/
         udSUmlnx3Up0baJPjotdNPdrzhfDljAHQ7CkSgevZz/dKfuAkkvNQFA+WNgmicKC+xWK
         puXW5qlrd0Zrs0+N+QhXvp2emMInVp5vp6PUm31xTNbHlz4yPLP/Q5BsrKKpKCFaFhUk
         e/Eg==
X-Gm-Message-State: AO0yUKXedVJnKkuX3e+LQNwZ8nFeeL/4qoE/QA20bA08c0+AwH3SAsuh
        s2kXmoKVZJJ7vtBNKhl7RfcUmQ==
X-Google-Smtp-Source: AK7set/+EAadHkg/X++PpHf3W9hnABrYPPySwyx5evVFobSq+Tn7ulCFd434kt/CZ6saMByfp7Dp1Q==
X-Received: by 2002:a17:907:320b:b0:91d:9745:407a with SMTP id xg11-20020a170907320b00b0091d9745407amr8604167ejb.14.1678640609455;
        Sun, 12 Mar 2023 10:03:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id t16-20020a1709063e5000b0092435626c0asm1308055eji.29.2023.03.12.10.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 10:03:29 -0700 (PDT)
Message-ID: <77e484df-711e-abe7-cb4f-b6db6f3c228a@linaro.org>
Date:   Sun, 12 Mar 2023 18:03:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/7] media: dt-bindings: Convert Samsung SoC Camera to
 DT schema
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20230216142204.48394-1-krzysztof.kozlowski@linaro.org>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230216142204.48394-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/02/2023 15:21, Krzysztof Kozlowski wrote:
> Hi,
> 
> The patchset depends on:
> https://lore.kernel.org/all/20230207205834.673163-1-krzysztof.kozlowski@linaro.org/
> 
> Changes since v2
> ================
> 1. Move size-cells next to address-cells.
> 2. Drop dead/debug code.
> 3. Add Rb tags.

Mauro,
Any comments here? Can you pick the set up?

Best regards,
Krzysztof

