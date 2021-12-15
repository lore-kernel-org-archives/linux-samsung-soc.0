Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0792C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Dec 2021 07:36:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbhLOHgo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Dec 2021 02:36:44 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:54718
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240622AbhLOHgl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 02:36:41 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 33B7A3F1AA
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Dec 2021 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639553800;
        bh=F6A76TBrmUtFWX3VCIsN07CYhL6FGO84vIVFcKsHMuk=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=HBhtqH1ftR+JE8s30I5DsAG0EuWjU+L6cYe5RU3DMx6TTR2l1POXl4JAJfUEU21W6
         j3BSoVnYkjcx9YjGGZccgnSmS5RQFEW1Fr/DdC61vvWnQjehz75pOIghLlyARcWSMB
         33HTuXB4CsxWmFzT+YvsOsVPkQAO8WOdBkU987uEpVShT8eRsXSY05ibMYgKsC6sA5
         lNcKKMBJaHRxD+iQZ8PafGHPCd333khRvEV3x3iGjUDidWJ5013WUPl9fkyuIVL5pI
         jb/yS+DraClm4KTIzSp0DzQal5w27BTJoMtVZOCb+Uu5FUUBq2Iwpekqv8Y64Ko/+N
         oh3GQkpRyU39g==
Received: by mail-lf1-f70.google.com with SMTP id e23-20020a196917000000b0041bcbb80798so9373030lfc.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Dec 2021 23:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=F6A76TBrmUtFWX3VCIsN07CYhL6FGO84vIVFcKsHMuk=;
        b=piGR/PgL34nU3vcCGZ4AHHV2kUlG2O6/EBKHGq2q71/ETs9cTj9V32GNYP7+fP8jpt
         w0Aujdtl6m6Ia7TuD4QoP9XaiPuOGiOaMHbA8CPB0qNEmIPLftOy/FffP4QFH/eU0avW
         m9LjI6NZVRD8f2RCzFAGumMKrpAqLfcVx6Dlu/JMzGMXn5Rs+aAx2d6Gv7kbmZYRohPd
         3bz3CsYKMuGFrGyf+3M8YzkktCCul7bZecT0NEibd9PixeXC4nkFVMLuJqv0lNu5dmCS
         UQ1b4dN0trKG72GwQBsWmJfP32s3Bqei1WanvSLjIkXqREVI+0iBRphBOXCiBa00Yowi
         GNRQ==
X-Gm-Message-State: AOAM531Cwdg4F5OhyPEH6ue6EZUST52rIDC+egqeVFCY4OjxpJ4LQtlT
        7d24ade4fnEcQBqSFsC2fCGi8jfkAKt4OdtcNeBnmRE2Alc/gU3hUeZWQNWxTP7du9EzVYthHsA
        XqmJNrPsXNDZQkbQ7lcRkLHDW5JKTL73MWar1+3fAyGdrHrvC
X-Received: by 2002:a05:6512:4022:: with SMTP id br34mr8848173lfb.530.1639553799647;
        Tue, 14 Dec 2021 23:36:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzPtDMOJasNzOvdacYEtvNk/bKv5BWr0rmdGjWr2pcPixNzBSY/JytR3tWeRLhzvX45bRflw==
X-Received: by 2002:a05:6512:4022:: with SMTP id br34mr8848159lfb.530.1639553799518;
        Tue, 14 Dec 2021 23:36:39 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bp15sm188546lfb.176.2021.12.14.23.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 23:36:39 -0800 (PST)
Message-ID: <27e76745-090c-36c5-78b8-aeda58c91034@canonical.com>
Date:   Wed, 15 Dec 2021 08:36:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] dt-bindings: soc: samsung: Fix I2C clocks order in USI
 binding example
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211214170924.27998-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211214170924.27998-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/12/2021 18:09, Sam Protsenko wrote:
> Now that HSI2C binding [1] is converted to dt-schema format, it reveals
> incorrect HSI2C clocks order in USI binding example:
> 
>     .../exynos-usi.example.dt.yaml:
>     i2c@13820000: clock-names:0: 'hsi2c' was expected
>     From schema: .../i2c-exynos5.yaml
> 
>     .../exynos-usi.example.dt.yaml:
>     i2c@13820000: clock-names:1: 'hsi2c_pclk' was expected
>     From schema: .../i2c-exynos5.yaml
> 
> Change HSI2C clock order in USI binding example to satisfy HSI2C binding
> requirements and fix above warnings.
> 
> [1] Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> NOTE: If possible, it can be squashed into "dt-bindings: soc: samsung:
>       Add Exynos USI bindings" patch (already applied in Krzysztof tree)
> 

I already merged it between branches, so no squashing.

Best regards,
Krzysztof
