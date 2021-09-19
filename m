Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6A6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 19 Sep 2021 09:31:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5329D611C3
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 19 Sep 2021 09:31:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237512AbhISJcr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 19 Sep 2021 05:32:47 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:40536
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237226AbhISJcq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 19 Sep 2021 05:32:46 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D0ECD40265
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Sep 2021 09:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632043880;
        bh=Zlzk0L+jJUx03F0UWBN9FUh9Hi4wSYcrxBZrYue21xY=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=LfHTCY+r7KvngarlW3ov6gMM3gwyvQpOQvAw6BSV4WXJBs7tKz61DoLopfB1fc8Oz
         eE43CBnCaYlsaOygCM4otIigS0CmSqu6QQXUc/E2tAf+KtqG8QZG7RNu4qLCHpZpAo
         K9unJ43vm1lFSxDt7l9flE3/GmnPrXjid2dkqhDcIjCA7EB00CYCB6HTByHWTgv3kb
         edrpcWAmI3TgwoX6fEFcB9Jxbqo2XLhDZ7MAodJGjKAtNafYj39u78Q9e1kVvlNObu
         5VH6rdkpXj2mvXIVxrFh4qLR0K+J8897NOHSBTBFC0sgyz9F4W2LeiC+87GkZQwZiX
         eDirt7kc+l1/A==
Received: by mail-ed1-f69.google.com with SMTP id m20-20020aa7c2d4000000b003d1add00b8aso13116095edp.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Sep 2021 02:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zlzk0L+jJUx03F0UWBN9FUh9Hi4wSYcrxBZrYue21xY=;
        b=5qTYXzWfFzxpc0mZkqwmc3dVbxxjsXWiz+v+0hOXs/qVs39nIAT5xk05Q6OdNRg9l+
         voJ9Y8S9y5soFNqWrfuH39TaGdIm9KmMCXBu3f5Cyb3IX6TRTmgfitX3TjSIIwbq15n6
         9ceNEZNztiVbfxdYfgEPsrj8YSvlu1taYqnbRHoFlOBlNMjxnC/ktBhTHyBGNakjEKmE
         kSHAJgb4L97oNk7lSo7Db38O2txe7DT7nCiHzPL0ATwXrfCYVedUZca7JWtFIBHLaYur
         4pWRx/L9dYl89B2FqmGB5y8Kv/yV4AYUDGzePRGtQywP6URBqTzHTUM6OX43xD2mpyT8
         n48Q==
X-Gm-Message-State: AOAM531v324HmhSvbRYovbVkmAlYm0BOKaPMgCsEDaiRik39ib+TwN4T
        Qx0AWAw/CC8tfufRoqs1KJIQ/hoOX9UCRbu+ZzDbI9EyelM1hfucNBf1Of9SAXMQ0lBzk7ocWgF
        Z4/hvdHMfaCWhfuxCdbS5m2a0DALQcQieOUbPM/ZjsyrhHRwJ
X-Received: by 2002:a17:906:eb56:: with SMTP id mc22mr21317132ejb.542.1632043880366;
        Sun, 19 Sep 2021 02:31:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA57zHEYeEhvGZbVieFxmBitOGTy7AjxQG0k0Zag5Vv7d7dTv4Kz8JFMwEnzRS1C5FpIrGrg==
X-Received: by 2002:a17:906:eb56:: with SMTP id mc22mr21317115ejb.542.1632043880176;
        Sun, 19 Sep 2021 02:31:20 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id p24sm514111edq.27.2021.09.19.02.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 02:31:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 0/3] soc: samsung: exynos-chipid: be a module!
Date:   Sun, 19 Sep 2021 11:31:11 +0200
Message-Id: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v1
================
1. Drop patch 1/2 - exporting soc_device_to_device
2. Add new patches: 1/3 and 3/3.

Question
========

A question - what is the convention for naming modules: underscores '_' or
hyphens '-'?

The C-unit file already uses a hyphen "exynos-chipid.c", so I could
create a module named:
1. exynos_chipid
2. soc-exynos-chipid
3. exynos-chip-id

The Linux device name is "exynos-chipid".

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  soc: samsung: exynos-chipid: avoid soc_device_to_device()
  soc: samsung: exynos-chipid: convert to a module
  soc: samsung: exynos-chipid: do not enforce built-in

 arch/arm/mach-exynos/Kconfig         |  1 -
 drivers/soc/samsung/Kconfig          |  4 +++-
 drivers/soc/samsung/Makefile         |  3 ++-
 drivers/soc/samsung/exynos-chipid.c  | 14 +++++++++++---
 drivers/soc/samsung/exynos5422-asv.c |  1 +
 5 files changed, 17 insertions(+), 6 deletions(-)

-- 
2.30.2

