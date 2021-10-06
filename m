Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA617C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 12:46:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9D8661039
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 12:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238312AbhJFMsd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 08:48:33 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:35894
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238036AbhJFMsd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 08:48:33 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9D6B93FFF0
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 12:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633524400;
        bh=CFPfrwCOLmoOnhcB5cFkeSRW+ygeIs9z/XXXtSaFs3Q=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=u6ZbrHRZdBUbkO8f7SjbHORutJ3tOm+ChiBmhCRUGPq3PZf6FSqRxVxgxtV1Z8uJL
         gHhWQ0fJ6Tp1r2LOez9U0G1pSqCVNw8jrkswAHMi8KfmUykOSGChFZO+yabMg5xOgX
         hunSFdWZFgNc1t/f9HFJz2VD2kUNwmFULQUK9VWXjg4ikL7m7u3Wg/g/XU/vArJC0a
         ytizQthEIdjCpqXUQ9fKJxhmJBF51EoZvtIyZ71WMuLEIIaGRt2ZOla6+5ZH9ivjVQ
         BPxDwZCgV3I7h1DgyzVAnG8NNHLBLiaX/7pKl8KyPbZqWxZ6TrGaneWLiDU8YfSa1n
         rVjs8J/04dsYg==
Received: by mail-lf1-f70.google.com with SMTP id g9-20020a0565123b8900b003f33a027130so1869305lfv.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 05:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CFPfrwCOLmoOnhcB5cFkeSRW+ygeIs9z/XXXtSaFs3Q=;
        b=qmDf2o68VTSyHE//9Dxix7UYikM6xiZApZc/VpDjOL6NJVTAXtPt/ciFGk8quUzmSg
         6MwBw7GehuFBqbbdH9IvhVw6DIllUu7+UzwtUdlkgB1I4x+58inXjiUGhqVcTr6z21sU
         +/ToMSIjzwTW2KDK/uSeSXuoIB95X82vjR5Y6T+2HQ3o2bBqT1ZNfKJF7AJ/eaiDPfL2
         QCHJsIDiabtGxTBcsDhnoLSmKUV5AEVsXgRK5uchTisPw407NIy1PngqZKjfHUDANd93
         FHH9FjPCCHMCqdMdHU6xP62FRjGGAFLHOvIbpoww1pa21QB+mMh5QAhoJqR84xnq8Knt
         cU0w==
X-Gm-Message-State: AOAM531aU+MNXlGtmPcLtFG5ERxk2Bww5mx3UOU6gr3/QPas4BXIHkns
        kOcU89W1dOa/GEKmC6T7sVVdydfsjaMBZggjCe1mtGIFw5PSRtY8Ag9H6UGety0rp6a0pEP84mf
        TobXDxr7fZNi4aD79vv2AMEfQqLWbo/cjNCj1EULslGh9RHnY
X-Received: by 2002:a2e:7f06:: with SMTP id a6mr28466855ljd.437.1633524399776;
        Wed, 06 Oct 2021 05:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1ImH5ZppaJiULcnlj61kt2m4gbZQp0zsJOhQk+6s6980dk31R5+ELxZ7FMAOsluAeUMfLEg==
X-Received: by 2002:a2e:7f06:: with SMTP id a6mr28466823ljd.437.1633524399584;
        Wed, 06 Oct 2021 05:46:39 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g18sm2184560ljj.105.2021.10.06.05.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 05:46:39 -0700 (PDT)
Subject: Re: [PATCH 6/6] clk: samsung: Introduce Exynos850 clock driver
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <CGME20210914155639eucas1p2b65f35fcbd2b3fde7d4e7541ac6d76d3@eucas1p2.samsung.com>
 <20210914155607.14122-7-semen.protsenko@linaro.org>
 <1d884e38-ac8c-6f0c-ad27-243c5c4b9b9b@samsung.com>
 <CAPLW+4n0DX3gn=Ntat39EUO-L2t=SR_=Nr3LtznN4XsNrc=OWA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <98c7d970-d937-3441-20c1-7cec736a8a62@canonical.com>
Date:   Wed, 6 Oct 2021 14:46:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4n0DX3gn=Ntat39EUO-L2t=SR_=Nr3LtznN4XsNrc=OWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/10/2021 13:36, Sam Protsenko wrote:
> On Wed, 15 Sept 2021 at 16:07, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>>
>> On 14.09.2021 17:56, Sam Protsenko wrote:
>>> +static void __init exynos850_cmu_top_init(struct device_node *np)
>>> +{
>>> +     exynos850_init_clocks(np, top_clk_regs, ARRAY_SIZE(top_clk_regs));
>>> +     samsung_cmu_register_one(np, &top_cmu_info);
>>> +}
>>> +
>>> +CLK_OF_DECLARE(exynos850_cmu_top, "samsung,exynos850-cmu-top",
>>> +            exynos850_cmu_top_init);
>>
>> Was there anything preventing you from making it a platform driver instead?
>>
> 
> Can you please elaborate on benefits of adding platform driver? I
> don't implement PM ops for now, and I can see that clk-exynos7.c does
> not add platform driver as well... clk-exynos5433.c seems to use
> platform_driver for PM ops only.

I said it in response to patch 1, so just for the record:
Exynos7 is not the example you are looking for. :) Exynos5433 is.


Best regards,
Krzysztof
