Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493A7C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Dec 2021 09:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233938AbhLGJgN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Dec 2021 04:36:13 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36534
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233765AbhLGJgM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 04:36:12 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 52B754003E
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Dec 2021 09:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638869561;
        bh=T6+9s82eszvtvdECt4LjIhYDKx4D2t9XfbY0joue/Fo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Jm/Hyhx5pGgs/QGzfTB/OsnrNBMqsQU9++qLk3/KoWnoQ4UHRZLulY0Mk3AiPqjmq
         smFLibq2s9roLJVdkjNgDZ4eYO2c9YFNdfCMrO7YRZUBtr0ZIu/mledv+VMGjtwGsy
         fGlNzPB/2wK6CoW8CJKxwvp3yGROf0c4VWEfjoWuZ2OJxzL7lTuBtnCchc06T8Md+2
         0eHrN5jH+dNzzVDyxGP6RoJPIhNOjmv2oCrtw4WTa3Qg1nj6gei2ttffpOKJlcPFQ7
         1a0gxN1vu9U4dVYCXQQXdW39961opiE42Xw901EkT5iuixKg4Y26RGOhXOOvbrrr4H
         fPIytuhbIPv+w==
Received: by mail-lf1-f69.google.com with SMTP id f15-20020a056512228f00b004037c0ab223so5091558lfu.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Dec 2021 01:32:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T6+9s82eszvtvdECt4LjIhYDKx4D2t9XfbY0joue/Fo=;
        b=Hm42NCY7GhcWlve/3GXhYudxDVJx8Ipwy9JhLzIw8zRZZMICyKhPvEuUx+DKqBd2BO
         1Z/egxdhJsBDwF6PvqCc0RTZK2AIxk6RhBJzS9+RI9on4pjE3vcCklMJolCL5uaFdsW3
         wHp9YNGluwaPshbQChXD6S1w319uP5ALdtks/LmWKXtDtgQMuhuAurQg2vNm7LCnsT00
         fh+WtV9UjRfY4xI34n+6568UZOMe0ObpsqASGGWDHzLix+gubnJd+ZDAKw3jAMvW4b7k
         00fQaMuD+dq6XeHAgQ7PBYxUtuJYJDsHvemnNYt0y3jvvmzsGhS+Ln09rdebnE+k4Z9K
         bwjg==
X-Gm-Message-State: AOAM532vR/K3+oheynFng84DO6YDc5q0vbDsgKDGPDr7g/N/K/XcgYxN
        svsM4wpT2tU5c19WBnQ3cwGQBNpVj/VXaP/y9BxNPruC+RTpIbR0hwgnCuH35XaU2R0FIIqM7p4
        6cxM5MD2YcK60WkuD+5t2fnrgJVNMLXkaWaZTsl1ZNDkxa6/B
X-Received: by 2002:a2e:994a:: with SMTP id r10mr41066368ljj.301.1638869560737;
        Tue, 07 Dec 2021 01:32:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKyBwQ35QuPUmJsbOyAfvODA2PllK81Af6yVKERMwFTiAYBejXq04Tp3ARzZKlv7wtY5zCdQ==
X-Received: by 2002:a2e:994a:: with SMTP id r10mr41066327ljj.301.1638869560444;
        Tue, 07 Dec 2021 01:32:40 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l5sm1553374ljh.66.2021.12.07.01.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 01:32:39 -0800 (PST)
Message-ID: <f2f2a084-9362-db44-27e9-19b54d350775@canonical.com>
Date:   Tue, 7 Dec 2021 10:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 4/7] clk: samsung: Make exynos850_register_cmu shared
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
 <20211206153124.427102-5-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211206153124.427102-5-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/12/2021 16:31, David Virag wrote:
> Rename exynos850_register_cmu to exynos_arm64_register_cmu and move it
> to a new file called "clk-exynos-arm64.c".
> 
> This should have no functional changes, but it will allow this code to
> be shared between other arm64 Exynos SoCs, like the Exynos7885 and
> possibly ExynosAuto V9.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - New patch
> 
> Changes in v3:
>   - Fix SPDX comment style in clk-exynos-arm64.h
> 
> Changes in v4:
>   - Fix missing headers but still remove of_address.h
>   - "__SAMSUNG_CLK_ARM64_H" -> "__CLK_EXYNOS_ARM64_H" in
>     clk-exynos-arm64.h everywhere (only the comment at the end had the
>     latter by accident)
> 
>  drivers/clk/samsung/Makefile           |  1 +
>  drivers/clk/samsung/clk-exynos-arm64.c | 94 ++++++++++++++++++++++++++
>  drivers/clk/samsung/clk-exynos-arm64.h | 20 ++++++
>  drivers/clk/samsung/clk-exynos850.c    | 88 ++----------------------
>  4 files changed, 119 insertions(+), 84 deletions(-)
>  create mode 100644 drivers/clk/samsung/clk-exynos-arm64.c
>  create mode 100644 drivers/clk/samsung/clk-exynos-arm64.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
