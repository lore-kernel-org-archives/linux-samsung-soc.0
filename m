Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D75CC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Nov 2022 19:24:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiKDTYB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Nov 2022 15:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiKDTXi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 15:23:38 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF30193F1
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Nov 2022 12:23:25 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id k2so3676989qkk.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Nov 2022 12:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hwx4i8kl3gAwulupSSsSkTjIChny3+b4UG2pCOA9J1M=;
        b=NWihxHTRWa7P5zAWtjlkyg2Vnu7KgSW/DAq99rTTsQv+FWpEqkQHsNv8lD5ZZ9y9Ji
         Q3LOosWuCXo1aT9A+WeLm0twlsu+DUIRj80oG7YCqVA9FHTvbvYsoGMWnm6t7mz+ykBZ
         PnwoHwsgEJTfKvGYfb/SsiQljzmT5hMmKACvnnzY9mYfTepTmoG/TNvyf0w/YEYPn1H8
         Gqa2MLN+Dz+72bDyzEUDjz34yb3vmM6MHFhKiKwYnIPWud5Q3euMqHPzGFrdrOHM/03H
         6C/fBFvQVnUfQkXKhqpIOzOAzjAPnAsoDF7cfmZoMy/a/tEH9AZkr5mJraDURAgp1yrY
         G4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hwx4i8kl3gAwulupSSsSkTjIChny3+b4UG2pCOA9J1M=;
        b=uEpwfv0+NY/P7K9UJ1Jg129u9lBXEDUflphP+8L6Ctgi2RfB9ZFuWL/bI9/kw/f/Ok
         BP6JleTj6+gYbqt03uYzRiksRiSA4zoM/o905Z8M/y/wqmrvYdSFttOVF1njktxrArJm
         83md6RfX01QEDKc8Dl39iQJPX2VzMLl7wNHV+DPclz6knpnezXyt1EIVu8I+7bTZ39k4
         X41tI4lw1nBqms7MPTndoIz39ly2BCbPsiMqcAafhPL+D7r3JmoJ7Njtf61pZEKUwESe
         3v7YlC/ec5Jpheoucv34n1UUMGQaxZenb8qqtPIQbOrh6W+kM0YzskKeF5O6ppz+NOUn
         gG1A==
X-Gm-Message-State: ACrzQf2J1yQlWShuYomwQcSQsgXKNI51MEpCzNxuy7jMgiERCU6fSpWh
        6iLl2tWroJnajtP7Af6sJVKxDg==
X-Google-Smtp-Source: AMsMyM63sQCJoLYWZE5iFa4ctJHidpSzagskhSlfSYHwmkvrA5KnZ60XMwDLlcNcUyRHhD3T6m0MMg==
X-Received: by 2002:a05:620a:404c:b0:6d9:4c49:9d5f with SMTP id i12-20020a05620a404c00b006d94c499d5fmr28032759qko.708.1667589804684;
        Fri, 04 Nov 2022 12:23:24 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id bq8-20020a05622a1c0800b003a4f435e381sm112870qtb.18.2022.11.04.12.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 12:23:23 -0700 (PDT)
Message-ID: <7fe8cb02-be1f-ecac-134d-b78e596d4140@linaro.org>
Date:   Fri, 4 Nov 2022 15:23:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: clock: exynosautov9: fix reference to
 CMU_FSYS1 mmc card clock
To:     Inbaraj <inbaraj.e@samsung.com>, krzysztof.kozlowski@linaro.org,
        s.nawrocki@samsung.com, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, alim.akhtar@samsung.com,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        chanho61.park@samsung.com
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pankaj.dubey@samsung.com
References: <CGME20221104085410epcas5p24d88f59001b739075e9e190e2c47841e@epcas5p2.samsung.com>
 <20221104090019.88387-1-inbaraj.e@samsung.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104090019.88387-1-inbaraj.e@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/11/2022 05:00, Inbaraj wrote:
> Fix reference to CMU_FSYS1 mmc card clock to gout clock instead of dout.
> 
> This fixes make dtbs_check warning as shown below:
> 
> arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: clock-controller@17040000:
> clock-names:2: 'dout_clkcmu_fsys1_mmc_card' was expected
> From schema: /home/inbaraj/mainline/linux/Documentation/devicetree/
> bindings/clock/samsung,exynosautov9-clock.yaml
> 
> Fixes: 4b6ec8d88623 ("dt-bindings: clock: exynosautov9: add schema for cmu_fsys0/1")
> Signed-off-by: Inbaraj <inbaraj.e@samsung.com>

One more comment - is Inbaraj your full legal name? Full name must be
used in From and Sob. Your email address has some additional "e", so I
wonder.

Best regards,
Krzysztof

