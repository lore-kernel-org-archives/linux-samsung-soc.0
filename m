Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B626C43217
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  9 Nov 2022 11:22:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbiKILWG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 9 Nov 2022 06:22:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbiKILV5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Nov 2022 06:21:57 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A1055A3
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Nov 2022 03:21:56 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id u11so25269145ljk.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Nov 2022 03:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCxYg4WgOjP/bm5a9BsDTG0c45MKZEsJG67lP9MsgSg=;
        b=HO+gw2fSW5E05U6Iq8JqzMRKLuM08uJDLhQRuJlxdr8dPesLMigBWgAyzAeExa/QeM
         nw0R5KrFXl+7T/GNrFhphNcbZaMhwSA3VB9Th1nj3R5wpJ6CcHE8rDHzETkHzHM0Oiwt
         in7VXNBFy/07Kz3EgHs7G0g0nZqONOpmfoGbGYOjZ3kVH55CNNAMH/bbX5ieNbd0Pqi9
         iuupt++I5YcAQlyePI7uickafZLUSSNtSPzpPb09dR/Xi5x3lBPgbm3CYeuBfvBGx6vL
         tkYQboJ0epeJoFCdNGZa3ThE7N8YaUG3rR4meKJAM5CPnNbbNrzqmAhmW0erUsceeqeb
         MRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCxYg4WgOjP/bm5a9BsDTG0c45MKZEsJG67lP9MsgSg=;
        b=zEZ52UIZkFQedou7lvuyt+mka6WlIa1BvQVFBV0rykP5Ka17/G6Lc2gAXLtDSqv4gE
         8Q2+Aelf+pUQa1kft+VDrYjiK2ekatuujiVaVJurYc5HeKB7wzj95Iui7acaYDiOQUBW
         Y9q8xmgNm4wuPJis4Tl8rAsSIiAXr9aY1BOGqNQF04poQUiAdQyE9o+dCwtnQZh7F812
         p+sHzd55JhS4x65fLHqYzVZI7gemZYgpWoOI3tu3Evqj3cdeDGt6QicfS/XPfmxjxLfw
         8xWL86FJP/Zp7nfoCReKpO3F2Qt041Jfx1bdFjcdF/6WAF4N+DNSgY1r1lWLx51nMd+x
         6ORw==
X-Gm-Message-State: ACrzQf2h8E+gitZif/llHI7+1cHQsl8epO/Lu/hmU/zwyXbtW1F/spkQ
        IFgRVKkWDEi2gJuUlh9fiJ5MHQ==
X-Google-Smtp-Source: AMsMyM5qV7jVeG2pPQIG8qp/abMPvu2TVr8VijShCi76V0U224nQCkI55e+QRkjLdIj+vRoGV2Cf7g==
X-Received: by 2002:a05:651c:2226:b0:277:4818:a1ca with SMTP id y38-20020a05651c222600b002774818a1camr7905330ljq.361.1667992914945;
        Wed, 09 Nov 2022 03:21:54 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id c6-20020ac25f66000000b0047f7722b73csm2187030lfc.142.2022.11.09.03.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 03:21:54 -0800 (PST)
Message-ID: <32240212-7460-9d37-8986-e7d3e34cb1b7@linaro.org>
Date:   Wed, 9 Nov 2022 12:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 6/6] arm64: dts: fsd: Add support for error correction
 code for message RAM
Content-Language: en-US
To:     Vivek Yadav <vivek.2311@samsung.com>, rcsekar@samsung.com,
        krzysztof.kozlowski+dt@linaro.org, wg@grandegger.com,
        mkl@pengutronix.de, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, pankaj.dubey@samsung.com,
        ravi.patel@samsung.com, alim.akhtar@samsung.com,
        linux-fsd@tesla.com, robh+dt@kernel.org
Cc:     linux-can@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        aswani.reddy@samsung.com, sriranjani.p@samsung.com
References: <20221109100928.109478-1-vivek.2311@samsung.com>
 <CGME20221109100309epcas5p4bc1ddd62048098d681ba8af8d35e2e73@epcas5p4.samsung.com>
 <20221109100928.109478-7-vivek.2311@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109100928.109478-7-vivek.2311@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/11/2022 11:09, Vivek Yadav wrote:
> Add mram-ecc-cfg property which indicates the error correction code config
> and enable the same for FSD platform.
> 
> In FSD, error correction code (ECC) is configured via PERIC SYSREG
> registers.
> 
> Signed-off-by: Chandrasekar R <rcsekar@samsung.com>
> Cc: devicetree@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Vivek Yadav <vivek.2311@samsung.com>
> ---

For net-folks: although the DTS patches are here as well, but they must
go via ARM SOC tree, so pick only network/can drivers and bindings when
they are ready.

Best regards,
Krzysztof

