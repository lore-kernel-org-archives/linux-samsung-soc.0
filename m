Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173E2C2B9F4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Jun 2021 19:33:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00F6761246
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Jun 2021 19:33:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234362AbhFNTfW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Jun 2021 15:35:22 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35372 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234976AbhFNTfU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 15:35:20 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lssKi-0000AH-7D
        for linux-samsung-soc@vger.kernel.org; Mon, 14 Jun 2021 19:33:16 +0000
Received: by mail-ed1-f71.google.com with SMTP id y16-20020a0564024410b0290394293f6816so3467840eda.20
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jun 2021 12:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qoNs0rkeMMUPf/jH63Pbn4GEa6xEussm8RBcM0JZAj0=;
        b=ii4oMHICY3Ox0Qjfc41Ts1OS3uInyEC3hnZXxvyb+d1qXMiJaJM3HCbOusN6Qk01Op
         oGA4QFQbQHUiKby4i7SIb4idbudrQnJ2dprISA6VM/8d0oii/j9V/OsrMAcE0DlpIG7v
         kixJkYK3Lhh+Guvi9h4vWnzjdpzsvkJWTe1O+2e2rc8um5wX6j0igqAg/9/1CayKgryR
         UiNxToSWEbS4EMQu8unLCHM07idVlOaLyzxTGBpSpsEsGfO9Ui2MSfUo1dj8ahtIAHXh
         96F0FwgDT9stRv5uYg1Rba8jNBISbNbRwUQXg+Fwb1W9sOaYilOOUcHuRK1wQefnXvZ6
         Uo/Q==
X-Gm-Message-State: AOAM533g5ne+gqK5WnSA2hb1c1JJPNuX4GXKVoclhfeTNW58k4O5qOfF
        5fvUjY5MI/h4Hjt29BRQutEn658gJp5M5sasus94tReHBicT2ev7sLEFJzTV1GUKpY5epSGX3r2
        jU4GC69lhjrbkdZ9Y7Ch2qOJGj8A+xSkNq0e6lZV3bVSNJ8IA
X-Received: by 2002:aa7:c818:: with SMTP id a24mr19448641edt.53.1623699196022;
        Mon, 14 Jun 2021 12:33:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq1B8upiBsEetFmAjSMtxkDRFzyHcPey+4IkR631CQiOXVzgOKDik6rb85uCWnTOZsFAP0FQ==
X-Received: by 2002:aa7:c818:: with SMTP id a24mr19448632edt.53.1623699195929;
        Mon, 14 Jun 2021 12:33:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id gw7sm8029291ejb.5.2021.06.14.12.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 12:33:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM/arm64: defconfig: samsung: pull for v5.14
Date:   Mon, 14 Jun 2021 21:33:09 +0200
Message-Id: <20210614193309.20248-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
References: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-5.14

for you to fetch changes up to 38f61ef1a0cefb4e3b37c3e7b16c0f68df34a3dc:

  ARM: exynos_defconfig: restore framebuffer support (2021-06-11 12:54:33 +0200)

----------------------------------------------------------------
Samsung defconfig changes for v5.14

1. Enable Exynos Universal Flash Storage (UFS) driver for Exynos7 arm64
   boards.
2. Restore framebuffer support in exynos_defconfig.

----------------------------------------------------------------
Alim Akhtar (1):
      arm64: defconfig: Enable Exynos UFS driver

Marek Szyprowski (1):
      ARM: exynos_defconfig: restore framebuffer support

 arch/arm/configs/exynos_defconfig | 1 +
 arch/arm64/configs/defconfig      | 2 ++
 2 files changed, 3 insertions(+)
