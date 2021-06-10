Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21703C48BD1
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Jun 2021 07:41:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07ADE613BD
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Jun 2021 07:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhFJHnE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Jun 2021 03:43:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41141 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhFJHnA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 03:43:00 -0400
Received: from mail-wm1-f72.google.com ([209.85.128.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lrFJH-0001ZF-PQ
        for linux-samsung-soc@vger.kernel.org; Thu, 10 Jun 2021 07:41:03 +0000
Received: by mail-wm1-f72.google.com with SMTP id u17-20020a05600c19d1b02901af4c4deac5so2721630wmq.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jun 2021 00:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CKFgI/XB09fK9EatvqSa+BvVfDN0LbVVk60PnCcv8+M=;
        b=CSATPlwdyWcxMtAKxUWIm1IQ9JMFVQKyoQ+Vehobr+Qqske/V8PL5DrRgmpXwiAAuw
         rZ96YTaXYYuqTgWZYJTbSb0Gif/53esEsNZn9bUlq2sLnBIIcIAO5S6pNTe8baINibVu
         veqtv24rwYukXIiqaJdc990r7kp1thK2p2nyVMmpZSz0m6y5FCSz3fg3+OqSBVUCkbsP
         7MgNeGYioCnq/L9laguB6OMFwSgmSXlFKEWPXsUlTYlBEVsoWbYvxhHQNwExm1/EkLat
         07HHlrY9OfAd44uoprB6JZdMrtwQDMzTzzvJWobWZUIIdrlQavJtlhNPhg2SMM8Jt1Lm
         xoxQ==
X-Gm-Message-State: AOAM530tOj0eKx9MN0hTzsY7gN2qFUH9CEkE3VkjAbVs2lV1k5Rb/uOo
        6hwS8jALl5WfKHIJCnV3rxS3OWnKFsDX5dByHh4WHA0u/qxgFDMk4ZkACDXAG8pzpUH/Tyn7pYr
        AsHsqW9PYvOkYdZoRwMoHSshZV3hEg3lz+xos70m1EV16dkiC
X-Received: by 2002:a5d:6405:: with SMTP id z5mr3739144wru.39.1623310863444;
        Thu, 10 Jun 2021 00:41:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVxKzzDYrUeVcjhdd9+2Z+ibNjojMlpPJWvTPtnCppc/0gdckdpbdXOxJdd1bHuCaxQPU7Jg==
X-Received: by 2002:a5d:6405:: with SMTP id z5mr3739117wru.39.1623310863233;
        Thu, 10 Jun 2021 00:41:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id k11sm8417229wmj.1.2021.06.10.00.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 00:41:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM: samsung: mach/soc for v5.14
Date:   Thu, 10 Jun 2021 09:40:55 +0200
Message-Id: <20210610074055.12474-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610074055.12474-1-krzysztof.kozlowski@canonical.com>
References: <20210610074055.12474-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.14

for you to fetch changes up to a6419e53c779302f8d5dd409eccf5b41ffa184a4:

  MAINTAINERS: Include Samsung PWM in Samsung SoC entry (2021-05-27 11:59:48 -0400)

----------------------------------------------------------------
Samsung mach/soc changes for v5.14

1. Fix: add missing of_node_put.
2. Extend Samsung maintainers entry to cover Samsung PWM driver files,
   because they do not have a dedicated entry.
3. Minor cleanups.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: exynos: add missing of_node_put for loop iteration
      soc: samsung: pmu: drop EXYNOS_CENTRAL_SEQ_OPTION defines
      MAINTAINERS: Include Samsung PWM in Samsung SoC entry

Wan Jiabing (1):
      ARM: s3c: Remove unnecessary break in RX1950

 MAINTAINERS                                 | 3 +++
 arch/arm/mach-exynos/exynos.c               | 2 ++
 arch/arm/mach-s3c/mach-rx1950.c             | 1 -
 include/linux/soc/samsung/exynos-regs-pmu.h | 6 ------
 4 files changed, 5 insertions(+), 7 deletions(-)
