Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18F6C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 14:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351370AbiEDOjo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 10:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351367AbiEDOjm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 10:39:42 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C2361FA62
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:36:06 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id m20so3252614ejj.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 07:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cj69kNdAT7OJwjP0WHM+y9peSYHjMZ4LxSkgoQoMKUA=;
        b=zK42u34VPnfyOxNhk0iqW1afDz26ADZdXdU0SxIaaQ0lpRluVgjjHagB1by/sFC4lz
         5V0mBiQ2lj7qMK/8ZPHX/xpDsbj+FSe2kOquvY5NemqTn6w0gzPVbzNgvlxT5HbdBNir
         FuxyuSSvqevxRI2JCt7OdQfRKxvYr4yEu1j3wrDj+rhCMy/vGmxWxMHMcBRlyFtm1FzK
         +uz0kJgUonEZDT9eyIk6v4OCzQjtFTsTHBG5195Mv9RkpRmKaATvWyQ3iNFuhxOS5ey6
         oy9lrNz9FBCWPlRcLwaeRVeKSmV9w+4wmMOn4vMg+I+uDYbd5mUvOmVrQ0cGbzMd+09E
         c9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cj69kNdAT7OJwjP0WHM+y9peSYHjMZ4LxSkgoQoMKUA=;
        b=jEDmHnSSKvOiVToZY7uv+XlDiFzLzakbleKhKZJ8SJ3f3tjHg0JWmM/pdWOM533GCz
         PMQPyybs1AvoW18h31zeNj35W8Cm4Zju2+Itb8zWVydYFVDb3pSxPki/4iGj22ACApsO
         5+rSSW6pa4cpF6of1eifwG/RcwojjS1oc6h6ranHcF0JdmramL4rsLf6YagsrbW2zgwA
         m+d1LvSzDMKoWgbnQUmyYstgAHzdYkbpGnycprLHTKEPw0ULQYQUgmEvXZ/+Ket5G4Dh
         zcTYOHNCPrahNa3vexYOlomEqGRW+aUktBm8yTNb2PFtrIg1CdBMgUyYXoawg/MdClCT
         4G+g==
X-Gm-Message-State: AOAM530a42v/Uy9UOrU6OaLfRr/fMrMuSgy0iNw43F8MwotyH9ctAA7u
        8H/T5P4MPm72//pPNsIcoD8Kcg==
X-Google-Smtp-Source: ABdhPJxQRGZdea5mQfD5avwlShqAqmOmyPxL439jtXkShSOrhV1tuSBLhDjdR0/HQUsIL2+ptx5+Wg==
X-Received: by 2002:a17:906:9b94:b0:6f3:fd8d:8a00 with SMTP id dd20-20020a1709069b9400b006f3fd8d8a00mr20342963ejc.90.1651674964733;
        Wed, 04 May 2022 07:36:04 -0700 (PDT)
Received: from [192.168.0.215] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h14-20020a1709070b0e00b006f3ef214db9sm5741551ejl.31.2022.05.04.07.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 07:36:04 -0700 (PDT)
Message-ID: <4f6bfca2-4591-af7c-4a65-f8b0b59d8076@linaro.org>
Date:   Wed, 4 May 2022 16:36:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: add clock binding
 definitions for Exynos Auto v9
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220504075154.58819-1-chanho61.park@samsung.com>
 <CGME20220504075003epcas2p3708d1853dae290bc42cfacd318767c8d@epcas2p3.samsung.com>
 <20220504075154.58819-2-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220504075154.58819-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/05/2022 09:51, Chanho Park wrote:
> Add device tree clock binding definitions for below CMU blocks.
> 
> - CMU_TOP
> - CMU_BUSMC
> - CMU_CORE
> - CMU_FYS2
> - CMU_PERIC0 / C1
> - CMU_PERIS
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../dt-bindings/clock/samsung,exynosautov9.h  | 299 ++++++++++++++++++

Hi Sylwester,

If I am to apply the DTS, which uses this header, I would need to take
it via my tree and send you a pull request with it.

Otherwise the DTS would need to be modified to have workaround-defines
for missing header.

Best regards,
Krzysztof
