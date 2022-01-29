Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17486C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 29 Jan 2022 11:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239851AbiA2Lyu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 29 Jan 2022 06:54:50 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60642
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239048AbiA2Lyt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Jan 2022 06:54:49 -0500
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DA7D83F1C6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 11:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643457286;
        bh=Ijka2jOdpqFz2YrK3+F7qMhZIXOz2gEU2sD1tESTLRA=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=tJ8GVkNl+57fkdsI8qjnk58UKYoucIRIkQgzlH9ibur0EoB+XyzyCNHlKrSTEz/tP
         EVQ8hvJZEl4YPK0Bd8JI1AtiK8hflnxfEwBfCR+7c+v8jAKpcT6m5M1ezFQihynkxN
         JG3vZla6fXS4Kv/IzI9lusi6okqaOtBltsPvQP3xVZVHfhxVk4DG1C6mSSZM79em51
         rkE6X8IRycXZYNq9oNRwXzz9nWzNn2nd/OxQ4zNgPmxDhWmbN8574HkfoTdMe0VfHv
         fXxidM8YepdrTPYnlMrDijG2lR9rm+xCxMoP/hqYkv4rFeSc3bLmTMIoV3/6y7FPhr
         QJMrBX9Bm0RIw==
Received: by mail-ej1-f72.google.com with SMTP id k16-20020a17090632d000b006ae1cdb0f07so3693458ejk.16
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 03:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ijka2jOdpqFz2YrK3+F7qMhZIXOz2gEU2sD1tESTLRA=;
        b=NfGuRAsGHSsoyJ0iWQt/hcAzQCLjVYbOKstmL/hB3Kx0hyS69F4ruSNLowcfvXX2DP
         w/XzKH65Km8jgnfty8k7EZXKjEJSP2IcDUioAqouifH4ZWzrKgHEE3mdCpF0EB+B3FcV
         PpAMt/TgaQYWPOfAOoR3JYNNRORANS536rnkGBQWpT9SrLu8kDktGtmZ3wxw6Ywew82V
         37wjmdF7FKRJIyOZARuyQd1ytL2eGj0nA9gttuxyxNrr/SrNX1kn/55a9s4X2QNNB0EY
         CjMluSog+zaIhMCoIjB+iGeKbndx/wj/rJt26WczmtVF9E+U4kDZ9rfDw8jPXZkOc0xd
         FwLA==
X-Gm-Message-State: AOAM533mVAsKSAFSq3pk8TOBDh8+wmtqg65nDXHdl7AxHFwH6fy+PAgP
        WBey46Vm2YNt2EfedzyWwYJyOt44WeVwcf6OzONzn4UVk/Qb8+AUNbaO4vDZN5NGXuiXx7Kc5kq
        DnhVhJkU9IQyM85s6P/FDDTVlaXPHalg9t/NMr7gbJEIK5S+Z
X-Received: by 2002:a17:906:31d0:: with SMTP id f16mr10332125ejf.627.1643457285827;
        Sat, 29 Jan 2022 03:54:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl4F8K9oN0osyeshGAGks4kNiiTjSReACDvep5GAMERd/Swk/uXL7hADTVqMn//NHDVdJ/cA==
X-Received: by 2002:a17:906:31d0:: with SMTP id f16mr10332112ejf.627.1643457285661;
        Sat, 29 Jan 2022 03:54:45 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id b30sm14571734edn.16.2022.01.29.03.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 03:54:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [GIT PULL] Samsung fixes for v5.17
Date:   Sat, 29 Jan 2022 12:54:42 +0100
Message-Id: <20220129115442.13474-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-5.17

for you to fetch changes up to 442b0c08db7e35980bed6af091877f4dda72ffca:

  soc: samsung: Fix typo in CONFIG_EXYNOS_USI description (2022-01-23 18:05:41 +0100)

----------------------------------------------------------------
Samsung fixes for v5.17

1. Typo in CONFIG_EXYNOS_USI description.
2. Add Alim Akhtar as a reviewer for Samsung Exynos platform.

----------------------------------------------------------------
Alim Akhtar (1):
      MAINTAINERS: add reviewer entry for Samsung/Exynos platform

Sam Protsenko (1):
      soc: samsung: Fix typo in CONFIG_EXYNOS_USI description

 MAINTAINERS                 | 3 +++
 drivers/soc/samsung/Kconfig | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
