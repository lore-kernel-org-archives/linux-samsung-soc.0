Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EA1C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 18:12:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354427AbiEDSQa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 14:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354674AbiEDSQR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 14:16:17 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2026FBF4D;
        Wed,  4 May 2022 10:35:21 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id i62so1705286pgd.6;
        Wed, 04 May 2022 10:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MNJT9YzuHEAZEheWVsgmUZA8nQvMITugjqtFZYM9yzI=;
        b=qcvs0NN+UVLDdqTT/NYRME6WjfWaBW9uy3X41u9k0CfY18BT3f5gCWMNZE4/q4a85Z
         sKi3aujMmD7fDjjzcsmNqQkcfVEGlJWNRnnplaI6dRB5RvFnZ6J7JoLzizRSPp5CTYec
         XPDynShDMimsPffdW5eCCobD4HRmGqnQBN9yF1JJgBehshm0NOt+H7JqsrUcKCQGnXgJ
         P4077BcV0nsL+gDac5n0DRVw7GbFd1uQWaAqe59BUOxtYvt7HFWhyhJ1XLSvRpUxdzs0
         Uh8+0uytNj71iSqMzLuRpJE8DHD239+uAMRIKhZ0glEQY+BRRPcQtOs78SSYTALpv8c6
         gsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MNJT9YzuHEAZEheWVsgmUZA8nQvMITugjqtFZYM9yzI=;
        b=8BVFhmnoslpqBO5xrCvkZga6pdOf+OalP7O2xZ6WkNtc0eyy/FbNY62k5yqKY2JDC4
         KYHOAKjIsHkUrbpq3Ta2d9hDW0kIINL27DEDNpfbOtw5LfBfEhkaCXNKFaH3AIMrDC/n
         FKstlv68dz46Jf5jU3yjUlWcDomdSONFQcb68ID616xF6OMfwukyS3cDXtM4dcGQybmv
         2yFynPAif2tltshuBH7jBMuG+1+SADn3picXCp1G/iQeaxYpkbWAmnjgn3a0vNemVLxP
         97XPv/VJq1whjB4jnWnHlHfrKOI542yGtCBeox0p7IkUznPBZJoA7G4lEMgsqjA4d7Zz
         vldg==
X-Gm-Message-State: AOAM530MR5o1T5bilPrnh+a6CTB0c04iX/wgTcROrQPod099YnVpHkPZ
        OF/xiL2+ujN4VRjc7HwiZM5a75+UiWs=
X-Google-Smtp-Source: ABdhPJwcUisFPL9uPWplV1T40GpRsHfI54F/UB7Jj6vFaHRLvxruWDuWodqfjBrwJ+3g+vkgrpzIvg==
X-Received: by 2002:a62:7ccc:0:b0:510:4e07:79f3 with SMTP id x195-20020a627ccc000000b005104e0779f3mr2050271pfc.10.1651685721045;
        Wed, 04 May 2022 10:35:21 -0700 (PDT)
Received: from [172.30.1.41] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id n9-20020a170903110900b0015e8d4eb1c1sm8616219plh.11.2022.05.04.10.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 10:35:20 -0700 (PDT)
Message-ID: <df273a5d-793d-0069-2df6-77b05050b2d2@gmail.com>
Date:   Thu, 5 May 2022 02:35:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 02/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU
 bindings
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220504075154.58819-1-chanho61.park@samsung.com>
 <CGME20220504075003epcas2p17f37265b522bb0c26dbdd4ebeec92ab9@epcas2p1.samsung.com>
 <20220504075154.58819-3-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220504075154.58819-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 5. 4. 16:51, Chanho Park wrote:
> Add dt-schema for Exynos Auto v9 SoC clock controller.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   .../clock/samsung,exynosautov9-clock.yaml     | 219 ++++++++++++++++++
>   1 file changed, 219 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
> 


(snip)

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
