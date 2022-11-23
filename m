Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BEFC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Nov 2022 09:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237025AbiKWJD2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 23 Nov 2022 04:03:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236999AbiKWJDS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 04:03:18 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4687100B2D
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Nov 2022 01:03:16 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id b3so27220116lfv.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Nov 2022 01:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lj5qM8HyY9yPvHfYz3RvhZJi/KrYTswvqs6RCRkYoUU=;
        b=hdw5NXv78GEDuDERgDIqOlpxuJTqcfYs4LLbA0s1YzzZIGq9kR1gw1DpIkLdb6s5cy
         bKA1PoiGqEdPaRae6SpkGDec7wGz8u3h/AIwCU/21tAcmtT8doWhTtyADI6MlOutrcA+
         J6WvQrnEq+wfo5+50rESDG21oH7Zy2ToeAIq+wOWhx5uVAm2ZLrtBuFqDC7DZPnoh7xl
         wlJvFqR2I22F+s2CbqrIrp/R96/4/bciWNa1OANOPG67eKZ3XjCKIE3MGJ56n699z2xk
         17vV7g8SOTWG/Fb68dB72EMCPOWIdOgAD+JDBjiuAmk0sSDl/2fCg3Qq+fq/aHCzSUKI
         y/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lj5qM8HyY9yPvHfYz3RvhZJi/KrYTswvqs6RCRkYoUU=;
        b=butgTV6HNXzOdHxmv++RL0lyQkvsvo+3VOklVSM2IIs7HvTpxpZdl5HLECg7fxOfUF
         O3b6CUkBJoHz3PtqhaxeyzpmUdRWV9mkX0hlZo8g1UvNDlDtl5u3Z0oqMREeVLHrnl8n
         5dEdHF5En+CvgElBNbzL7FiXLcABes0DCY4BdacqgWBYcVGlwEtcattAhi5qkp3j9rqr
         1eiNrEONFgYQHd+IV5U1WuYZe0vTm3gdMzEn9lodCazJAiacfwcxpQV1D7VtUM7WQqtK
         vc7/UmZG9je+vAyDu2KA1c3sCmaAXaypSdQaG4T4XuGmtjHoj34gdO74m4NRteAnFAto
         Q+zg==
X-Gm-Message-State: ANoB5pnFJxe0VwOkd63daNWhMuBj8t4PYRFTj8umtbpUgpVDmvPWpLPe
        Jv073imC048kbmW+JHAoTnl+nw==
X-Google-Smtp-Source: AA0mqf5YZINXfyoHMvEKMXYYzTYl/T0856F2iwgRBsR9O5/Nm6Nm+W15mMPu0oipOaJPOJ/G1QGVXg==
X-Received: by 2002:a05:6512:2a98:b0:4b1:4612:6d06 with SMTP id dt24-20020a0565122a9800b004b146126d06mr8677897lfb.683.1669194195317;
        Wed, 23 Nov 2022 01:03:15 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u10-20020ac258ca000000b00499bf7605afsm2809973lfo.143.2022.11.23.01.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 01:03:14 -0800 (PST)
Message-ID: <cdb96213-ec91-11dc-73c5-63a266200ac6@linaro.org>
Date:   Wed, 23 Nov 2022 10:03:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 0/2] arm64: dts: Update cache properties for exynos/fsd
Content-Language: en-US
To:     Pierre Gondois <pierre.gondois@arm.com>,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Aswani Reddy <aswani.reddy@samsung.com>,
        Shashank Prashar <s.prashar@samsung.com>,
        Andi Shyti <andi@etezian.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20221123090109.74441-1-pierre.gondois@arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123090109.74441-1-pierre.gondois@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/11/2022 10:01, Pierre Gondois wrote:
> v1:
>  - exynos: [1]
>  - fds: [2]
> v2:
>   No change.
>  - exynos: [3]
>  - fds: [4]
> v3:
>  - Update commit header for fds platform.
> 
> As requested by [5], resend patches updating the cache properties for the
> exynos/fsd platforms with:
> 1. Fixed subject.

No improvements in the subject.

Use subject prefixes matching the subsystem (git log --oneline -- ...).


Best regards,
Krzysztof

