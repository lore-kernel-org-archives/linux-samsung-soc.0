Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9F4C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Dec 2021 09:40:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhLTJkp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Dec 2021 04:40:45 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55618
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229908AbhLTJkp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 04:40:45 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3B386402FC
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 09:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639993244;
        bh=EVGM/+q0CXCgdQ8nkwe34/uQXDmUodwxi1yGzkWco68=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
         In-Reply-To:Content-Type;
        b=H4oP6VMsLHl+sK1sA7HiwSA4Ruu6Z18CcHt4621+vZ4aFhIDHxcONthMDgxD+XO+v
         EVu35GZ92iaQYlLMBS7LI6zPn/sf9/UORk3POfLLRsNG+Sb+fNTbZgvLnYxsDPeIV5
         ifKeaRJwwWUEB+APnx3Zx03MhOAnhVAS+oUlq/3YYnXDDD17MAupKliGHkrcq9i5iC
         ccMKpnQhiNlkk0bivSt4+C3gNmZ/jw+qSjMLCBIIzPaC8z+BDRR97MGFKq6Dmvpkwz
         umG9kN0XKAcsRjMtj2VEFjHevYiH+gJFCfo3am4LrjzHX/IyLtcaFTSnWMU3SSZ2oO
         4FSQMzijNKw0Q==
Received: by mail-lf1-f71.google.com with SMTP id r21-20020ac25f95000000b004259e6ab262so2357869lfe.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 01:40:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=EVGM/+q0CXCgdQ8nkwe34/uQXDmUodwxi1yGzkWco68=;
        b=cpPpv900+YW9FcE0bDo9kRyKAgu8nhStNgWwVtJb82rULx3Xxa5oy8bFALn9oLYIF/
         oho1lu/TxirZXvel1nAgtwEwPBcFAsc7DiN/b905IxdafB5UYUoaBFti2BZqCjd60OXl
         MxYJui/1XdA7My5A8YKc3/RLhTvHnH3Tw9qMQlf4fY9f5uR7YBGWCEabkNFFcMWoKIGi
         z1qZJX6UGMIS9chqEJhN2schjTfmmaw760urlAvvVeAp2va/Q5kyh4ce+GjOvWJf35X9
         8GLLD0DvMKXcZ41c5h40N9opcBUq902ukvmN+FdgvEIjAS5O3uMP8kLsG4mPH6YoeoxF
         /iyA==
X-Gm-Message-State: AOAM533Rr0HuUZvebKl0X9JL+0tdM7H8SWbBJoJow8toMlP/VipgjIzL
        TBLNAFTuuvDMRGRZPSmkcFTsm96SXMvEKFdCdsKbr1ImkTnhiPEI66IaJziiB14jC59fVf4k5/s
        3qkwaH75hZwlDHmXBX6jWFtGNNhynXzmOCJpMrQ1IOXU0eGOj
X-Received: by 2002:a2e:81da:: with SMTP id s26mr13591961ljg.94.1639993243230;
        Mon, 20 Dec 2021 01:40:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxM2KvTkLS2aeCYmftY/HbRanVa+empcVyws/mA/hlDePnsN/jZUkCVGawwvT8X6EoeDauwow==
X-Received: by 2002:a2e:81da:: with SMTP id s26mr13591954ljg.94.1639993243069;
        Mon, 20 Dec 2021 01:40:43 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j16sm2306251lfe.4.2021.12.20.01.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 01:40:42 -0800 (PST)
Message-ID: <b49ffb8c-8784-978b-faf5-6fe1ace37c9e@canonical.com>
Date:   Mon, 20 Dec 2021 10:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Add bindings definitions for
 Exynos7885 CMU
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        David Virag <virag.david003@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211206153124.427102-1-virag.david003@gmail.com>
 <20211206153124.427102-2-virag.david003@gmail.com>
 <aa76e303-95ac-20ff-c0a9-26f7f8c6b2cb@canonical.com>
In-Reply-To: <aa76e303-95ac-20ff-c0a9-26f7f8c6b2cb@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/12/2021 19:39, Krzysztof Kozlowski wrote:
> On 06/12/2021 16:31, David Virag wrote:
>> Just like on Exynos850, the clock controller driver is designed to have
>> separate instances for each particular CMU, so clock IDs start from 1
>> for each CMU in this bindings header too.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Signed-off-by: David Virag <virag.david003@gmail.com>
>> ---
>> Changes in v2:
>>   - Added R-b tag by Krzysztof Kozlowski
>>
>> Changes in v3:
>>   - Nothing
>>
>> Changes in v4:
>>   - Nothing
>>
>>  include/dt-bindings/clock/exynos7885.h | 115 +++++++++++++++++++++++++
>>  1 file changed, 115 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/exynos7885.h
>>
> 
> Hi Sylwester,
> 
> The DTS/DTSI patch (7/7) depends on this one, just like the clock driver.
> 
> Since some time Arnd and Olof prefer not to have external trees going
> into the arm-soc, even if this is only the header change. They recommend
> one of:
> 1. to hard-code the numbers in DTS and replace numbers->macros later,
> 2. merge headers to arm-soc tree with DTS and provide the header to an
> external (e.g. clk) tree,
> 3. wait with merging DTSI till headers reach mainline.
> 
> I propose that I take the clock headers, put on separate branch and
> provide them to you as stable tag. You can base clk driver changes on
> top of it.
> 
> Are you okay with this?

Hi Sylwester,

I see you applied the patches, so I understand we are not going with
this proposal.

David,

Your DTSI and DTS will have to either wait for next cycle or please
resend with clock macros replaced with numbers + TODO note.

Best regards,
Krzysztof
