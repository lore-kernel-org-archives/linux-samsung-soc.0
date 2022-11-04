Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BF7C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Nov 2022 13:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbiKDNuB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Nov 2022 09:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbiKDNuA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 09:50:00 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F00DC75F
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Nov 2022 06:49:55 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id h24so3028089qta.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Nov 2022 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZJ2aOaaUkPc7hXzI05dVMHGbsrqBHLESRDGd2lD25E=;
        b=IXfbCmC8PtXTsNkLrL+DvTe0XcYAmFl0ckpoQh7LJO5xtRb3Knya+c398QU4oLtsy2
         qA5SXTHPWYuby0U7FPDwNkSWO6jNRzJJCIss9SoV9JKaC+m7NfNTy/0R1THp1qZ86Ag3
         EZF24q4tEHjwz9WBRNBG2xlr145AonK9E7MY3SMYBWV2T2V1rBokQzZfuSLiSka0VHyY
         1a4mVsQ9Dmxy67zK5ednVlMaafnAGl8SAXNfNuKZyVrQQRbhibVpH0m8YFLepc82+Ufp
         lgzflv3TIlsfv51rFksDoRLqXUZcPhahrFLCsNdAxQGXia1AJK3NkJQkmDhXPOFqk3ox
         R/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZJ2aOaaUkPc7hXzI05dVMHGbsrqBHLESRDGd2lD25E=;
        b=sFIIQ9OlTBHq1DrJS8A1sGwBWo0N460v8LGIfefpdOZq1QznblYFDpv76BUCXGI4BR
         6JKsuoHkmQcqGYo/tH7qlYLlMHdMYbqC36b2cZSbyW0wkZkWIChKY3dx26e9IoaSPkSW
         a0u7auaqhemSRRqF7opP3MaYFygNAFjE18kFXeLwyezIMN43C+0Zxo4MeM+nOjAIoJwU
         voL+h0OyIKaLc+j/ysHQ4ch6mVhGtZka0DAREyhYJIH+GEWJtWeNuZ1CnvGeOC8QyrjD
         FAzJYflMnnKQ6rk6N8ykhmKdrQA3ntZHpIPUU3UfhF0SBSx2vMg25ysaGhm+hdBkqwNa
         9ZBw==
X-Gm-Message-State: ACrzQf1Cc5G3jKpVg2jNkgsbBlxO07N+SVZl+BgWs4r50SSGUH6SxKEL
        0rmnxjH/nuNDwQWZmaazLkGosQ==
X-Google-Smtp-Source: AMsMyM4N05QjHYPa+Q1y17ey5o2SUCiHSJ0KJ6XZ2VSmE8PWXs7RoGVP7raxNrdlqIgkstd7Lgfc1g==
X-Received: by 2002:a05:622a:196:b0:3a5:40ab:592c with SMTP id s22-20020a05622a019600b003a540ab592cmr14548301qtw.103.1667569794299;
        Fri, 04 Nov 2022 06:49:54 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id h4-20020a05620a400400b006eea4b5abcesm3039698qko.89.2022.11.04.06.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 06:49:53 -0700 (PDT)
Message-ID: <85706811-a471-a7f9-b1f9-31189aef4309@linaro.org>
Date:   Fri, 4 Nov 2022 09:49:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] iommu/exynos: Fix driver initialization sequence
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
        linux-samsung-soc@vger.kernel.org
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <CGME20221104115521eucas1p2ef149555574e8f6cbd1bb3df0bdbbb20@eucas1p2.samsung.com>
 <20221104115511.28256-1-m.szyprowski@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104115511.28256-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/11/2022 07:55, Marek Szyprowski wrote:
> Registering SYSMMU platform driver might directly trigger initializing
> IOMMU domains and performing initial mappings. That time all common
> resources for the SYSMMU driver must be already allocated, so move
> platform driver registration to the end of exynos_iommu_init() function.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

How about:
Fixes: 66a7ed84b345 ("iommu/exynos: Apply workaround of caching fault
page table entries")
?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

