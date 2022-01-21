Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558FBC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 Jan 2022 18:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382159AbiAUSeG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 Jan 2022 13:34:06 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56684
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1382149AbiAUSeG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jan 2022 13:34:06 -0500
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8219C3F17B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jan 2022 18:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642790045;
        bh=rzjVc/hzS//b68XON/N1yvKj2eAA333KRQ8cX3B1duk=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=TXXVsQ/WhKw9R8fKz/7n852J7+AeKHEc8IgxQFsMradbnWYiDm/h2SJ6Rd/iIeUos
         s2nWglAQwEiugQbk+RikrKxh2WwFMCThgZkbG2KXoOyS1tckmX2ls+LyLlzoGMlgUb
         RmtJePlDwRZ1D7ssBmLhbAdWH77cuFfH49P5E8+pJxDCm8OnF81/FFxSYsO1VIc6fF
         rOFs9Ltx7ZrHkCi8boRJtHqGn0yPGONXk8u+VhkJCCB/zYKhTEDsK8Lts6c0pi8xWM
         UCImsQJ9SqtctO0YZh0JG0lbfrkqIw+tHHWgoAyBWkBBFYSdnd8j92XmZInqEVMPIx
         +BM6Rm8XMXJ+g==
Received: by mail-ej1-f69.google.com with SMTP id r18-20020a17090609d200b006a6e943d09eso409639eje.20
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jan 2022 10:34:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rzjVc/hzS//b68XON/N1yvKj2eAA333KRQ8cX3B1duk=;
        b=xTlCQ14W483Wrxy0/gZZQq20lr6DjH0xJR8VaIY/r09mRKIwJ7auTuuZFCY8APZxHY
         Gu7QE8w0UqC7lSsgYUWAXb8d2+MR/xOYtouUBZLuqx7in5OHbxlIul2+oIYkvfzyUfO8
         xmlRiooDkw4B/W85tHSD7x7Zb2BtJjC5WLgCGcdtAlQphEe8ZJSv36RxELPcQwRc1b8D
         kcyrc2OHqxdjahoJqxgYbIfgTfecULbQO5WVgHKXCi4AblhbYSs9gZCzOc5g4KapGg/d
         almNyY7Svg7RthvpdnvflQnlsVLUWpEJ8zEMSOJJybhrCJ5XJaNHOIly+4aH302GcwdF
         qYfA==
X-Gm-Message-State: AOAM533sumNo0s8jMtr3fI6Y9uijcIkhzk/uUssi5Iy8Kti9n1lY0OPf
        A+T/yB1yDqplBBH0r3uunG1e0clmTd9LcwupRoxrMzMC2Kn31GZ0JSEj1aTtUITIwTxZKIcvZ5h
        lnuGsZXHch0T8nLbuQ47Lyb070T3bXiKRPOXvgjZ+ItJPn0FF
X-Received: by 2002:a17:906:17c6:: with SMTP id u6mr4264772eje.263.1642790045243;
        Fri, 21 Jan 2022 10:34:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFxrSulwwT1O8pILmYDkoX3mOFh5Ze91D39vMO/Ze+pPeAqAZF5qwP1SYFHjvCEaqXQxKq3g==
X-Received: by 2002:a17:906:17c6:: with SMTP id u6mr4264755eje.263.1642790045110;
        Fri, 21 Jan 2022 10:34:05 -0800 (PST)
Received: from [192.168.0.51] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id z18sm2249888ejb.112.2022.01.21.10.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jan 2022 10:34:04 -0800 (PST)
Message-ID: <5b90220f-c31d-cc8d-3e86-75ad8e56ab5e@canonical.com>
Date:   Fri, 21 Jan 2022 19:34:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 1/3] spi: dt-bindings: samsung: Add fsd spi compatible
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
        pankaj.dubey@samsung.com, broonie@kernel.org, andi@etezian.org,
        linux-spi@vger.kernel.org, linux-fsd@tesla.com,
        Adithya K V <adithya.kv@samsung.com>
References: <20220120192438.25555-1-alim.akhtar@samsung.com>
 <CGME20220120193613epcas5p238851849d212e01d7d830d78ca7d6379@epcas5p2.samsung.com>
 <20220120192438.25555-2-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220120192438.25555-2-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/01/2022 20:24, Alim Akhtar wrote:
> Adds spi controller dt-binding compatible information for
> Tesla Full Self-Driving (FSD) SoC.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Adithya K V <adithya.kv@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
