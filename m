Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FD7C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 11:56:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234609AbiFBL4S (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 07:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234629AbiFBL4R (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 07:56:17 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A9623F228
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 04:56:14 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z7so5919062edm.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jun 2022 04:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VYkRhKv59af1KeqL/rucgV/mHExUmIzFqqIMFo3QP2w=;
        b=f/4iOzj2fjFbh9BHIpxiLcPJ8fw5lzBWiHDgOhfcATZHx4C+uUd8r/eNFmvIavnVl4
         dpOUk0BfUc1xjQartU7r+q7vseF3UETtFtDHF+37Alc5vnJlQ6ssNY7pEVeUy/XMRs85
         B6VWi3KiGu3vH8tpW57Mv4BJ1luzryGnrPIXZ2Rmth9r5r939N0ogdopXNkRGpOfN4pa
         S/NaQfmC86D2kewTZWZCOFKUUTXUVjexVByb6Cd/NSjKrk26DCSkq7CPSvW7nSFSfG18
         lonUXcIU+x6/EMY2m0ERnPFlxjbsU9Qbf+Mow1hULDq8FToYZPabEMSAPkmyc/PdaOw/
         BRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VYkRhKv59af1KeqL/rucgV/mHExUmIzFqqIMFo3QP2w=;
        b=id3sKOp+jjZcPiG2O8Ws9lItvOgcRdbrarTE5Vh57zK9H3u9ZC/PdD6P6ibsHzXJLp
         df9xbn1Athydf7C2+mHIYlN0Vttxdx9vhbesLV0NhurDVBGFQamdeh6UI/9+aAs5UUAW
         RwX0dhTYJZSyISqSJynRvJNYTwKujbQi/mQC/OS3sZhGZQh+jsKl1IBPqKeq0e1PIq3o
         FrXTNDd8HuMIOKUvwjc4/115I5yMAfaMy0+kzzXseDMRtMtv4LnZh/w4XL2D+vY011sk
         lG/3TDKlEXTC423zNHkdawHFA10nRPGCT7aU8u5hQlM0KDAeXbW6or4YbJ67uv7c+zgu
         wvCw==
X-Gm-Message-State: AOAM5336FIYQUQMPqZaaagdcgCaeKUC396ewS83mhzI+cu819ZFJNQhU
        TTvHOVAJx4hPhiIiJLOH4BYzYw==
X-Google-Smtp-Source: ABdhPJyelEPbsqEleXXPro/QCHXWTp8zcnnilj3IxbJgwVsMW+YQkef2813NyyLt+qVfpqaDOunYWQ==
X-Received: by 2002:a05:6402:1941:b0:413:2b80:b245 with SMTP id f1-20020a056402194100b004132b80b245mr4961471edz.252.1654170973072;
        Thu, 02 Jun 2022 04:56:13 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e2-20020a1709062d4200b006fec2097d53sm1664095eji.118.2022.06.02.04.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 04:56:12 -0700 (PDT)
Message-ID: <a66ad5e4-0be1-bb3b-5e7b-c2a5b936a898@linaro.org>
Date:   Thu, 2 Jun 2022 13:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/5] clk: samsung: exynos7885: Implement CMU_FSYS domain
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     phone-devel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220601233743.56317-1-virag.david003@gmail.com>
 <20220601233743.56317-4-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601233743.56317-4-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/06/2022 01:37, David Virag wrote:
> CMU_FSYS clock domain provides clocks for FSYS IP-core providing clocks
> for all MMC devices on Exynos7885, and USB30DRD.
> 
> This patch includes:

https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

s/This patch includes:/Add:/

>   - Bus clocks in CMU_TOP needed for CMU_FSYS
>   - All clocks in CMU_FSYS needed for MMC devices
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
