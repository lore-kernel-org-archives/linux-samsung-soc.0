Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11607C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 May 2022 07:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245686AbiEEHMb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 May 2022 03:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245580AbiEEHM3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 May 2022 03:12:29 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D807147AC5
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 May 2022 00:08:50 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id be20so4112501edb.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 May 2022 00:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fVLdbbRm7o8Kr/qaiqHOlJCx7E5vPIzj60nZ6WYkBcg=;
        b=dbPdHvIdFxfl/xApx4IIEno/DV26lk8IA7uY6v1Qko7aEUeZLZ2WCSoslxjfMyFrEx
         6eQ6ES3C7Av3Xu8M3YEpjltFwD+HuYjFobzSEbJEK/loZ6NcteIWA3zzrKeedxFD8ZyP
         XE8sL6nVRl+WpomkxXT2c6Z8CxHWRPufcOR4ZRc0oiKtmuYaWUFLxxMe2U0bL4yBeSCr
         LkH4gPUBCQZgHdQDtrzfTdo3q5Y+uO0X4aqyAeDF6m/B0oYrrAxffI+RXx686iReYA1U
         Vf4JQ8v2kfc0mljWWLfKDv56o5r6CAl7z4WRbDHd6F1gYhClMUiCK7UgsPRB5rdvi8Xs
         t0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fVLdbbRm7o8Kr/qaiqHOlJCx7E5vPIzj60nZ6WYkBcg=;
        b=Gq99feg4Hph9NYhMyGorn5+wKMbnowzGZIw8SnSqg8M/54qzdb9vuyvQOE0zTGqLK1
         49KOImSSJczl4FfBL4xVYx6ztMoJFhwrqWltjjg4x9yz7DR74whvsFRJtcz+rSCpEJZJ
         1hGZae7DmiO7tua1IhXKOG0M4EHVZazPyvISuwkFfslIdRtCuDsmfzvkLfxVXWiHBVh5
         0fFbdqOWXaDwOby0R1bMwYxVgITityBcQWcCdg4LvohgJ6DFSfIB0WqEvREQhuoaOPJa
         WL9bPbZxTdeA6m5Uan8HPi8jJSoMY0x/31O+fB+RqYPXnNNei4ppBPhrxQ6I9lMZ+L1n
         dIpw==
X-Gm-Message-State: AOAM5322Zf76fMfS4rUONP1eDopmr4RdmgiQkcnCj0CyL63PM2ospsuO
        7wkuvtx36zU6pjp3hcut4Up1Cg==
X-Google-Smtp-Source: ABdhPJwEx3qcD0RQVnukFDRTaaKu3Gzc2FGACZpB8A7Pw/KD772yFDHP8ydZmZBO7Jk3D1w2hf8pAw==
X-Received: by 2002:aa7:cac5:0:b0:41c:c1fb:f5cc with SMTP id l5-20020aa7cac5000000b0041cc1fbf5ccmr27357092edt.219.1651734529254;
        Thu, 05 May 2022 00:08:49 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b4-20020a0564021f0400b0042617ba63ccsm394386edb.86.2022.05.05.00.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 00:08:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 11/12] arm64: dts: exynosautov9: switch usi clocks
Date:   Thu,  5 May 2022 09:08:44 +0200
Message-Id: <165173452272.31721.13862341104750504155.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504075154.58819-12-chanho61.park@samsung.com>
References: <20220504075154.58819-1-chanho61.park@samsung.com> <CGME20220504075004epcas2p2fafaa565e78bfdbbf55c2b4da31743a9@epcas2p2.samsung.com> <20220504075154.58819-12-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 4 May 2022 16:51:53 +0900, Chanho Park wrote:
> This changes to use cmu clock nodes instead of dummy fixed-rate-clock.
> 
> 

Applied, thanks!

[11/12] arm64: dts: exynosautov9: switch usi clocks
        commit: 4c882968d434c9968f53fbefa3ba6e64ff33d6a0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
