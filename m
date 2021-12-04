Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627FEC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  4 Dec 2021 19:58:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351074AbhLDUB1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 4 Dec 2021 15:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344972AbhLDUB1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 4 Dec 2021 15:01:27 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB08C061751
        for <linux-samsung-soc@vger.kernel.org>; Sat,  4 Dec 2021 11:58:01 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id q3so13305726wru.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 Dec 2021 11:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Tae7shI/erDBK4JbFqL57PR9dNyL7JXb+7DeAlnpbE=;
        b=HYbAMkZQ7OyhNh+oJ+o26au8HLeEYXjmkei/adv8/PCYcWI3IKBVgGPM3+yw6nJ9tq
         y88Kv2DVc2HfYedBiSmrcsS5KhwHV04zoFQpgf/zhB7jewv63yH4O7cXMViNRPyyU3HM
         +gWQNlDfAWwyBFvoPVsHKRhirK9leTz7pKic/sHhCuLVsIHkmraUl+6AEdCPvybPxylm
         872i28hbddCHq/BTH+RahXxsA6k2muhrWaze1KjveMtx7M4TGLI2nSQvoj0qQVfQbw62
         nb8l+UgNLjjUav+pqqccAGAlKAxeDmhDauEf4lE3zzMWe9kBnnsF4bwlxCUs58E6Ub/N
         4a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Tae7shI/erDBK4JbFqL57PR9dNyL7JXb+7DeAlnpbE=;
        b=GhN9VICsD6hGuRNTiENskfP3DyIrBmxv6C3QjsBNKfd/B6o7U2NzXGWg7Uas5BOpYB
         JXI+Nln+wGh4yIZmJWuwpU5bFsRGhGfptGNvpSFhprf5TrVPFF/MLT9ROUztkoZJeOLU
         6kGkF7//cr2scH/NnrVrM5Hg8ZFxkABqi1g3rtOXiSSQc8t1eifWVLBoRWGlHCn1IYFc
         2U2bc3Qf1gdN7AV1qYLL8DEu3ORpUllTm7cZGm8vgiA+oTogDC43W8zuoViw0FJAH5Nh
         98OTNrVYsZmT7WWIOavrRSYngO/WFU2T6EAtEDYNffUVzdR84e8HPtboD45co5cSL9gr
         OFhQ==
X-Gm-Message-State: AOAM530jMfwF50ypg0A+d1417dE44/Pq3GQjHK30QIIJ4K7pJYlDT6TV
        MSO4KJ9j/9bmr8Zl/LMnALXnpg==
X-Google-Smtp-Source: ABdhPJxwjIqYxZ/dHI2yVxue6xSU9HkKtY/F4RcR68UF2cflsf4OPRwRK95eY5hT0ZZNFe3+ydy2ng==
X-Received: by 2002:a5d:404d:: with SMTP id w13mr30057082wrp.293.1638647879454;
        Sat, 04 Dec 2021 11:57:59 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id m14sm9185932wrp.28.2021.12.04.11.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 11:57:58 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 0/5] soc: samsung: Add USI driver
Date:   Sat,  4 Dec 2021 21:57:52 +0200
Message-Id: <20211204195757.8600-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

USIv2 IP-core provides selectable serial protocol (UART, SPI or
High-Speed I2C); only one can be chosen at a time. This series
implements USIv2 driver, which allows one to select particular USI
function in device tree, and also performs USI block initialization.

With that driver implemented, it's not needed to do USI initialization
in protocol drivers anymore, so that code is removed from the serial
driver.

Because USI driver is tristate (can be built as a module), serial driver
was reworked so it's possible to use its console part as a module too.
This way we can load serial driver module from user space and still have
serial console functional.

Design features:
  - "reg" property contains USI registers start address (0xc0 offset);
    it's used in the driver to access USI_CON and USI_OPTION registers.
    This way all USI initialization (reset, HWACG, etc) can be done in
    USIv2 driver separately, rather than duplicating that code over
    UART/SPI/I2C drivers
  - System Register (system controller node) and its SW_CONF register
    offset are provided in "samsung,sysreg" property; it's used to
    select USI function (protocol to be used)
  - USI function is specified in "samsung,mode" property; integer value
    is used to simplify parsing
  - there is "samsung,clkreq-on" bool property, which makes driver
    disable HWACG control (needed for UART to work properly)
  - PCLK and IPCLK clocks are both provided to USI node; apparently both
    need to be enabled to access USI registers
  - protocol nodes are embedded (as a child nodes) in USI node; it
    allows correct init order, and reflects HW properly
  - USI driver is a tristate: can be also useful from Android GKI
    requirements point of view
  - driver functions are implemented with further development in mind:
    - we might want to add some DebugFs interface later
    - some functions might need to be revealed to serial drivers with
      EXPORT_SYMBOL(), and provide somehow pointer to needed USI driver
      instance
    - another USI revisions could be added (like USIv1)

Changes in v3:
  - Renamed compatible from samsung,exynos-usi-v2 to samsung,exynos850-usi
  - Used clk_bulk API instead of handling each clock separately
  - Spell check fixes and coding style fixes
  - Improved dt-bindings doc

Changes in v2:
  - Renamed all 'usi_v2' wording to just 'usi' everywhere
  - Removed patches adding dependency on EXYNOS_USI for UART/I2C/SPI
    drivers
  - Added patch: "tty: serial: samsung: Fix console registration from
    module"
  - Combined dt-bindings doc and dt-bindings header patches
  - Reworked USI driver to be ready for USIv1 addition
  - Improved dt-bindings
  - Added USI_V2_NONE mode value

Sam Protsenko (5):
  dt-bindings: soc: samsung: Add Exynos USI bindings
  soc: samsung: Add USI driver
  tty: serial: samsung: Remove USI initialization
  tty: serial: samsung: Enable console as module
  tty: serial: samsung: Fix console registration from module

 .../bindings/soc/samsung/exynos-usi.yaml      | 159 ++++++++++
 drivers/soc/samsung/Kconfig                   |  14 +
 drivers/soc/samsung/Makefile                  |   2 +
 drivers/soc/samsung/exynos-usi.c              | 285 ++++++++++++++++++
 drivers/tty/serial/Kconfig                    |   2 +-
 drivers/tty/serial/samsung_tty.c              |  78 ++---
 include/dt-bindings/soc/samsung,exynos-usi.h  |  17 ++
 include/linux/serial_s3c.h                    |   9 -
 8 files changed, 518 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
 create mode 100644 drivers/soc/samsung/exynos-usi.c
 create mode 100644 include/dt-bindings/soc/samsung,exynos-usi.h

-- 
2.30.2

