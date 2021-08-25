Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3533C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Aug 2021 13:41:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C978260FD8
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Aug 2021 13:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241345AbhHYNmY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Aug 2021 09:42:24 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:35632
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241334AbhHYNmY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Aug 2021 09:42:24 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B162240798
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Aug 2021 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629898897;
        bh=Lkb6PM27Kco3Iu1MuOjl/JgWnsvlf08P1Raoj+pvz3A=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=CK6eYYjDDhgFXAcW2aHpcqKMRSOBZ4UDyxcDjzJPLmtDAtocpeClzZKUA+Es9p7Du
         /ZxfldsrScf0EO1zk0ieClaojgN9T4hE8qvyVtTmXdIcvWY6mmUV7ixWVJwc6kyDeE
         vPe8K5QLMRCjEAdrQfVvuvPEzkVu5EuQczyfNJYq12wyS6t0+v+hF8xp2BtTFm8oZM
         xnbCH4kcLx7oB0jSbV1LhRNY8HkIXx+3B5ZpTXW0wcXRIgKzTZRaLBE/y43r7+2twO
         +CZKXrbGZ/zyTpyily/9r7VOnTQtNRFH8QRexTtgasguQ4g+1MtgP89BkHyvkLMDFx
         eKtNmiaF+fMXw==
Received: by mail-wr1-f70.google.com with SMTP id i16-20020adfded0000000b001572ebd528eso4374171wrn.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Aug 2021 06:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lkb6PM27Kco3Iu1MuOjl/JgWnsvlf08P1Raoj+pvz3A=;
        b=fR3nxR+x1vaMQkBOp4cb852rFIym5ffDdLatBFTtTy6lGo32BYZFrj3kkj8YVVd4NC
         9xWBYDDQNwsO7oeRlQbasw9YEh9LMRFGifLml+hXQuTrFZs4szQyvH4PAPr0IyqNYDE7
         xIcv+fCqxzP5OptxsE30wivTF/E0k0I27TXe0SXERurxvQNn+97/63iSN/CgHILokc+n
         tMELPvkdPT75dWzvJ8QQY1vDejF4JN76K4QQkCI8kUdjO0wP4FVmj0GWM2Tf3q0DnwAO
         PyqlVnh4dXwq9s2mDW0MY0oYdb/QOgSRnT8jES8mZBJz07wdgBd86r1UaH4suDcRLcX9
         OhEQ==
X-Gm-Message-State: AOAM533fEkmqQu+62l/q1ZyhKR3ZnWeBvQgDv30lFgy1LHCkZwa9AcaL
        QBKZYZ8mlg5FoNiC3mUz6CPvuoJ8AgWGc7gYSZBaEDmQ3X2b74JoSG68gT0X1aUdbv2M4Z3K4K4
        twyMVq52RKnR5XsXqmyhzRzvpkjXuLNc72WhkFcCuKFi+oPUm
X-Received: by 2002:a1c:44c5:: with SMTP id r188mr3291304wma.9.1629898897381;
        Wed, 25 Aug 2021 06:41:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyYRLtspcOY32ZHpe9nvY0ozhgHK+bBdMXVh9m1PO2zTa0PuTosOfEluJhLyloJQ/WFCYypA==
X-Received: by 2002:a1c:44c5:: with SMTP id r188mr3291280wma.9.1629898897212;
        Wed, 25 Aug 2021 06:41:37 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
        by smtp.gmail.com with ESMTPSA id g5sm7185861wrq.80.2021.08.25.06.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 06:41:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v3 0/8] dt-bindings: clock: samsung: convert to dtschema
Date:   Wed, 25 Aug 2021 15:40:48 +0200
Message-Id: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v2:
1. Add reviews.
2. Split Exynos4 ISP into separate schema.
3. Add maxItems to clocks and power-domains (review feedback).
4. Do not allow samsung,exynos5420-clock and samsung,exynos5800-clock
   without syscon. These clock controllers should always use syscon
   to allow DMC bindings access the registers.
5. Drop assigned-clocks.

Changes since v1:
1. Patch 7/8: include header to fix clock IDs error in example.
2. Combined patchset of separate v1 sets:

https://lore.kernel.org/linux-samsung-soc/20210809120544.56596-1-krzysztof.kozlowski@canonical.com/T/#t
https://lore.kernel.org/linux-samsung-soc/20210809130935.80565-1-krzysztof.kozlowski@canonical.com/T/#t
https://lore.kernel.org/linux-samsung-soc/20210809135942.100744-1-krzysztof.kozlowski@canonical.com/T/#t

Best regards,
Krzysztof

Krzysztof Kozlowski (8):
  dt-bindings: clock: samsung: convert Exynos5250 to dtschema
  dt-bindings: clock: samsung: add bindings for Exynos external clock
  dt-bindings: clock: samsung: convert Exynos542x to dtschema
  dt-bindings: clock: samsung: convert Exynos3250 to dtschema
  dt-bindings: clock: samsung: convert Exynos4 to dtschema
  dt-bindings: clock: samsung: convert Exynos AudSS to dtschema
  dt-bindings: clock: samsung: convert S5Pv210 AudSS to dtschema
  MAINTAINERS: clock: include S3C and S5P in Samsung SoC clock entry

 .../bindings/clock/clk-exynos-audss.txt       | 103 ------------------
 .../bindings/clock/clk-s5pv210-audss.txt      |  53 ---------
 .../bindings/clock/exynos3250-clock.txt       |  57 ----------
 .../bindings/clock/exynos4-clock.txt          |  86 ---------------
 .../bindings/clock/exynos5250-clock.txt       |  41 -------
 .../bindings/clock/exynos5420-clock.txt       |  42 -------
 .../clock/samsung,exynos-audss-clock.yaml     |  80 ++++++++++++++
 .../bindings/clock/samsung,exynos-clock.yaml  |  59 ++++++++++
 .../clock/samsung,exynos-ext-clock.yaml       |  46 ++++++++
 .../clock/samsung,exynos4412-isp-clock.yaml   |  64 +++++++++++
 .../clock/samsung,s5pv210-audss-clock.yaml    |  78 +++++++++++++
 MAINTAINERS                                   |   4 +
 12 files changed, 331 insertions(+), 382 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos3250-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos5250-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos5420-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.yaml

-- 
2.30.2

