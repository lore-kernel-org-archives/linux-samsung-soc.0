Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A1EC43217
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 Jan 2022 18:33:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382141AbiAUSdz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 Jan 2022 13:33:55 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56414
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1382145AbiAUSdx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jan 2022 13:33:53 -0500
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D7FFE4002A
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jan 2022 18:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642790032;
        bh=v1/ZmZoCSfUTZLAD5km6I/vpYxbMEROGRzZoW4u340I=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=KMPDuy10Yod7oilWVZ5zcFp5bGnvWqOi9A5Ql3hGBr7L6u2Xv589+aGY1EOhbgYvy
         witsPX2OWlSTc5Qigp7vEwG/Rwd4c/R2Gg9HTldLj9fRlOj+qcKyYhe0gj1iKKi5k3
         fnLCmHPRgYgoMLXFwbdGy9Aj16s9DWqJZJsXGhwlYuzSJcv99xgqh+WXrBQ5riLJ7B
         niZaIJC2K2buYfivAaRU/D3mreJoIPoOfzO810H2AxSermwSucKe1cnsAh275ZA+64
         0M8zAa7s9z12IU4dABrKSVViN5TaM9QjuiLSClRmLd5xs3MLaidEZpK320vbKFsvVV
         mFR36Y3MTtTvw==
Received: by mail-ej1-f71.google.com with SMTP id i21-20020a1709063c5500b006b4c7308c19so410253ejg.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jan 2022 10:33:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v1/ZmZoCSfUTZLAD5km6I/vpYxbMEROGRzZoW4u340I=;
        b=gxfRkB6SQqVbNxAxRnUpcp2KA2uUjd+OmIxm8oY13d7tfyU0OcWh5KOwY9CBpnq7c2
         0vualpZklra3E4qtHXitXAuOofKdVqeFqn9NPPBkXhrkR97xSdTDOX91JBIkAKcudQ/z
         qNkMdTU9QGUHJdAkecEbONFDsMA1zyAF46u7Kxe5uC/E20uDljh5R+yZRvWqrITRuJL2
         wBsUzAGZWIp+zPTFiwSvyCBBpdQx1gaJdOOW2UfjPMbKjvcVkVG7Ib293+q1/RR5r+Vp
         quRGn04W7X7MxmxKvE5+BTPjKdCCNqIFaVXFvcWcaL21Wuhath1+uL/5hG6Ow4+d5aZo
         urRA==
X-Gm-Message-State: AOAM530f9PRJ2O7GY6YQF/Da+ir5+16dcoWhvGo616dXH+nfXcj+M6gU
        YRKczxXcnRylJyifica8IHY/IYU/EVeczMt+2NxYbwTFR9VFM62463t/J+GLyeLD4l4i9AA7Q53
        UaJZleVDd/QunqvTxpcJTggkWnW+29745n8SbDmKiptYgz4+L
X-Received: by 2002:a17:907:94ce:: with SMTP id dn14mr4257058ejc.225.1642790030050;
        Fri, 21 Jan 2022 10:33:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUiLoCSnLbb+feIhIvxBFMattSryvmMTgY5adK0i09eglMEN/QYyW33qlmPPUw6iB1mJV4rA==
X-Received: by 2002:a17:907:94ce:: with SMTP id dn14mr4257044ejc.225.1642790029899;
        Fri, 21 Jan 2022 10:33:49 -0800 (PST)
Received: from [192.168.0.51] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id lf16sm2220182ejc.25.2022.01.21.10.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jan 2022 10:33:49 -0800 (PST)
Message-ID: <b11b8507-339b-2125-30e6-a927539d7825@canonical.com>
Date:   Fri, 21 Jan 2022 19:33:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 2/3] spi: s3c64xx: Add spi port configuration for Tesla
 FSD SoC
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
        pankaj.dubey@samsung.com, broonie@kernel.org, andi@etezian.org,
        linux-spi@vger.kernel.org, linux-fsd@tesla.com,
        Aswani Reddy <aswani.reddy@samsung.com>
References: <20220120192438.25555-1-alim.akhtar@samsung.com>
 <CGME20220120193618epcas5p45be1db500363072e647bf179623f8e7a@epcas5p4.samsung.com>
 <20220120192438.25555-3-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220120192438.25555-3-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/01/2022 20:24, Alim Akhtar wrote:
> Adds compatible and port configuration for spi controller
> for Tesla Full Self-Driving SoC.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/spi/spi-s3c64xx.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
