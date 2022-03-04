Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A6AC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Mar 2022 12:25:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236788AbiCDMZv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Mar 2022 07:25:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236434AbiCDMZv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 07:25:51 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F611B01A7
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 04:25:02 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C43BD3F1C5
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646396700;
        bh=TY+lA6i8XxWtBRy+CXNMVFSE4D7AiD1N2aYEOcdmjms=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=DtmU2TP9KpY2Kpbnm7c1WAoDUrzvqWn7+46lnYWjgx8GIrBviiqLaLyLG/F7lMb5S
         K8f6Rr9EN7BQZO0YhXTHgfKIBco6f/B+mWPnmXGFllOrWkzai6s4uTiFow0Duc7L3x
         45Bo4POJoHRTc59DRfun74nboa1aWnHIgNSs6aBXQd6jRi1lUKBxY5E5P2EnGv5cMh
         DWjN74D7WVib0q/PbAzN6FITxhrnfRtYR+D3BR4n0SbZN3OTULdyKbdNs7O01fdj49
         NjxMOW6GYe/T83FsWrhxtv7THkc+04GMqFT4HVcgEt2Qpq+URLvIcPYLVLM9n+6j7w
         ECKjzqX7rH8cg==
Received: by mail-ed1-f72.google.com with SMTP id l14-20020a056402344e00b0041593c729adso4490512edc.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Mar 2022 04:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TY+lA6i8XxWtBRy+CXNMVFSE4D7AiD1N2aYEOcdmjms=;
        b=pQgeiaGoNaFF6VfjGjkbeV+KGKtXyvVrbyqGceWygbZLZGDyRk2aioWrocrWFzsRyq
         CzmCxm/sXUNYuFgjgwvcOESjOK0E12Bj/TNg2/tRuphk8m/wNGVDvLDpvNlRwj0pnXfe
         56039WF8TR0AbiXyTICCQ9H2YtvDepS2OR9JlFDJ8JUE6lNm7ApOPbE3E/TJEeQLqLRj
         lNXCm1shVfPzKgvLTOoxIZg806zZc4NIVlQ/lE47BitPeJnebtnte7JD/QAtqMW5FYMo
         fcMu6+pco3KkAwtEGYTQy5yhHnp+H8gt477gp3zA4nj6TAOsPnuZApGNIME7tDImip8O
         T11Q==
X-Gm-Message-State: AOAM533QJ4oRWCjwY+EeKnj9mg+8YkEkz1RN63oj6bIvpXLdCwd4Tobd
        zRtovWofvJPoJIEAqPMaf0W/lpcFSBcqsccvnjrz5nbUa0bU4AvRKJUaDgq4xj2cOTFLlEayeUn
        gk6Pf6qDPFMeGNpGd+u0bYDYsYqJjBFmbov/9qDkbWdcFHZ9E
X-Received: by 2002:a17:906:b207:b0:6da:81ba:3789 with SMTP id p7-20020a170906b20700b006da81ba3789mr8302674ejz.578.1646396700461;
        Fri, 04 Mar 2022 04:25:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWzK+iNBIRKwo4mH2PPJHmzHvNxYOtWvwU/P0Gkg3e+/8BPPc+9gd/RWrf4ekFqNBIo2I59Q==
X-Received: by 2002:a17:906:b207:b0:6da:81ba:3789 with SMTP id p7-20020a170906b20700b006da81ba3789mr8302658ejz.578.1646396700216;
        Fri, 04 Mar 2022 04:25:00 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7da17000000b00415a1431488sm2047368eds.4.2022.03.04.04.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 04:24:59 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 0/4] dt-bindings: timer: exynos4210-mct: describe known hardware and its interrupts
Date:   Fri,  4 Mar 2022 13:24:20 +0100
Message-Id: <20220304122424.307885-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v1:
1. Patch 1: Specify Tesla FSD interrupts.
2. New patch 4 for Tesla FSD.
3. Add review tags.

Merging/dependencies
====================
The dt-bindings (patch 1) can go via timer tree and I will take later DTS
patches via Samsung Soc.

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  dt-bindings: timer: exynos4210-mct: describe known hardware and its
    interrupts
  ARM: dts: exynos: add a specific compatible to MCT
  arm64: dts: exynos: add a specific compatible to MCT
  arm64: dts: tesla: add a specific compatible to MCT on FSD

 .../timer/samsung,exynos4210-mct.yaml         | 67 ++++++++++++++++++-
 arch/arm/boot/dts/exynos3250.dtsi             |  3 +-
 arch/arm/boot/dts/exynos5250.dtsi             |  3 +-
 arch/arm/boot/dts/exynos5260.dtsi             |  3 +-
 arch/arm/boot/dts/exynos54xx.dtsi             |  3 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  3 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |  3 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi            |  2 +-
 8 files changed, 77 insertions(+), 10 deletions(-)

-- 
2.32.0

