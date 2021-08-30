Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0D2C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 30 Aug 2021 06:59:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 462A460FC0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 30 Aug 2021 06:59:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232969AbhH3HAN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 30 Aug 2021 03:00:13 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46312
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232622AbhH3HAK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Aug 2021 03:00:10 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5CB0840779
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Aug 2021 06:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630306756;
        bh=TfCd6FiaT8DSxbI3Ba5RISkJ5knMWyV+1tKQL4oN4Pk=;
        h=Subject:To:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=g9TwuTwcsWlworIL0foJevvgTkc3ttp9FhHFWRpF7p3AwO5JXlb3QS0zwsQ4RcyhK
         3/5vIoL9dvLBy33Uln5bcwUF/H4kGjCwKQlrwMaC+K/Rd/XbYks9B65y5OVVLUdbYb
         3CRWzRNbXWYRS7V2DzeMzQ8YL0ZrUI50f3vTnI7emzAGBhLLDB7Dwi4zKrh34PL/7z
         bDLdA93voZ84cjHGLacZtRSwyFNNQGZR/M0w2gi8zPbffeIbb+UotW3ncgu6qIY6tq
         MsWIyAj6uSQxKrSpihTLYgt867XfRL+7r3p+MZaLgzKADNpm6r82H1hgB+tt7dhGA3
         nI1JaVxdgmx2g==
Received: by mail-wm1-f71.google.com with SMTP id x125-20020a1c3183000000b002e73f079eefso8341308wmx.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Aug 2021 23:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TfCd6FiaT8DSxbI3Ba5RISkJ5knMWyV+1tKQL4oN4Pk=;
        b=gZAJ7w2GRxTDOa5l001kt7Q7LrUtlzIM0OjKadrhNU40YbcNuPEkGiXJgD6IqG4Bj2
         nHVI0NHJQek5I5R34FyibhPVko4EaOV7FCKx97K3x6oDfpEXmoEripzYQDoBitZO5fd5
         8Q45n2Q+o0t1kRWJZTYN/1ixPcgNG998amKrz9QW6UopayPG7TABpxxM8+84Voa9kQFA
         qGfpxSVZP8BEvLSGhDw1oKvvg8iWUjnupj/J2nXf9Mu3Lag5k05oDgs4LbFX71+hKxbQ
         pGrRQbdN9iXnK/3Q3JRRiDctGdJTIIDVUdlVGYDmKszPjSHzlQIljmFCbHXS6ViuWWK4
         Zu+w==
X-Gm-Message-State: AOAM530mNglhLO2I4JvwYGLtuaQ7KRyc9swK/xA4M4wtHElPXmABKykS
        lN5T7I40L2/YXGPpSsnvDZ4ZtibH3PVGnWOQcKoSPCE7v44hHODi3xbiIKuFXqho4FvmFMsLfzG
        ac6uFtG/BfkpDtJC6bsWQmGx8t0FJFDX6r23GsuIQ9fnjr0N6
X-Received: by 2002:adf:e509:: with SMTP id j9mr24038750wrm.320.1630306756076;
        Sun, 29 Aug 2021 23:59:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0ZqYN0bkagHGWkHbzTZbv9x4AkRZKERJlpklYIFSr1ahy2vKEcx4g1ux82suPSSvCeeexxg==
X-Received: by 2002:adf:e509:: with SMTP id j9mr24038730wrm.320.1630306755877;
        Sun, 29 Aug 2021 23:59:15 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.112.21])
        by smtp.gmail.com with ESMTPSA id z17sm10180474wrh.66.2021.08.29.23.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 23:59:15 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: clock: samsung: include S3C/S5P header
 bindings
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210830065647.5386-1-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <69d4b87b-74f8-8107-d4b2-19b4c28910b4@canonical.com>
Date:   Mon, 30 Aug 2021 08:59:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830065647.5386-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/08/2021 08:56, Krzysztof Kozlowski wrote:
> Include S3C24xx, S3C64xx and S5Pv210 SoC clock headers with bindings in
> the Samsung SoC Clock drivers entry.  The clock drivers for these SoCs
> are already covered.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eee4c926003b..c17299c30ea7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16582,6 +16582,9 @@ F:	Documentation/devicetree/bindings/clock/samsung,s3c*
>  F:	Documentation/devicetree/bindings/clock/samsung,s5p*
>  F:	drivers/clk/samsung/
>  F:	include/dt-bindings/clock/exynos*.h
> +F:	include/dt-bindings/clock/s3c24*.h
> +F:	include/dt-bindings/clock/s5pv210*.h
> +F:	include/dt-bindings/clock/samsung,s3c64xx-clock.h
>  F:	include/linux/clk/samsung.h
>  F:	include/linux/platform_data/clk-s3c2410.h

Ignore it, please. I just sent the same patch second time... I need more
coffee.


Best regards,
Krzysztof
