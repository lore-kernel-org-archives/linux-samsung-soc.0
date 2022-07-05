Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE036C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Jul 2022 10:42:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbiGEKmE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Jul 2022 06:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbiGEKlw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 06:41:52 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5328715A13
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jul 2022 03:41:48 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id t24so19858998lfr.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2022 03:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/jfcvja26P96z3/urGx2rae4b/vvXk75GHplu3VS634=;
        b=HJCTR5wY/AoVZCiO5otcGz+kK9HRkTTYbE/XFvZlslGj8XUrvApcgsaQgBZhRn6lsM
         DvvJjLbgPmdRLhaPoOCSHy2wOwh3okcC3wUiGnCrW4rgtTrloJkDQOqiZYC/dUsRTh/z
         5O6k/tjgbVHtygp49lvnY07V2qUmhNoswPdfZtfYR6tLgGhvVPAWbzEenZcsAmleDmTE
         xqZnaqnt8AH8PviQ6H5L1eEpdSEl8bYZfE73DgHfmYVdTlUuxiXQvsi/wIICXC6uQl3q
         WL0dRjUnNG4iXhF6QTgYAY3OzA1oYohvV4J8XkNMvnp1ffqCRNBr0IZLZonGew+GvC3h
         jTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/jfcvja26P96z3/urGx2rae4b/vvXk75GHplu3VS634=;
        b=HWGFF+oNn4GkVHXCFz9gQ6zOpslozPkfEuma3wV1pQytR3N+3C9RtbxjnWb54Y1JOF
         7jypxZ3PfdU7h4EWmaxIbrNx1r2KfGQNFzflRPI/GD/dfjBG26RanVWcjVyFknoc28fj
         iFCIY08CtxRwx2LyREXZfz/bOFPBcqs4wk8x0NNfjIhcX91G/iS5YfjZnEEA4a/JeFMr
         jYkTC5mRmyJfCs65LvvaCQc64PQMLWKg/kEXjYyga5BLd20AD6l+eohijEAy9GjbWSOH
         7EebfwWsVLfdZjNbnztdpWHZ+djIOfA24665SlicvbmRx51l+TCwqLEXiMR1uX2ByQdv
         0dnw==
X-Gm-Message-State: AJIora8CX4q9JHh+uRzbH50O44QZ/hvijIlwQLcSaSsIrACvtkrs3HIP
        W77/HL1rj5mDGoNiuNQWiXELFw==
X-Google-Smtp-Source: AGRyM1uCdOKxFWjeK6s8eyzBuGkVZZYJW6HMdRXUsHcVjnulsQreMlciaL9sLeKbD6P1l5C77Bb4Iw==
X-Received: by 2002:a05:6512:238a:b0:481:154a:fe47 with SMTP id c10-20020a056512238a00b00481154afe47mr21341766lfv.69.1657017706733;
        Tue, 05 Jul 2022 03:41:46 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id q24-20020a056512211800b0047f615b5cbfsm5619814lfr.211.2022.07.05.03.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 03:41:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        chanho61.park@samsung.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        jaewon02.kim@samsung.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
        semen.protsenko@linaro.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 3/5] arm64: dts: exynosautov9: add pdma0 device tree node
Date:   Tue,  5 Jul 2022 12:41:38 +0200
Message-Id: <165701769258.78614.16079833355225996036.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220701015226.32781-4-chanho61.park@samsung.com>
References: <20220701015226.32781-1-chanho61.park@samsung.com> <CGME20220701015451epcas2p2834c160df3be05cf73ff30eb597d10af@epcas2p2.samsung.com> <20220701015226.32781-4-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 1 Jul 2022 10:52:24 +0900, Chanho Park wrote:
> Add an ARM pl330 dma controller DT node as pdma0.
> 
> 

Applied, thanks!

[3/5] arm64: dts: exynosautov9: add pdma0 device tree node
      https://git.kernel.org/krzk/linux/c/358ab0d11d8446a93efc9c79007e8513e8becc30

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
