Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAEFC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 14:04:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44E1760C41
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 14:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234628AbhJZOGW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 10:06:22 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50732
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230119AbhJZOGW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 10:06:22 -0400
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 071DA3F170
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635257036;
        bh=x/vUBlyAiuA+avFtBriAudT3vNCXe1kaXbEyrRvMHFE=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Vkx1If1uUsRhmGsUvmSvh/54GYIbzsUbEVWQVzuZtI8lUfxe4143eihtfcf9LAKun
         Ejmvc2ezD+Qj3FpeeCjJmJLNkQ+Grx3glgF/5+5jGUHg5A86EMKFokpkmSnEaTz+mS
         GEnr+7afYEXIRiUOs2u5nRHANm6s/WZm/12yHYcjNJylM9GxPFOCzkRBM3O026LWxP
         NipCEItrUTLq2MmoPbbaKCIeSP/2AybaDyNQrVV+8UaJkJnv6zrnAW1wglZVVWjgq+
         1UatKP6cc6+p/kuBZibR9I6fy+A3XQ1wamL5D2353UcU5NqjHiS3wHCOPUTIrlDjhe
         +gUfffrb6YhmA==
Received: by mail-lj1-f198.google.com with SMTP id w9-20020a2e9989000000b00210af61ebbdso4424281lji.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 07:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x/vUBlyAiuA+avFtBriAudT3vNCXe1kaXbEyrRvMHFE=;
        b=Bx7KopuyBWJzYUHqOYq7VdNUvFBYhDAysqXZu2v82p738DiegwUkVS0rM0IA+hhdf8
         81t82/Kpn41NhMNX2pIrfnzq550mZapza4RL9hZughRivN8OJjyhs5AesWRpIYyRTy6J
         OLnM9t4vNJ7UFeRBpZcwTpz4qfAmpANofoX/WYcNGEz2nIOH8PkW78zRMhOjO/xclh0s
         wy0pBtrFKLJuTcDhwD8z7CGe1uqbEIxE/WE1Q7waX1g87bVcjFOiEz+1dev8dm28fkmn
         7DxPfwi8VoPNvZq/yEf2ZobfajbFRGUEFxCQkdT5i7F+4qmM8kWtDiphEZeFWfIb97yl
         LTuA==
X-Gm-Message-State: AOAM531lfr68yCKmuLku10X7STD5ngOEIM98bm05x0s6PkuBPf4NxD74
        7WSRItSbyAHifxaR4ikQ7YmJ3rtIxj/ibMGRJytT+qTKWyvmVvPanrpHfzSjZX8Wdkg8i/S/e7u
        AmLlzE/DjWx3EJJMQaQ9aBteF/DG/OcB2C7olJLBHliYhcDzM
X-Received: by 2002:a05:6512:23a0:: with SMTP id c32mr23741133lfv.166.1635257035260;
        Tue, 26 Oct 2021 07:03:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4ERI9ISaFm/R3JZzdG9KW96YbtJuIMYMGTR4liFkJVPAhW2hMHHCatdrqNwv3us4qWXTLYA==
X-Received: by 2002:a05:6512:23a0:: with SMTP id c32mr23741093lfv.166.1635257035008;
        Tue, 26 Oct 2021 07:03:55 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bq37sm1423133lfb.166.2021.10.26.07.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 07:03:54 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Will Deacon <will@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
References: <20211026115916.31553-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH] arm64: Kconfig: Enable MCT timer for ARCH_EXYNOS
Message-ID: <8b3466f1-2b16-80ca-79c7-577860fc90aa@canonical.com>
Date:   Tue, 26 Oct 2021 16:03:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026115916.31553-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/10/2021 13:59, Sam Protsenko wrote:
> Some ARM64 Exynos SoCs have MCT timer block, e.g. Exynos850 and
> Exynos5433. CLKSRC_EXYNOS_MCT option is not visible unless COMPILE_TEST
> is enabled. Select CLKSRC_EXYNOS_MCT option for ARM64 ARCH_EXYNOS like
> it's done in arch/arm/mach-exynos/Kconfig, to enable MCT timer support
> for ARM64 Exynos SoCs.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
> 

+CC Marek, Marc, Mark and Chanwoo,
Looks like duplicated:
https://lore.kernel.org/lkml/20181018095708.1527-7-m.szyprowski@samsung.com/

The topic stalled and I think this particular patch did not make sense
on its own, without rest of changes from Marek. I am not sure, though...

Best regards,
Krzysztof
