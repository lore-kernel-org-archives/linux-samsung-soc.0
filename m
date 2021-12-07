Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47F5C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Dec 2021 09:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233945AbhLGJgg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Dec 2021 04:36:36 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36590
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233215AbhLGJgf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 04:36:35 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 03D973F1F7
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Dec 2021 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638869585;
        bh=BEdVsoIuFxM799cTbQkXLyx5ca2h6q0N/IASsw9oLV4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=WJfpJf9yzKjRLd13tGz/qbf0vAw8krN5pm7AuyHUBNC7nuuPTL7E8n0YFnKi1OqA0
         zMaObJD4Ihm2VFCjhvux3wkCD0/qml6Amlc0+R2oWXowG4RxdW8FNKHKOr9YcmWf9u
         yCTnNPW0UOKhcC2v5GZUhHvghThQ1C5KteLw6EO2l9XbZrviGQGDzBQ6Iqm728QooT
         WjNViXFSbijmeeb8nv/uC7wVxhrvDjcWz8ugvaQM4zl0XdZ1ufuD3I4BeN5yZgmTMe
         zx4yKVeKdaIb8i7r8nRJOQfHfvaTfP6EdvSdKnDaS3BJFBr8XA2MHT7c85qUV3Gob3
         Adyb0+MgiHNJA==
Received: by mail-lf1-f70.google.com with SMTP id t9-20020a056512068900b00417ba105469so5078418lfe.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Dec 2021 01:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BEdVsoIuFxM799cTbQkXLyx5ca2h6q0N/IASsw9oLV4=;
        b=k+BNH1MdvXNcl4cde/mAnbAiric0ANc/O1J1tsOA4IccbfLuCegZ0vi4suwfeTF48v
         MRp6Cst4w5FOmuGMrPXX+IHm6gEffxxTMZcNQoEDRRXW66idPgH9FADPumQNr7EPyJrv
         3AmvWIwIi5iNJ5v0oKni4QrkempBXzO522riKGY+bCvaQjARhSGeYKsnHoQpeO0zIHqG
         LoUxShsvBcC0rG/vRF6tIdCUDqLu0VJpzaU8oE4rUMbvU0ckusD1bf+BnuXgpuIVsitX
         kqjZ4YVtjrjrUUmHeYX32rtt1BcKimX+OCicveaR9Shh7GSZMrXBvWdncH2HHRsr9ZPQ
         VCnA==
X-Gm-Message-State: AOAM530iKkx+Tp8+gO2BdqsXT1JsNrLP6nVBM+Jx3ew7znkIvLDl984V
        RLrMfxKzJeSTJqyCjjyepTYVasviwxS4TNQMNHs1epdK2JWryql9vczm1qVieXzCwfY6heYHmu1
        /zT9hdOdjBpuhfB707dpYf+1VvE7UtVak3LkBtEh5+1Gv05/n
X-Received: by 2002:ac2:4568:: with SMTP id k8mr39785446lfm.80.1638869584476;
        Tue, 07 Dec 2021 01:33:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJnVDk3iH40oUmSMxetPRxhkoJ0C7h06clV4jQucaTt6d1WFAgv+kKH51sPo13Jm0l9iRrdA==
X-Received: by 2002:ac2:4568:: with SMTP id k8mr39785427lfm.80.1638869584282;
        Tue, 07 Dec 2021 01:33:04 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l5sm1553513ljh.66.2021.12.07.01.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 01:33:03 -0800 (PST)
Message-ID: <314c4616-7151-f854-2ee4-9ab8d25ef0fb@canonical.com>
Date:   Tue, 7 Dec 2021 10:33:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 6/7] clk: samsung: Add initial Exynos7885 clock driver
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211206153124.427102-1-virag.david003@gmail.com>
 <20211206153124.427102-7-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211206153124.427102-7-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/12/2021 16:31, David Virag wrote:
> This is an initial implementation adding basic clocks, such as UART,
> USI, I2C, WDT, ect. and their parent clocks. It is heavily based on the
> Exynos850 clock driver at 'drivers/clk/samsung/clk-exynos850.c' which
> was made by Sam Protsenko, thus the copyright and author lines were
> kept.
> 
> Bus clocks are enabled by default as well to avoid hangs while trying to
> access CMU registers.
> 
> Only the parts of CMU_TOP needed for CMU_CORE and CMU_PERI, a bit of
> CMU_CORE, and most of CMU_PERI is implemented as of now.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - Use shared code between Exynos850 and 7885 clock drivers
>   - As the code that was from the Exynos850 clock driver was moved to
>     clk-exynos-arm64.c and what remains is mostly SoC specific data,
>     move the Linaro copyright and Sam Protsenko author lines there.
> 
> Changes in v3:
>   - Nothing
> 
> Changes in v4:
>   - Fixed missing headers
> 
>  drivers/clk/samsung/Makefile         |   1 +
>  drivers/clk/samsung/clk-exynos7885.c | 597 +++++++++++++++++++++++++++
>  2 files changed, 598 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos7885.c
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
