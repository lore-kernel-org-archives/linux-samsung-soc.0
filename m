Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2BBC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 18:55:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA7B961361
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 18:55:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236297AbhKHS6U (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Nov 2021 13:58:20 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:34562 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhKHS6T (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 13:58:19 -0500
Received: by mail-oi1-f170.google.com with SMTP id bg25so28456298oib.1;
        Mon, 08 Nov 2021 10:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2DWB0kKoYivJV1oeehdIpIIrx7+K+8Z44OtivzHAj5E=;
        b=D3X/1n4b03idPnRX3bHay8UA24tSmDfDbg7LqfWIOz77pErgiLoNo4DkaSwWAEXMN2
         3q882zqDP+GUTtFCSV9OzspHBZzClyZTlpkl/zdbxshhF6DWK5dO8DkcdbndiFs9FL31
         QKUWrNtQ3BM3mfnnWqWEeHoVoWxztXRKSrSDMfKcqi4onJdCSCzAy31YVB2r3MZ+J0W9
         mrJdHHb4Lr4OSnpEAmV8qfkYR9ZQT7x28Nr7zumD7VNNd/bUw9BbInTmj+cGZVR4VIze
         jUuy+y4sswTU5huTCCpH0LSuzH4Inb/9Dvr0ac9naretlSALjqRXVLNZVRhSonYYAgMM
         qZrg==
X-Gm-Message-State: AOAM5306ffIFUybtSbifgnUf3PuMaBJGuZjoxu7XvbEwAWpqeupq3TjW
        CQ06ZqTazncI1wqphIey4A==
X-Google-Smtp-Source: ABdhPJxqNdVWRJ8PvfVAwRV2ZRqHbQKK2BKg35mESHevrhtZhoI8JZEi/wgeqZmv5eS0CfP63WfU2g==
X-Received: by 2002:aca:3b89:: with SMTP id i131mr449070oia.102.1636397734731;
        Mon, 08 Nov 2021 10:55:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bh12sm2950638oib.25.2021.11.08.10.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 10:55:34 -0800 (PST)
Received: (nullmailer pid 4020796 invoked by uid 1000);
        Mon, 08 Nov 2021 18:55:33 -0000
Date:   Mon, 8 Nov 2021 12:55:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: samsung: pmu: Document Exynos850
Message-ID: <YYlypWEWpUn+e7JE@robh.at.kernel.org>
References: <20211028144313.9444-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028144313.9444-1-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 28 Oct 2021 17:43:12 +0300, Sam Protsenko wrote:
> Exynos850 SoC can reuse PMU driver functionality. Add corresponding
> compatible string to PMU bindings documentation.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/samsung/pmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
