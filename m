Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F83DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Jun 2022 09:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235723AbiFHJ5m (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Jun 2022 05:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235717AbiFHJ51 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 05:57:27 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F3715C89F
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Jun 2022 02:30:03 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id h23so29183888ejj.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jun 2022 02:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5OSQTqUpVQqGdtiWsQiVzCNGN/W+6rXCSBNE12Fte78=;
        b=enw+NAUpYeQlR6hfdS6xQpRkqLghi6Z2iYYF2YW+inYhh6MXxx9ps2oboBmw7sVEaJ
         0Mm50RUaA2kKP4rEFFIkDypeMAPgiSRifYJiTO6UfFGqAVDtF510NJmQco/zdGYMrpt8
         P4W9osQMjyrRrhHw8bE/7fUsJ35fRglmf5U6JjyJJYqA/Iix9L53C0zF/KO3yMC7dZH2
         9cS6XaOgTZGDQw+iegdG0lnsyzIdjsMEzbBw6RGqT9IfmFXE9bcg6U7Ay4T1+xU8Sgbg
         uqyDXRmd3nCM1nm2XObVyaU40A9z1m+U2qcV/fdQAqE0d6MF6ISUaupq7c98IUFaFGOb
         eMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5OSQTqUpVQqGdtiWsQiVzCNGN/W+6rXCSBNE12Fte78=;
        b=R3dljd7puRNAh5BsbZ7PNlgP9RZq0fvGRxAOu3Qi+9jg5tiM/aqbiS8kBs+0eD8EiA
         8uq7ojSPmBvBCh72SzsjeHSapQHKeI+vT2U+uohwhctwT1JdZGCpK2XSqdvV76pSNqtE
         7JrUGXjm5zMUo7lPl/l1ml2rLEj8ZJ+LHfVpUQt8TrWB3S4nlTR5bWsp3YJdXbnAnBeu
         DpzZGO0sGzOo9uw8LL/Bi612Z+NOtwmM/he83KdH7M20PWdX3+cA5fX6+QmhndzPc0Vw
         lyCtxDmmLjYWFNwPvtBzOrCX23LyaHRnyXpkvk6EToxSsEaPflXlmeUlK5l/Nwr37abk
         QoFQ==
X-Gm-Message-State: AOAM533kt0u/8p8eOUYfX4137aA9RSXUdHdYIAN6yejg2BUNFo9lSSgS
        mZ9dV3t9fPiAM2ZfNhCVKoenuvKX2g8HAw==
X-Google-Smtp-Source: ABdhPJzdM9jQq7Knm4/sB2ExOoHBLPfrsf5VDhDvQZsiispnrNYZsvuDkJKUdXzIVPgg30O3pT7bMg==
X-Received: by 2002:a17:907:868f:b0:702:f865:55de with SMTP id qa15-20020a170907868f00b00702f86555demr30709192ejc.24.1654680601876;
        Wed, 08 Jun 2022 02:30:01 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7c698000000b0042bb229e81esm11830571edq.15.2022.06.08.02.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 02:30:01 -0700 (PDT)
Message-ID: <3c9abbcf-086b-07ab-2638-cd25fa9f329b@linaro.org>
Date:   Wed, 8 Jun 2022 11:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH][next] spi: s3c64xx: Fix spelling mistake "hannel" ->
 "channel"
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220608081912.2083086-1-colin.i.king@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220608081912.2083086-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/06/2022 10:19, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
