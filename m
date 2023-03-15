Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723B7C61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Mar 2023 18:57:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbjCOS5l (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Mar 2023 14:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232623AbjCOS5k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Mar 2023 14:57:40 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D974967035
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Mar 2023 11:57:38 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id s22so25532709lfi.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Mar 2023 11:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678906657;
        h=subject:in-reply-to:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g+Z6yMufViGivHBpi3ybAlT526oTlR6qrL1yn4estsw=;
        b=TbvS11P0xtuzQgbgQCqOohztcpoFJths5zdmiB8U1YiaqalvTn8Kg837uvxLKqhmmu
         Z6pr0HA8pY50Okdo77gCa6IS3qO1k1eiqbqVfBPriRIGpjBbYMWnld98OAJK+aa8Cuv0
         yoZegs5NlIJN9iyxy0kt8A2eRkIcSlVCI7Z9ud1qX3P9ZDYcTGIawqj2L+OINfxDYoju
         AWoDgcFNJPyk93BG3mSIafnnbDkwWhacynrJmJ+Hbjnfdwl2IRXUZFKAfhYlvq5dlBXD
         wRC90U1pcM3lXBXMtaUx2GSm5bsNL5xN+8sYciRNHaVUDrtfe3kTdYgKYU+8Gu8DL4vJ
         Gb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678906657;
        h=subject:in-reply-to:cc:to:from:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+Z6yMufViGivHBpi3ybAlT526oTlR6qrL1yn4estsw=;
        b=wsOjr1Nbat2SnGweWTjl+adsgdPBtsya5OTpYB56CnLm/THbNoyobnjW9wokwhmRn0
         Fu9g16nmNmYYX43w9BXM+hk6K6crrZjcx9ybFGjzf+Vii23qb9iw4A2vv3F7/uZ3ja+r
         o37aYENkpQVPm7nISkVHo4ZaHz5rq9GZg81two8CYWhaovU7nARACkYFaIah0jyRhKAM
         otiXm/S8jIIGpGxb/7bhDyhiJntf+l+chrIpeot+VmlLSGsec7FqyQUNMLA0LPFTulJv
         3JqjdBT3KZzJLuxKLSqsihcTGUTNGRskmiiNVAPKOs7lphJVoJ/gfUbBjPW0+3nLdFum
         xqYg==
X-Gm-Message-State: AO0yUKWYTut9tn13ndN/NqoSBFCsltsn3WoXzA9Iqm20ADcPuztnPqbp
        +w1/SBzci+K1HdqNUR6GGt4h29nPgXiKRFL0
X-Google-Smtp-Source: AK7set8mNeiKJhSjVIOOafNG41yerQyNAEcc+yZx2RFaV0HduijUIfLTrNsJ7Tk5cYJlCdCx3ktqYA==
X-Received: by 2002:ac2:55a4:0:b0:4de:7b5b:f16f with SMTP id y4-20020ac255a4000000b004de7b5bf16fmr2486151lfg.7.1678906656901;
        Wed, 15 Mar 2023 11:57:36 -0700 (PDT)
Received: from letter.txt (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id h5-20020ac250c5000000b004dc4e3f02aasm918127lfm.53.2023.03.15.11.57.36
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 11:57:36 -0700 (PDT)
Message-ID: <64121520.c20a0220.dd80e.3259@mx.google.com>
Date:   Wed, 15 Mar 2023 11:57:36 -0700 (PDT)
From:   Sergey Lisov <sleirsgoevy@gmail.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <1bd962b1-2fbc-9bdb-8b7a-9f2c70c316e2@linaro.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: exynos-dw-mshc-common: add exynos7885
 variants
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

>> +      - samsung,exynos7885-dw-mshc
>> +      - samsung,exynos7885-dw-mshc-smu
> 
> What about the if-then at the end? Since this is pretty compatible with
> exynos7, then I would expect being added also there.

Makes sense. Also it probably makes sense to add "samsung,exynos7-dw-mshc"
as a fallback compatible to the jackpotlte.dts, because it probably
somewhat worked for whoever contributed that.

