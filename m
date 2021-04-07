Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDA0C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Apr 2021 06:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8085613E4
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Apr 2021 06:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346031AbhDGG6u (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Apr 2021 02:58:50 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59010 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346008AbhDGG6u (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 02:58:50 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lU29A-0000ei-8R
        for linux-samsung-soc@vger.kernel.org; Wed, 07 Apr 2021 06:58:40 +0000
Received: by mail-wr1-f70.google.com with SMTP id z17so4522527wru.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Apr 2021 23:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZGp9cCtQeuvZ4dDU3lNFYxtK3g+aG0STXiLOrxikwkU=;
        b=qDRBX5lUWkNoNsQXnYonKd8pXLQ/AH6/4FbHs4qUfvHo3qD3fByJ7WSPsc1q09FfF/
         DyEMfCEplBriZU+I5xwvNkqKFzL5Tnk/hWs4vI6FrKZvB+v1IF7bKCfE5SVtRXFsKYtY
         85ksctN9UkNFa4BHD83qefwAyHz/RcR5DSlhR+AWNxzJPtj6Hw/VGuQ5om98cflfuNSl
         g5ztZfrGzCg1DHCz3C+l5AsaUJMWgLEkhcFrRxVuTaYgze1o4osJLZy//PM+EWVtxPmO
         qyNLw2J2iVPXVVI0U4yR9wsrh51Ow+KO2PEKg0DYTtOj5inzXr52lj7liCtbfTa1v3Up
         7ttQ==
X-Gm-Message-State: AOAM5322Xl4Z3xPv7R7e9Ok+AFOhPf2WRQIJxXBej2EKFbCzItl4e73X
        WQQRARmGBuTLvwMxjqNy+iMqRp+IG0xZPP8p8VfmuPVMYfXmiqjte1f4HDh+14uWpW0cweS0D5D
        OkKsDzESF41LQA+4dJWkKnwIlwVvBfg0rW5mOd1MDBBBmVOfp
X-Received: by 2002:a05:6000:1803:: with SMTP id m3mr2459255wrh.258.1617778719962;
        Tue, 06 Apr 2021 23:58:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2chc2TVWpQSi3GSuDDxdkbpVm4TczJXiGWLWQEGOjPsmLj4qrqZWc1VSc39QEy+uL9LpD7A==
X-Received: by 2002:a05:6000:1803:: with SMTP id m3mr2459243wrh.258.1617778719852;
        Tue, 06 Apr 2021 23:58:39 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id c16sm2410506wrx.46.2021.04.06.23.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:58:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/3] arm64: dts: exynos: Pull for v5.13
Date:   Wed,  7 Apr 2021 08:58:27 +0200
Message-Id: <20210407065828.7213-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
References: <20210407065828.7213-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.13

for you to fetch changes up to 7d2636e9d6dd884ae2ec6127f29963d4da0dfe6e:

  arm64: dts: exynos: white-space cleanups (2021-03-19 11:34:55 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.13

Two cleanups in DTS without expected impact.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: exynos: re-order Slim SSS clocks to match dtschema
      arm64: dts: exynos: white-space cleanups

 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi            | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
