Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F2DC6FD19
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 16:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjCLQnq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 12:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbjCLQnp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 12:43:45 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA7423D87
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 09:43:44 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id bp27so2529423lfb.6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 09:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678639422;
        h=subject:in-reply-to:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MKTinlG5kM8KUglYqEy7kn40PH2Oa+0TdD9V1KN73Hg=;
        b=Ra0eP4RTzgSI8UE8iguwh32A3BNIqVnl0mcJpajIb0utDcyTjhhNkuhSAJi8ekaqWk
         FqbUbKyVKDXSbUur2ChHV49f5F08UtjAZEZPlaNMswZVtau4mP/tMp/xtm2HEE1zBwLj
         KA1YrCOm9zdeLBv15/+YF30pB7fPL41QynNuinq4SR/mNVmjb/WEY/m6Bk/EcRERCEei
         naackGyy7HD4nq1IWSEQJ12V0jld5vqJkxHdnIkUZEgdNO69rvKGaRmvuSF96kfMRMTT
         UqKWYR+q+yIEtdQeVhw1gNrFsYDvhCvNfBOEFYXF8Hs5gDusxXxE+n2cerPqiJecs89U
         Gb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678639422;
        h=subject:in-reply-to:cc:to:from:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MKTinlG5kM8KUglYqEy7kn40PH2Oa+0TdD9V1KN73Hg=;
        b=ZMd0n3nX8WCwjYuL2ZXXD4Lht9yQmu/cU2aIPMwjaVRlutRM4F5GM90VNcd/OLkueJ
         C4KwxuT7U8ohDLecsKbWAIxVWMjvHc6e3qae/bEpXdlgZc7c7utSI4OpPjIGDI6sF7YZ
         T2l5R0Ym24QY+DZ7sNSZXr08LjjCNp7mxkDyZKQyzdku94uHIqtwEfrpyT956m005pAx
         GLqXoMdcS19p2jW9phRp2kEcaW3Dfp+uDuMCUEU8zzowkR+o3SvhyJyutZ5gbfDSePNL
         kMOSlKYtWOvqvk3+iLzqqI3ezhHcx+/ahbNvlsBgJO2nE5EMevRaNm1FUBByPuwoiEmP
         Uccg==
X-Gm-Message-State: AO0yUKXsvrll8H1GZPp09nY4Ok1/mLI5uQNiVS5OeIautFUKdiWkwtQG
        qoTGB1qO/ZZ8mnHDFvEYi6ytmceb97v+ALjo
X-Google-Smtp-Source: AK7set9TiTVrVfFaHR4ZrpcbOtTrnywkPPht0vtPW0aUU4kdb++22Bix/GrcR+x6IpS2l4Z7hNlVMA==
X-Received: by 2002:ac2:5df1:0:b0:4db:2cdf:4c11 with SMTP id z17-20020ac25df1000000b004db2cdf4c11mr9011333lfq.62.1678639422415;
        Sun, 12 Mar 2023 09:43:42 -0700 (PDT)
Received: from letter6.txt (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id v19-20020a197413000000b004dc12a7e03bsm689290lfe.222.2023.03.12.09.43.41
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 09:43:42 -0700 (PDT)
Message-ID: <640e013e.190a0220.b6471.18d8@mx.google.com>
Date:   Sun, 12 Mar 2023 09:43:42 -0700 (PDT)
From:   Sergey Lisov <sleirsgoevy@gmail.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <c9f8d89e-7420-a049-907c-60e3fa551548@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: exynos-dw-mshc-common: add exynos78xx
 variants
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> Bindings and DTS (and driver) are always separate.

Okay, will split the patch.

> Compatibles must be specific.

No, this way you'd have tons of identical compatibles that only differ in
the exynosXXXX digits, and are functionally equivalent.

> That's non-bisectable change (also breaking other users of DTS), so you
> need to explain in commit msg rationale - devices were never compatible
> and using exynos7 does not work in certain cases.

Valid point.

