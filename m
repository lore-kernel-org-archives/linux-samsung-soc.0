Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41241C4320E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 08:56:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A72060F55
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 08:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234568AbhHKI5A (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Aug 2021 04:57:00 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:45130
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236392AbhHKI5A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 04:57:00 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id E7B5340330
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 08:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628672195;
        bh=4UxhWMl2UKsgMwJ4KPtjlnO+CYaM79dqretD7p+dVEo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=GLcoQlN12pQpFBAjVEf3Z84A85xqE9cD8Wc/QRQsl8W4cHDRkMhsy1OA366Mi2Igo
         FzDUW9/T126Xe9Oj3ljE0xKJBTgefNByODgQn4XM6dC2ZOEb8xHcP4HHYZGTszl4C0
         rqNeYjtzV2ZSutY+IK1k6b55SlHszKeiAGcXit7/UWaQ4EyY0+UbiHZvMnXDuto2wS
         D1UB21GcstYHSUC31yZkQZoNEu3uHTp9c6rinf60OrvfLHnO/72vCmR6URxwLT+io8
         oA+4feQdJ6uWmzFvTQtLlMr4jZi8wea6NR5sV5dAIwLQkN6uPYI8Az9upvRgHS8mAC
         ZJPwHiIPgDCJA==
Received: by mail-ed1-f72.google.com with SMTP id p2-20020a50c9420000b02903a12bbba1ebso887030edh.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 01:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4UxhWMl2UKsgMwJ4KPtjlnO+CYaM79dqretD7p+dVEo=;
        b=Z/kypft2uvqxKWs8OYmgrfhEuppKwGbPZZmcvautVcC6MAB9P4HYDvkBzPP863y2WX
         lPD7AZ8y6dv08n/8iIOM2sLUPqR5pb3GgHeNw/+lT6Ny8iezrZ50Kg4IOv3UZdJcICIL
         kwrtWJ1121B6Mu4D6B05xGM7idBXs5QxLRgbvxX11JbEXFsPHW3veV+y39GJFknKTwga
         pxoRQrRKIjUYza31lA6STCJdjRRaTMlUPhNN0srn/ROLslBcNTb+bNd7y5ynd5iTxofS
         r5CrT/JcijtZTBqMfeHD37S//1oMtZ25kIiQqBYt/X8ZIHAcCErnvIMsGnWZsvthTa2r
         hOKw==
X-Gm-Message-State: AOAM532BgRUY677M9Fo4udEyI2cQw3qDJVlv/SRto59WjAcQ7yafhPW3
        9o5oX7rbof7Qq1509DaL2pkP7baqeuUrRqReJXjHuZLKGDBZlxyNoruUgloX6g/RoOhBZxJSTxE
        Bet2tCe/hKy7w8E5gcgIlvSTNEPOQoqOekbj3/m7qSo7cIC6D
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr2668525ejc.188.1628672195690;
        Wed, 11 Aug 2021 01:56:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpmVBBAuHJt1OGlhgZTnKfjQF5Z2T6ege4UKylVzKjJZwBAKyNkyO/TlXJPJzdEYl+DoWCBA==
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr2668511ejc.188.1628672195534;
        Wed, 11 Aug 2021 01:56:35 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id x4sm7834003ejb.106.2021.08.11.01.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 01:56:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: samsung: DT64 for v5.15
Date:   Wed, 11 Aug 2021 10:51:28 +0200
Message-Id: <20210811085128.30103-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811085128.30103-1-krzysztof.kozlowski@canonical.com>
References: <20210811085128.30103-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.15

for you to fetch changes up to 01c72cad790cb6cd3ccbe4c1402b6cb6c6bbffd0:

  arm64: dts: exynos: correct GIC CPU interfaces address range on Exynos7 (2021-08-09 12:36:41 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.15

1. Add CPU topology and cache information to Exynos DTSI files.
2. Correct GIC CPU interfaces address range on Exynos7.

----------------------------------------------------------------
Alim Akhtar (2):
      arm64: dts: exynos: Add cpu cache information to Exynos7
      arm64: dts: exynos: Add cpu cache information to Exynos5433

Krzysztof Kozlowski (2):
      arm64: dts: exynos: add CPU topology to Exynos5433
      arm64: dts: exynos: correct GIC CPU interfaces address range on Exynos7

 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 102 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi    |  37 ++++++++++-
 2 files changed, 138 insertions(+), 1 deletion(-)
