Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D5ACCA473
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Jun 2022 09:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234050AbiF0JhJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Jun 2022 05:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234053AbiF0JhF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Jun 2022 05:37:05 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C67D63F2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 02:37:04 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id c65so12118645edf.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 02:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=w0aW5XU24CXUQJUKLfDtXpZjwGGEf6KSE77Jnc5qpBU=;
        b=nXS+aFmrsby8Ftcq5F07OREp5Dm5dO2fQEaKGhRu6Hnn31Oi6+DgEZ7T9BYYY3kuoZ
         cK+yYYFBKL9X6KYDkUgbvL1RQz7nhEc1lJ+7IK5zsWVCS4ck+qkS2XDOn+P2WV9sIv7S
         nGONh1ApEf1fDj5EAUAHbFkBL7liKY9+Q/QF63VBD3lA3kX9rAYLOFTxIcIEHioxQr9l
         Xnl5Wj6GLUZJB75mnaEl9newrQc3bw/XxJXH7Jf6M7ZNnGhRXViecHIfknDF+pjuJR3H
         KMzyIkmU9aaIcZlndY6B5lxPrN3qGEXxL8YqWGXgbz2RwaYLaO/9ERVaDbvH1RTLZM8L
         lcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w0aW5XU24CXUQJUKLfDtXpZjwGGEf6KSE77Jnc5qpBU=;
        b=x2TdiZWEMYYl4VME0NxIDx5Z1EYY3P4B8jssT3ciLnIsxu5pYqyiFbSL0Z0xm1iCH2
         c4+8Zm+oqxkrTwRSpliesA+Z1E7wo2KCFqpmzRcmWnRt9nGtqgv/d1SfsAeJjTQ/Ya2T
         JMNgyWIDzH1Oti4DuF1QUri8Yw8bEsNPsxTIb+sAKT+Y5wtNnjszrFzOYypTmoX7xdIU
         UuS3mCOAGlRScrok/mSMc8faMZWMV6iqyyZ1t1WZN0Op7ucHhANRAhLgPwvHcBrmFkjg
         9rItRYGjghUbf4gKzt5LwZ7quneWO91GPAUHn/XZaltEAUx6PS79oNp7z82UYgZFf8Qg
         eDqw==
X-Gm-Message-State: AJIora8YeMHQgfOdv0lsKO6rG6gjp7pehQJBvLdIzMMY9U3yP9UkhYC3
        MEndUvQ7eBnoST5Jo9NbePogNA==
X-Google-Smtp-Source: AGRyM1s43gV+0w1Q+pYZSeB2L/MkEkiDZaFrvfXc5F2tuI0PjRVd6jRNQPdw8UXxCXGM/cxv9dgUVA==
X-Received: by 2002:a05:6402:4408:b0:435:9ed2:9be with SMTP id y8-20020a056402440800b004359ed209bemr14937052eda.81.1656322623202;
        Mon, 27 Jun 2022 02:37:03 -0700 (PDT)
Received: from [192.168.0.247] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f15-20020a1709062c4f00b007081282cbd8sm4827026ejh.76.2022.06.27.02.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 02:37:02 -0700 (PDT)
Message-ID: <3e068305-4570-f970-ab00-d4397afc88bd@linaro.org>
Date:   Mon, 27 Jun 2022 11:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/5] spi: spi-s3c64xx: increase MAX_SPI_PORTS to 12
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220627064707.138883-1-chanho61.park@samsung.com>
 <CGME20220627064931epcas2p4d90034c1fe583a3460f0e4613e83e6d0@epcas2p4.samsung.com>
 <20220627064707.138883-2-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627064707.138883-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27/06/2022 08:47, Chanho Park wrote:
> For exynosautov9 SoC, the spi can be supported up to 12.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/spi/spi-s3c64xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This should be squashed with patch #5 which actually makes use of it.

Best regards,
Krzysztof
