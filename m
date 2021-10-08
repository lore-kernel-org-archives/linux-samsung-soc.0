Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D283C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 06:46:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E99C60238
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 06:46:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhJHGsl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 02:48:41 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51788
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231895AbhJHGsk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 02:48:40 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AA70E4001A
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 06:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633675604;
        bh=tV+7M+3749uq1FCdCB9Xz0P5iM22X/rCXdWu/eTEMvY=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=vuVq1fooYPogZi4oj8vV21pcb2DGBgBEvsed3WtrcVbZnRIjz2BVU52JKEFw06RX7
         /a4w2rNnYrIz/DJOs+aPsb5S+rRQcun80UoWQGrlL1N4JoaWBYh8xurb3+QPPyE/6Y
         rVTxpfE864xIbKnPBq+NwQYCdKvXvyG1tFOkQHIAwbYqrtz0AzwWWiILhw/usm165e
         j3aRlAFDKael0JEOAVxy8idhK9FTRzaq2s+agYiCi4pBM/XSj7Mj99CmNhQgpWA/vL
         h3QH71W58CU4zS4Dp+p4XCGKnAVhyGo48VBl3CCF9PPoOPDZIWCzLvZ+c5rTeYuauB
         WkcoXVR2WR/bg==
Received: by mail-wr1-f71.google.com with SMTP id f11-20020adfc98b000000b0015fedc2a8d4so6530192wrh.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Oct 2021 23:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tV+7M+3749uq1FCdCB9Xz0P5iM22X/rCXdWu/eTEMvY=;
        b=AZDCAwskwll6oFZPiQ7pyIMD5JDEt5WLiDGopiHiWYS6v58XN03VLRb3nzYJn+UvcH
         AdIUTYJr/0yy5mY5Zscg19bq/k0v/oNBVt92KCl9TEFKRk95njCad6aHUyfUoZGl2uHj
         AGB+ix28f0uuwVgMwr69fy4eQ9Jcf7pOstvXbSM7xruLa6hQlZpVbMEq7XM3Rkz3BtL/
         nsSCfCSRERkmx0ah5soohjGpLq6NOkBxQ8IJEGe4yt0xVnWo9vNTkxMhZbpfS79hhiEa
         2llkYCvSWESid5gICY5WG2QlCqdJ9M4HYA8NoWBiAr66qyIfBC+q3bwP7ez5AbexvLQ/
         dCGQ==
X-Gm-Message-State: AOAM533ZgpT5Q85zDXqB7zj8+4Doo7bTZ4sEFih8UK6jUHXMKrT7AYgp
        vo+oMkNqJNLIpBd+gLQc9epqS0PaIR/9ItP31jsvSLlSuQHUO64D71OAj6lGLnONbxLgv3No8Uq
        58OZaRUGiW/DNRqwPfnthiLY5Him+y/NNpzDPe0Kaq8gxMctq
X-Received: by 2002:adf:fe4e:: with SMTP id m14mr1797398wrs.14.1633675604155;
        Thu, 07 Oct 2021 23:46:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3BOUcmtFw3Bjgu6D37Q26E5qqcZd2Qentpsk296xnX+9N3jCG0wxVsZ0hEoAFzfyQGWbhyA==
X-Received: by 2002:adf:fe4e:: with SMTP id m14mr1797373wrs.14.1633675603999;
        Thu, 07 Oct 2021 23:46:43 -0700 (PDT)
Received: from [192.168.1.24] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id k9sm1462654wrz.22.2021.10.07.23.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 23:46:43 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] dt-bindings: clock: Document Exynos850 CMU
 bindings
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211007194113.10507-1-semen.protsenko@linaro.org>
 <20211007194113.10507-5-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <0befb3ab-cea8-ccd8-98f3-b05bfc6fb0f0@canonical.com>
Date:   Fri, 8 Oct 2021 08:46:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007194113.10507-5-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/10/2021 21:41, Sam Protsenko wrote:
> Provide dt-schema documentation for Exynos850 SoC clock controller.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
> Changes in v2:
>   - Dropped OSCCLK node declaration example
>   - Dropped UART node declaration example
>   - Added Ack tag by Chanwoo Choi
> 
>  .../clock/samsung,exynos850-clock.yaml        | 185 ++++++++++++++++++
>  1 file changed, 185 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> new file mode 100644
> index 000000000000..79202e6e6402
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> @@ -0,0 +1,185 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/samsung,exynos850-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos850 SoC clock controller
> +
> +maintainers:
> +  - Sam Protsenko <semen.protsenko@linaro.org>
> +  - Chanwoo Choi <cw00.choi@samsung.com>
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +  - Tomasz Figa <tomasz.figa@gmail.com>
> +
> +description: |
> +  Exynos850 clock controller is comprised of several CMU units, generating
> +  clocks for different domains. Those CMU units are modeled as separate device
> +  tree nodes, and might depend on each other. Root clocks in that clock tree are
> +  two external clocks:: OSCCLK (26 MHz) and RTCCLK (32768 Hz). Those external
> +  clocks must be defined as fixed-rate clocks in dts.
> +
> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
> +  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
> +
> +  Each clock is assigned an identifier and client nodes can use this identifier
> +  to specify the clock which they consume. All clocks that available for usage
> +  in clock consumer nodes are defined as preprocessor macros in
> +  'dt-bindings/clock/exynos850.h' header.
> +


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
