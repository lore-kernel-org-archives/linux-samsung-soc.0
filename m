Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6FCCCA473
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 16:25:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233818AbiGFQZm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 12:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiGFQZl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 12:25:41 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10E7248C3
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 09:25:39 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t24so26832883lfr.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 09:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JIashhGYeFkYbR7kffcxLHDD+hAhV8QuuTTEgk9FK6w=;
        b=SSDkiH9n4YUDAEgzeFf1wijKsdU1ygC2Uyrcwx3gg8zkLNpuo/dxGqL9ivnDrIvWyk
         K7yIk7BMjOc6IC/9b4aQTUqXeBnTDeHPL2xwu4cOGWLdCvJ9GySyewAp8xjALGKyBPn4
         wrsgaRflmgDS7gopEhVKYyjKWrASbY+yuOsZRblk4Dz4T/xpYr5ti5UqzEO+kUH0j0ev
         EsvgVCkjESXJvQtWvCzUzKH6nhBTNYjyCqwaLce8Z/sswjrLjQA/pyjdGHbUo2hfwQJp
         WmHOcsagFJ1ypodUlhsfFtJOhHYm0I4etlRQwLGimh/qRSggOHY1Q3wVmFvSc2m+5FKR
         8Eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JIashhGYeFkYbR7kffcxLHDD+hAhV8QuuTTEgk9FK6w=;
        b=MSi2mqjgqoghLqczc/LtcXiU+m2RELM7bnoNoDd361ql3iEE1KpBf0o4hIbetqz7bC
         +kjGzJHzPngAlbFW7EQGL5ytIuB+gGudu/R0T70W2noe2CwjIpSiOpMWey9a9m/HrKe+
         +Ra+qdc5KHDQ0Bv0BNCDXQ5of3F/hW9cFmvn/GdCYh4tmWjL81pIcJhgqGAbuET0f1FB
         Fkewq3IktVqm9nus5aaRPtL+QJeXtRnwl/FR22XgU9r4ngLMOoB/gCK3YVtkn9Y0mLho
         /KGr02HW5X6IriIYU+v15henxFZ98R7qbGEYel+nIlXINW9ucYKUoZ0wfMQ6Xfzo6TpA
         i61g==
X-Gm-Message-State: AJIora8CI2o/C19dFw8lIf3jNod9OW5+yEejwdGbekt5851hNSZ0wBz7
        Tf303vQublTUvGD7z4+Tv5FRZQ==
X-Google-Smtp-Source: AGRyM1v3dY3SIkHzldafEjg4djIqTpd+Td8TJMqE++IEKyQClDARm8w1I4/mKmWXRyPnpi9Alj+NTQ==
X-Received: by 2002:a05:6512:b8d:b0:47f:74f0:729b with SMTP id b13-20020a0565120b8d00b0047f74f0729bmr25713700lfv.403.1657124738237;
        Wed, 06 Jul 2022 09:25:38 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id 14-20020a2e154e000000b0025bf58c5338sm4025232ljv.15.2022.07.06.09.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 09:25:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     krzysztof.kozlowski@linaro.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, alim.akhtar@samsung.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: samsung: exynos-pmu: cleanup assigned clocks
Date:   Wed,  6 Jul 2022 18:25:35 +0200
Message-Id: <165712469638.30806.13604483011536770069.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706160257.27579-1-krzysztof.kozlowski@linaro.org>
References: <20220706160257.27579-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 6 Jul 2022 18:02:55 +0200, Krzysztof Kozlowski wrote:
> "assigned-clocks" are not needed in the device schema as they come from
> core schema.
> 
> 

Applied with Rob's tags carried over from v1.

Applied, thanks!

[1/3] dt-bindings: soc: samsung: exynos-pmu: cleanup assigned clocks
      https://git.kernel.org/krzk/linux/c/38aed2e0aa406de6dda64515cc3937976a27038e
[2/3] dt-bindings: soc: samsung: exynos-pmu: use abolute ref paths
      https://git.kernel.org/krzk/linux/c/61bebc2902901cc2f1cac496dc81be38ca74d7d4
[3/3] dt-bindings: soc: samsung: exynos-pmu: add reboot-mode
      https://git.kernel.org/krzk/linux/c/3e27bf719303b1b19edd37bd04e9e586c73f6511

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
