Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC49C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 06:45:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32A3361040
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 06:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhJHGri (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 02:47:38 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37114
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229807AbhJHGrg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 02:47:36 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4FB703FFF7
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 06:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633675541;
        bh=K6iXGmH+Xr2/o1b+hKgXwSDn2IBjQQPNyuaqrgkHtGo=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=PT1NqoZzVjJyUPAMWHuwBpPsRVP70IS/83vS9DgwnUXfSSMrJGkQGPVOXzymbuSMa
         6aG9hoH5DffhPZ6lMrGDK5nvw6LE44LJBgh374OEXA/JpXTmOrpM3gg5/9RZ0YgYxP
         ZPJeJf040IzOzOs/GOeddNGds+slas7Y2RRzP85GGB3nGShUcpHb7jOvpuafMqkkIL
         NhBQb7t6Iqv/8Za+NgXew3zMnNy9N4HDVzHV/WCBfQOhH3AKAA1cXD6uUXbPm8i4kE
         Hd3sZPCpetsX5xF3wk+RqLyp07793NU0dIXk+ucUFJHR859a2940eJ4zAeetYvHlzS
         K1rzKgOqVvjHw==
Received: by mail-wr1-f71.google.com with SMTP id j19-20020adfb313000000b00160a9de13b3so6503486wrd.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Oct 2021 23:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K6iXGmH+Xr2/o1b+hKgXwSDn2IBjQQPNyuaqrgkHtGo=;
        b=fihCG6cKiBWLODVcUndzPyOc+vgWdNfhCoq3E6ay4WXNWubeuQWmadesBeLvFTGfwh
         86/QrDm+Ye2hj8cHMBOQL7qJpg2LxIiRmyaSbMyl5qO2oQJYky3TxLQCjLK6/sajN3QC
         s04oVXtcIOPP8PeI7RP+XmXpKW8BqzuRwffAfIn71Qmx758ARntjLluLF63GVA+rCOyX
         YDXIOHVdxPCP58lxv8TNCQuT7zwlGGAy7Ss9+hoCPjXVT2jVzoXZ7XPjlCtpleVFAxrH
         eInMhdvjJQQ79ULnTFNzHcc6vJ74jDi3kVDr+1uefgM+wxKxgjpX1zHhGVEm5+pudktU
         cicA==
X-Gm-Message-State: AOAM532Ab8GJj/OYeWPHH3RzonBkakCj0pk4YJppCQZucKHo6FvEEIPn
        NnsA6ET1B2Ejl2UZR76fi2UrLzDcdQl9ZYN9n6vRACfMKo7iSng2hHsns9CIUmuWvNkY/iUMDei
        hYpQlit5pktZxpqV3RBXmx5H5Uc4NRSsg3FbO5o3SP92aJhEV
X-Received: by 2002:a5d:5986:: with SMTP id n6mr1798238wri.75.1633675540698;
        Thu, 07 Oct 2021 23:45:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOmryVllHENNzxlkya8eUdoqWDAGCtwrtq2AttxUID67l6XccGUczuhDVl0y/YrmmVswUgeg==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr1798196wri.75.1633675540394;
        Thu, 07 Oct 2021 23:45:40 -0700 (PDT)
Received: from [192.168.1.24] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id q12sm1467343wrp.75.2021.10.07.23.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 23:45:39 -0700 (PDT)
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: Add bindings definitions for
 Exynos850 CMU
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
 <20211007194113.10507-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <abe4bdeb-ee15-d8c8-54af-1cdf7282b004@canonical.com>
Date:   Fri, 8 Oct 2021 08:45:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007194113.10507-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/10/2021 21:41, Sam Protsenko wrote:
> Clock controller driver is designed to have separate instances for each
> particular CMU. So clock IDs in this bindings header also start from 1
> for each CMU.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Changes in v2:
>   - Added all clock ids
>   - Added CLK_ prefix for all clock constants
>   - Added R-b tag by Krzysztof Kozlowski
>   - Added Ack tag by Rob Herring
> 
>  include/dt-bindings/clock/exynos850.h | 141 ++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 include/dt-bindings/clock/exynos850.h
> 
> diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
> new file mode 100644
> index 000000000000..a44c5f91d3c7
> --- /dev/null
> +++ b/include/dt-bindings/clock/exynos850.h
> @@ -0,0 +1,141 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

The bindings are preferred to be under GPL-2.0+BSD. I don't know about
such policy for the headers but it seems reasonable - allows re-usage in
other systems. Do you mind licensing it under:
GPL-2.0-only or BSD-2-Clause
?

Best regards,
Krzysztof

> +/*
> + * Copyright (C) 2021 Linaro Ltd.
> + * Author: Sam Protsenko <semen.protsenko@linaro.org>
> + *
> + * Device Tree binding constants for Exynos850 clock controller.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_EXYNOS_850_H
> +#define _DT_BINDINGS_CLOCK_EXYNOS_850_H
> +
> +/* CMU_TOP */
